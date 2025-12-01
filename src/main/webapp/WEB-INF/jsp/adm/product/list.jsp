<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">

var pageSize = '${pageSize}'; //페이지당 그리드에 조회 할 Row 갯수;
var totalCount = '${totalCount}'; //전체 데이터 갯수
var pageIndex = '${pageIndex}'; //현재 페이지 정보

$(document).ready(function() {
	if ('' == pageSize) {
		pageSize = 10;
	}
	if ('' == totalCount) {
		totalCount = 0;
	}
	if ('' == pageIndex) {
		pageIndex = 1;
	}
	loadPage();
	 $('#searchKeyword').on('keypress', function(e){
		if(e.keyCode == '13'){		
			$('#searchBtn').click();
		} 
	});
	
});

function loadPage() {
	/* initEvent(); */
	initHtml(); 
}

function initHtml() {
   com.pageNavi( "pageNavi", totalCount , pageSize , pageIndex );
	$("#pageSize").val(pageSize); //페이지당 그리드에 조회 할 Row 갯수;
	$("#pageIndex").val(pageIndex); //현재 페이지 정보
	$("#totalRow").text(totalCount);
}

function press(event) {
	if (event.keyCode==13) {		
		fn_search('1');
	}
}

 //리스트 조회 
function fn_search( param1 ){
	$("#pageIndex").val( param1 );
	var reqUrl = "${contextRoot}/adm/product/list.do?codeId=?"+param1;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

//상세보기
function fn_detail( param1 ){
	var productId = $("#productId").val( param1 );   //검색 조건
	var reqUrl = "${contextRoot}/adm/product/detail.do?productId="+productId;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}  

</script>

<form id="form" name="form" method="get">
	<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
	<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
	<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
	<input type="hidden" id="productId" name="productId" value="" />

	<ul class="search-box">
		<li>
			<label><i class="fa fa-angle-right"></i> 검색조건</label>
			<select id="searchCondition" name="searchCondition">
				<option value="">전체</option>
				<option value="PRODUCT_NAME" ${productVO.searchCondition == 'PRODUCT_NAME' ? 'selected="selected"' : ''}>공예품명</option>
				<option value="PRODUCT_DESC" ${productVO.searchCondition == 'PRODUCT_DESC' ? 'selected="selected"' : ''}>내용</option>
			</select>
			<input type="text" style="width:300px" value="${param.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
		</li>
		<li class="search-btn">
			<button type="button" onclick="fn_search('1');"><i class="fa fa-search"></i> 검색</button>
		</li>
	</ul>
</form>

<table class="list-1">
	<thead>
		<tr>
			<th style="width: 5%">순 번</th>
			<th style="width: 10%">공예품명</th>
			<th style="width: 10%">체험대상</th>
			<th style="width: 10%">체험시간</th>
			<th style="width: 10%">가격</th>
			<th style="width: 10%">비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="productList" items="${productList}" varStatus="status">
			<tr>
				<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}" /></td>
				<td><a href="javascript:fn_detail('${productList.productId}');">${productList.productName}</a></td>
				<td>
					<c:forEach var="item" items="${targetList}">
			            <c:if test="${item.codeCode eq productList.target}">
			                ${item.codeName}
			            </c:if>
			        </c:forEach>
				</td>
				<td>${productList.duration}분</td>
				<td>
					<fmt:formatNumber value="${productList.price}" pattern="#,###"/> 원
					<c:if test="${productList.optionName ne ''}">
						(${productList.optionName} +<fmt:formatNumber value="${productList.optionPrice}" pattern="#,###"/>원)
					</c:if>
				</td>
				<td>
					<a href="javascript:fn_detail('${productList.productId}');">
						<dl>
							<dd>
								<img src="${contextRoot}/thumbnail/${productList.thumbpath}" onerror="this.style.visibility='hidden'" alt="" style="width: 100px; height:100px; overflow: hidden; justify-content: center;" />
							</dd>
						</dl>
					</a>
				</td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(productList) == 0}">
			<tr>
				<td colspan="6" class="no-data"><i class="fa fa-search"></i> 최근 게시글이 없습니다.</td>
			</tr>
		</c:if>
	<tbody>
</table>

<div class="text-center">
	<ul class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
	</ul>
	<div class="text-right btn-area">
		<a href="${contextRoot}/adm/product/form.do?menuId=${menuId}">등록</a>
	</div>
</div>
</section>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
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
		if(e.keyCode == '13'){		//???
			$('#searchBtn').click();
		} 
	});
	
});

function loadPage() {
	initEvent();
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

/* 리스트 조회 */
function fn_search( param1  ){
	$("#pageIndex").val( param1 ); 		//첫 번째 페이지
	var siteId = $("#siteId").val();
	var reqUrl = "${contextRoot}/adm/bbs/config/list.do";
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_detail( bcId , siteId){
	$("#bcId").val( bcId );   //검색 조건
	var reqUrl = "${contextRoot}/adm/bbs/config/detail.do";
	$("#form").attr("action", reqUrl);
	$("#form").submit();
} 

</script>


<section>
	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="bcId" name="bcId" value="" />

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCondition" name="searchCondition">
					<option value="">전체</option>
					<option value="BC_ID" ${param.searchCondition == 'BC_ID' ? 'selected="selected"' : ''}>ID</option>
					<option value="BC_NAME" ${param.searchCondition == 'BC_NAME' ? 'selected="selected"' : ''}>게시판 이름</option>
				</select>
				<input type="text" style="width:300px" value="${param.searchKeyword}" name="searchKeyword"
					id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
			</li>
			<li class="search-btn">
				<button type="button" onclick="fn_search('1');"><i class="fa fa-search"></i> 검색</button>
			</li>
		</ul>
	</form>

	<table class="list-1">
		<thead>
			<tr>
				<th style="width: 7%">아이디</th>
				<th>게시판 이름</th>
				<th>게시판 유형</th>
				<th style="width: 10%">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="resultList" items="${resultList}" varStatus="status">
				<tr>
					<td>${resultList.bcId}</td>
					<td class="text-left">
						<a href="javascript:fn_detail('${resultList.bcId}', '${siteId}');">${resultList.bcName}</a>
					</td>
					<td class="text-left">${resultList.bcType}</td>
					<td class="text-left">${resultList.bcRegdate}</td>
				</tr>
			</c:forEach>

			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="4" class="no-data"><i class="fa fa-search"></i> 최근 게시글이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

	<div class="text-center">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
		</ul>

		<div class="text-right btn-area">
			<a href="${contextRoot }/adm/bbs/config/form.do?menuId=${menuId}">등록</a>
		</div>
	</div>
</section>
</div>

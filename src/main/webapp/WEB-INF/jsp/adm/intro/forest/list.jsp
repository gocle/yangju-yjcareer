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
		pageSize = 16;
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
 
function fn_search(param1){
	
	$("#pageIndex").val( param1 );
	var pgType = "${introVO.pgType}";
	var reqUrl ="${contextRoot}/adm/intro/"+pgType+"/list.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_detail( pgType , intId){
	 
	var menuId = $("#menuId").val();
	$("#pgType").val( pgType ); 
	$("#intId").val( intId ); 

	var reqUrl = "${contextRoot}/adm/intro/"+pgType+"/detail.do?intId="+intId+"&menuId="+menuId;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
} 

function fn_orders(value){
	var orders = value.split("||")[0];
	var intId = value.split("||")[1];
	var pgType = "${introVO.pgType}";
	 $.ajax({
         url : "${contextRoot}/adm/intro/"+pgType+"/introOrderUpdate.do",
         data : {"orders" : orders, "intId" : intId},
         type:'POST',
         dataType:'json',
         success:function(res){
        	// alert(res);
            alert("정렬 저장에 성공하였습니다.");
            fn_search(1);
         },error:function(res){
            // alert("오류 발생.\n관리자에게 문의해주세요.");
         }
	});
}

</script>

<section>
	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="pgType" name="pgType" value="${introVO.pgType}" />
		<input type="hidden" id="intId" name="intId" value="${introVO.intId}" />

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCondition" name="searchCondition">
					<option value="">전체</option>
					<option value="INT_TITLE" ${introVO.searchCondition == 'INT_TITLE' ? 'selected="selected"' : ''}>제목</option>
					<option value="INT_DESC" ${introVO.searchCondition == 'INT_DESC' ? 'selected="selected"' : ''}>내용</option>
				</select>
				<input type="text" style="width:300px" value="${introVO.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
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
			<th style="width: 20%">소개제목</th>
			<th style="width: 30%">소개내용</th>
			<th style="width: 8%">썸네일</th>
			<th style="width: 5%">정렬 순서</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="resultList" items="${resultList}" varStatus="status">
			<tr>
				<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}" /></td>
				
				<td>
					<a href="javascript:fn_detail('${resultList.pgType}','${resultList.intId}');">
						${resultList.intTitle}
					</a>
				</td>
				<td>
					${resultList.intDesc}
				</td>
				<td>
					<a href="javascript:fn_detail('${resultList.pgType}','${resultList.intId}');">
						<dl>
							<dd>
								<img src="${contextRoot}/thumbnail/${resultList.thumbpath}"  
								     onerror="this.style.visibility='hidden'" 
								     alt="${resultList.intTitle}" 
								     style="width: 100px; height:100px; overflow: hidden; justify-content: center;"
								     />
							</dd>
						</dl>
					</a>
				</td>
				<td>
					<c:set var="end" value="30"/>
					<select id="orders" name="orders" style="width : 45px;" onchange="fn_orders(this.value);">
						<c:forEach var="i" begin="1" end="${end}" step="1">
							<option value="${i}||${resultList.intId}" ${i eq resultList.orders ? 'selected' : ''}>${i}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(resultList) == 0}">
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
			<a href="${contextRoot }/adm/intro/${introVO.pgType}/form.do?menuId=${menuId}">등록</a>
		</div>
	</div>
</section>


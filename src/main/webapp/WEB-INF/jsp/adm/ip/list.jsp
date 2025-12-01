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

function fn_search(param1){
	
	$("#pageIndex").val( param1 );
	 $("#ipId").val(ipId);

	var reqUrl = "${contextRoot}/adm/ip/list.do";
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_deleteIp(ipId) {
    if(confirm("정말 삭제하시겠습니까?")) {
        $("#ipId").val(ipId);

        var reqUrl = "${contextRoot}/adm/ip/deleteIp.do";

        $("#form").attr("action", reqUrl);
        $("#form").attr("method", "post");
        $("#form").submit();
    }
}

</script>

<form id="form" name="form" method="get">
	<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
	<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
	<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
	<input type="hidden" id="ipId" name="ipId" value="" />

</form>

<table class="list-1">
	<thead>
		<tr>
			<th style="width: 10%">순번</th>
			<th style="width: 30%">IP 주소</th>
			<th style="width: 30%">접근명 (설명)</th>
			<th style="width: 30%">관리</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="resultList" items="${resultList}" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${resultList.ipAddress}</td>
				<td>${resultList.accessName}</td>
				<td>
					<button type="button" class="btn-del" onclick="fn_deleteIp('${resultList.ipId}')">삭제</button>
				</td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td colspan="4" class="no-data">
					<i class="fa fa-info-circle"></i> 등록된 IP 정보가 없습니다.
				</td>
			</tr>
		</c:if>
	</tbody>
</table>

<div class="text-center">
	<ul class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
	</ul>
	<div class="text-right btn-area">
		<a href="${contextRoot}/adm/ip/form.do?menuId=${menuId}">등록</a>
	</div>
</div>
</section>
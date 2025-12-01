<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/staff/include/common.jsp" %>
<c:import url="/${sessionScope.SESSION_MEM_TYPE}/menu/leftMenu.do" />

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
	 
	 $("#btn_apply").on("click", function(){
		var url = $(this).data("url");
		$("#reservationFormFrame").attr("src", url);
		$("#reservationFormArea").show();
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
	var pgType = "${programVO.pgType}";
	var reqUrl ="${contextRoot}/staff/reservation/"+pgType+"/dayList.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_applyList( pgType , pgId, slotDate, slotId){
	 
	$("#pgType").val( pgType ); 
	$("#pgId").val( pgId ); 
	$("#slotDate").val( slotDate ); 
	$("#slotId").val( slotId );
	$("#pageIndex").val( 1 );

	var reqUrl = "${contextRoot}/staff/reservation/"+pgType+"/applyList.do?pgId="+pgId+"&menuId="+menuId+"&slotDate="+slotDate;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_list() {
	var pgType = "${programVO.pgType}"
	var menuId = $("#menuId").val();

	$("#form").attr("action", "${contextRoot}/adm/program/"+pgType+"/list.do?menuId="+menuId);
	$("#form").attr("method", "get");
	$("#form").submit();
		
}

</script>

<section>
<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="pgType" name="pgType" value="${programVO.pgType}" />
		<input type="hidden" id="pgId" name="pgId" value="${programVO.pgId}" />
		<input type="hidden" name="slotDate" id="slotDate" />
		<input type="hidden" id="slotId" name="slotId" />
		
</form>
<h3>예약현황 : ${programVO.pgName}</h3>
<table class="list-1">
	<thead>
		<tr>
			<th style="width: 5%">번호</th>
			<th style="width: 15%">체험일</th>
			<c:if test="${not empty timeTable}">
		        <c:forEach var="slotEntry" items="${timeTable.values().iterator().next().entrySet()}">
		            <th>
		                ${slotEntry.key}부<br/>
		                <c:choose>
		                    <c:when test="${slotEntry.value != null}">
		                        ${slotEntry.value.startTime}~${slotEntry.value.endTime}
		                    </c:when>
		                    <c:otherwise>-</c:otherwise>
		                </c:choose>
		            </th>
		        </c:forEach>
		    </c:if>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dateEntry" items="${timeTable.entrySet()}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>
                	${dateEntry.key}
                </td>
                
                <c:forEach var="slotNo" items="${dateEntry.value.keySet()}">
				    <td>
				        <c:choose>
						    <c:when test="${dateEntry.value[slotNo] != null}">
						        <a href="javascript:fn_applyList('${programVO.pgType}','${programVO.pgId}', '${dateEntry.key}', ' ${dateEntry.value[slotNo].slotId}', '${dateEntry.value[slotNo].slotId}');">${dateEntry.value[slotNo].resvCnt} 명 / ${dateEntry.value[slotNo].capacity} 명</a>
						    </c:when>
						    <c:otherwise>
						        -
						    </c:otherwise>
						</c:choose>
				    </td>
				</c:forEach>
            </tr>
        </c:forEach>
		<c:if test="${empty timeTable}">
			<tr>
				<td colspan="6" class="no-data"><i class="fa fa-search"></i> 내용이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	<tbody>
</table>

	<div class="text-center">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
		</ul>
	</div>
	
	<div class="text-right btn-area">
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
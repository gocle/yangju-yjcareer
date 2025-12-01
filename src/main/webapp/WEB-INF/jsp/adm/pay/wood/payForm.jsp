<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

function fn_list() {
	var pgType = "${programVO.pgType}"
	var menuId = $("#menuId").val();

	$("#form").attr("action", "${contextRoot}/adm/pay/"+pgType+"/payList.do?menuId="+menuId);
	$("#form").attr("method", "get");
	$("#form").submit();
		
}

function fn_update() {
    var pgType = $("#pgType").val()
    
    //결제상태 미선택 시 값 전송안함
    $("select[name^='payList']").each(function() {
        if ($(this).attr("name").endsWith(".payStatus") && $(this).val() === "") {
            $(this).closest("tr").find("input, select, textarea").prop("disabled", true);
        }
    });

    $("#form").attr("action", "${contextRoot}/adm/pay/" + pgType + "/update.do");
    $("#form").attr("method", "post");
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

	<table class="list-1">
		<thead>
			<tr>
				<th style="width: 5%">예약번호</th>
				<th style="width: 5%">예약자명</th>
				<th style="width: 10%">프로그램명</th>
				<th style="width: 7%">참석일</th>
				<th style="width: 7%">결제일</th>
				<th style="width: 7%">공예품명</th>
				<th style="width: 5%">인원수</th>
				<th style="width: 5%">결제상태</th>
				<th style="width: 5%">결제방식</th>
				<th style="width: 5%">실결제자명</th>
				<th style="width: 10%">예상결제금액</th>
				<th style="width: 10%">실제결제금액</th>
				<th style="width: 15%">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="resultList" items="${payList}" varStatus="status">
				<input type="hidden" name="payList[${status.index}].payId" value="${resultList.payId}" />
				<input type="hidden" name="payList[${status.index}].resvId" value="${resultList.resvId}" />
				<tr>
				    <td>${resultList.resvId}</td>
				    <td>${resultList.name}</td>
				    <td>${resultList.pgName}</td>
				    <td>${resultList.slotDate} ${resultList.slotNo} 부</td>
				    <td><input type="date" name="payList[${status.index}].payDt" value="${fn:substring(resultList.payDt, 0, 10)}" /></td>
				    <td>
	                    ${resultList.productName}
	                    <c:if test="${not empty resultList.optionName}">
	                        (${resultList.optionName})
	                    </c:if>
	                </td>
				    <td>
	                	<c:if test="${resultList.groupYn eq 'N'}">
	                		1 명
	                	</c:if>
	                	<c:if test="${resultList.groupYn eq 'Y'}">
	                		${resultList.peopleCnt} 명
	                	</c:if>
	                </td>
				    <td>
				        <select name="payList[${status.index}].payStatus">
				        	<option value="">선택</option>
				            <option value="READY" <c:if test="${resultList.payStatus eq 'READY'}">selected</c:if>>대기</option>
				            <option value="PAY" <c:if test="${resultList.payStatus eq 'PAY'}">selected</c:if>>결제완료</option>
				            <option value="CANCEL" <c:if test="${resultList.payStatus eq 'CANCEL'}">selected</c:if>>취소</option>
				        </select>
				    </td>
				    <td>
				        <select name="payList[${status.index}].payMethod" style="width:80%;">
				        	<option value="">선택</option>
				            <option value="BANK" <c:if test="${resultList.payMethod eq 'BANK'}">selected</c:if>>무통장</option>
				            <option value="CARD" <c:if test="${resultList.payMethod eq 'CARD'}">selected</c:if>>카드</option>
				            <option value="CASH" <c:if test="${resultList.payMethod eq 'CASH'}">selected</c:if>>현금</option>
				        </select>
				    </td>
				    <td>
				    	<input type="text" name="payList[${status.index}].payName" value="${resultList.payName}" />
				    </td>
				    <td>
	                    <c:choose>
					        <c:when test="${not empty resultList.optionName}">
					            <fmt:formatNumber value="${(resultList.price + resultList.optionPrice) * (resultList.groupYn eq 'Y' ? resultList.peopleCnt : 1)}" pattern="#,###"/>원
					        </c:when>
					        <c:otherwise>
					            <fmt:formatNumber value="${resultList.price * (resultList.groupYn eq 'Y' ? resultList.peopleCnt : 1)}" pattern="#,###"/>원
					        </c:otherwise>
					    </c:choose>
	                </td>
	                <c:set var="finalPrice" value="${(not empty resultList.optionName ? (resultList.price + resultList.optionPrice) : resultList.price) * (resultList.groupYn eq 'Y' ? resultList.peopleCnt : 1)}" />
	
				    <td>
				    	<input type="text" name="payList[${status.index}].amount" value="${resultList.amount}" />
				    </td>
				    <td><input type="text" name="payList[${status.index}].note" value="${resultList.note}" style="width:80%;" /></td>
				</tr>
			</c:forEach>
		<tbody>
	</table>
</form>
	<div class="text-right btn-area">
		<button type="button" onclick="fn_update();" class="point">저장</button>
		<a href="javascript:fn_list();">취소</a>
	</div>
	
	<div class="text-center">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
		</ul>
	</div>
</section>
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

function fn_search(param1){
	
	$("#pageIndex").val( param1 );
	var pgType = "${programVO.pgType}";
	var reqUrl ="${contextRoot}/adm/pay/"+pgType+"/payList.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
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
	var pgType = '${programVO.pgType}';
	var menuId = "${menuId}";
	
	$("#form").attr("action", "${contextRoot}/adm/pay/"+pgType+"/list.do?menuId=" + menuId);
	$("#form").submit()
}

function fn_update() {
	var pgType = '${programVO.pgType}';
	
	$("#form").attr("action", "${contextRoot}/adm/pay/"+pgType+"/payForm.do");
	$("#form").submit()
}
</script>

<section>
	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="pgType" name="pgType" value="${programVO.pgType}" />
		<input type="hidden" id="pgId" name="pgId" value="${programVO.pgId}" />

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCondition" name="searchCondition">
					<option value="">전체</option>
					<option value="NAME" ${param.searchCondition == 'NAME' ? 'selected="selected"' : ''}>예약자명</option>
					<option value="PRODUCT_NAME" ${param.searchCondition == 'PRODUCT_NAME' ? 'selected="selected"' : ''}>공예품명</option>
				</select>
				<input type="text" style="width:300px" value="${param.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
			</li>
			<li class="search-btn">
				<button type="button" onclick="fn_search('1');"><i class="fa fa-search"></i> 검색</button>
			</li>
		</ul>
	</form>

<h3>결제현황 : ${programVO.pgName}</h3>
<table class="list-1">
	<thead>
		<tr>
			<th style="width: 8%">예약자명</th>
			<th style="width: 10%">프로그램명</th>
			<th style="width: 10%">참석일</th>
			<th style="width: 5%">결제일</th>
			<th style="width: 7%">공예품명</th>
			<th style="width: 5%">인원수</th>
			<th style="width: 5%">결제상태</th>
			<th style="width: 5%">결제방식</th>
			<th style="width: 5%">실결제자명</th>
			<th style="width: 8%">예상결제금액</th>
			<th style="width: 8%">실제결제금액</th>
			<th style="width: 10%">비고</th>
			<th style="width: 5%">세금계산서</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="payList" items="${payList}" varStatus="status">
            <tr>
                <td>${payList.name}</td>
                <td>${payList.pgName}</td>
                <td>${payList.slotDate} ${payList.slotNo} 부</td>
                <td>
                	<c:if test="${not empty payList.payDt}">
                		${fn:substring(payList.payDt, 0, 10)}
                	</c:if>
                	<c:if test="${empty payList.payDt}">
                		-
                	</c:if>
                </td>
                <td>
                    ${payList.productName}
                    <c:if test="${not empty payList.optionName}">
                        (${payList.optionName})
                    </c:if>
                </td>
                <td>
                	<c:choose>
				        <c:when test="${payList.groupYn eq 'Y'}">${payList.peopleCnt} 명</c:when>
				        <c:otherwise>1 명</c:otherwise>
				    </c:choose>
                </td>
                <td>
                	<c:choose>
				        <c:when test="${payList.payStatus == 'READY'}">결제전</c:when>
				        <c:when test="${payList.payStatus == 'PAY'}">결제완료</c:when>
				        <c:when test="${payList.payStatus == 'CANCEL'}">취소</c:when>
				        <c:otherwise>-</c:otherwise>
				    </c:choose>
			    </td>
                <td>
	                <c:choose>
					    <c:when test="${payList.payMethod eq 'BANK'}">무통장</c:when>
					    <c:when test="${payList.payMethod eq 'CARD'}">카드</c:when>
					    <c:when test="${payList.payMethod eq 'CASH'}">현금</c:when>
					    <c:otherwise>-</c:otherwise>
					</c:choose>
                </td>
                <td>${payList.payName}</td>
                <td>
                    <c:choose>
				        <c:when test="${not empty payList.optionName}">
				            ${(payList.price + payList.optionPrice) * (payList.groupYn eq 'Y' ? payList.peopleCnt : 1)}원
				        </c:when>
				        <c:otherwise>
				            ${payList.price * (payList.groupYn eq 'Y' ? payList.peopleCnt : 1)}원
				        </c:otherwise>
				    </c:choose>
                </td>
                <td>
                	<c:choose>
				        <c:when test="${payList.payStatus == 'READY'}">결제전</c:when>
				        <c:when test="${payList.payStatus == 'PAY'}">${payList.amount} 원</c:when>
				        <c:when test="${payList.payStatus == 'CANCEL'}">취소</c:when>
				        <c:otherwise>결제전</c:otherwise>
				    </c:choose>
				</td>
                <td>${payList.note}</td>
                <td>
                	<button type="button" onclick="window.open('${contextRoot}/adm/pay/${pgType}/taxPopup.do?payId=${payList.payId}', 'taxPopup', 'width=900,height=700')">출력</button>
                </td>
            </tr>
        </c:forEach>
        
        <c:if test="${fn:length(payList) == 0}">
		    <tr>
		        <td colspan="13"  class="no-data"><i class="fa fa-search"></i>데이터가 존재하지 않습니다.</td>
		    </tr>
		</c:if>
	<tbody>
</table>

	<div class="text-right btn-area">
		<c:if test="${fn:length(payList) > 0}">
			<button type="button" onclick="fn_update();" class="point">수정</button>
		</c:if>
		<a href="javascript:fn_list();">목록</a>
	</div>
	
	<div class="text-center">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
		</ul>
	</div>
</section>
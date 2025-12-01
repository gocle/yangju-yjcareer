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
	var reqUrl ="${contextRoot}/staff/reservation/"+pgType+"/applyList.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_applyList( pgType , pgId){
	 
	var menuId = $("#menuId").val();
	$("#pgType").val( pgType ); 
	$("#pgId").val( pgId ); 

	var reqUrl = "${contextRoot}/staff/reservation/"+pgType+"/applyList.do?pgId="+pgId+"&menuId="+menuId;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_detail(resvId, pgType) {
	var menuId = $("#menuId").val();
	$("#pgType").val( pgType );
	$("#resvId").val(resvId);
	var reqUrl = "${contextRoot}/staff/reservation/" + pgType + "/detail.do?menuId="+menuId;
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_list() {
	var pgType = "${programVO.pgType}"
	var menuId = $("#menuId").val();

	$("#form").attr("action", "${contextRoot}/staff/reservation/"+pgType+"/list.do?menuId="+menuId);
	$("#form").attr("method", "get");
	$("#form").submit();
		
}

</script>

<section>
	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="resvId" name="resvId" value="${reservationVO.resvId}" />
		<input type="hidden" id="pgType" name="pgType" value="${programVO.pgType}" />
		<input type="hidden" id="pgId" name="pgId" value="${programVO.pgId}" />

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCondition" name="searchCondition">
					<option value="">전체</option>
					<option value="NAME" ${param.searchCondition == 'NAME' ? 'selected="selected"' : ''}>예약자명</option>
					<option value="GROUP_NAME" ${param.searchCondition == 'GROUP_NAME' ? 'selected="selected"' : ''}>단체명</option>
				</select>
				<input type="text" style="width:300px" value="${param.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
			</li>
			<li class="search-btn">
				<button type="button" onclick="fn_search('1');"><i class="fa fa-search"></i> 검색</button>
			</li>
		</ul>
	</form>

<h3>프로그램명 : ${programVO.pgName}</h3>
<table class="list-1">
	<thead>
		<tr>
			<th style="width: 10%">예약번호</th>
			<th style="width: 7%">예약자명</th>
			<th style="width: 5%">나이</th>
			<th style="width: 5%">성별</th>
			<th style="width: 5%">연락처</th>
			<th style="width: 5%">차량번호</th>
			<th style="width: 5%">예약상태</th>
			<th style="width: 10%">예약일시</th>
			<th style="width: 5%">단체여부</th>
			<th style="width: 5%">단체명</th>
			<th style="width: 5%">단체인원</th>
			<th style="width: 5%">참석여부</th>
			<th style="width: 10%">장소</th>
			<th style="width: 10%">선택일자</th>
			<th style="width: 10%">비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="resultList" items="${resultList}" varStatus="status">
			<tr>
				<td>${resultList.resvId}</td>
				<td>
					<a href="javascript:fn_detail('${resultList.resvId}','${resultList.pgType}');">${resultList.name}</a>
				</td>
				<td>${resultList.age} 세</td>
				<td>
					<c:choose>
				        <c:when test="${resultList.gender eq 'M'}">남성</c:when>
				        <c:when test="${resultList.gender eq 'F'}">여성</c:when>
				        <c:otherwise>알수없음</c:otherwise>
				    </c:choose>
				</td>
				<td>
					<c:choose>
				        <c:when test="${not empty resultList.phone}">${resultList.phone}</c:when>
				        <c:otherwise>-</c:otherwise>
				    </c:choose>
				<td>
					<c:choose>
				        <c:when test="${not empty resultList.carNum}">${resultList.carNum}</c:when>
				        <c:otherwise>-</c:otherwise>
				    </c:choose>
			    </td>
				<td>
					<c:choose>
				        <c:when test="${resultList.status eq 'WAIT'}">대기</c:when>
				        <c:when test="${resultList.status eq 'CONFIRM'}">확정</c:when>
				        <c:when test="${resultList.status eq 'CANCEL'}">취소</c:when>
				        <c:when test="${resultList.status eq 'REJECT'}">반려</c:when>
				        <c:otherwise>알수없음</c:otherwise>
				    </c:choose>
			    </td>
				<td>${resultList.applyDate}</td>
				<td>${resultList.groupYn}</td>
				<td>
					<c:choose>
				        <c:when test="${not empty resultList.groupName}">${resultList.groupName}</c:when>
				        <c:otherwise>-</c:otherwise>
				    </c:choose>
			    </td>
				<td>
					<c:choose>
				        <c:when test="${not empty resultList.peopleCnt}">${resultList.peopleCnt} 명</c:when>
				        <c:otherwise>-</c:otherwise>
				    </c:choose>
				</td>
				<td>
					<c:if test="${resultList.attendYn eq 'Y' }">참석</c:if>
					<c:if test="${resultList.attendYn eq 'N' }">미참석</c:if>
				</td>
				<td>${resultList.locationNm}</td>
				<td>${resultList.programDt}</td>
				<td>${resultList.note}</td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td colspan="15" class="no-data"><i class="fa fa-search"></i> 신청자가 존재하지 않습니다.</td>
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
		<a href="javascript:void(0);" id="btn_apply" class="point" data-url="${contextRoot}/staff/reservation/${programVO.pgType}/applyForm.do?menuId=${menuId}&pgId=${programVO.pgId}&pgCode=${pgCode}">
		   참여자 등록
		</a>
		<a href="javascript:fn_list();">목록</a>
	</div>
	
	<div id="reservationFormArea" style="display:none; margin-top:40px; border:3px solid #EFEFEF">
		<iframe id="reservationFormFrame" width="100%" height="300px" frameborder="0" scrolling="auto"></iframe>
	</div>
</section>
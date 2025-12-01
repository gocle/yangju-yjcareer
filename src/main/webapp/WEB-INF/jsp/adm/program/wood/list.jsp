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
	var pgType = "${programVO.pgType}";
	var reqUrl ="${contextRoot}/adm/program/"+pgType+"/list.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_detail( pgType , pgId){
	 
	var menuId = $("#menuId").val();
	$("#pgType").val( pgType ); 
	$("#pgId").val( pgId ); 

	var reqUrl = "${contextRoot}/adm/program/"+pgType+"/detail.do?pgId="+pgId+"&menuId="+menuId;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
} 

function fn_dayList( pgType , pgId){
	 
	var menuId = $("#menuId").val();
	$("#pgType").val( pgType ); 
	$("#pgId").val( pgId ); 

	var reqUrl = "${contextRoot}/adm/reservation/"+pgType+"/dayList.do?pgId="+pgId+"&menuId="+menuId;
	$("#form").attr("action", reqUrl);
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

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCondition" name="searchCondition">
					<option value="">전체</option>
					<option value="PG_NAME" ${programVO.searchCondition == 'PG_NAME' ? 'selected="selected"' : ''}>제목</option>
					<option value="PG_DESC" ${programVO.searchCondition == 'PG_DESC' ? 'selected="selected"' : ''}>내용</option>
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
			<th style="width: 10%">프로그램명</th>
			<th style="width: 5%">유형</th>
			<th style="width: 7%">신청기간</th>
			<th style="width: 7%">체험일</th>
			<th style="width: 5%">상태</th>
			<th style="width: 7%">예약현황</th>
			<th style="width: 10%">썸네일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="resultList" items="${resultList}" varStatus="status">
			<tr>
				<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}" /></td>
				
				<td>
					<a href="javascript:fn_detail('${resultList.pgType}','${resultList.pgId}');">
						${resultList.pgName}
					</a>
				</td>
				<td>
					<c:choose>
						<c:when test="${resultList.classType eq 'ONEDAY'}">원데이클래스</c:when>
						<c:when test="${resultList.classType eq 'DIY'}">DIY</c:when>
						<c:when test="${resultList.classType eq 'CHILD'}">유치원</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
				<td>
					${resultList.regOpenDate} ~ ${resultList.regCloseDate}
				</td>
				<td>
					${resultList.startDate} ~ ${resultList.endDate}
				</td>
				
				<td>
					<c:choose>
						<c:when test="${resultList.status eq 'WAIT'}">
							신청대기
						</c:when>
						<c:when test="${resultList.status eq 'OPEN'}">
							접수중
						</c:when>
						<c:when test="${resultList.status eq 'CLOSE'}">
							접수마감
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<button type="button" onClick="fn_dayList('${resultList.pgType}','${resultList.pgId}')">예약현황</button>
				</td>
				<td>
					<a href="javascript:fn_detail('${resultList.pgType}','${resultList.pgId}');">
						<dl>
							<dd>
								<img src="${contextRoot}/thumbnail/${resultList.pgThumbpath}" 
								     onerror="this.style.visibility='hidden'" 
								     alt="${resultList.pgName}" 
								     style="width: 100px; height:100px; overflow: hidden; justify-content: center;" />
							</dd>
						</dl>
					</a>
				</td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td colspan="7" class="no-data"><i class="fa fa-search"></i> 최근 게시글이 없습니다.</td>\
			</tr>
		</c:if>
	<tbody>
</table>

	<div class="text-center">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
		</ul>

		<div class="text-right btn-area">
			<a href="${contextRoot }/adm/program/${programVO.pgType}/form.do?menuId=${menuId}">등록</a>
		</div>
	</div>
</section>
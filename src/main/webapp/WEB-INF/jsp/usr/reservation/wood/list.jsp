<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />
<c:import url="/usr/menu/header.do" />

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
});

function fn_search(param1) {
	$("#pageIndex").val(param1);
	var pgType = $("#pgType").val();
	var reqUrl = "${contextRoot}/usr/reservation/" + pgType + "/list.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_detail(pgType, pgId){
	$("#pgType").val( pgType );
	$("#pgId").val( pgId ); 
	var reqUrl = "${contextRoot}/usr/reservation/" + pgType + "/detail.do?pgId="+pgId;
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
} 

function fn_reset(type) {
    if (type === 'searchDt') {
        $("#searchDt").val("").prop("disabled", true);
    } else if (type === 'classType') {
        $("#classType").val("").prop("disabled", true);
    } else if (type === 'pgCode') {
        $("#pgCode").val("").prop("disabled", true);
    } else if (type === 'all') {
        $("#searchDt").val("").prop("disabled", true);
        $("#classType").val("").prop("disabled", true);
        $("#pgCode").val("").prop("disabled", true);
        $("#searchYn").val("").prop("disabled", true);
    }

    // 조건 전부 비었으면 searchYn 도 비활성화
    if ($("#searchDt").val() === "" && $("#classType").val() === "" && $("#pgCode").val() === "") {
        $("#searchYn").val("").prop("disabled", true);
    } else {
        $("#searchYn").val("Y").prop("disabled", false);
    }

    var pgType = $("#pgType").val();
    var form = $("#form");
    form.attr("action", "${contextRoot}/usr/reservation/" + pgType + "/list.do");
    form.submit();

    // submit 후에는 다시 enable (다음 동작 위해)
    form.find("input[type=hidden]").prop("disabled", false);
}
</script>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>온라인 예약</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">온라인예약</a></li>
				<li><a href="<c:url value="/usr/reservation/${pgType}/list.do"/>">목공체험 프로그램신청</a></li>
			</ul>
		</div>
	</section>

	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="pgType" name="pgType" value="${pgType}" />
		<input type="hidden" id="pgId" name="pgId" value="" />
		<input type="hidden" id="pgCode" name="pgCode" value="${pgCode}" />
		<input type="hidden" id="classType" name="classType" value="${classType}" />
		<input type="hidden" id="searchDt" name="searchDt" value="${searchDt}" />
		<input type="hidden" id="searchYn" name="searchYn" value="${searchYn}" />
	</form>
	
	<!-- 검색 있을 시 -->
	<c:if test="${searchYn eq 'Y'}">
	<section class="section programS-list search-tab flex center">
		<h3>검색조건</h3>
		<div class="programS-txt flex center">
		<c:if test="${searchDt ne null && searchDt ne ''}">
			<dl>
				<dt>이용날짜</dt>
				<dd>${searchDt}</dd>
				<dd><span class="item-pop-close" onclick="fn_reset('searchDt')">×</span></dd>
			</dl>
		</c:if>
		<c:if test="${classType ne null && classType ne '' && pgType eq 'wood'}">
			<!-- <dl>
				<dt>프로그램</dt>
				<dd>목공체험</dd>
				<dd><span class="item-pop-close" >×</span></dd>
			</dl> -->
			<dl>
				<dt>유형</dt>
				<dd>
					<c:choose>
		                <c:when test="${classType eq 'ONEDAY'}">원데이클래스</c:when>
		                <c:when test="${classType eq 'DIY'}">DIY</c:when>
		                <c:when test="${classType eq 'CHILD'}">유치원</c:when>
		                <c:otherwise>${classType}</c:otherwise>
		            </c:choose>
				</dd>
				<dd><span class="item-pop-close" onclick="fn_reset('classType')">×</span></dd>
			</dl>
		</c:if>
		<c:if test="${pgCode ne null && pgCode ne '' && pgType eq 'forest'}">
			<!-- <dl>
				<dt>프로그램</dt>
				<dd>산림교육</dd>
				<dd><span class="item-pop-close">×</span></dd>
			</dl> -->
			<dl>
				<dt>유형</dt>
				<dd>
					<c:choose>
		                <c:when test="${pgCode eq 'FOREST_INT'}">숲체험</c:when>
		                <c:when test="${pgCode eq 'CHILD_REG'}">유아숲</c:when>
		                <c:otherwise>${pgCode}</c:otherwise>
		            </c:choose>
				</dd>
				<dd><span class="item-pop-close" onclick="fn_reset('pgCode')">×</span></dd>
			</dl>
		</c:if>
			<dl class="reset">
				<dd onclick="fn_reset('all')">초기화</dd>
			</dl>
		</div>
	</section>
	</c:if>

    <!-- 프로그램 리스트 -->
    <section class="section">
      <div class="programS-list">
        <c:forEach var="resultList" items="${resultList}" varStatus="status">
        	<article class="program-item" aria-labelledby="p1-title">
	          	<c:if test="${empty resultList.pgThumbpath}">
        			<div class="program-thumb" style="background-image:url('${contextRoot}/assets/css/usr/img/list-1.jpg');" role="img" aria-label="목공체험 이미지"></div>
        		</c:if>
        		<c:if test="${not empty resultList.pgThumbpath}">
        			<div class="program-thumb" style="background-image:url('${contextRoot}/thumbnail/${resultList.pgThumbpath}');" role="img" aria-label="목공체험 이미지"></div>
        		</c:if>
				
	          <div class="program-body">
	
				<div class="program-actions flex center">
					<div>
						<span class="status">
						<c:set var="now" value="<%= new java.util.Date() %>" />
						<fmt:parseDate value="${resultList.regCloseDate}" pattern="yyyy-MM-dd" var="closeDate" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="todayStr" />
						<fmt:parseDate value="${todayStr}" pattern="yyyy-MM-dd" var="today" />
							<c:choose>
								<c:when test="${closeDate.time lt today.time}">종료</c:when>
								<c:when test="${resultList.status eq 'WAIT'}">예정</c:when>
								<c:when test="${resultList.status eq 'OPEN'}">모집중</c:when>
								<c:when test="${resultList.status eq 'CLOSE'}">마감</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</span>
						<a href="javascript:fn_detail('${resultList.pgType}','${resultList.pgId}');" class="p1-title">${resultList.pgName}</a>
					</div>
					<a href="javascript:fn_detail('${resultList.pgType}','${resultList.pgId}');"  class="btn" aria-label="6월 성인반 목공체험 자세히 보기">자세히 보기</a>
				</div>
	
				<div class="programS-txt">
					<dl>
						<dt>신청기간</dt>
						<dd>${resultList.regOpenDate} ~ ${resultList.regCloseDate}</dd>
					</dl>
					<dl>
						<dt>체험가능일</dt>
						<dd>${resultList.startDate} ~ ${resultList.endDate}</dd>
					</dl>
					<dl>
						<dt>유형</dt>
						<dd>
							<c:choose>
								<c:when test="${resultList.classType eq 'ONEDAY'}">원데이클래스</c:when>
								<c:when test="${resultList.classType eq 'DIY'}">DIY</c:when>
								<c:when test="${resultList.classType eq 'CHILD'}">유치원 체험</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</dd>
					</dl>
					<dl>
						<dt>장소</dt>
						<dd>${resultList.location}</dd>
					</dl>
	            </div>
	          </div>
	        </article>
        </c:forEach>
        
        <c:if test="${fn:length(resultList) == 0}">
        	<c:if test="${searchYn ne 'Y'}">
      			<div style="text-align:center;">등록된 프로그램이 없습니다.</div>
      		</c:if>
      		<c:if test="${searchYn eq 'Y'}">
	      		<section class="sub-section no-search-tab">
					<div class="preparing">
				   	 	<div class="section">
				   	 		<img src="/forest/assets/css/usr/img/1110.png">
						</div>
						<h3>검색결과가 없습니다.</h3>
						<p>검색조건 변경 후 다시 시도해보세요.</p>
					</div>
			    </section>
		    </c:if>
      	</c:if>
      </div>

      <!-- 페이지네이션 -->
      <c:if test="${fn:length(resultList) != 0}">
      <ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
      </c:if>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
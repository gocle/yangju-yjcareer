<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>${bcName}</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">참여 마당</a></li>
				<li><a href="<c:url value="/usr/bbs/${bcId}/list.do?menuId=${menuId}"/>">${bcName}</a></li>
			</ul>
		</div>
	</section>

    <!-- 프로그램 리스트 -->
	<section class="sub-section">
		<div class="info-main-title flex section">
			<h2>${bcName}</h2>
		</div>
		<div class="myReservation table-container">
			<table class="table-0 notice-table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					
					
						<c:forEach var="topNoticeList" items="${topNoticeList}" varStatus="status">
						<tr>
						 	<td data-label="번호" class="no notice"></td>
						<td data-label="제목" class="left">
							<a href="<c:url value="/usr/bbs/${topNoticeList.bcId }/detail.do?menuId=${menuId}&baId=${topNoticeList.baId}&baNotice=1"/>">${topNoticeList.baTitle}</a>
						</td>
						<td data-label="작성자">${fn:substring(topNoticeList.memName, 0, 1)}*${fn:substring(topNoticeList.memName, fn:length(topNoticeList.memName)-1, fn:length(topNoticeList.memName))}</td>
						<td data-label="작성일">${topNoticeList.baRegdate}</td>
						<td data-label="조회수">${topNoticeList.baHit}</td>
						<td class="mo-view">
							<a href="view0.html">상세 보기</a>
						</td>
					</tr>
					</c:forEach>	
					<c:forEach var="articleList" items="${articleList}" varStatus="status">
						<tr>
							<td data-label="번호" class="no"><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
							<td data-label="제목" class="left">
								<a href="<c:url value="/usr/bbs/${articleList.bcId }/detail.do?menuId=${menuId}&baId=${articleList.baId}&baNotice=0"/>">${articleList.baTitle}</a>
							</td>
							<td data-label="작성자">
								${fn:substring(articleList.memName, 0, 1)}*${fn:substring(articleList.memName, fn:length(articleList.memName)-1, fn:length(articleList.memName))}
							</td>
							<td data-label="작성일">${articleList.baRegdate}</td>
							<td data-label="조회수">${articleList.baHit}</td>
							<td class="mo-view">
								<a href="view0.html">상세 보기</a>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(articleList) == 0 && fn:length(topNoticeList) == 0}">
						<tr>
							<td colspan="7" class="no-data">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			
			<c:if test="${bcId eq 'review'}">
			<div class="qna-btn">
				<button type="button" onclick="location.href='<c:url value="/usr/bbs/${bcId }/form.do?menuId=${menuId}"/>'">체험후기 등록</button>
			</div>
			</c:if>
		</div>
		
		<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
			
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
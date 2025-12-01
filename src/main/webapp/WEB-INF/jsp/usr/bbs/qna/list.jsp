<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
  <script type="text/javascript">
  
  function fn_detail( url , baId){
		
		 
		 $("#baId").val( baId ); 
		 
		 $("#form").attr("action", url);
				
		 $("#form").submit();
		 
} 
  
  </script>

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>Q&A</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">참여 마당</a></li>
				<li><a href="<c:url value="/usr/bbs/${bcId}/list.do?menuId=${menuId}"/>">Q&A</a></li>
			</ul>
		</div>
	</section>
	
	<form  id="form" name="form" method="get" >		
		<input type="hidden" id="baId" name="baId" value="" />
		<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
	</form>	

    <!-- 프로그램 리스트 -->
	<section class="sub-section">
		<div class="info-main-title flex section">
			<h2>Q&A</h2>
		</div>
		<div class="myReservation table-container">
			<table class="table-0">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="*">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>상태</th>
						<th>제목</th>
						<th>등록자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="articleList" items="${articleList}" varStatus="status">	
					<tr>
						<td class="no"><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
						<td class="my-status my-statusA">
							<c:if test="${articleList.processStatusArticle eq '0001'}">
								<label class="waiting">답변대기</label>
							</c:if>
							<c:if test="${articleList.processStatusArticle eq '0002'}">
								<label class="done">답변완료</label>
							</c:if>	
						</td>
						<td data-label="제목" class="left">
							<c:choose>
								<c:when test="${articleList.baSecret eq  '1' }"> <!-- 비밀글일 경우 -->
									<a href="javascript:fn_detail('<c:url value="/usr/bbs/${articleList.bcId }/passCheck.do?menuId=${menuId}"/>','${articleList.baId}');" class="lock">${articleList.baTitle}</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:fn_detail('<c:url value="/usr/bbs/${articleList.bcId }/detail.do?menuId=${menuId}"/>','${articleList.baId}');">${articleList.baTitle}</a>		
								</c:otherwise>
							</c:choose>
						</td>
						<td data-label="등록자">
							${fn:substring(articleList.memName, 0, 1)}*${fn:substring(articleList.memName, fn:length(articleList.memName)-1, fn:length(articleList.memName))}
						</td>
						<td data-label="작성일">${articleList.baRegdate}</td>
						<td class="mo-view">
							<a href="#" onclick="" class="lock-btn">상세 보기</a>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(articleList) == 0}">
					<tr>
						<td colspan="7" class="no-data">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<div class="qna-btn">
				<button type="button" onclick="location.href='<c:url value="/usr/bbs/qna/form.do?menuId=${menuId}"/>'">문의등록</button>
			</div>
		</div>

		<!-- 페이지네이션 -->
		<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
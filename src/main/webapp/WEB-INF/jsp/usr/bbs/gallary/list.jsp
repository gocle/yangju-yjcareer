<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:import url="/usr/layout/top.do" />
<c:import url="/usr/menu/header.do" />

<!-- 서브 배너 -->
<section class="sub-banner">
	<div class="sub-banner-text">
		<h1>사진 게시판</h1>
	</div>
</section>

<section class="breadcrumb">
	<div class="hero-inner">
		<ul>
			<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
			<li><a href="#">참여 마당</a></li>
			<li><a href="<c:url value='/usr/bbs/${bcId}/list.do?menuId=${menuId}'/>">사진 게시판</a></li>
		</ul>
	</div>
</section>

<section class="sub-section program gallery-sub">
	<div class="info-main-title section flex">
		<h2>사진 게시판</h2>
	</div>

	<!-- 카테고리 라디오 버튼 -->
	<div class="radio-group">
		<input type="radio" id="all" name="galRadio" 
		       <c:if test="${empty baCategory1}">checked="checked"</c:if>
		       onclick="codeSelect('')" />
		<label for="all">전체</label>

		<c:forEach var="codeList" items="${codeSubList}">
		    <input type="radio" id="${codeList.codeId}" name="galRadio"
		           <c:if test="${baCategory1 eq codeList.codeId}">checked="checked"</c:if>
		           onclick="codeSelect('${codeList.codeId}')" />
		    <label for="${codeList.codeId}">${codeList.codeName}</label>
		</c:forEach>
	</div>

	<!-- 카드 리스트 -->
	<div class="program-list section flex" id="photo-list">
		<c:if test="${empty articleList}">
	        <div class="no-data" style="width:100%; text-align:center; padding:40px 0;">
	            등록된 게시물이 없습니다.
	        </div>
	    </c:if>
		<c:forEach var="articleList" items="${articleList}" varStatus="status">	
			<div class="card" 
			     onclick="location.href='<c:url value='/usr/bbs/${articleList.bcId }/detail.do?menuId=${menuId}&baId=${articleList.baId}&baNotice=0&baCategory1=${baCategory1}'/>'">
				<img src="${contextRoot}/thumbnail/${articleList.baThumbpath}" alt="">
				<div class="card-body">
					<h3>${articleList.baTitle}</h3>
					<span class="age">${articleList.baRegdate}</span>
					<span class="detail">상세보기</span>
				</div>
			</div>
		</c:forEach>
	</div>

    <!-- 페이지네이션 -->
    <form id="form" name="form" method="get">
      <input type="hidden" id="menuId" name="menuId" value="${menuId}" />
      <input type="hidden" id="baCategory1" name="baCategory1" value="${baCategory1}" />
      <input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
      <input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
    </form>
    <ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
</section>

<c:import url="/usr/layout/footer.do" />

<script type="text/javascript">
	// 페이지네이션용
	function fn_search(pageNo) {
		document.getElementById("pageIndex").value = pageNo;
		var form = document.getElementById("form");
		form.action = "${pageContext.request.contextPath}/usr/bbs/${bcId}/list.do";
		form.submit();
	}

	// 카테고리 선택용
	function codeSelect(categoryId) {
		document.getElementById("baCategory1").value = categoryId;
		document.getElementById("pageIndex").value = 1; // 새 카테고리 선택 시 1페이지부터
		var form = document.getElementById("form");
		form.action = "${pageContext.request.contextPath}/usr/bbs/${bcId}/list.do";
		form.submit();
	}
</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>목재문화체험장</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">휴양림 소개</a></li>
				<li><a href="<c:url value="/usr/introduce/woodCenter.do"/>">목재문화체험장</a></li>
			</ul>
		</div>
	</section>
    
    <!--서브 네비2-->
   	<section class="nav-btn">
		<div class="nav-btn-inner">
			<ul>
				<li><a href="<c:url value='/usr/introduce/woodCenter.do'/>">인사말</a></li>
				<li class="on"><a href="<c:url value='/usr/introduce/woodInfo.do'/>">연혁 및 시설 안내</a></li>
				<li><a href="<c:url value='/usr/introduce/woodLoad.do'/>">오시는 길</a></li>
			</ul>
		</div>
	</section>

    <!-- 연혁 및 시설 안내 -->

	<section class="info section sub-section">
		<div class="info-main-title flex section">
			<h2>양주 목재문화체험장 층별안내</h2>
		</div>
		<ul class="timeline section">
			<li>
				<div class="timeline-content">
					<div class="timeline-date">2018. 12. 10.</div>
					<div class="timeline-text">준공 후 현재 목재문화체험장으로 이용 중</div>
				</div>
			</li>
			<li>
				<div class="timeline-content">
					<div class="timeline-date">2022. 1. 26.</div>
					<div class="timeline-text">증축</div>
				</div>
			</li>
			<li>
				<div class="timeline-content">
					<div class="timeline-text">시설규모 건축면적 341.02㎡   연면적: 536.34㎡</div>
				</div>
			</li>
		</ul>
		<div class="info-img">
			<div class="info-fx">
				<div class="img-area section">
					<img src="${contextRoot}/assets/css/usr/img/info-2.png">
					<h3>1층 목재문화체험장 · 목공품 전시장 · 목재 재단실</h3>
				</div>
				<div class="img-area section">
					<img src="${contextRoot}/assets/css/usr/img/info-1.png">
					<h3>2층 사무실 및 휴게공간 · 작업실</h3>
				</div>
			</div>
		</div>
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
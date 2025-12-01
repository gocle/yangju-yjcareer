<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>산림교육</h1>
		</div>
	</section>
	
	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">휴양림 소개</a></li>
				<li><a href="<c:url value="/usr/introduce/forestEdu.do"/>">산림교육</a></li>
			</ul>
		</div>
	</section>

    <!--서브 네비2-->
   	<section class="nav-btn">
		<div class="nav-btn-inner">
			<ul>
				<li><a href="<c:url value='/usr/introduce/forestEdu.do'/>">인사말</a></li>
				<li class="on"><a href="<c:url value='/usr/introduce/forestInfo.do'/>">대표 프로그램</a></li>
				<li><a href="<c:url value='/usr/introduce/forestStatus.do'/>">숲체험원 현황</a></li>
			</ul>
		</div>
	</section>

    <!-- 대표 프로그램 -->
	<section class="section sub-section">
		<div class="info-main-title flex section">
			<h2>대표 프로그램</h2>
		</div>

		<div class="programP flex">
			<div class="programP-div-1 section">
				<img src="${contextRoot}/assets/css/usr/img/sub-list-1.png">
				<div class="programP-text">
					<div class="programP-text-inner">
						<h3>유아숲교육이란?</h3>
						<p>유아들이 자연속, 특히 숲이라는 환경에서 놀이와 체험을 통해</p>
						<p>전인적으로 성장하고 발달할 수 있도록 돕는 자연 중심 교육입니다.</p>
						<p class="sub">
						<span>유아숲체험원</span>
						유아들이 자연 속에서 놀이와 체험 활동을 할 수 있도록 조성된 전용 숲 교육 공간
						</p>
					</div>
				</div>
			</div>
			<div class="programP-div-2 section">
				<div class="programP-text">
					<div class="programP-text-inner">
						<h3>숲해설이란?</h3>
						<p>사람들이 숲과 자연을 잘 이해하고 즐길 수 있도록 도와주며</p>
						<p>자연의 생태, 역사, 문화적 의미등을 이야기 형식으로 풀어주는 교육입니다.</p>
					</div>
				</div>
				<img src="${contextRoot}/assets/css/usr/img/sub-list-2.png">
			</div>
		</div>
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
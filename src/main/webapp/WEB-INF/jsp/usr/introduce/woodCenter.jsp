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
				<li class="on"><a href="<c:url value='/usr/introduce/woodCenter.do'/>">인사말</a></li>
				<li><a href="<c:url value='/usr/introduce/woodInfo.do'/>">연혁 및 시설 안내</a></li>
				<li><a href="<c:url value='/usr/introduce/woodLoad.do'/>">오시는 길</a></li>
			</ul>
		</div>
	</section>

    <!-- 인사말 -->
	<section class="intro-section sub-section">
		<div class="intro-inner">
			<header class="intro-header section">
				<div class="info-main-title flex">
					<h2>목재문화체험장 인사말</h2>
				</div>
				<div class="intro-header-box">
					<h1>자연과 함께하는 특별한 체험</h1>
					<p class="subtitle">양주 목재문화체험장</p>
				</div>
			</header>

			<div class="intro-body section">
				<p>안녕하십니까? 양주시청 목재문화체험장입니다.</p>
				<p>양주목재문화체험장 홈페이지를 찾아주셔서 감사합니다.</p>
				
				<p>
				양주목재문화체험장은 목재에 대한 배움과 놀이를 통해 자연과 교감하고 마음을 치유하며
				다양한 프로그램을 체험할 수 있는 복합 문화공간입니다.
				</p>
				<p>
				우리 양주 목재문화체험장은 이용객들의 눈높이에 맞는 프로그램을 통해
				누구나 창의력을 발휘할 수 있는 유익하고 특별한 체험을 제공할 수 있도록 노력하겠습니다.
				</p>
				<p class="thanks">감사합니다.</p>
			</div>
		</div>
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
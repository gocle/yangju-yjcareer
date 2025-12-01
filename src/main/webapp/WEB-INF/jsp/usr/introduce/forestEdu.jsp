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
				<li class="on"><a href="<c:url value='/usr/introduce/forestEdu.do'/>">인사말</a></li>
				<li><a href="<c:url value='/usr/introduce/forestInfo.do'/>">대표 프로그램</a></li>
				<li><a href="<c:url value='/usr/introduce/forestStatus.do'/>">숲체험원 현황</a></li>
			</ul>
		</div>
	</section>

    <!-- 인사말 -->
	<section class="intro-section new-intro">
		<div class="intro-inner-00">
			<header class="intro-header section">
				<div class="intro-header-box-00">
					<h1>산림교육 인사말</h1>
				</div>
			</header>

			<div class="intro-body section">
				<p class="subtitle">숲에서 펼쳐지는 자연과의 힐링 타임</p>
				<p>안녕하세요? 양주 산림교육센터입니다.</p>
				<p>양주 산림교육센터 홈페이지를 찾아주셔서 감사합니다.</p>
				<p>
				양주 산림교육센터는 숲체험, 유아숲교육을 통해 어린아이부터 어른까지 숲에서 다양한 체험과 프로그램을 통해 자연에 대한 관심과 생명에 대한 존중을 배울 수 있는 교육을 운영하고 있습니다.
				</p>
				<p>
				아이들은 숲에서 즐겁게 뛰어놀며 자연을 접하고 사회성을 길러주며 체력을 튼튼하게 만들어 줄 뿐만 아니라, 남녀노소 모두에게 숲에서 살아가는 다양한 생물의 살아가는 이야기, 나무나 식물에 대한 지식 등의 지식을 제공하는 복합적인 교육공간입니다.
				</p>
				<p>
					양주시 내 산림욕장 및 유아숲체험원에서 누구나 쉽고 즐겁게 자연과 조화를 이루어 도심 속에 지친 분들에게 힐링의 공간으로 거듭나도록 항상 노력하겠습니다.
				</p>
				<p class="thanks">감사합니다.</p>
			</div>
		</div>
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
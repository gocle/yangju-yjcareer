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
				<li><a href="<c:url value='/usr/introduce/forestInfo.do'/>">대표 프로그램</a></li>
				<li class="on"><a href="<c:url value='/usr/introduce/forestStatus.do'/>">숲체험원 현황</a></li>
			</ul>
		</div>
	</section>

	<section class="road sub-section">
		<div class="info-main-title flex section">
			<h2>양주시 숲체험원 현황</h2>
		</div>
		<div class="tree">
			<div class="road-info tree-info section">
				<div class="tree-title"><span></span>산림욕장</div>
				<dl>
					<dd><span>1</span> 천보산 산림욕장(삼숭동 산48번지 일원) <span>면적 29,876㎡</span></dd>
				</dl>
				<dl>
					<dd><span>2</span> 불곡산 산림욕장(유양동 산 33-1 일원) <span>면적 22,278㎡</span></dd>
				</dl>
				<dl>
					<dd><span>3</span> 고장산 산림욕장(고암동 493-81 일원) <span>면적 29,875㎡</span></dd>
				</dl>
				<dl>
					<dd><span>4</span> 옥정숲 산림욕장(옥정동 산57번지 외 4필지) <span>면적 10304㎡</span></dd>
				</dl>
			</div>
			<div class="road-info tree-info tree-2 section">
				<div class="tree-title"><span></span>유아숲체험원</div>
				<dl>
					<dd><span>1</span> 불곡산 유아숲체험원(유양동 산33-1번지) <span>면적 15,000㎡</span></dd>
				</dl>
				<dl>
					<dd><span>2</span> 하늘물 유아숲체험원(광사동 659 하늘물 근린공원 내) <span>면적 15,000㎡</span></dd>
				</dl>
				<dl>
					<dd><span>3</span> 회암사지 유아숲체험원(회암동 산14-4 외 1필지) <span>면적 10,000㎡</span></dd>
				</dl>
				<dl>
					<dd><span>4</span> 독바위 유아숲체험원(옥정동 889 독바위공원 내) <span>면적 15,000㎡</span> </dd>
				</dl>
				<dl>
					<dd><span>5</span> 감악산 산마루 유아숲체험원(남면 신암리 산24-3) <span>면적 5,000㎡</span> </dd>
				</dl>
				<dl>
					<dd><span>6</span> 홍죽 유아숲체험원(백석읍 홍죽리 952) <span>면적 6,400㎡</span> </dd>
				</dl>
				<dl>
					<dd><span>7</span> 오산산들 유아숲체험원(백석읍 오산리 522-3) <span>면적 11,000㎡</span> </dd>
				</dl>
			</div>
		</div>
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
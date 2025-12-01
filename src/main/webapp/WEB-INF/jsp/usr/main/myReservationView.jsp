<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>나의 예약</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="#">홈</a></li>
				<li><a href="#">나의 예약</a></li>
			</ul>
		</div>
	</section>

    <section class="sub-section">
		<div class="programS-form view section">
			<div class="info-main-title flex">
				<h2>나의 예약</h2>
			</div>
			<form>
				<div class="view-tile table-0">
					<span class="my-status my-statusA">승인대기</span>
					<h3>6월 성인반 목공체험 원데이클래스</h3>
				</div>
				
				<div class="programS-txt">
					<dl>
						<dt>프로그램 일시</dt>
						<dd>6월 25일 수요일 10:00</dd>
					</dl>
					<dl>
						<dt>신청일</dt>
						<dd>6월 25일 수요일 10:00</dd>
					</dl>
					<dl>
						<dt>프로그램 장소</dt>
						<dd>양주시 목공체험장</dd>
					</dl>
					<dl>
						<dt>참여자명</dt>
						<dd>홍길동</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>010-0000-0000</dd>
					</dl>
					<dl>
						<dt>품목명</dt>
						<dd>나무 도마</dd>
					</dl>
					<dl>
						<dt>비용</dt>
						<dd>5,000원</dd>
					</dl>
					<dl>
						<dt>단체 여부</dt>
						<dd>개인</dd>
					</dl>
				</div>
				
				
			</form>
		</div>
		<div class="form-btn">
			<button type="button">예약 취소</button>
			<button type="button" class="list">목록</button>
		</div>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
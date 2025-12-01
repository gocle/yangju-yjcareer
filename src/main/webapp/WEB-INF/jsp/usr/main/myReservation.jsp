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

    <!-- 프로그램 리스트 -->
	<section class="sub-section">
		<div class="info-main-title flex section">
			<h2>나의 예약</h2>
		</div>
		<div class="table-menu">
			<ul>
				<li class="on"><a href="program.html">신청내역</a></li>
				<li><a href="#">지난예약</a></li>
			</ul>
		</div>
		<div class="myReservation table-container">
			<table class="table-0">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="15%">
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>상태</th>
						<th>예약번호</th>
						<th>신청자</th>
						<th>프로그램명</th>
						<th>결제금액</th>
						<th>신청일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="no">4</td>
						<td class="my-status my-statusA">승인대기</td>
						<td data-label="예약번호"><a href="<c:url value='/usr/main/myReservationView.do'/>">reserv_2025XXX</a></td>
						<td data-label="신청자">홍길동</td>
						<td data-label="프로그램명" class="left">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">2025년 6월 성인반 목공체험 원데이클래스</a>
						</td>
						<td data-label="결제금액">10,000</td>
						<td data-label="신청일">2025.06.09</td>
						<td class="mo-view">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">예약 상세 보기</a>
						</td>
					</tr>
					<tr>
						<td class="no">3</td>
						<td class="my-status my-statusB">승인완료</td>
						<td data-label="예약번호"><a href="<c:url value='/usr/main/myReservationView.do'/>">reserv_2025XXX</a></td>
						<td data-label="신청자">홍길동</td>
						<td data-label="프로그램명" class="left">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">2025년 6월 성인반 목공체험 원데이클래스</a>
						</td>
						<td data-label="결제금액">10,000</td>
						<td data-label="신청일">2025.06.09</td>
						<td class="mo-view">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">예약 상세 보기</a>
						</td>
					</tr>
					<tr>
						<td class="no">2</td>
						<td class="my-status my-statusC">예약취소</td>
						<td data-label="예약번호"><a href="<c:url value='/usr/main/myReservationView.do'/>">reserv_2025XXX</a></td>
						<td data-label="신청자">홍길동</td>
						<td data-label="프로그램명" class="left">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">2025년 6월 성인반 목공체험 원데이클래스</a>
						</td>
						<td data-label="결제금액">10,000</td>
						<td data-label="신청일">2025.06.09</td>
						<td class="mo-view">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">예약 상세 보기</a>
						</td>
					</tr>
					<tr>
						<td class="no">1</td>
						<td class="my-status my-statusB">승인완료</td>
						<td data-label="예약번호"><a href="<c:url value='/usr/main/myReservationView.do'/>">reserv_2025XXX</a></td>
						<td data-label="신청자">홍길동</td>
						<td data-label="프로그램명" class="left">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">2025년 6월 성인반 목공체험 원데이클래스</a>
						</td>
						<td data-label="결제금액">10,000</td>
						<td data-label="신청일">2025.06.09</td>
						<td class="mo-view">
							<a href="<c:url value='/usr/main/myReservationView.do'/>">예약 상세 보기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 페이지네이션 -->
		<nav class="pagination" aria-label="페이지 네비게이션">
			<a href="#" class="btn-before" aria-label="이전 페이지">이전</a>
			<a class="current" href="#" aria-current="page">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#" class="btn-after" aria-label="다음 페이지">다음</a>
		</nav>
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
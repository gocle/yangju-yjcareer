<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				<li class="on"><a href="#">신청내역</a></li>
				<!-- <li><a href="#">지난예약</a></li> -->
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
					<col width="5%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>상태</th>
						<th>예약번호</th>
						<th>신청자</th>
						<th>유형</th>
						<th>프로그램명</th>
						<th>장소/공예품명</th>
						<th>금액</th>
						<th>인원수</th>
						<th>체험일</th>
						<th>신청일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reservationList" items="${resultList}" varStatus="status">
				        <tr>
				            
				            <td class="my-status 
				                <c:choose>
				                    <c:when test="${reservationList.status eq 'WAIT'}">my-statusA">승인대기</c:when>
				                    <c:when test="${reservationList.status eq 'CONFIRM'}">my-statusB">승인완료</c:when>
				                    <c:when test="${reservationList.status eq 'CANCEL'}">my-statusC">예약취소</c:when>
				                    <c:when test="${reservationList.status eq 'REJECT'}">my-statusC">승인반려</c:when>
				                    <c:otherwise>">-</c:otherwise>
				                </c:choose>
				            </td>
				            
				            <td data-label="예약번호">
				                <a href="<c:url value='/usr/mypage/myReservationView.do?resvId=${reservationList.resvId}'/>">${reservationList.resvId}</a>
				            </td>
				            <td data-label="신청자">${reservationList.name}</td>
				            <td data-label="유형">
							    <c:choose>
							        <c:when test="${reservationList.pgType eq 'wood'}">목공체험</c:when>
							        <c:when test="${reservationList.pgType eq 'forest'}">숲체험</c:when>
							        <c:otherwise>-</c:otherwise>
							    </c:choose>
							</td>
				            <td data-label=프로그램명 class="left">
				                    ${reservationList.pgName} 
				                    <c:if test="${reservationList.pgType eq 'wood'}">
				                    	${reservationList.slotNo}부
				                    </c:if>
				            </td>
				            <td data-label="장소/공예품명" class="left">
				            	<c:choose>
							        <c:when test="${reservationList.pgType eq 'wood'}">
							        	${reservationList.productName}
					                    <c:if test="${not empty reservation.optionName }">
					                    	(${reservationList.optionName})
					                    </c:if>
				                    </c:when>
							        <c:when test="${reservationList.pgType eq 'forest'}">
							        	<c:choose>
										    <c:when test="${reservationList.location eq 'TEMPLE'}">회암사지</c:when>
										    <c:when test="${reservationList.location eq 'DOK'}">독바위</c:when>
										    <c:when test="${reservationList.location eq 'SKY'}">하늘물</c:when>
										    <c:when test="${reservationList.location eq 'DOTORI'}">도토리</c:when>
										    <c:when test="${reservationList.location eq 'GOJANG'}">고장산</c:when>
									        <c:when test="${reservationList.location eq 'BULGOK'}">불곡산</c:when>
									        <c:when test="${reservationList.location eq 'OKJEONG'}">옥정숲</c:when>
									        <c:when test="${reservationList.location eq 'CHEONBO'}">천보산</c:when>
										    <c:otherwise>기타</c:otherwise>
										</c:choose>
							        </c:when>
							    </c:choose>
				                   
				            </td>
				            <td data-label="금액">
				            	<c:choose>
					                <c:when test="${not empty reservationList.price}">
								        <c:choose>
								            <c:when test="${not empty reservationList.optionName}">
								                <fmt:formatNumber value="${reservationList.price + (reservationList.optionPrice != null ? reservationList.optionPrice : 0)}"  type="currency" currencySymbol="₩" />
								            </c:when>
								            <c:otherwise>
								                <fmt:formatNumber value="${reservationList.price}" type="currency" currencySymbol="₩" />
								            </c:otherwise>
								        </c:choose>
								    </c:when>
								    <c:otherwise>
								        ₩0
								    </c:otherwise>
							    </c:choose>
				            </td>
				            <td data-label="인원수">
				               <c:choose>
							        <c:when test="${reservationList.groupYn eq 'Y'}">
							           ${reservationList.peopleCnt} 명
							        </c:when>
							        <c:otherwise>
							            1 명
							        </c:otherwise>
							    </c:choose>
				            </td>
				            <td>
				            	<c:choose>
							        <c:when test="${reservationList.pgType eq 'wood'}">
							        	${reservationList.slotDate}
							        </c:when>
							        <c:when test="${reservationList.pgType eq 'forest'}">
							        	${fn:substringBefore(reservationList.programDt, ' ')}
							        </c:when>
							        <c:otherwise>-</c:otherwise>
							    </c:choose>
							</td>
				            <td data-label="신청일">
				            	${reservationList.applyDate}
				            </td>
				            <td class="mo-view">
				                <a href="<c:url value='/usr/main/myReservationView.do?resvId=${reservationList.resvId}'/>">예약 상세 보기</a>
				            </td>
				        </tr>
				    </c:forEach>
				
				    <c:if test="${empty resultList}">
				        <tr>
				            <td colspan="9" class="no-data">예약 내역이 없습니다.</td>
				        </tr>
				    </c:if>
				</tbody>
			</table>
		</div>

		<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
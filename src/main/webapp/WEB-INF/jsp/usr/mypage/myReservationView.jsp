<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
function cancelReservation(resvId) {
	if (!confirm("정말 예약을 취소하시겠습니까?")) return;

    $.ajax({
        url: "<c:url value='/usr/mypage/cancelResv.do'/>",
        type: "POST",
        data: { resvId: resvId },
        success: function(response) {
            if (response.result === "success") {
                alert("예약이 취소되었습니다.");
                window.location.href = "<c:url value='/usr/mypage/myReservation.do'/>";
            } else {
                alert(response.message || "예약 취소 중 오류가 발생했습니다.");
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("서버 통신 중 오류가 발생했습니다.");
        }
    });
}

</script>

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
					<span class="my-status
						<c:choose>
		                    <c:when test="${userReservationVO.status eq 'WAIT'}">my-statusA">승인대기</c:when>
		                    <c:when test="${userReservationVO.status eq 'CONFIRM'}">my-statusB">승인완료</c:when>
		                    <c:when test="${userReservationVO.status eq 'CANCEL'}">my-statusC">예약취소</c:when>
		                    <c:when test="${userReservationVO.status eq 'REJECT'}">my-statusC">승인반려</c:when>
		                    <c:otherwise>">-</c:otherwise>
		                </c:choose>
		            </span>
					<h3>${userReservationVO.pgName}</h3>
				</div>
				
				<div class="programS-txt">
					<dl>
						<dt>프로그램 일시</dt>
						<dd>
							<c:choose>
								<c:when test="${userReservationVO.pgType eq 'wood' }">
									${userReservationVO.slotDate} ${userReservationVO.slotNo}부 (${userReservationVO.startTime} ~ ${userReservationVO.endTime})
								</c:when>
								<c:when test="${userReservationVO.pgType eq 'forest' }">
									${fn:substringBefore(userReservationVO.programDt, ' ')}
								</c:when>
							</c:choose>
						</dd>
					</dl>
					<dl>
						<dt>신청일</dt>
						<dd>${userReservationVO.applyDate}</dd>
					</dl>
					<c:if test="${userReservationVO.pgType eq 'forest'}">
						<dl>
							<dt>프로그램 장소</dt>
							<dd>
								<c:choose>
								    <c:when test="${userReservationVO.location eq 'TEMPLE'}">회암사지</c:when>
								    <c:when test="${userReservationVO.location eq 'DOK'}">독바위</c:when>
								    <c:when test="${userReservationVO.location eq 'SKY'}">하늘물</c:when>
								    <c:when test="${userReservationVO.location eq 'DOTORI'}">도토리</c:when>
								    <c:when test="${userReservationVO.location eq 'GOJANG'}">고장산</c:when>
							        <c:when test="${userReservationVO.location eq 'BULGOK'}">불곡산</c:when>
							        <c:when test="${userReservationVO.location eq 'OKJEONG'}">옥정숲</c:when>
							        <c:when test="${userReservationVO.location eq 'CHEONBO'}">천보산</c:when>
								    <c:otherwise>기타</c:otherwise>
								</c:choose>
							</dd>
						</dl>
					</c:if>
					<dl>
						<dt>참여자명</dt>
						<dd>${userReservationVO.name}</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>${userReservationVO.phone}</dd>
					</dl>
					<c:if test="${userReservationVO.pgType eq 'wood'}">
						<dl>
							<dt>품목명</dt>
							<dd>${userReservationVO.productName}
								<c:if test="${not empty userReservationVO.optionName}">
								(${userReservationVO.optionName})
								</c:if>
							</dd>
						</dl>
					</c:if>
					<dl>
						<dt>비용</dt>
						<c:choose>
							<c:when test="${not empty userReservationVO.price}">
						        <c:choose>
						            <c:when test="${not empty userReservationVO.optionName}">
						                <dd><fmt:formatNumber value="${userReservationVO.price + (userReservationVO.optionPrice != null ? userReservationVO.optionPrice : 0)}"  type="currency" currencySymbol="₩" /></dd>
						            </c:when>
						            <c:otherwise>
						                <dd><fmt:formatNumber value="${userReservationVO.price}" type="currency" currencySymbol="₩" /></dd>
						            </c:otherwise>
						        </c:choose>
						    </c:when>
						    <c:otherwise>
						        <dd>₩0</dd>
						    </c:otherwise>
					    </c:choose>
					</dl>
					<dl>
						<dt>단체 여부</dt>
						<c:choose>
				            <c:when test="${userReservationVO.groupYn eq 'Y'}">
				               <dd>단체 (${userReservationVO.peopleCnt}명)</dd>
				            </c:when>
				            <c:otherwise>
				               <dd>개인</dd>
				            </c:otherwise>
				        </c:choose>
					</dl>
				</div>
				
				
			</form>
		</div>
		<div class="form-btn">
			<c:if test="${userReservationVO.status == 'WAIT' || userReservationVO.status == 'CONFIRM'}">
		        <button type="button" onclick="cancelReservation('${userReservationVO.resvId}')">예약 취소</button>
		    </c:if>
			<button type="button" class="list" onclick="location.href='<c:url value='/usr/mypage/myReservation.do'/>';">목록</button>
		</div>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
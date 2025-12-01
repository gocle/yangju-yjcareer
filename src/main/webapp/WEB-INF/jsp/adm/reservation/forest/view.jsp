<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">


function fn_delete(){
	var pgType = '${reservationVO.pgType}';
	var menuId = $("#menuId").val();;
	
	if(confirm("삭제하시겠습니까?")){
		var reqUrl = "${contextRoot}/adm/reservation/"+pgType+"/delete.do?&memuId="+menuId;
		$("#form").attr("action", reqUrl);
		$("#form").submit();
	}
}

function fn_update(){
	
	var pgType = '${reservationVO.pgType}';
	var menuId = "${menuId}";
	var reqUrl = "${contextRoot}/adm/reservation/"+pgType+"/updateForm.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").attr("method", "get");
	$("#form").submit();
}

function fn_applyList(){
	
	var pgType = '${reservationVO.pgType}';
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/adm/reservation/"+pgType+"/applyList.do?menuId="+menuId
	
	$("#form").attr("action", reqUrl);
	$("#form").attr("method", "get");
	$("#form").submit();
}

</script>

<section>
	<form id="form" name="form" method="post">
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="resvId" name="resvId" value="${reservationVO.resvId}" />
		<input type="hidden" id="pgId" name="pgId" value="${reservationVO.pgId}" />
		<input type="hidden" id="pgType" name="pgType" value="${reservationVO.pgType}" />
		<input type="hidden" id="pgCode" name="pgCode" value="${reservationVO.pgCode}" />
	
		<table class="detail">
			<colgroup>
			    <col width="16.6%">
			    <col width="16.6%">
			    <col width="16.6%">
			    <col width="16.6%">
			    <col width="16.6%">
			    <col width="16.6%">
			</colgroup>
			<tbody>
				<tr>
					<th>예약번호</th>
					<td>${reservationVO.resvId}</td>
					<th>이름</th>
					<td>${reservationVO.name}</td>
					<th>성별</th>
					<td>
						<c:choose>
							<c:when test="${reservationVO.gender eq 'M'}">남성</c:when>
							<c:when test="${reservationVO.gender eq 'F'}">여성</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${reservationVO.phone}</td>
					<th>이메일</th>
					<td>${reservationVO.email}</td>
					<th>차량번호</th>
					<td>${reservationVO.carNum}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${reservationVO.age}</td>
					<th>보호자명</th>
					<td>${reservationVO.parentName}</td>
					<th>보호자연락처</th>
					<td>${reservationVO.parentPhone}</td>
				</tr>
				<tr>
					<th>단체여부</th>
					<td>
						<c:choose>
							<c:when test="${reservationVO.groupYn eq 'N'}">개인</c:when>
							<c:when test="${reservationVO.groupYn eq 'Y'}">단체</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<th>단체명</th>
					<td>${reservationVO.groupName}</td>
					<th>인원수</th>
					<td>${reservationVO.peopleCnt} 명</td>
				</tr>
				<tr>
					<th>신청일시</th>
					<td>${reservationVO.applyDate}</td>
					<th>예약상태</th>
					<td>
						<c:choose>
					        <c:when test="${reservationVO.status eq 'WAIT'}">대기</c:when>
					        <c:when test="${reservationVO.status eq 'CONFIRM'}">확정</c:when>
					        <c:when test="${reservationVO.status eq 'CANCEL'}">취소</c:when>
					        <c:when test="${reservationVO.status eq 'REJECT'}">반려</c:when>
					        <c:otherwise>알수없음</c:otherwise>
					    </c:choose>
					</td>
					<th>참석여부</th>
					<td>
						<c:choose>
							<c:when test="${reservationVO.attendYn eq 'Y'}">참석</c:when>
							<c:when test="${reservationVO.attendYn eq 'N'}">미참석</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td colspan="3">${reservationVO.note}</td>
					<th>선택일자</th>
					<td>${reservationVO.programDt}</td>
				</tr>
			</tbody>
		</table>
	</form>

	<div class="text-right btn-area">
		<button type="button" class="point" onclick="fn_update()">수정</button>
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_applyList();">목록</a>
	</div>
</section>
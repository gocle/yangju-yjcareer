<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/staff/include/common.jsp" %>
<c:import url="/${sessionScope.SESSION_MEM_TYPE}/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="${contextRoot}/js/com_validation.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    $('.groupYn').on('change', function() {
        if ($(this).val() === 'N') {
            $('.peopleCnt').val(1);
        }
    });
});

var locationInfo = [
	  <c:forEach var="loc" items="${locationInfo}" varStatus="s">
	    { location: '${fn:escapeXml(loc.location)}', locationCnt: ${loc.locationCnt} }<c:if test="${!s.last}">,</c:if>
	  </c:forEach>
	  ];
	  var CURRENT_LOCATION = '${fn:escapeXml(reservationVO.location)}';
	  var ORIG_PEOPLE      = parseInt('${reservationVO.peopleCnt}', 10) || 0;
	  var CAPACITY         = parseInt('${pvo.capacity}', 10) || 0;
	  var PG_CODE          = '${pvo.pgCode}';  // FOREST_INT / CHILD_REG 등

	  function capacityValidateSimple(){
		var groupYn = $('.groupYn').val();
		var newPeople = parseInt($('.peopleCnt').val(), 10) || 0;
		
		if (groupYn === 'Y' && newPeople < 1) {
	      alert('인원수는 1명 이상이어야 합니다.');
	      return false;
	    }

	    // 현재 장소의 누적 인원 조회
	    var row = locationInfo.find(r => r.location === CURRENT_LOCATION);
	    var locCnt = row ? (parseInt(row.locationCnt,10) || 0) : 0;

	    // (기존 인원 제외 후 + 새 인원)
	    var adjusted = Math.max(locCnt - ORIG_PEOPLE, 0) + newPeople;
	    var limit = 0;

	    // 🔸 pgCode 별 유효성 분기
	    if (PG_CODE === 'FOREST_INT') {
	      // rows가 1개면 CAPACITY×2, 2개면 CAPACITY
	      limit = (locationInfo.length === 1) ? (CAPACITY * 2) : CAPACITY;

	    } else if (PG_CODE === 'CHILD_REG') {
	      // CHILD_REG는 장소별 담당자 2명, 단일 장소 기준 CAPACITY×2
	      limit = CAPACITY * 2;

	    } else {
	      // 기타 프로그램은 CAPACITY만 사용 (예비안)
	      limit = CAPACITY;
	    }

	    if (adjusted > limit) {
	      alert(
	        '허용 인원을 초과했습니다.\n' +
	        '조정 후 인원: ' + adjusted + '명 / 제한: ' + limit + '명'
	      );
	      return false;
	    }

	    return true;
	  }

function fn_update() {
	var pgType = '${reservationVO.pgType}';
	if (pgType === 'forest') {
	    if (!capacityValidateSimple()) return;
	  }
	
	$("#form").attr("action", "${contextRoot}/staff/reservation/"+pgType+"/update.do");
	$("#form").attr("pgTarget","_self");
	$("#form").submit();
}

//목록
function fn_list() {
	var pgType = '${reservationVO.pgType}';
	var menuId = $("#menuId").val();

	$("#form").attr("action", "${contextRoot}/staff/reservation/"+pgType+"/applyList.do?menuId="+menuId);
	$("#form").attr("method", "get");
	$("#form").submit();
		
}
</script>

<section>
	<form id="form" name="form" method="post">
	<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
	<input type="hidden" id="resvId" name="resvId" value="${reservationVO.resvId}" />
	<input type="hidden" id="pgType" name="pgType" value="${reservationVO.pgType}" />
	<input type="hidden" id="pgId" name="pgId" value="${reservationVO.pgId}" />
	<input type="hidden" id="pgCode" name="pgCode" value="${pvo.pgCode}" />

	<table class="detail">
		<colgroup>
		    <col width="16.6%">
		    <col width="16.6%">
		    <col width="16.6%">
		    <col width="16.6%">
		    <col width="16.6%">
		    <col width="16.6%">
		</colgroup>
		<tbody id="applyFormBody">
			<tr>
				<th>예약번호</th>
				<td>${reservationVO.resvId}</td>
				<th>이름</th>
				<td><input type="text" name="name" value="${reservationVO.name}" /></td>
				<th>성별</th>
				<td>
					<select name="gender" style="width: 55%">
						<option value="M" <c:if test="${reservationVO.gender eq 'M'}">selected</c:if>>남성</option>
						<option value="F" <c:if test="${reservationVO.gender eq 'F'}">selected</c:if>>여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone" value="${reservationVO.phone}" class="phone_num"/></td>
				<th>이메일</th>
				<td><input type="email" name="email" value="${reservationVO.email}" /></td>
				<th>차량번호</th>
				<td><input type="text" name="carNum" value="${reservationVO.carNum}" /></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="age" value="${reservationVO.age}" /></td>
				<th>보호자명</th>
				<td><input type="text" name="parentName" value="${reservationVO.parentName}" /></td>
				<th>보호자연락처</th>
				<td><input type="text" name="parentPhone" value="${reservationVO.parentPhone}" class="phone_num"/></td>
			</tr>
			<tr>
				<th>단체여부</th>
				<td>
					<select name="groupYn" style="width: 55%" class="groupYn">
						<option value="N" <c:if test="${reservationVO.groupYn eq 'N'}">selected</c:if>>개인</option>
						<option value="Y" <c:if test="${reservationVO.groupYn eq 'Y'}">selected</c:if>>단체</option>
					</select>
				</td>
				<th>단체명</th>
				<td><input type="text" name="groupName" value="${reservationVO.groupName}" class="groupName"/></td>
				<th>인원수</th>
				<td><input type="number" name="peopleCnt" value="${reservationVO.peopleCnt}" class="peopleCnt"/></td>
			</tr>
			<tr>
				<th>신청일시</th>
				<td>${reservationVO.applyDate}</td>
				<th>예약상태</th>
				<td>
					<select name="status" style="width: 55%">
						<option value="WAIT" <c:if test="${reservationVO.status eq 'WAIT'}">selected</c:if>>대기</option>
						<option value="CONFIRM" <c:if test="${reservationVO.status eq 'CONFIRM'}">selected</c:if>>확정</option>
						<option value="CANCEL" <c:if test="${reservationVO.status eq 'CANCEL'}">selected</c:if>>취소</option>
						<option value="REJECT" <c:if test="${reservationVO.status eq 'REJECT'}">selected</c:if>>반려</option>
					</select>
				</td>
				<th>참석여부</th>
				<td>
					<select name="attendYn" style="width: 55%">
						<option value="">-</option>
						<option value="Y" <c:if test="${reservationVO.attendYn eq 'Y'}">selected</c:if>>참석</option>
						<option value="N" <c:if test="${reservationVO.attendYn eq 'N'}">selected</c:if>>미참석</option>
					</select>
				</td>
			</tr>
			<tr>
			    <th>선택일자</th>
			    <td colspan="5">
			        <input name="programDt" id="programDt" value="${reservationVO.programDt}" />
			    </td>
			</tr>			
			<tr>
			    <th>비고</th>
			    <td colspan="5">
			        <textarea name="note" id="note" class="form-control" rows="4" style="width:100%;">${reservationVO.note}</textarea>
			    </td>
			</tr>
		</tbody>
	</table>

	<div class="text-right btn-area">
		<button type="button" onclick="fn_update();" class="point">수정</button>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="${contextRoot}/js/com_validation.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    function updateHidden() {
        var selected = $('#productSelect').find('option:selected');
        $('#optionName').val(selected.data('option') || '');
    }
    updateHidden();
    $('#productSelect').change(function() {
        updateHidden();
    });
    
    $('#applyFormBody tr').each(function() {
        toggleGroupFields($(this).find('.groupYn')[0]);
    });

    $('#applyFormBody').on('change', '.groupYn', function() {
        toggleGroupFields(this);
    });

    $('#applyFormBody').on('input', '.mCnt, .fCnt', function() {
        const row = $(this).closest('tr');
        updateTotalPeople(row);
    });
});

function fn_update() {
	var pgType = '${reservationVO.pgType}';
	
	$("#form").attr("action", "${contextRoot}/adm/reservation/"+pgType+"/update.do");
	$("#form").attr("pgTarget","_self");
	$("#form").submit();
}

function fn_detail(resvId, pgType) {
	var menuId = $("#menuId").val();
	$("#pgType").val( pgType );
	$("#resvId").val(resvId);
	var reqUrl = "${contextRoot}/adm/reservation/" + pgType + "/detail.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function toggleGroupFields(select) {
    const row = $(select).closest('tr');
    const groupYn = $(select).val();

    if(groupYn === 'Y') {
        row.find('.group-fields').show();
        row.find('.personal-field').hide();

        const m = row.find('.mCnt').val();
        const f = row.find('.fCnt').val();
        if(m === '') row.find('.mCnt').val('0');
        if(f === '') row.find('.fCnt').val('0');

        updateTotalPeople(row);
    } else {
        row.find('.group-fields').hide();
        row.find('.personal-field').show();

        row.find('.mCnt, .fCnt').val('');
        row.find('.totalCnt').val(row.find('.peopleCnt').val() || '');
    }
}

function updateTotalPeople(row) {
    const mCnt = parseInt(row.find('.mCnt').val()) || 0;
    const fCnt = parseInt(row.find('.fCnt').val()) || 0;
    const total = mCnt + fCnt;
    
    row.find('.totalCnt').val('');
    row.find('.totalCnt').val(total);
}
</script>

<section>
	<form id="form" name="form" method="post">
	<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
	<input type="hidden" id="resvId" name="resvId" value="${reservationVO.resvId}" />
	<input type="hidden" id="pgType" name="pgType" value="${reservationVO.pgType}" />
	<input type="hidden" id="pgId" name="pgId" value="${reservationVO.pgId}" />
	<input type="hidden" id="slotDate" name="slotDate" value="${reservationVO.slotDate}" />
	<input type="hidden" name="optionName" id="optionName">

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
				<th>이름</th>
				<td><input type="text" name="name" value="${reservationVO.name}" /></td>
				<th>성별</th>
				<td>
					<select name="gender" style="width: 55%">
						<option value="M" <c:if test="${reservationVO.gender eq 'M'}">selected</c:if>>남성</option>
						<option value="F" <c:if test="${reservationVO.gender eq 'F'}">selected</c:if>>여성</option>
					</select>
				</td>
				<th>연락처</th>
				<td><input type="text" name="phone" value="${reservationVO.phone}" class="phone_num"/></td>
			</tr>
			<tr>
				<th>신청차시</th>
				<td>
					<select name="slotId" id="slotId" style="width: 60%">
					    <c:forEach var="time" items="${timeList}">
					        <option value="${time.slotId}" 
					            <c:if test="${reservationVO.slotId == time.slotId}">selected</c:if>>
					            ${time.slotNo}부 ${time.startTime} ~ ${time.endTime}
					        </option>
					    </c:forEach>
					</select>
				</td>
				<th>이메일</th>
				<td><input type="email" name="email" value="${reservationVO.email}" /></td>
				<th>공예품</th>
				<td>
					<select name="productId" id="productSelect">
					    <option value="">선택</option>
					    <c:forEach var="product" items="${productList}">
					        <option value="${product.productId}" 
					                data-option="" 
					                <c:if test="${reservationVO.productId eq product.productId && empty reservationVO.optionName}">selected</c:if>>
					            ${product.productName} - 
					            <fmt:formatNumber value="${product.price}" type="currency"/>
					        </option>
					
					        <c:if test="${not empty product.optionName}">
					            <option value="${product.productId}" 
					                    data-option="${product.optionName}" 
					                    <c:if test="${reservationVO.productId eq product.productId && reservationVO.optionName eq product.optionName}">selected</c:if>>
					                ${product.productName} (${product.optionName}) - 
					                <fmt:formatNumber value="${product.price + product.optionPrice}" type="currency"/>
					            </option>
					        </c:if>
					    </c:forEach>
					</select>
				</td>
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
				<td>
					<!-- 단체 -->
					<div class="group-fields" style="display: ${reservationVO.groupYn eq 'Y' ? 'block' : 'none'};">
					    남 <input type="number" name="mCnt" value="${reservationVO.mCnt}" class="mCnt" style="width:50px;" min="0"/> 
					    여 <input type="number" name="fCnt" value="${reservationVO.fCnt}" class="fCnt" style="width:50px;" min="0"/> 
					    총 <input type="number" name="peopleCnt" value="${reservationVO.peopleCnt}" class="peopleCnt totalCnt" style="width:60px;" readonly/>
					</div>
					
					<!-- 개인 
					<div class="personal-field" style="display: ${reservationVO.groupYn eq 'Y' ? 'none' : 'block'};">
					    <input type="number" name="peopleCnt" value="${reservationVO.peopleCnt}" class="peopleCnt" disabled />
					</div>-->
		        </td>
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
			    <th>비고</th>
			    <td colspan="5">
			        <textarea name="note" id="note" class="form-control" rows="4" style="width:100%;">${reservationVO.note}</textarea>
			    </td>
			</tr>
		</tbody>
	</table>

	<div class="text-right btn-area">
		<button type="button" onclick="fn_update();" class="point">수정</button>
		<a href="javascript:fn_detail('${reservationVO.resvId}', '${reservationVO.pgType}');">취소</a>
	</div>
</section>
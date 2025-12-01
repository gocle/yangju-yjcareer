<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/staff/include/common.jsp" %>

<script type="text/javascript" src="${contextRoot}/js/com_validation.js"></script>

<script type="text/javascript">

const CODE_TO_NAME = {};
$(function(){
  $("select[name$='.location'] option").each(function(){
    const code = $(this).val();
    const nm   = $(this).data("name");
    if (code && nm) CODE_TO_NAME[code] = nm;
  });
});
function codeToName(code){ return CODE_TO_NAME[code] || code; }

/* ===== 서버에서 내려준 값들을 JS 상수로 주입 ===== */
const PG_TYPE         = "${programVO.pgType}";
const PG_CODE         = "${pgCode}";
const PER_LOCATION_MAX = parseInt("${perLocationMax != null ? perLocationMax : 0}", 10) || 0;   // CHILD_REG 전용(장소별 최대수용)
const LEGACY_REMAIN    = parseInt("${peopleCnt != null ? peopleCnt : 0}", 10) || 0;             // FOREST_INT 등 기존 단일 잔여

/* 장소별 잔여 맵: { "A": 12, "B": 3, ... } (CHILD_REG 전용) */
const REMAIN_BY_LOC = {
<c:if test="${not empty remainByLoc}">
  <c:forEach var="e" items="${remainByLoc}" varStatus="st">
    "${fn:escapeXml(e.key)}": ${e.value}<c:if test="${!st.last}">,</c:if>
  </c:forEach>
</c:if>
};

$(document).ready(function() {
  $("#btn_close").on("click", function(){
    parent.$("#reservationFormFrame").attr("src", "about:blank");
    parent.$("#reservationFormArea").hide();
  });

  // 첫 행의 groupYn 상태에 맞춰 필드 토글
  $("#applyFormBody").on("change", "select[name$='.groupYn']", function(){
    toggleGroupFields(this);
  });
  // 초기 1회 실행
  toggleGroupFields($("select[name$='.groupYn']")[0]);

  // 휴대전화 자동 하이픈
  $("#applyFormBody").on("input", "input[name$='.phone']", function(){
    let v = (this.value || "").replace(/[^0-9]/g, "");
    if (v.length > 3 && v.length <= 7) v = v.replace(/(\d{3})(\d{1,4})/, "$1-$2");
    else if (v.length > 7)             v = v.replace(/(\d{3})(\d{4})(\d{1,4})/, "$1-$2-$3");
    this.value = v;
  });
});

/* 그룹 필드 토글 */
function toggleGroupFields(sel){
  const $tr = $(sel).closest("tr");
  const yn  = $(sel).val();
  const $gName = $tr.find("input[name$='.groupName']");
  const $gCnt  = $tr.find("input[name$='.peopleCnt']");
  if (yn === "Y") {
    $gName.prop("disabled", false);
    $gCnt.prop("disabled", false);
  } else {
    $gName.prop("disabled", true).val("");
    $gCnt.prop("disabled", true).val("");
  }
}

/* 저장 */
function fn_save() {
  let hasError = false;

  // CHILD_REG: 장소별 합산 검증 / 그 외: 전체 합계 vs 단일 잔여
  const wantByLoc = {}; // CHILD_REG 전용

  // 공통 필드 검증 + 신청 인원 집계
  $("#applyFormBody tr").each(function(){
    const $tr = $(this);

    // 장소 필수
    const loc = ($tr.find("select[name$='.location']").val() || "").trim();
    if (!loc) { alert("장소를 선택하세요."); hasError = true; return false; }

    // 개인/단체 인원 계산
    const groupYn   = ($tr.find("select[name$='.groupYn']").val() || "N");
    const peopleStr = ($tr.find("input[name$='.peopleCnt']").val() || "").trim();

    let want = 1;
    if (groupYn === "Y") {
      if (!/^\d+$/.test(peopleStr) || parseInt(peopleStr,10) < 1) {
        alert("단체 인원은 1 이상의 숫자만 입력하세요.");
        hasError = true; return false;
      }
      want = parseInt(peopleStr, 10);
    }

    // 기본 정보 검증
    const name    = ($tr.find("input[name$='.name']").val() || "").trim();
    const ageStr  = ($tr.find("input[name$='.age']").val() || "").trim();
    const gender  = $tr.find("select[name$='.gender']").val();
    const phone   = ($tr.find("input[name$='.phone']").val() || "").trim();

    if (!name)   { alert("예약자명을 입력하세요."); hasError = true; return false; }
    if (!gender) { alert("성별을 선택하세요.");   hasError = true; return false; }
    if (!/^\d+$/.test(ageStr) || parseInt(ageStr,10) <= 0) { alert("나이는 1 이상의 숫자만 입력하세요."); hasError = true; return false; }
    if (!phone)  { alert("연락처를 입력하세요."); hasError = true; return false; }

    if (PG_CODE === "CHILD_REG") {
      wantByLoc[loc] = (wantByLoc[loc] || 0) + want;
    } else {
      // FOREST_INT 등에서는 총합을 위해 data-*에 누적하거나, 기존 서버 단일 잔여로만 검증
      // 여기서는 서버 단일 잔여(LEGACY_REMAIN) 비교를 아래에서 수행
      wantByLoc["_TOTAL_"] = (wantByLoc["_TOTAL_"] || 0) + want;
    }
  });
  if (hasError) return;

  if (PG_CODE === "CHILD_REG") {
    // 장소별 잔여 검증
    for (const loc in wantByLoc) {
      const add = wantByLoc[loc];
      // REMAIN_BY_LOC가 없으면 (예약 0건 등) 최댓값(PER_LOCATION_MAX)을 잔여로 간주
      const baseRemain = (Object.prototype.hasOwnProperty.call(REMAIN_BY_LOC, loc))
                         ? Number(REMAIN_BY_LOC[loc])
                         : PER_LOCATION_MAX;
      if (add > baseRemain) {
         const locNm = codeToName(loc);
         alert("장소 [" + locNm + "] 신청 합계 " + add + "명이 잔여 " + baseRemain + "명을 초과했습니다.");
         return;
      }
    }
  } else {
    // FOREST_INT 등: 기존 단일 잔여 검증 유지
    const totalWant = wantByLoc["_TOTAL_"] || 0;
    if (totalWant > LEGACY_REMAIN) {
      alert("총 신청 인원(" + totalWant + "명)이 잔여 인원(" + LEGACY_REMAIN + "명)을 초과했습니다.");
      return;
    }
  }

  // 통과 → 저장
  $.ajax({
    url: "${contextRoot}/staff/reservation/" + PG_TYPE + "/applyInsert.do",
    type: "POST",
    data: $("#applyForm").serialize(),
    success: function(response) {
      alert(response.message || "저장되었습니다.");
      parent.location.reload();
      parent.$("#reservationFormFrame").attr("src", "about:blank");
      parent.$("#reservationFormArea").hide();
    },
    error: function() {
      alert("저장 중 오류가 발생했습니다.");
    }
  });
}

/* 행 추가 */
function fn_addRow() {
  const index = $("#applyFormBody tr").length;
  const $row  = $("#applyFormBody tr:first").clone(false);

  // 값 초기화
  $row.find("input").not("[name$='.resvId'], [type='hidden']").val("");
  $row.find("select").prop("selectedIndex", 0);

  // name 인덱스 재부여
  $row.find("input, select").each(function () {
    const name = $(this).attr("name");
    if (name) {
      const newName = name.replace(/reservationList\[\d+\]/, "reservationList[" + index + "]");
      $(this).attr("name", newName);
    }
  });

  $row.find("input[name$='.resvId']").val("자동생성");
  $("#applyFormBody").append($row);

  // 새 행의 그룹 필드 토글 초기화
  const $newSelect = $row.find("select[name$='.groupYn']");
  toggleGroupFields($newSelect[0]);
}

/* 행 삭제 */
function fn_delRow() {
  const $rows = $("#applyFormBody tr");
  if ($rows.length <= 1) {
    alert("삭제할 수 없습니다.");
    return;
  }
  $rows.last().remove();
  reindexRows();
}

/* name 인덱스 리시퀀싱 */
function reindexRows() {
  $("#applyFormBody tr").each(function (i) {
    $(this).find("input, select").each(function () {
      const name = $(this).attr("name");
      if (name) {
        const newName = name.replace(/reservationList\[\d+\]/, "reservationList[" + i + "]");
        $(this).attr("name", newName);
      }
    });
  });
}
</script>

<section>
	<div class="sub-title-area">
		  <h3>참여자 등록</h3>
		  <div class="text-right btn-area" style="margin-bottom: 10px;">
		    <button type="button" class="point" onClick="fn_addRow()">추가</button>
		    <button type="button" onClick="fn_delRow()">삭제</button>
		  </div>
	</div>

  <style>
  	section {
  		width: 98%;
	    margin: auto;
	    padding-top: 1rem;
	}
	
  	td input {
  		width : 100%;
  	}
  	
  	td select {
	    min-width: 50px;
	    width : 100%;
	}
	
	.sub-title-area {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	}
	
	.list-1 {
		table-layout: fixed;
	}
  </style>

  <form id="applyForm" name="applyForm" method="post">
   	<!-- 숨김 기본값 -->
   	<input type="hidden" name="reservationList[0].pgId"     value="${programVO.pgId}" />
   	<input type="hidden" name="reservationList[0].pgType"   value="${programVO.pgType}" />
   	<input type="hidden" name="reservationList[0].pgCode"   value="${pgCode}" />
   	<input type="hidden" name="reservationList[0].capacity" value="${programVO.capacity}" />
  
    <table class="list-1">
	    <colgroup>
	      <col style="width: 6%;">   <!-- 예약번호 -->
	      <col style="width: 8%;">     <!-- 예약자명 -->
	      <col style="width: 5%;">     <!-- 나이 -->
	      <col style="width: 5%;">     <!-- 성별 -->
	      <col style="width: 12%;">    <!-- 연락처 -->
	      <col style="width: 8%;">     <!-- 예약상태 -->
	      <col style="width: 6%;">     <!-- 단체여부 -->
	      <col style="width: 10%;">    <!-- 단체명 -->
	      <col style="width: 6%;">     <!-- 단체인원 -->
	      <col style="width: 8%;">     <!-- 참여여부 -->
	      <col style="width: 10%;">    <!-- 비고 -->
	      <col style="width: 10%;">    <!-- 장소 -->
	    </colgroup>
      <thead>
        <tr>
          <th>예약번호</th>
          <th>예약자명</th>
          <th>나이</th>
          <th>성별</th>
          <th>연락처</th>
          <th>예약상태</th>
          <th>단체여부</th>
          <th>단체명</th>
          <th>단체인원</th>
          <th>참여여부</th>
          <th>비고</th>
          <th>장소</th>
        </tr>
      </thead>
      <tbody id="applyFormBody">
        <tr>
          <td><input type="text" name="reservationList[0].resvId" readonly value="자동생성"/></td>
          <td><input type="text" name="reservationList[0].name" class="form-control" /></td>
          <td><input type="number" name="reservationList[0].age" class="form-control" /></td>
          <td>
            <select name="reservationList[0].gender" class="form-control" style="width: 90%">
              <option value="">선택</option>
              <option value="M">남</option>
              <option value="F">여</option>
            </select>
          </td>
          <td><input type="text" name="reservationList[0].phone" class="form-control phone_num" placeholder="예) 010-1234-5678" maxlength="13"/></td>
          <td>
            <select name="reservationList[0].status" class="form-control" style="width: 90%">
              <option value="CONFIRM">확정</option>
              <option value="WAIT">대기</option>
              <option value="CANCEL">취소</option>
              <option value="REJECT">반려</option>
            </select>
          </td>
          <td>
            <select name="reservationList[0].groupYn" class="form-control groupYn" style="width: 90%">
              <option value="N">개인</option>
              <option value="Y">단체</option>
            </select>
          </td>
          <td><input type="text" name="reservationList[0].groupName" class="form-control groupName" /></td>
          <td><input type="number" name="reservationList[0].peopleCnt" class="form-control peopleCnt" /></td>
          <td>
            <select name="reservationList[0].attendYn" class="form-control" style="width: 90%">
              <option value="Y">참여</option>
              <option value="N">미참여</option>
            </select>
          </td>
          <td><input type="text" name="reservationList[0].note" class="form-control" /></td>
          <td>
            <select name="reservationList[0].location" class="form-control">
              <option value="">선택</option>
              <c:forEach var="c" items="${codeList}">
                <c:forEach var="l" items="${locationList}">
                  <c:if test="${c.codeCode eq l.location}">
                    <option value="${c.codeCode}" data-name="${fn:escapeXml(c.codeName)}">
                      ${c.codeName}
                      <c:if test="${pgCode eq 'CHILD_REG'}">
                        <c:if test="${remainByLoc[c.codeCode] ne null}"> (잔여: ${remainByLoc[c.codeCode]})</c:if>
                      </c:if>
                      <c:if test="${pgCode eq 'FOREST_INT'}">
						(잔여: ${peopleCnt})
					  </c:if>                      
                    </option>
                  </c:if>
                </c:forEach>
              </c:forEach>
            </select>
          </td>
        </tr>
      </tbody>
    </table>

    <div class="text-right btn-area" style="margin-top: 30px;">
      <button type="button" class="point" onClick="fn_save()">저장</button>
      <button id="btn_close" type="button">닫기</button>
    </div>
  </form>
</section>
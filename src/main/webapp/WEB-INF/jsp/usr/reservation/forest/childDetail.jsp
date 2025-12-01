<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />
<c:import url="/usr/menu/header.do" />

<script>
var contextRoot = "${contextRoot}";
var pgType      = "${pgType}";               // ex) forest
var PG_ID       = "${userProgramVO.pgId}";
var PG_CODE     = "${userProgramVO.pgCode}"; // CHILD_REG (이 파일은 CHILD_REG 전용)

const LOCATIONS_RAW    = "${fn:escapeXml(userProgramVO.location)}";   // 코드 CSV
const LOCATIONS_NM_RAW = "${fn:escapeXml(userProgramVO.locationNm)}"; // 이름 CSV

// CSV → 배열
const PLACE_CODES = (LOCATIONS_RAW || "").split(",").map(s => s.trim()).filter(Boolean);
const PLACE_NAMES = (LOCATIONS_NM_RAW || "").split(",").map(s => s.trim()).filter(Boolean);

// 장소별 정원: 담당자 2명 × 개별 capacity
const PER_INSTRUCTOR = parseInt("${userProgramVO.capacity}", 10) || 0;
const PER_LOCATION_MAX = PER_INSTRUCTOR;
const CAP_OVERRIDE = { "TEMPLE": Math.floor(PER_LOCATION_MAX / 2) };

// 선택일(YYYY-MM-DD)
let selectedDay = null;

// ===== 예약하기 =====
function fn_apply() {
  // 날짜/장소 선택 확인
  if (!$("#location").val()) { alert("일정과 장소를 먼저 선택해 주세요."); return; }

  // 참여자 이름
  const name = ($("#name").val() || "").trim();
  if (!name) { alert("참여자 명을 입력해 주세요."); $("#name").focus(); return; }

  // 나이
  const age = ($("#age").val() || "").trim();
  if (!/^\d+$/.test(age) || parseInt(age, 10) <= 0) {
    alert("나이는 1 이상의 숫자만 입력하세요.");
    $("#age").focus();
    return;
  }

  // 연락처
  const phone = ($("#phone").val() || "").trim();
  if (!phone) { alert("연락처를 입력해 주세요."); $("#phone").focus(); return; }

  // 개인/그룹
  const groupYn = $('input[name="groupYn"]:checked').val();
  if (!groupYn) { alert("개인/그룹을 선택해 주세요."); $('input[name="groupYn"]').first().focus(); return; }

  // 잔여 인원
  const rem = parseInt($("#remain").val(), 10);
  if (isNaN(rem)) { alert("잔여 인원을 확인할 수 없습니다. 날짜/장소를 다시 선택해 주세요."); return; }

  if (groupYn === "Y") {
    const v = ($("#peopleCnt").val() || "").trim();
    if (!/^\d+$/.test(v)) { alert("인원수는 1 이상의 숫자만 입력 가능합니다."); $("#peopleCnt").focus(); return; }
    const n = parseInt(v, 10);
    if (n < 1) { alert("인원수는 1명 이상 입력하세요."); $("#peopleCnt").focus(); return; }
    if (n > rem) {
      alert("잔여 인원(" + rem + "명)보다 많이 신청할 수 없습니다.");
      $("#peopleCnt").val(rem).focus();
      return;
    }
  } else {
    // 개인: peopleCnt = 1
    if (!$("#peopleCnt").length) {
      $("<input>", {type:"hidden", id:"peopleCnt", name:"peopleCnt", value:"1"}).appendTo("#form");
    } else {
      $("#peopleCnt").val("1");
    }
    if (rem < 1) { alert("잔여 인원이 없습니다. 다른 날짜/장소를 선택해 주세요."); return; }
  }

  // (선택) 약관 체크 필요시
  if (!$("#agree").is(":checked")) { alert("개인정보 수집 및 이용에 동의해 주세요."); return; }

  $("#form").attr("action", contextRoot + "/usr/reservation/" + pgType + "/reserve.do").submit();
}

// ===== 초기 달력 =====
$(function(){
  // 체험 시작/종료일
  var startParts = "${userProgramVO.startDate}".split("T")[0].split("-");
  var endParts   = "${userProgramVO.endDate}".split("T")[0].split("-");
  var startDate  = new Date(startParts[0], startParts[1]-1, startParts[2]);
  var endDate    = new Date(endParts[0],   endParts[1]-1,   endParts[2]);

  var currentYear  = startDate.getFullYear();
  var currentMonth = startDate.getMonth() + 1;

  function pad2(n){ return (n<10 ? "0" : "") + n; }

  // 요일 헤더
  var weekdays = ['일','월','화','수','목','금','토'];
  var h = '';
  for (var i=0;i<7;i++){ h += '<th>'+weekdays[i]+'</th>'; }
  $("#calendarHeaderRow").html(h);

  function generateCalendar(year, month){
    $("#calendarHeader").text(year + "년 " + month + "월");
    var firstDay = new Date(year, month-1, 1).getDay();
    var lastDate = new Date(year, month, 0).getDate();
    var html = "";

    for (var i=0; i<6; i++){
      html += "<tr>";
      for (var j=0; j<7; j++){
        if (i===0 && j<firstDay) {
          html += "<td></td>";
        } else {
          var date = i*7 + j - firstDay + 1;
          if (date > lastDate){ html += "<td></td>"; continue; }
          var dateStr = year + "-" + pad2(month) + "-" + pad2(date);
          var cellDate = new Date(year, month-1, date);
          var isSelectable = (cellDate >= startDate && cellDate <= endDate);

          html += '<td class="'+(isSelectable ? 'selectable' : 'disabled')+'" data-date="'+dateStr+'">'+date+'</td>';
        }
      }
      html += "</tr>";
    }
    $("#calendarBody").html(html);
  }

  $("#prevMonth").click(function(){
    currentMonth = (currentMonth === 1) ? 12 : currentMonth - 1;
    currentYear  = (currentMonth === 12) ? currentYear - 1 : currentYear;
    generateCalendar(currentYear, currentMonth);
  });
  $("#nextMonth").click(function(){
    currentMonth = (currentMonth === 12) ? 1 : currentMonth + 1;
    currentYear  = (currentMonth === 12) ? currentYear + 1 : currentYear;
    generateCalendar(currentYear, currentMonth);
  });

  // 날짜 클릭 → 장소별 잔여 조회 & 렌더
  $(document).on("click", ".selectable", function(){
    $(".calendar td").removeClass("selected");
    $(this).addClass("selected");
    selectedDay = $(this).data("date");
    fetchAndRenderSchedule(selectedDay);
  });

  // 휴대전화 하이픈
  $(".phone_num").on("input", function() {
    let v = $(this).val().replace(/[^0-9]/g, "");
    if (v.length > 3 && v.length <= 7) v = v.replace(/(\d{3})(\d{1,4})/, "$1-$2");
    else if (v.length > 7)             v = v.replace(/(\d{3})(\d{4})(\d{1,4})/, "$1-$2-$3");
    $(this).val(v);
  });

  // 개인/그룹 토글
  function togglePeopleCnt() {
    if ($("input[name='groupYn']:checked").val() === "Y") $("#peopleCntContainer").show();
    else $("#peopleCntContainer").hide();
  }
  togglePeopleCnt();
  $("input[name='groupYn']").change(togglePeopleCnt);

  // 추천 체크박스 단일 선택
  $("input[name='recommend']").on("click", function() {
    $("input[name='recommend']").not(this).prop("checked", false);
  });

  // 최초 달력 렌더
  generateCalendar(currentYear, currentMonth);
});

// ===== 선택일의 장소별 잔여 조회 & 렌더 =====
// 서버 응답 예시(JSON):
// {
//   "date": "2025-10-01",
//   "perLocationMax": 40,              // capacity(=20) * 2
//   "reserved": { "A":"15", "B":"22", "C":"0" } // 장소코드별 누적 예약 인원(해당 일자 한정)
// }
function fetchAndRenderSchedule(day) {
  $("#selectedDate p").text(day + " 예약현황");
  $("#selectedDate span").hide();

  // 실제 API URL은 컨트롤러에 맞춰 변경
  const url = contextRoot + "/usr/reservation/" + pgType + "/remainByDate.do";
  const params = {
    pgId: PG_ID,
    pgCode: PG_CODE,      // CHILD_REG
  };

  // 조회 중 표시
  $("#scheduleBody").html("<tr><td colspan='3'>조회 중...</td></tr>");

  $.ajax({
    url: url,
    method: "GET",
    data: params,
    dataType: "json"
  }).done(function(res){
    // 안전 처리
    const perMax = PER_LOCATION_MAX;
    const reserved = (res && res.reserved) || {};
    
    renderScheduleRows(day, perMax, reserved);
  }).fail(function(){
    // 실패 시 reserved=0으로 가정하여라도 렌더 (최악의 경우 사용자 선택은 가능)
    renderScheduleRows(day, PER_LOCATION_MAX, {});
  });
}

// 실제 테이블 렌더
function renderScheduleRows(day, perLocationMax, reservedMap) {
  let html = "";

  if (PLACE_CODES.length === 0) {
    html = "<tr><td colspan='3'>등록된 장소가 없습니다.</td></tr>";
  } else {
    PLACE_CODES.forEach(function(code, i){
      const name = PLACE_NAMES[i] || code;
      const used = Number(reservedMap[code] || 0);
      const slotMax = (CAP_OVERRIDE[code] != null ? CAP_OVERRIDE[code] : perLocationMax);
      const remain  = Math.max(0, slotMax - used);

      const isFull = (remain === 0);
      const btnClass = isFull ? "btn full" : "btn available";
      const btnText  = isFull ? "예약마감" : "예약가능";
      const disabled = isFull ? "disabled" : "";

      const safeCode = code.replace(/'/g, "\\'");
      const safeName = name.replace(/'/g, "\\'");
      
      html += "<tr>"
           +  "<td>" + name + "</td>"
           +  "<td class='text-right'>잔여 " + remain + "명</td>"
           +  "<td class='text-right'>"
           +     "<button type='button' class='" + btnClass + "' " + disabled
           +       " onclick=\"selectSlot('" + day + "', '" + safeCode + "', '" + safeName + "', '" + remain + "')\">"
           +         btnText
           +     "</button>"
           +  "</td>"
           + "</tr>";
    });
  }

  $("#scheduleBody").html(html);
}

// 사용자가 장소 선택했을 때 폼 hidden 값 채움
function selectSlot(slotDate, placeCode, placeName, remain){
  $("#location").val(placeCode);
  $("#remain").val(remain);
  $("#selectedSlot").val(slotDate + " " + placeName);
}
</script>

<style>
  .reservationTable td.place-only { padding: 10px 8px; font-weight: 600; }
  .calendar td.selected { outline: 2px solid #2a6; border-radius: 6px; }
  .calendar td.disabled { color:#bbb; pointer-events:none; }
  .reservationTable .btn { padding:6px 12px; border:1px solid #ddd; border-radius:6px; background:#fff; }
  .reservationTable .btn.available { border-color:#2a6; }
  .reservationTable .btn.full { color:#999; border-color:#ccc; background:#f6f6f6; cursor:not-allowed; }
</style>

<!-- 서브 배너 -->
<section class="sub-banner">
  <div class="sub-banner-text">
    <h1>온라인 예약</h1>
  </div>
</section>

<section class="breadcrumb">
  <div class="hero-inner">
    <ul>
      <li><a href="<c:url value='/usr/main.do'/>">홈</a></li>
      <li><a href="#">온라인예약</a></li>
      <li><a href="<c:url value='/usr/reservation/${pgType}/list.do'/>">산림체험 프로그램신청</a></li>
    </ul>
  </div>
</section>

<form id="form" name="form" method="post" enctype="multipart/form-data">
  <input type="hidden" id="pgType"   name="pgType"  value="${pgType}" />
  <input type="hidden" id="pgId"     name="pgId"    value="${userProgramVO.pgId}" />
  <input type="hidden" id="pgCode"   name="pgCode"  value="${userProgramVO.pgCode}" />
  <input type="hidden" id="capacity" name="capacity"value="${userProgramVO.capacity}" />
  <input type="hidden" id="location" name="location" />
  <input type="hidden" id="remain"   name="remain" />

  <section class="section">
    <div class="programS-list programS-detail">
      <article class="program-item" aria-labelledby="p1-title">
        <c:if test="${empty userProgramVO.pgThumbpath}">
          <div class="program-thumb" style="background-image:url('${contextRoot}/assets/css/usr/img/list-1.jpg');" role="img" aria-label="산림체험 이미지"></div>
        </c:if>
        <c:if test="${not empty userProgramVO.pgThumbpath}">
          <div class="program-thumb" style="background-image:url('${contextRoot}/thumbnail/${userProgramVO.pgThumbpath}');" role="img" aria-label="산림체험 이미지"></div>
        </c:if>

        <div class="program-body">
          <div class="program-actions flex center">
            <div>
              <span class="status">모집중</span>
              <p class="p1-title">[${userProgramVO.pgCodeNm}]${userProgramVO.pgName}</p>
            </div>
          </div>

          <div class="programS-txt">
            <dl>
              <dt>신청기간</dt>
              <dd>${userProgramVO.regOpenDateYmd} ~ ${userProgramVO.regCloseDateYmd}</dd>
            </dl>
            <dl>
              <dt>체험일</dt>
              <dd>${userProgramVO.startDateYmd} ~ ${userProgramVO.endDateYmd}</dd>
            </dl>
            <dl>
              <dt>신청인원</dt>
              <dd><fmt:formatNumber value="${userProgramVO.capacity}" type="number" maxFractionDigits="0"/>명</dd>
            </dl>
            <dl>
              <dt>장소</dt>
              <dd>${userProgramVO.locationNm}</dd>
            </dl>
            <dl>
              <dt>비용</dt>
              <dd>5,000원</dd>
            </dl>
          </div>
        </div>
      </article>
    </div>

    <div class="programS-form">
      <h3>프로그램 정보</h3>
      <div class="programS-txt">
        <dl>
          <dt>프로그램</dt>
          <dd>${userProgramVO.pgName}</dd>
        </dl>
        <dl>
          <dt>프로그램 일시</dt>
          <dd>${userProgramVO.startDateYmd} ~ ${userProgramVO.endDateYmd}</dd>
        </dl>
        <dl>
          <dt>프로그램 장소</dt>
          <dd>${userProgramVO.locationNm}</dd>
        </dl>

        <!-- 일정선택 -->
        <dl class="calendarDt">
          <dt>일정선택</dt>
          <dd>
            <div id="calendarSection">
              <!-- 달력 -->
              <div id="calendarContainer">
                <div id="calendarNav">
                  <button type="button" id="prevMonth">
                    <img src="${contextRoot}/assets/css/usr/img/arrow_right.png" alt="">
                  </button>
                  <span id="calendarHeader"></span>
                  <button type="button" id="nextMonth">
                    <img src="${contextRoot}/assets/css/usr/img/arrow_right.png" alt="">
                  </button>
                </div>
                <table class="calendar">
                  <thead>
                    <tr id="calendarHeaderRow"></tr>
                  </thead>
                  <tbody id="calendarBody"></tbody>
                </table>
              </div>

              <!-- 선택된 날짜 예약현황 -->
              <div id="reservationContainer">
                <div id="selectedDate">
                  <p>예약 가능</p>
                  <span>달력에서 예약 가능 일자를 선택해 주세요.</span>
                </div>
                <table class="reservationTable">
                  <tbody id="scheduleBody"></tbody>
                </table>
              </div>
            </div>
          </dd>
        </dl>

        <dl>
          <dt>선택일정</dt>
          <dd><input type="text" id="selectedSlot" name="programDt" readonly></dd>
        </dl>

        <!-- 신청자 정보 -->
        <dl>
          <dt>참여자명</dt>
          <dd><input type="text" id="name" name="name" placeholder="내용을 입력하세요"/></dd>
        </dl>
        <dl>
          <dt>성별</dt>
          <dd>
            <select id="gender" name="gender">
              <option value="M">남성</option>
              <option value="F">여성</option>
            </select>
          </dd>
        </dl>
        <dl>
          <dt>체험자 나이</dt>
          <dd><input type="text" id="age" name="age" class="cost" />세</dd>
        </dl>
        <dl>
          <dt>연락처</dt>
          <dd><input type="text" id="phone" name="phone" class="phone_num" maxlength="13"/></dd>
        </dl>

        <!-- 개인/그룹 -->
        <dl>
          <dt>선택</dt>
          <dd>
            <input type="radio" id="label-1" name="groupYn" value="N">
            <label for="label-1">개인</label>
            <input type="radio" id="label-2" name="groupYn" value="Y">
            <label for="label-2">그룹</label>
          </dd>
        </dl>
        <dl id="peopleCntContainer" style="display:none;">
          <dt>인원수</dt>
          <dd><input type="text" id="peopleCnt" name="peopleCnt"/>&nbsp;&nbsp;&nbsp;명</dd>
        </dl>

        <!-- 유입 경로(단일 선택) -->
        <dl>
          <dt>프로그램을<br>알게된 경로</dt>
          <dd>
            <input type="checkbox" id="cLabel-1" name="recommend" value="FRIEND" checked>
            <label for="cLabel-1">지인추천</label>

            <input type="checkbox" id="cLabel-2" name="recommend" value="KAKAO">
            <label for="cLabel-2">카카오톡</label>

            <input type="checkbox" id="cLabel-3" name="recommend" value="BLOG">
            <label for="cLabel-3">블로그</label>

            <input type="checkbox" id="cLabel-4" name="recommend" value="CAFE">
            <label for="cLabel-4">카페</label>

            <input type="checkbox" id="cLabel-5" name="recommend" value="NEWS">
            <label for="cLabel-5">뉴스레터</label>

            <input type="checkbox" id="cLabel-6" name="recommend" value="ETC">
            <label for="cLabel-6">기타</label>
          </dd>
        </dl>
      </div>

      <div class="agree-div flex center">
        <input type="checkbox" id="agree">
        <label for="agree">개인정보 수집 및 이용에 동의합니다.</label>
      </div>

      <div class="form-btn">
        <button type="button" onclick="fn_apply()">예약하기</button>
      </div>
    </div>
  </section>
</form>

<c:import url="/usr/layout/footer.do" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

<script>
var pgType = "${pgType}";
const LOCATIONS_RAW = "${fn:escapeXml(userProgramVO.location)}";
const LOCATIONS_NM_RAW = "${fn:escapeXml(userProgramVO.locationNm)}";

// 예약된 장소 목록(종류) → 서버에서 내려준 값 직렬화
const REG_PLACE_LIST = [
<c:forEach var="p" items="${regPlaceList}" varStatus="st">
  "${fn:escapeXml(p.location)}"<c:if test="${!st.last}">,</c:if>
</c:forEach>
];

const REG_PLACE_SET = new Set(REG_PLACE_LIST.filter(Boolean));
const REG_PLACE_CNT = ${empty regPlaceList ? 0 : fn:length(regPlaceList)};

const SLOT_CAPACITY = parseInt("${userProgramVO.capacity}");

function fn_apply() {
	  // 일정·장소 선택 여부
	  if (!$("#location").val()) { alert("일정과 장소를 먼저 선택해 주세요."); return; }

	  // 기본 정보
	  const name = ($("#name").val() || "").trim();
	  if (!name) { alert("참여자 명을 입력해 주세요."); $("#name").focus(); return; }

	  const age = ($("#age").val() || "").trim();
	  if (!/^\d+$/.test(age) || parseInt(age, 10) <= 0) {
	    alert("나이는 1 이상의 숫자만 입력하세요.");
	    $("#age").focus();
	    return;
	  }
	  
	  const phone = ($("#phone").val() || "").trim();
	  if (!phone) { alert("연락처를 입력해 주세요."); $("#phone").focus(); return; }

	  // 그룹 여부(라디오)
	  const groupYn = $('input[name="groupYn"]:checked').val();
	  if (!groupYn) { alert("개인/그룹을 선택해 주세요."); $('input[name="groupYn"]').first().focus(); return; }

	  // 잔여 인원(선택 시 selectSlot에서 #remain에 세팅됨)
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
	    // 개인: peopleCnt를 1로 고정 전달
	    if (!$("#peopleCnt").length) {
	      $("<input>", {type:"hidden", id:"peopleCnt", name:"peopleCnt", value:"1"}).appendTo("#form");
	    } else {
	      $("#peopleCnt").val("1");
	    }
	    if (rem < 1) { alert("잔여 인원이 없습니다. 다른 날짜/장소를 선택해 주세요."); return; }
	  }

	  // (선택) 약관 동의가 필요하면 활성화
	  if (!$("#agree").is(":checked")) { alert("개인정보 수집 및 이용에 동의해 주세요."); return; }

	  $("#form").attr("action", "${contextRoot}/usr/reservation/" + pgType + "/reserve.do").submit();
	}

$(function(){
  // 체험 시작일/종료일 (YYYY-MM-DD)
  var startParts = "${userProgramVO.startDate}".split("T")[0].split("-");
  var endParts   = "${userProgramVO.endDate}".split("T")[0].split("-");
  var startDate  = new Date(startParts[0], startParts[1]-1, startParts[2]);
  var endDate    = new Date(endParts[0],   endParts[1]-1,   endParts[2]);

  // 달력 초기값: 체험 시작 월
  var currentYear  = startDate.getFullYear();
  var currentMonth = startDate.getMonth() + 1;

  function pad2(n){ return (n<10 ? "0" : "") + n; }

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

          // ★ 체험일 범위 안인 날짜만 선택 가능
          var isSelectable = (cellDate >= startDate && cellDate <= endDate);

          html += '<td class="'+(isSelectable ? 'selectable' : 'disabled')+'" data-date="'+dateStr+'">'+date+'</td>';
        }
      }
      html += "</tr>";
    }

    $("#calendarBody").html(html);
  }

  // 이전/다음 달 이동: 체험기간 내에서만 이동 허용
  $("#prevMonth").click(function(){
    var tempMonth = (currentMonth === 1) ? 12 : currentMonth - 1;
    var tempYear  = (currentMonth === 1) ? currentYear - 1 : currentYear;

    /* if (tempYear < startDate.getFullYear() || tempYear > endDate.getFullYear()) return;
    if (tempYear === startDate.getFullYear() && tempMonth < (startDate.getMonth()+1)) return;
    if (tempYear === endDate.getFullYear()   && tempMonth > (endDate.getMonth()+1)) return; */

    currentYear = tempYear;
    currentMonth = tempMonth;
    generateCalendar(currentYear, currentMonth);
  });

  $("#nextMonth").click(function(){
    var tempMonth = (currentMonth === 12) ? 1 : currentMonth + 1;
    var tempYear  = (currentMonth === 12) ? currentYear + 1 : currentYear;

    /* if (tempYear < startDate.getFullYear() || tempYear > endDate.getFullYear()) return;
    if (tempYear === startDate.getFullYear() && tempMonth < (startDate.getMonth()+1)) return;
    if (tempYear === endDate.getFullYear()   && tempMonth > (endDate.getMonth()+1)) return; */

    currentYear = tempYear;
    currentMonth = tempMonth;
    generateCalendar(currentYear, currentMonth);
  });

  // 날짜 클릭 → 시간표 조회
  $(document).on("click", ".selectable", function(){
    $(".calendar td").removeClass("selected");
    $(this).addClass("selected");
    var day = $(this).data("date");
    updateSchedule(day);
  });

  function updateSchedule(day){
	  $("#selectedDate p").text(day + " 예약현황");
	  $("#selectedDate span").hide();

	  const codes = (LOCATIONS_RAW || "")
	    .split(",").map(s => s.trim()).filter(Boolean);

	  const names = (LOCATIONS_NM_RAW || "")
	    .split(",").map(s => s.trim()).filter(Boolean);

	  const baseCapacity = (parseInt("${userProgramVO.capacity}") || 0); // 필요 시 *2 등 조정

	  let html = "";
	  if (codes.length === 0 || names.length === 0) {
	    html = "<tr><td colspan='3'>등록된 장소가 없습니다.</td></tr>";
	  } else {
	    codes.forEach(function(code, idx){
	      const name = names[idx] || code;

	      // TODO: 실제 예약수로 바꾸세요.
	      const reserved = "${userProgramVO.regCnt}"; // TODO: 실제 예약 수 반영
	      const remain   = Math.max(0, baseCapacity - reserved);

	      // 기본 가용여부
	      let isFull   = (remain === 0);
	      let btnClass = isFull ? "btn full" : "btn available";
	      let btnText  = isFull ? "예약마감" : "예약가능";
	      let disabled = isFull ? "disabled" : "";

	      // ★ 장소 종류가 이미 2개면, 그 2개에 포함되지 않은 곳은 '예약불가'
	      if (REG_PLACE_CNT >= 2 && !REG_PLACE_SET.has(code)) {
	        btnClass = "btn full";
	        btnText  = "예약불가";
	        disabled = "disabled";
	      }

	      const safeCode = code.replace(/'/g, "\\'");
	      const safeName = name.replace(/'/g, "\\'");

	      html += "<tr>"
	           +   "<td>" + name + "</td>"
	           +   "<td class='text-right'>잔여 " + remain + "명</td>"
	           +   "<td class='text-right'>"
	           +     "<button type='button' class='" + btnClass + "' " + disabled
	           +       " onclick=\"selectSlot('" + day + "', '" + safeCode + "', '" + safeName + "', '" + remain + "')\">"
	           +         btnText
	           +     "</button>"
	           +   "</td>"
	           + "</tr>";
	    });
	  }

	  $("#scheduleBody").html(html);
	}

  // 달력 렌더 (체험 시작월 기준)
  generateCalendar(currentYear, currentMonth);

  // 휴대전화 자동 하이픈
  $(".phone_num").on("input", function() {
    let v = $(this).val().replace(/[^0-9]/g, "");
    if (v.length > 3 && v.length <= 7) v = v.replace(/(\d{3})(\d{1,4})/, "$1-$2");
    else if (v.length > 7)             v = v.replace(/(\d{3})(\d{4})(\d{1,4})/, "$1-$2-$3");
    $(this).val(v);
  });

  // 그룹 인원수 토글 (필요 시)
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
});

function selectSlot(slotDate, placeCode, placeName, remain){
	  $("#location").val(placeCode);
	  $("#remain").val(remain);
	  $("#selectedSlot").val(slotDate + " " + placeName);
	}

//그룹일 시 인원수 입력 추가
function togglePeopleCnt() {
    if ($("input[name='groupYn']:checked").val() === "Y") {
        $("#peopleCntContainer").show();
    } else {
        $("#peopleCntContainer").hide();
    }
}

togglePeopleCnt();
$("input[name='groupYn']").change(function(){
    togglePeopleCnt();
});
</script>

<style>
  .reservationTable td.place-only { padding: 10px 8px; font-weight: 600; }
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
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">온라인예약</a></li>
				<li><a href="<c:url value="/usr/reservation/${pgType}/list.do"/>">산림체험 프로그램신청</a></li>
			</ul>
		</div>
	</section>

	<form id="form" name="form" method="post" enctype="multipart/form-data">
		<input type="hidden" id="pgType" name="pgType" value="${pgType}" />
		<input type="hidden" id="pgId" name="pgId" value="${userProgramVO.pgId}" />
		<input type="hidden" id="pgCode" name="pgCode" value="${userProgramVO.pgCode}" />
		<input type="hidden" id="capacity" name="capacity" value="${userProgramVO.capacity}" />
		<input type="hidden" id="location" name="location" />
		<input type="hidden" id="remain" name="remain" />
	
    <!-- 프로그램 리스트 -->
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
			<form>
				<h3>프로그램 정보</h3>
				<div class="programS-txt">
					<dl>
						<dt>프로그램</dt>
						<dd>${userProgramVO.pgName}</dd>
					</dl>
					<dl>
						<dt>프로그램 일시</dt>
						<dd>6월 25일 수요일 10:00</dd>
					</dl>
					<dl>
						<dt>프로그램 장소</dt>
						<dd>${userProgramVO.locationNm}</dd>
					</dl>
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
					<!-- <dl>
						<dt>품목명</dt>
						<dd>
							<select>
								<option>선택해주세요</option>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>비용</dt>
						<dd><input type="text" class="cost" placeholder="5,000" disabled/>원</dd>
					</dl> -->
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
					<!-- <dl>
						<dt>결제방식</dt>
						<dd>
							<input type="radio" id="label-3" name="groupYn" value="N"> 
							<label for="label-3">개인</label>
							<input type="radio" id="label-4" name="groupYn" value="Y">
							<label for="label-4">단체</label>
						</dd>
					</dl> -->
				</div>
				
				<div class="agree-div flex center">
					<input type="checkbox" id="agree">
					<label for="agree">개인정보 수집 및 이용에 동의합니다.</label>
				</div>
				
				<div class="form-btn">
					<button type="button" onclick="fn_apply()">예약하기</button>
				</div>
			</form>
		</div>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
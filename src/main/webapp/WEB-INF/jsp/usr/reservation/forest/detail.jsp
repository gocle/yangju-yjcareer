<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
<script>
var pgType = "${pgType}";

function fn_apply() {
  $("#form").attr("action", "${contextRoot}/usr/reservation/" + pgType + "/reserve.do");
  $("#form").submit();
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

    if (tempYear < startDate.getFullYear() || tempYear > endDate.getFullYear()) return;
    if (tempYear === startDate.getFullYear() && tempMonth < (startDate.getMonth()+1)) return;
    if (tempYear === endDate.getFullYear()   && tempMonth > (endDate.getMonth()+1)) return;

    currentYear = tempYear;
    currentMonth = tempMonth;
    generateCalendar(currentYear, currentMonth);
  });

  $("#nextMonth").click(function(){
    var tempMonth = (currentMonth === 12) ? 1 : currentMonth + 1;
    var tempYear  = (currentMonth === 12) ? currentYear + 1 : currentYear;

    if (tempYear < startDate.getFullYear() || tempYear > endDate.getFullYear()) return;
    if (tempYear === startDate.getFullYear() && tempMonth < (startDate.getMonth()+1)) return;
    if (tempYear === endDate.getFullYear()   && tempMonth > (endDate.getMonth()+1)) return;

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

    $.ajax({
      url: "${contextRoot}/usr/reservation/"+ pgType +"/getTimeByDate.do",
      type: "GET",
      data: { pgId: $("#pgId").val(), slotDate: day },
      dataType: "json",
      success: function(res){
        var schedules = res.time || [];
        var html = "";
        if (schedules.length === 0){
          html = "<tr><td colspan='4'>예약 데이터가 없습니다.</td></tr>";
        } else {
          schedules.forEach(function(s,i){
            var remain   = s.capacity - s.resvCnt;
            var btnClass = (remain === 0) ? "btn full" : "btn available";
            var btnText  = (remain === 0) ? "예약마감" : "예약가능";
            var start = String(s.startTime.hour).padStart(2, '0') + ":" + String(s.startTime.minute).padStart(2, '0');
            var end   = String(s.endTime.hour).padStart(2, '0') + ":" + String(s.endTime.minute).padStart(2, '0');

            html += "<tr>"
                 + "<td>"+(i+1)+"부</td>"
                 + "<td>"+ start + "~" + end +"</td>"
                 + "<td>잔여 "+ remain +"명</td>"
                 + "<td><button type='button' class='"+btnClass+"' onclick='selectSlot(\""
                 + s.slotId + "\", \""
                 + s.slotDate.year + "-" + String(s.slotDate.monthValue).padStart(2,'0') + "-" + String(s.slotDate.dayOfMonth).padStart(2,'0') + "\", \""
                 + s.slotNo + "\", \""
                 + start + "\", \""
                 + end + "\")'>"+ btnText +"</button></td>"
                 + "</tr>";
          });
        }
        $("#scheduleBody").html(html);
      },
      error: function(){
        $("#scheduleBody").html("<tr><td colspan='4'>데이터 조회 실패</td></tr>");
      }
    });
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

function selectSlot(slotId, slotDate, slotNo, startTime, endTime){
  $("#slotId").val(slotId);
  $("#selectedSlot").val(slotDate + " " + slotNo + "부 " + startTime + " ~ " + endTime);
}
</script>



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
						<dd>${userProgramVO.capacity}명</dd>
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
						<dd><input type="text" id="selectedSlot" disabled></dd>
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
						<dt>나이</dt>
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
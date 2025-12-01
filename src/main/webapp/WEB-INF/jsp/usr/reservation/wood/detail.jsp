<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />
<c:import url="/usr/menu/header.do" />

<script>
var timeSlots = [
    <c:forEach var="slot" items="${timeSlots}" varStatus="st">
    {
        date: "${slot.slotDate}",   // yyyy-MM-dd
        time: "${slot.startTime}~${slot.endTime}",
        total: ${slot.capacity}
    }<c:if test="${!st.last}">,</c:if>
    </c:forEach>
];
var pgType = "${pgType}";
$(function(){
	var availableDates = new Set(timeSlots.map(slot => slot.date));

    var firstSlotDate = new Date(Array.from(availableDates)[0]); 
    var currentYear  = firstSlotDate.getFullYear();
    var currentMonth = firstSlotDate.getMonth() + 1;

    function generateCalendar(year, month){
        $("#calendarHeader").text(year + "년 " + month + "월");

        var firstDay = new Date(year, month-1, 1).getDay();
        var lastDate = new Date(year, month, 0).getDate();
        var html = "";
        
        var today = new Date();
        var minDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 5);

        for(var i=0;i<6;i++){
            html += "<tr>";
            for(var j=0;j<7;j++){
                if(i===0 && j<firstDay){
                    html += "<td></td>";
                } else {
                    var date = i*7 + j - firstDay + 1;
                    if(date>lastDate){ html+="<td></td>"; continue; }

                    var dateStr = year + "-" + (month<10?"0"+month:month) + "-" + (date<10?"0"+date:date);
                    var cellDate = new Date(year, month-1, date);
                    var isSelectable = availableDates.has(dateStr) && cellDate >= minDate;

                    html += '<td class="'+(isSelectable?"selectable":"disabled")+'" data-date="'+dateStr+'">'+date+'</td>';
                }
            }
            html += "</tr>";
        }

        $("#calendarBody").html(html);
    }

    var startParts = "${userProgramVO.startDate}".split("T")[0].split("-");
    var endParts   = "${userProgramVO.endDate}".split("T")[0].split("-");

    var startDate = new Date(startParts[0], startParts[1]-1, startParts[2]);
    var endDate   = new Date(endParts[0], endParts[1]-1, endParts[2]);
    // 좌우 화살표 클릭
    $("#prevMonth").click(function(){
        var tempMonth = currentMonth === 1 ? 12 : currentMonth - 1;
        var tempYear = currentMonth === 1 ? currentYear - 1 : currentYear;

        // 체험기간 내 월만 허용
        if(tempYear > endDate.getFullYear() || tempYear < startDate.getFullYear()) return;
        if(tempYear === startDate.getFullYear() && tempMonth < startDate.getMonth()+1) return;
        if(tempYear === endDate.getFullYear() && tempMonth > endDate.getMonth()+1) return;

        currentYear = tempYear;
        currentMonth = tempMonth;
        generateCalendar(currentYear, currentMonth);
    });

    $("#nextMonth").click(function(){
        var tempMonth = currentMonth === 12 ? 1 : currentMonth + 1;
        var tempYear = currentMonth === 12 ? currentYear + 1 : currentYear;

        if(tempYear > endDate.getFullYear() || tempYear < startDate.getFullYear()) return;
        if(tempYear === startDate.getFullYear() && tempMonth < startDate.getMonth()+1) return;
        if(tempYear === endDate.getFullYear() && tempMonth > endDate.getMonth()+1) return;

        currentYear = tempYear;
        currentMonth = tempMonth;
        generateCalendar(currentYear, currentMonth);
    });

    // 날짜 클릭 이벤트
    $(document).on("click",".selectable",function(){
        $(".calendar td").removeClass("selected");
        $(this).addClass("selected");
        var day = $(this).data("date");
        updateSchedule(day);
    });

    function updateSchedule(day){
        $("#selectedDate p").text((day<10?"0"+day:day) + " 예약현황");
        $("#selectedDate span").hide();
        $.ajax({
            url: "${contextRoot}/usr/reservation/"+ pgType +"/getTimeByDate.do",
            type: "GET",
            data: { pgId: $("#pgId").val(), slotDate: day },
            dataType: "json",
            success: function(res){
                var schedules = res.time || [];
                var html = "";
                if(schedules.length === 0){
                    html = "<tr><td colspan='4'>예약 데이터가 없습니다.</td></tr>";
                } else {
                    schedules.forEach(function(s,i){
                    	var remain = s.capacity - s.resvCnt;
                        var btnClass, btnText, onclickFn;

                        if(remain <= 0){
                            remain = 0; // 음수 방지
                            btnClass = "btn full";
                            btnText = "예약마감";
                            onclickFn = "alert('예약마감되었습니다')";
                        } else {
                            btnClass = "btn available";
                            btnText = "예약가능";
                            onclickFn = "selectSlot(\""
                                + s.slotId + "\", \"" 
                                + s.slotDate + "\", \"" 
                                + s.slotNo + "\", \"" 
                                + String(s.startTime.hour).padStart(2,'0') + ":" + String(s.startTime.minute).padStart(2,'0') + "\", \"" 
                                + String(s.endTime.hour).padStart(2,'0') + ":" + String(s.endTime.minute).padStart(2,'0') + "\")";
                        }

                        var start = String(s.startTime.hour).padStart(2,'0') + ":" + String(s.startTime.minute).padStart(2,'0');
                        var end   = String(s.endTime.hour).padStart(2,'0') + ":" + String(s.endTime.minute).padStart(2,'0');
                        var time  = start + "~" + end;

                        html += "<tr><td>"+(i+1)+"부</td><td>"+ time +"</td><td>잔여 "+ remain +"명</td>" +
                                "<td><button type='button' class='"+btnClass+"' onclick='"+onclickFn+"'>"+btnText+"</button></td></tr>";
                    });
                }
                $("#scheduleBody").html(html);
            },
            error: function(){
                $("#scheduleBody").html("<tr><td colspan='4'>데이터 조회 실패</td></tr>");
            }
        });
    }

    generateCalendar(currentYear, currentMonth);
    
    //휴대전화 val
    $(".phone_num").on("input", function() {
        let value = $(this).val().replace(/[^0-9]/g, "");

        if (value.length > 3 && value.length <= 7) {
            value = value.replace(/(\d{3})(\d{1,4})/, "$1-$2");
        } else if (value.length > 7) {
            value = value.replace(/(\d{3})(\d{4})(\d{1,4})/, "$1-$2-$3");
        }
        $(this).val(value);
    });
    
    //그룹일 시 인원수 입력 추가
    function togglePeopleCnt() {
    	if ($("input[name='groupYn']:checked").val() === "Y") {
            $("#peopleCntContainer").show();
            $('#peopleCnt').prop('readonly', true);

            function updateDlTotal() {
                const m = parseInt($('#mCnt').val().replace(/,/g, '')) || 0;
                const f = parseInt($('#fCnt').val().replace(/,/g, '')) || 0;
                $('#peopleCnt').val(m + f);
            }

            $('#mCnt, #fCnt').off('input').on('input', updateDlTotal);

            updateDlTotal();
        } else {
            $("#peopleCntContainer").hide();
            $('#peopleCnt').prop('readonly', false);
            $('#peopleCnt').val('1');
            $('#mCnt, #fCnt').val('');
        }
    }

    togglePeopleCnt();
    $("input[name='groupYn']").change(function(){
        togglePeopleCnt();
    });
    
    $("input[name='recommend']").on("click", function() {
        $("input[name='recommend']").not(this).prop("checked", false);
    });
});

function selectSlot(slotId, slotDate, slotNo, startTime, endTime){
    $("#slotId").val(slotId);
    $("#selectedSlot").val(slotDate + " " + slotNo + "부 " + startTime + " ~ " + endTime);
}

//공예품 선택
function fn_selProduct(productId, productName, basePrice, optionName, optionPrice) {
    $("#productId").val(productId);
    $("#productName").val(productName);

    $("#price").val(Number(basePrice).toLocaleString());
    $("#price").data("basePrice", Number(basePrice));

    var $dl = $("#productOption");
    var $select = $("#optionName");

    if(optionName && optionName !== "") {
        $dl.show();
        $select.empty();

        $select.append($('<option>', { 
            value: "", 
            text: "선택안함", 
            'data-price': 0 
        }));

        var price = Number(optionPrice) || 0;
        var text = optionName;
        if(price > 0) text += " (+" + price.toLocaleString() + "원)";

        $select.append($('<option>', { 
            value: optionName, 
            text: text, 
            'data-price': price 
        }));
    } else {
        $dl.hide();
    }

    $('.item-pop-modal').fadeOut().removeClass('active');
    $('body').css('overflow', '');
}

function updatePrice(select) {
    var basePrice = Number($("#price").data("basePrice")) || 0;
    var optionPrice = Number($(select).find(":selected").data("price")) || 0;

    $("#price").val((basePrice + optionPrice).toLocaleString());
}

function fn_apply() {

	// 일정·장소 선택 여부
	if (!$("#selectedSlot").val()) { alert("일정과 장소를 먼저 선택해 주세요."); return; }
	
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
	  if (!phone) { alert("담당자 연락처를 입력해 주세요."); $("#phone").focus(); return; }
	  
	  const productName = ($("#productName").val() || "").trim();
	  if (!productName) { alert("품목을 선택해 주세요."); $("#productName").focus(); return; }

	  // 그룹 여부(라디오)
	  const groupYn = $('input[name="groupYn"]:checked').val();
	  if (!groupYn) { alert("개인/그룹을 선택해 주세요."); $('input[name="groupYn"]').first().focus(); return; }
	  
	  if (groupYn === "Y") {
		    const v = ($("#peopleCnt").val() || "").trim();
		    if (!/^\d+$/.test(v)) { alert("인원수는 1 이상의 숫자만 입력 가능합니다."); $("#peopleCnt").focus(); return; }
		    const n = parseInt(v, 10);
		    if (n < 1) { alert("인원수는 1명 이상 입력하세요."); $("#peopleCnt").focus(); return; }
		  }
	  
	  if (!$("#agree").is(":checked")) {
			alert("개인정보 수집 및 이용에 동의해 주세요.");
			$("#agree").focus();
			return;
	  }
	  
	$("#form").attr("action", "${contextRoot}/usr/reservation/"+pgType+"/reserve.do");
	$("#form").submit();
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
				<li><a href="<c:url value="/usr/reservation/${pgType}/list.do"/>">목공체험 프로그램신청</a></li>
			</ul>
		</div>
	</section>

    <section class="section">
		<div class="programS-list programS-detail">
			<article class="program-item" aria-labelledby="p1-title">
			  <c:if test="${empty userProgramVO.pgThumbpath}">
        		<div class="program-thumb" style="background-image:url('${contextRoot}/assets/css/usr/img/list-1.jpg');" role="img" aria-label="목공체험 이미지"></div>
        	  </c:if>
        	  <c:if test="${not empty userProgramVO.pgThumbpath}">
        		<div class="program-thumb" style="background-image:url('${contextRoot}/thumbnail/${userProgramVO.pgThumbpath}');" role="img" aria-label="목공체험 이미지"></div>
        	  </c:if>

			  <div class="program-body">

				<div class="program-actions flex center">
					<div>
						<span class="status">
						<c:set var="now" value="<%= new java.util.Date() %>" />
						<fmt:parseDate value="${userProgramVO.regCloseDateYmd}" pattern="yyyy-MM-dd" var="closeDate" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="todayStr" />
						<fmt:parseDate value="${todayStr}" pattern="yyyy-MM-dd" var="today" />
							<c:choose>
								<c:when test="${closeDate.time lt today.time}">종료</c:when>
								<c:when test="${userProgramVO.status eq 'WAIT'}">예정</c:when>
								<c:when test="${userProgramVO.status eq 'OPEN'}">모집중</c:when>
								<c:when test="${userProgramVO.status eq 'CLOSE'}">마감</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</span>
						<p class="p1-title">${userProgramVO.pgName}</p>
					</div>
				</div>

				<div class="programS-txt">
					<dl>
						<dt>신청기간</dt>
						<dd>
							${userProgramVO.regOpenDateYmd} ~ ${userProgramVO.regCloseDateYmd}
						</dd>
					</dl>
					<dl>
						<dt>체험일</dt>
						<dd>${userProgramVO.startDateYmd} ~ ${userProgramVO.endDateYmd}</dd>
					</dl>
					<dl>
						<dt>프로그램 유형</dt>
						<dd>
							<c:choose>
								<c:when test="${userProgramVO.classType eq 'ONEDAY'}">원데이클래스</c:when>
								<c:when test="${userProgramVO.classType eq 'DIY'}">DIY</c:when>
								<c:when test="${userProgramVO.classType eq 'CHILD'}">유치원</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</dd>
					</dl>
					<dl>
						<dt>프로그램 장소</dt>
						<dd>${userProgramVO.location}</dd>
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
					<dt>안내</dt>
					<dd>
						<div class="pgDesc">
						${userProgramVO.pgDesc} 
						</div>
					</dd>
				</dl>
				<dl>
					<dt>강사명</dt>
					<dd>${userProgramVO.instructorName}</dd>
				</dl>
				<dl>
					<dt>문의</dt>
					<dd>${userProgramVO.contact}</dd>
				</dl>
			</div>
		</div>
		
		<c:if test="${userProgramVO.status eq 'OPEN' and userProgramVO.statusEnd ne 'Y' }">
		<form id="form" name="form" method="post" enctype="multipart/form-data">
		<input type="hidden" id="pgType" name="pgType" value="${pgType}" />
		<input type="hidden" id="pgId" name="pgId" value="${userProgramVO.pgId}" />
		<input type="hidden" id="slotId" name="slotId" />
		<input type="hidden" id="diKey" name="dikey" />
		<input type="hidden" id="productId" name="productId" />
		<div class="programS-form">
			<h3>예약 정보</h3>
			<div class="programS-txt detail-item">
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
					<dt>이름</dt>
					<dd><input type="text" id="name" name="name" value="${sessionScope.SESSION_MEM_NAME}"/></dd>
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
					<c:choose>
					    <c:when test="${userProgramVO.classType eq 'CHILD'}">
					        <dt>담당자 연락처</dt>
					    </c:when>
					    <c:otherwise>
					        <dt>연락처</dt>
					    </c:otherwise>
					</c:choose>
					<dd><input type="text" id="phone" name="phone" class="phone_num" maxlength="13" value="${sessionScope.SESSION_PHONE}"/></dd>
				</dl>
				<dl>
					<dt>품목명</dt>
					<dd>
						<input type="text" id="productName" class="item-class" readOnly/>
						<button type="button" class="openModalBtn">품목 선택</button>
					</dd>
				</dl>
				<dl id="productOption" style="display:none;">
					<dt>옵션</dt>
					<dd><select id="optionName" name="optionName" onchange="updatePrice(this)"></select></dd>
				</dl>
				<dl>
					<dt>비용</dt>
					<dd><input type="text" id="price" name="price" class="price cost" readOnly/>원</dd>
				</dl>
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
				    <dd>
				        남&nbsp;&nbsp; <input type="text" id="mCnt" name="mCnt" style="width:50px;" min="0"/> &nbsp;&nbsp;
				        여&nbsp;&nbsp; <input type="text" id="fCnt" name="fCnt" style="width:50px;" min="0"/> &nbsp;&nbsp;
				        총&nbsp;&nbsp; <input type="text" id="peopleCnt" name="peopleCnt" style="width:60px;" readonly/>&nbsp;&nbsp;명
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
			</div>
			
			<div class="agree-div flex center">
				<input type="checkbox" id="agree">
				<label for="agree">개인정보 수집 및 이용에 동의합니다.</label>
			</div>
			
			<div class="form-btn">
				<button type="button" onclick="fn_apply()">예약하기</button>
			</div>
		</div>
		</form>
		</c:if>
    </section>
    
	<script>
		
		$(document).ready(function() {
			$('.openModalBtn').click(function() {
				var slotId = $('#slotId').val();
			    var pgId = $('#pgId').val();
			    if (!slotId) {
			        alert("일정을 선택해주세요.");
			        return;
			    }
			    if ($('.item-pop-modal').length === 0) {
			    	$.ajax({
		    		  url: "${contextRoot}/usr/reservation/wood/productPopup.do",   
		    		  type: "GET",
		    		  data: {
		                  slotId: slotId,
		                  pgId: pgId
		              },
		    		  dataType: "html",
		    		  success: function(data) {
		    		    $('body').append(data);
		    		    initPopupEvents();
		    		    openPopup();
		    		  },
		    		  error: function(xhr, status, error) {
		    		    console.error("팝업 로드 실패:", status, error);
		    		  }
		    		});
			    } else {
			    	$.ajax({
			            url: "${contextRoot}/usr/reservation/wood/productPopup.do",
			            type: "GET",
			            data: { slotId: slotId, pgId: pgId },
			            dataType: "html",
			            success: function(data) {
			                $('.item-pop-modal').replaceWith(data);
			                initPopupEvents();
			                openPopup();
			            }
			        });
			    }
			  });

			  function openPopup() {
			    $('.item-pop-modal').fadeIn().addClass('active');
			    $('body').css('overflow', 'hidden');
			  }

			  function initPopupEvents() {
			    // 닫기
			    $(document).on('click', '.item-pop-close', function() {
			      $('.item-pop-modal').fadeOut().removeClass('active');
			      $('body').css('overflow', '');
			    });

			    // 탭 클릭
			    $(document).on('click', '.ageTab_btn', function() {
			      var tabId = $(this).data('tab');
			      $('.ageTab_btn').removeClass('active');
			      $(this).addClass('active');
			      $('.ageTab_content').removeClass('active');
			      $('#' + tabId).addClass('active');
			    });
			  }
		});
	</script>

	<c:import url="/usr/layout/footer.do" />
</body>
</html>
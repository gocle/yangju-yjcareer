<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sub.css">
<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/evo-calendar.css">
<script src="/yjcareer/assets/site/yjcareer/js/program.min.js"></script>
<script src="/yjcareer/assets/site/yjcareer/js/sub.js"></script>
<script src="/yjcareer/assets/common/js/board.js"></script>
    
  <c:import url="/usr/menu/header.do" />
  
   <div id="container">
        <div class="wrap clearfix">
            <main class="colgroup">
                <article>
    
                    <header class="sub_head">
    
                        <div class="sub_title">
                            <!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
                            <p class="first_title">1:1 상시 상담</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>
                            	<c:choose>
                            		<c:when test="${menuId eq '2025MENU0000152' }">학습심리상담</c:when>
                            		<c:when test="${menuId eq '2025MENU0000153' }">수시·정시상담</c:when>
                            		<c:when test="${menuId eq '2025MENU0000334' }">면접컨설팅</c:when>
                            		<c:otherwise>맞춤컨설팅</c:otherwise>
                            	</c:choose>
                            </h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                        
							<c:import url="/usr/menu/sub.do" />
            
                            <div class="addons">
                                <ul class="addons_list">
                                    <li class="addons_item print">
                                        <button type="button" onclick="window.print();" class="addons_button">인쇄</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                    
				</article>
			</main>
            <div id="contents">
            	<form id="searchForm" name="searchForm" method="post" onsubmit="return false;">
				<div class="calendar-nav">
				  <button id="prevMonth" type="button">이전</button>
				  <div class="top-date"></div>
				  <button id="nextMonth" type="button">다음</button>
				</div>
				<div class="cal-bottom">
					<!-- <dl class="cal-label">
						<dt>예약 안내</dt>
						<dd>맞춤컨설팅</dd>
						<dd>학습심리상담</dd>
						<dd>수시·정시상담</dd>
						<dd>면접컨설팅</dd>
					</dl> -->
					
					<div class="search_tab">
						<label class="chk-circle">
							<input type="checkbox" id="cbx_chkAll">
							<span class="chk-ui"></span>
							<span class="chk-text">전체</span>
						</label>
							      
						<label class="chk-circle">
							<input type="checkbox" name="searchCateCd" id="chk00" value="AA" ${searchVo.searchCateCd eq 'AA' ? 'checked' : '' }>
							<span class="chk-ui"></span>
							<span class="chk-text">맞춤컨설팅</span>
						</label>
						
						<label class="chk-circle">
							<input type="checkbox" name="searchCateCd" id="chk01" value="AB" ${searchVo.searchCateCd eq 'AB' ? 'checked' : '' }>
							<span class="chk-ui"></span>
							<span class="chk-text">학습심리상담</span>
						</label>
							
						<label class="chk-circle">
							<input type="checkbox" name="searchCateCd" id="chk02" value="AC" ${searchVo.searchCateCd eq 'AC' ? 'checked' : '' }>
							<span class="chk-ui"></span>
						    <span class="chk-text">수시·정시상담</span>
						</label>
							      
						<label class="chk-circle">
							<input type="checkbox" name="searchCateCd" id="chk03" value="AD" ${searchVo.searchCateCd eq 'AD' ? 'checked' : '' }>
						    <span class="chk-ui"></span>
						    <span class="chk-text">면접컨설팅</span>
						</label>
					</div>
					
					<c:if test="${not empty sessionScope.SESSION_DI_KEY}">
					<div class="reservation_more">
						<button class="reservation_more_btn" type="button" onclick="fnMyReservation();">나의 예약현황</button>
					</div>
					</c:if>
				</div>
				</form>
				<div id="calendar"></div>
			</div>        
		</div>
	</div>
	
     <form id="listForm" name="listForm" method="post">
     	<input type="hidden" id="seqCd" name="seqCd" value="" />
     	<input type="hidden" name="menuId" value="${param.menuId}">
     </form>
     
    <script>
	    function parseDate(dateStr) {
	        const parts = dateStr.split('-');
	        return new Date(parts[0], parts[1] - 1, parts[2]);
		}
    
		$(function () {
		  $('#calendar').evoCalendar({
			  eventHeaderFormat: 'yyyy-MM-dd 예약현황',
			  calendarEvents: []
			});

		  	const inst = $('#calendar')[0].evoCalendar;
		  	
		 	// 오늘 날짜 조회
		    const today = new Date();
			getConsulting(today.getFullYear(), today.getMonth() + 1);
		    
			markToday(inst);
			updateTopDate(inst);
			
			function moveMonth(delta) {
				// delta: -1 (prev), +1 (next)
				let y = inst.$active.year;
				let m = inst.$active.month + delta; // 0~11

				if (m < 0) { m = 11; y -= 1; }
				if (m > 11) { m = 0;  y += 1; }

				inst.$active.year = y;
				inst.$active.month = m;

				// ✅ 화면 갱신(사이드바/타이틀/달력)
				inst.buildSidebarYear();
				inst.buildSidebarMonths();
				inst.buildCalendar();

				// ✅ (event-header/이벤트리스트를 살려둔 경우만)
				if (typeof inst.buildEventList === 'function') {
				  inst.buildEventList();
				}

				// ✅ 타이틀 한글 커스텀 쓰고 있으면 여기서 한 번 더
				if (typeof renderKoreanTitle === 'function') {
				  renderKoreanTitle(inst);
				}
				
				updateTopDate(inst);
				markToday(inst);
			}

			  $('#prevMonth').on('click', function () {
				moveMonth(-1);
			  });

			  $('#nextMonth').on('click', function () {
				moveMonth(1);
			  });

			  $('#calendar').on('click', '.btn-apply', function (e) {
				e.stopPropagation();
				const id = $(this).data('id');
				//alert('신청 클릭: ' + id);
				fnReservation(id);
			  });
			
			
		});
		
		function markToday(inst) {
		  const today = new Date();
		  const yyyy = today.getFullYear();
		  const mm = String(today.getMonth() + 1).padStart(2, '0');
		  const dd = String(today.getDate()).padStart(2, '0');
		  
		  const todayStr = mm + "/" + dd + "/" + yyyy;
		 	
		  // 기존 today 클래스 제거
		  inst.$elements.innerEl
			.find('[data-date-val]')
			.removeClass('is-today');
		  
		  // 오늘 날짜에 클래스 추가
		  inst.$elements.innerEl
			.find('[data-date-val="' + todayStr + '"]')
			.addClass('is-today');
		}
		
		function updateTopDate(inst) {
		  const year  = inst.$active.year;
		  const month = inst.$active.month + 1;

		  $('.top-date').text(String(year) + '년 ' + String(month) + '월');
		}
		
		let currentEvents = []; // 기존 달력에 표시된 이벤트
		
		function getConsulting(year, month) {
			const selectedCates = $("input[name=searchCateCd]:checked").map(function(){
		        return $(this).val();
		    }).get();
			
			const $cal = $('#calendar');
		    const inst = $cal[0].evoCalendar;
		    
		    // 전체 해제
		    if (selectedCates.length == 0) {
		        // 기존 이벤트 제거
		        if (currentEvents.length > 0) {
		            currentEvents.forEach(id => inst.removeCalendarEvent(id));
		        }
		        currentEvents = [];
		        
		        $cal.evoCalendar('addCalendarEvent', []);
		        // undefined 제거
		        $(".event-list").html('<div class="event-empty"><p>선택한 날짜에 일정이 없습니다.</p></div>');
		        
		        return;
		    }
			
			$.ajax({
			    url: '${contextRoot}/usr/reservation/selectConsultingList.do',
			    type: 'GET',
			    data: {
		            year: year,
		            month: month,
		            searchCateCd: selectedCates
		        },
			    success: function (result) {			    	
			         const calendarEvents = [];
			         
			         result.forEach(function(item) {
			                let eventColor;
			                switch(item.CATE_CD) {
			                    case 'AA': eventColor = '#4c65d9'; break;
			                    case 'AB': eventColor = '#fd61a4'; break;
			                    case 'AC': eventColor = '#29daaa'; break;
			                    default: eventColor = '#f4bf00';
			                }
			                
			                let startDate = parseDate(item.LEARN_START_DT);
			                let endDate = parseDate(item.LEARN_END_DT);
			                
			                let applyBtnNm;
			                switch(item.STATUS) {
				                case 'disable': applyBtnNm = '신청불가'; break;
			                    case 'apply': applyBtnNm = '신청하기'; break;
			                    default: applyBtnNm = '신청불가';
			                }
			                
			                for (let d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
			                    const y = d.getFullYear();
			                    const m = String(d.getMonth() + 1).padStart(2, '0');
			                    const day = String(d.getDate()).padStart(2, '0');
			                    const dateStr = y+'-'+m+'-'+day;

			                    calendarEvents.push({
			                        id: item.SEQ_CD + '_' + dateStr,
			                        name: item.SUBJ_NM,
			                        date: dateStr,
			                        type: item.CATE_CD,
			                        color: eventColor,
			                        description: '<div class="description"><div class="date-time"><span>시간</span>' + item.START_TIME + ' ~ ' + item.END_TIME + '</div>'
			                            + '<div class="number"><span>인원</span>' + item.ENROLL_CNT + '/' + item.CAPACITY + '</div></div>'
			                            + '<div class="event-btn-wrap">'
			                            + '<button class="btn-'+ item.STATUS +'" data-id="' + item.SEQ_CD + '">'+applyBtnNm+'</button>'
			                            + '</div>'
			                    });
			                }
			            });

			            const inst = $('#calendar')[0].evoCalendar;

			            // 기존 이벤트 제거
			            if (currentEvents.length > 0) {
			            	currentEvents.forEach(id => inst.removeCalendarEvent(id));
			            }

			            // 새 이벤트 추가
			            if (calendarEvents.length > 0) {
			                $('#calendar').evoCalendar('addCalendarEvent', calendarEvents);
			                currentEvents = calendarEvents.map(e => e.id);
			            } else {
			                currentEvents = [];
			            }
						
			            // 오늘 날짜 표시
			            markToday(inst);
			    },
		        error: function() {
		            console.error("데이터 로드 실패");
		        }
			});
		}
		
		function fnReservation(id) {
			if(!id){
				alert('오류가 발생하였습니다.');
			} else {
				$("#seqCd").val(id);
				let reqUrl = "${contextRoot}/usr/reservation/eduLctreWebView.do";
				
				$("#listForm").attr("action", reqUrl);
			    $("#listForm").submit();
			}
		}
		
		function fnMyReservation() {
			let reqUrl = "${contextRoot}/usr/mypage/myReservation.do";

			$("#listForm").attr("action", reqUrl);
		    $("#listForm").submit();
		}
		
		$(document).ready(function(){
			const $form = $("#searchForm");
			const $all = $("#cbx_chkAll");
			const $items = $form.find("input[name=searchCateCd]").not("#cbx_chkAll");
			 
			function getCheckedCnt() {
				return $items.filter(":checked").length;
			}
			
			// 현재 달력의 인스턴스에서 연/월 가져오는 함수
		    function refreshCalendar() {
		        const inst = $('#calendar')[0].evoCalendar;
		        const year = inst.$active.year;
		        const month = inst.$active.month + 1; // 0~11 기반이므로 +1
		        
		        getConsulting(year, month);
		    }
			
			// 전체 체크
			$all.on("change", function () {
				const isChecked = this.checked;
				$items.prop("checked", isChecked);
				refreshCalendar();
			});
			
			// 개별 체크
			$items.on("change", function () {
				const total = $items.length;
				const checked = getCheckedCnt();
				$all.prop("checked", checked === total);
				refreshCalendar();
			});
			
			
		});
	</script>
   
    <script src="/yjcareer/assets/site/yjcareer/js/evo-calendar.js"></script>
   
	<c:import url="/usr/layout/footer.do" />
	    
    
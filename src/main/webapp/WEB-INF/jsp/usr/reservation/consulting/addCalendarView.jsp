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
                            <p class="first_title">프로그램 신청</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>프로그램 신청 안내</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
							<div class="breadcrumbs">
								<a href="${contextRoot}/usr/main.do" class="home">홈</a>
								<ol class="breadcrumbs_list">
									<li class="breadcrumbs_item">
										<a href="" class="breadcrumbs_anchor mobile">프로그램 신청</a>
										<button type="button" class="breadcrumbs_select" title="목록열기">프로그램 신청</button>
										<ul class="breadcrumbs_panel">
												<li class="tab_item"><a href="/yjcareer/contents.do?key=4123"  target="_self" >진로진학교육</a></li>
												<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" class="active">프로그램 신청</a></li>
												<li class="tab_item"><a href="/yjcareer/contents.do?key=4135"  target="_self" >학습지원서비스</a></li>
												<li class="tab_item"><a href="/yjcareer/contents.do?key=4254"  target="_self" >JUMP UP 2025 양주 미래교육 페스타</a></li>
												<li class="tab_item"><a href="/yjcareer/contents.do?key=4141"  target="_self" >교육 네트워크</a></li>
												<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" >알림마당</a></li>
												<li class="tab_item"><a href="/yjcareer/sitemap.do?key=4151"  target="_self" >홈페이지 가이드</a></li>
										</ul>
									</li>
									<li class="breadcrumbs_item">
										<a href="" class="breadcrumbs_anchor mobile"></a>
										<button type="button" class="breadcrumbs_select" title="목록열기"></button>
										<ul class="breadcrumbs_panel">
											<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" >프로그램 신청 안내</a>	</li>
											<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4130"  target="_self" >프로그램 신청</a>	</li>
										</ul>
									</li>
								</ol>
							</div>
            
                            <div class="addons">
                                <ul class="addons_list">
                                    <li class="addons_item share">
                                        <button type="button" class="addons_button share_show">공유하기</button>
                                        <div class="share_panel">
                                            <ul class="share_list clearfix">
                                                <li class="share_item n1">
                                                    <a href="javascript:openFacebook();" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">페이스북</a>
                                                </li>
                                                <li class="share_item n2">
                                                    <a href="javascript:openNaverbolg('여주시청');" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">블로그</a>
                                                </li>
                                                <li class="share_item n3">
                                                    <a href="javascript:openKakaoStory();" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">카카오</a>
                                                </li>
                                                <li class="share_item n4">
                                                    <a href="javascript:openTwitter('여주시청');" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">트위터</a>
                                                </li>
                                                <li class="share_item n5">
                                                    <a href="#n" onclick="copy()" title="새창" class="share_anchor copy_anchor">주소복사</a>
                                                </li>
                                                <script>
													function openFacebook(){
														var _url = encodeURIComponent(window.location.href);
														openWin2('http://www.facebook.com/sharer/sharer.php?u=' + _url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
														
													}

													function openNaverbolg(txt){
														var _txt = encodeURIComponent(txt);
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://share.naver.com/web/shareView.nhn?url=' + _url + '&title=' + _txt, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
														
													}

													function openKakaoStory(){
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://story.kakao.com/s/share?url=' + _url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
													}

													function openTwitter(txt){
														var _txt = encodeURIComponent(txt);
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://twitter.com/intent/tweet?text='+_txt+'&url='+_url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
													}
													
													function openWin2(url, winname, width, height, tbar, mbar, sbar, loc, status, resizable, fscreen, left, top, cflag) {
														if(cflag == 'yes' || cflag == 'y' || cflag == '1') {
															left = (window.screen.width - width ) / 2;
															top  = (window.screen.height- height) / 2;
														}

														opening_window = window.open(url, winname, 'width=' + width + ', height=' + height + ', toolbar=' + tbar + ', menubar=' + mbar + ', scrollbars=' + sbar + ', location=' + loc + ', status=' + status + ', resizable=' + resizable + ', fullscreen=' + fscreen + ', left=' + left + ', top=' + top);
														opening_window.focus();
													}

													function openWin2(url, winname, width, height, tbar, mbar, sbar, loc, status, resizable, fscreen, left, top, cflag) {
														if(cflag == 'yes' || cflag == 'y' || cflag == '1') {
															left = (window.screen.width - width ) / 2;
															top  = (window.screen.height- height) / 2;
														}

														opening_window = window.open(url, winname, 'width=' + width + ', height=' + height + ', toolbar=' + tbar + ', menubar=' + mbar + ', scrollbars=' + sbar + ', location=' + loc + ', status=' + status + ', resizable=' + resizable + ', fullscreen=' + fscreen + ', left=' + left + ', top=' + top);
														opening_window.focus();
													}

                                                    function copy() {
                                                        var url = '';
                                                        var textarea = document.createElement("textarea");
                                                        document.body.appendChild(textarea);
                                                        url = window.document.location.href;
                                                        textarea.value = url;
                                                        textarea.select();
                                                        document.execCommand("copy");
                                                        document.body.removeChild(textarea);
                                                        alert("URL이 복사되었습니다.")
                                                    }
                                                </script>
                                            </ul>
                                            <button type="button" class="share_hide">닫기</button>
                                        </div>
                                    </li>
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
				<div class="calendar-nav">
				  <button id="prevMonth" type="button">이전</button>
				  <div class="top-date"></div>
				  <button id="nextMonth" type="button">다음</button>
				</div>
				<div class="cal-bottom">
					<dl class="cal-label">
						<dt>예약 안내</dt>
						<dd>맞춤컨설팅</dd>
						<dd>학습심리상담</dd>
						<dd>수시·정시상담</dd>
						<dd>면접컨설팅</dd>
					</dl>
					<c:if test="${not empty sessionScope.SESSION_DI_KEY}">
					<div class="reservation_more">
						<button class="reservation_more_btn" type="button" onclick="fnMyReservation();">나의 예약현황</button>
					</div>
					</c:if>
				</div>
				<div id="calendar"></div>
			</div>        
		</div>
	</div>
	
     <form id="listForm" name="listForm" method="post">
     	<input type="hidden" id="seqCd" name="seqCd" value="" />
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
				
				getConsulting(y, m+1);
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
		  
		  const todayStr = `${mm}/${dd}/${yyyy}`;
		  // ⚠️ EvoCalendar format: mm/dd/yyyy
		 	
		  // 기존 today 클래스 제거
		  inst.$elements.innerEl
			.find('[data-date-val]')
			.removeClass('is-today');
		  
		  // 오늘 날짜에 클래스 추가
		  /*inst.$elements.innerEl
			.find(`[data-date-val="${todayStr}"]`)
			.addClass('is-today');*/
		  
		  // 오늘 날짜 includes로 확인
		  inst.$elements.innerEl
		  	.find('[data-date-val]').each(function() {
		        const val = $(this).attr('data-date-val');
		        if (val.includes(mm) && val.includes(dd) && val.includes(yyyy)) {
		            $(this).addClass('is-today');
		        }
		    });
		}
		
		function updateTopDate(inst) {
		  const year  = inst.$active.year;
		  const month = inst.$active.month + 1; // 0-based
		  
		  //$('.top-date').text(`${year}년 ${month}월`);
		  $('.top-date').text(String(year) + '년 ' + String(month) + '월');
		}
		
		let currentEvents = []; // 기존 달력에 표시된 이벤트
		
		function getConsulting(year, month) {
			$.ajax({
			    url: '${contextRoot}/usr/reservation/selectConsultingList.do',
			    type: 'GET',
			    data: {
		            year: year,
		            month: month
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
			                        description: '<div class="date-time">' + item.START_TIME + ' ~ ' + item.END_TIME + '</div>'
			                            + '<div class="number">' + item.ENROLL_CNT + '/' + item.CAPACITY + '</div>'
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
	</script>
   
    <script src="/yjcareer/assets/site/yjcareer/js/evo-calendar.js"></script>
   
	<c:import url="/usr/layout/footer.do" />
	    
    
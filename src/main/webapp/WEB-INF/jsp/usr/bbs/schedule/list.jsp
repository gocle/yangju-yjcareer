<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />
<c:import url="/usr/menu/header.do" />
      
<div id="container">
	<div class="wrap clearfix">
	    <main class="colgroup">
	        <article>
	            <header class="sub_head">
	
					<div class="sub_title">
						<!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
						<p class="first_title">알림마당</p>
						
						<!-- 현재메뉴명 입력해주세요 -->
						<h2>일정</h2>
					</div>
	               
	               <div class="sub_head_wrap">
	
					<c:import url="/usr/menu/sub.do" />
	   
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
	            
	            <script>
					//이벤트 연결
					document.addEventListener('DOMContentLoaded', function() {
						
					    var initialLocaleCode = 'ko';  
					    
					    var localeSelectorEl = document.getElementById('locale-selector');
					    
					    var calendarEl = document.getElementById('calendar');
				
					    //오늘 시간
					    let today = new Date();   
					
					    var calendar = new FullCalendar.Calendar(calendarEl, {
					      headerToolbar: {
					        left: 'today prev',
					        center: 'title',
					        right: 'next'
					      },
						  initialDate: today,
					      locale: initialLocaleCode,
					      buttonIcons: true,
					      weekNumbers: false,
					      navLinks: false,
					      editable: false,
					      dayMaxEvents: false,
					      selectable: true,
					      height: 'auto',   // PC
					      contentHeight: 'auto',

					      windowResize: function () {
					        if (window.innerWidth <= 768) {
					          calendar.setOption('height', '100%');
					        } else {
					          calendar.setOption('height', 'auto');
					        }
					      },
				
					      eventClick: function(arg) {
					    	  arg.jsEvent.preventDefault();
				
					    	  const e = arg.event;
					    	  const p = e.extendedProps;
				
					    	  $('#modalTitle').text(e.title);
					    	  
					    	  $('#modalTime').text(p.startTime + ' ~ ' + p.endTime);  
					    	  $('#modalDate').text(e.startStr);

					    	  var tyTxt = '';

					    	  if(p.scTyCd == 'AA') {tyTxt = '<dd class="AA">맞춤컨설팅</dd>'}
					    	  if(p.scTyCd == 'AB') {tyTxt = '<dd class="AB">학습심리상담</dd>'}
					    	  if(p.scTyCd == 'AC') {tyTxt = '<dd class="AC">수시·정시상담</dd>'}
					    	  if(p.scTyCd == 'AD') {tyTxt = '<dd class="AD">면접컨설팅</dd>'}
					    	  $('.cal-label').html(tyTxt);
				
					    	  $('.modal').fadeIn(100);
					    	},
				
					      /* 등록된 스케줄 목록 */
					     events: function (data, successCallback) {

							  var events = [];
							
							  events.push({
							    id: 'evt_1',
							    title: '맞춤컨설팅 일정 테스트 첫번째 일정',
							    start: '2025-12-30',
							    classNames: ['dot-blue'],
							    extendedProps: {
							      scTyCd: 'AA',
							      startTime: '10:00',
							      endTime: '11:00'
							    }
							  });
							
							  events.push({
							    id: 'evt_2',
							    title: '[학습심리상담] 2025-12-29 1차',
							    start: '2025-12-04',
							    classNames: ['dot-pink'],
							    extendedProps: {
							      scTyCd: 'AB',
							      startTime: '10:00',
							      endTime: '11:00'
							    }
							  });
							
							  events.push({
							    id: 'evt_3',
							    title: '3차 수시·정시상담',
							    start: '2025-12-05',
							    end: '2025-12-07',
							    allDay: true,
							    classNames: ['dot-green'],
							    extendedProps: {
							      scTyCd: 'AC',
							      startTime: '10:00',
							      endTime: '11:00'
							    }
							  });
							
							  events.push({
							    id: 'evt_4',
							    title: '면접컨설팅',
							    start: '2025-12-06',
							    classNames: ['dot-orange'],
							    extendedProps: {
							      scTyCd: 'AD',
							      startTime: '10:00',
							      endTime: '11:00'
							    }
							  });
							
							  successCallback(events);
							}
				
					    });
					    
					    //tab 검색
				    	$(document).on("click","input[name=searchScTyCd]",function(){
				  	    	calendar.refetchEvents();
					    })
				
					    calendar.render();

					  });
					
					 $(document).ready(function(){
						 
						 //사이즈조절 추가
						 $(window).load(function(){
						 	$(".fc-col-header").css("width","100%");
						 	$(".fc-daygrid-body,.fc-scrollgrid-sync-table").css("width","100%");
						 })
						 
						 //모달창닫기
						 $(".btn-close").click(function(){
							 $(".modal").fadeOut('fast');
						 });

						  $("#cbx_chkAll").prop("checked", true);
						  $("input[name=searchScTyCd]").not("#cbx_chkAll").prop("checked", true);
						

						// 전체 체크
						$("#cbx_chkAll").on("change", function () {
						  const isChecked = $(this).is(":checked");
						  $("input[name=searchScTyCd]").not(this).prop("checked", isChecked);
						});

						// 개별 체크
						$("input[name=searchScTyCd]").not("#cbx_chkAll").on("change", function () {
						  const total = $("input[name=searchScTyCd]").not("#cbx_chkAll").length;
						  const checked = $("input[name=searchScTyCd]:checked").not("#cbx_chkAll").length;

						  $("#cbx_chkAll").prop("checked", total === checked);
						});
				
					})
					
					 jQuery.datetimepicker.setLocale('kr');
					 
					 //날짜+시간
					 $(function() {
						$(".datetimepicker").datetimepicker({ 
							format: "Y-m-d H:i",
							lang : 'ko',
							defaultTime:'12:00'
						});
					 });
					 
				
				</script>	
				
				<div class="content">

					<form id="searchForm" name="searchForm" method="post" onsubmit="return false;">
						<div class="calendar_searchBox">
						  <div class="tab_left">
						    <div class="search_tab">
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchScTyCd" id="cbx_chkAll" value="">
						        <span class="chk-ui"></span>
						        <span class="chk-text">전체</span>
						      </label>
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchScTyCd" id="chk00" value="AA">
						        <span class="chk-ui"></span>
						        <span class="chk-text">맞춤컨설팅</span>
						      </label>
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchScTyCd" id="chk01" value="AB">
						        <span class="chk-ui"></span>
						        <span class="chk-text">학습심리상담</span>
						      </label>
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchScTyCd" id="chk02" value="AC">
						        <span class="chk-ui"></span>
						        <span class="chk-text">수시·정시상담</span>
						      </label>
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchScTyCd" id="chk03" value="AD">
						        <span class="chk-ui"></span>
						        <span class="chk-text">면접컨설팅</span>
						      </label>
						
						    </div>
						  </div>
						</div>
					</form>
					<div id='calendar'></div>
				
				</div>
	        </article>
	    </main>
	
	</div>
</div>

<div class="modal">
	<div class="modal-inner">
		<h3 id="modalTitle"></h3>
		<p>날짜: <span id="modalDate"></span></p>
		<p>시간: <span id="modalTime"></span></p>
		<p id="modalDesc">
			<dl class="cal-label"></dl>
		</p>
	
		<button class="btn-close">닫기</button>
	</div>   
</div>

<!-- 캘린더  -->
<link href='/yjcareer/assets/script/fullcalendar/main.css' rel='stylesheet' />
<script src='/yjcareer/assets/script/fullcalendar/main.js'></script>
<script src='/yjcareer/assets/script/fullcalendar/locales-all.js'></script>

<link href='/yjcareer/assets/site/yjcareer/css/full-calendar.css' rel='stylesheet' />

<c:import url="/usr/layout/footer.do" />

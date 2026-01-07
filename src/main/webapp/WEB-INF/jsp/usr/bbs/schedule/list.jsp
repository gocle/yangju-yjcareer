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
								<li class="addons_item print">
							    	<button type="button" onclick="window.print();" class="addons_button">인쇄</button>
							    </li>
						    </ul>
						</div>
	                </div>
	            </header>
	            
	            <script>
					let calendar;
					
					document.addEventListener('DOMContentLoaded', function() {
						
					    var initialLocaleCode = 'ko';  
					    
					    var localeSelectorEl = document.getElementById('locale-selector');
					    
					    var calendarEl = document.getElementById('calendar');
				
					    //오늘 시간
					    let today = new Date();   
					
					    calendar = new FullCalendar.Calendar(calendarEl, {
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
					    	  
					    	  $('#modalTime').text(p.startTime);  
					    	  $('#modalDate').text(e.startStr);

					    	  var tyTxt = '';

					    	  if(p.scTyCd == 'BA') {tyTxt = '<dd class="AC">진로진학</dd>'}
					    	  if(p.scTyCd == 'BB' || p.scTyCd == "BC" ) {tyTxt = '<dd class="AB">AI디지털</dd>'}
					    	  if(p.scTyCd == 'BD' || p.scTyCd == "BE" ) {tyTxt = '<dd class="AA">돌봄</dd>'}
					    	  $('.cal-label').html(tyTxt);
				
					    	  $('.modal').fadeIn(100);
					    	},
				
					    	/* 등록된 스케줄 목록 */
						     events: function (data, successCallback) {
						    	 
						    	 const checkedCnt = $("input[name=searchCateCd]:checked")
						    	    .not("#cbx_chkAll")
						    	    .length;

							     if (checkedCnt === 0) {
							    	 alert("3")
							         successCallback([]);
							         return;
							     }
						    	 
						  			var params = $("#searchForm").serialize();

						  			$.ajax({
						  		 		
						  				url: '${contextRoot}/usr/bbs/selectProgramList.do',
						  		 		type : "POST",
						  		 		dataType:"json",
						  		 		data : params,
						  		 		success : function(data){	

						  		 			var events = [];
						  		 			var classNames = "";
						  		 			
						  		 			
						  		 			$.each(data, function(index, value) {
						  		 				
						  		 				if(value.CATE_CD == "BA") {classNames = 'dot-green'}
						  		 				if(value.CATE_CD == "BB" || value.CATE_CD == "BC" ) {classNames = 'dot-pink'}
						  		 				if(value.CATE_CD == "BD" || value.CATE_CD == "BE" ) {classNames = 'dot-blue'}
						  							
						  							 events.push({
														    id: value.SEQ_CD,
														    title: value.SUBJ_NM,
														    start: value.LEARN_START_DT,
														    classNames: classNames,
														    extendedProps: {
														      scTyCd: value.CATE_CD,
														      startTime: value.START_TIME,
														      endTime: value.END_TIME
														    }
														  });

						  		 			});
						  		 			
						  		 			successCallback(events);

						  		 		},
						  		 	     error:function(request,status,error){
						  			 	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
						  			 	    },
						  			 	    
						  			    }) 


								}
					
						    });
								
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
						  $("input[name=searchCateCd]").not("#cbx_chkAll").prop("checked", true);
						

						  const $form = $("#searchForm");
						  const $all = $("#cbx_chkAll");
						  const $items = $form.find("input[name=searchCateCd]").not("#cbx_chkAll");

						  function getCheckedCnt() {
						    return $items.filter(":checked").length;
						  }

						  // 전체 체크
						  $all.on("change", function () {
						    const isChecked = this.checked;

						    $items.prop("checked", isChecked);

						    if (getCheckedCnt() === 0) {
						      calendar.removeAllEvents();
						      return;
						    }

						    calendar.refetchEvents();
						  });

						  // 개별 체크
						  $items.on("change", function () {
						    const total = $items.length;
						    const checked = getCheckedCnt();

						    $all.prop("checked", checked === total);

						    if (checked === 0) {
						      calendar.removeAllEvents();
						      return;
						    }

						    calendar.refetchEvents();
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
						        <input type="checkbox" id="cbx_chkAll">
						        <span class="chk-ui"></span>
						        <span class="chk-text">전체</span>
						      </label>
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchCateCd" id="chk00" value="BA">
						        <span class="chk-ui"></span>
						        <span class="chk-text">진로진학</span>
						      </label>
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchCateCd" id="chk01" value="BB,BC">
						        <span class="chk-ui"></span>
						        <span class="chk-text">AI디지털</span>
						      </label>
						
						      <label class="chk-circle">
						        <input type="checkbox" name="searchCateCd" id="chk02" value="BD,BE">
						        <span class="chk-ui"></span>
						        <span class="chk-text">돌봄</span>
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
		<p>기간: <span id="modalDate"></span></p>
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

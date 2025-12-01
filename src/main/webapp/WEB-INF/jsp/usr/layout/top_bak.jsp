<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>양주시 산림휴양시설</title>
	<link rel="stylesheet" href="${contextRoot}/assets/css/usr/css/font/font.css" type="text/css">
	<link rel="stylesheet" href="${contextRoot}/assets/css/usr/css/reset.css" type="text/css">
	<link rel="stylesheet" href="${contextRoot}/assets/css/usr/css/style.css" type="text/css">
	<link rel="stylesheet" href="${contextRoot}/assets/css/usr/css/style_m.css" type="text/css">
	<link rel="stylesheet" href="${contextRoot}/assets/css/usr/css/schedule.css" type="text/css">

	<script src="${contextRoot}/js/jquery-1.9.0.js"></script>
	
	<link href='${contextRoot}/assets/css/usr/js/fullcalendar/main.css' rel='stylesheet' />
	<script src='${contextRoot}/assets/css/usr/js/fullcalendar/main.js'></script>
	<script src='${contextRoot}/assets/css/usr/js/fullcalendar/locales-all.js'></script>
	
	<script type="text/javascript" src="${contextRoot}/js/common.js"></script>
	
	<!--slick slider-->
	<link rel="stylesheet" href="${contextRoot}/assets/css/slick.css"/>
	<script src="${contextRoot}/assets/script/slick.min.js"></script>
	
	<style>
		.fc-event {
		  cursor: pointer;
		}
	</style>
	
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		  const sections = document.querySelectorAll('.section');

		  function checkSectionInView() {
		    const windowHeight = window.innerHeight;
		    sections.forEach((section, index) => {
		      const rect = section.getBoundingClientRect();
		      if (rect.top < windowHeight && rect.bottom > 0 && !section.classList.contains('active')) {
		        const delay = window.innerWidth > 1200 ? index * 50 : index * 150;
		        setTimeout(() => section.classList.add('active'), delay);
		      }
		    });
		  }

		  window.addEventListener('scroll', checkSectionInView, { passive: true });
		  window.addEventListener('resize', checkSectionInView, { passive: true });
		  checkSectionInView();

		  const initialLocaleCode = 'ko';
		  const calendarEl = document.getElementById('calendar');
		  const calendar = new FullCalendar.Calendar(calendarEl, {
		    headerToolbar: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		    },
		    initialDate: new Date(),
		    locale: initialLocaleCode,
		    aspectRatio: window.innerWidth > 768 ? 1.3 : 0.75,
		    buttonIcons: true,
		    weekNumbers: false,
		    navLinks: false,
		    editable: false,
		    dayMaxEvents: false,
		    selectable: true,

		    select: function(arg) {
		      // jQuery 의존 제거: 필요 시 document.querySelector('.modal')로 교체
		      const modal = document.querySelector('.modal');
		      if (modal) modal.style.display = 'block';
		      calendar.unselect();
		    },

		    /* 등록된 스케줄 목록 */
		    events: function (fetchInfo, successCallback, failureCallback) {
		      // 체크값 수집 (jQuery 없이)
		      const checkedValues = Array.from(document.querySelectorAll('input[name="searchScTyCd"]:checked'))
		        .map(el => el.value);

		      const isAll = checkedValues.length === 0 || checkedValues.includes('ALL');
		      const typesParam = isAll ? [] : checkedValues.filter(v => v !== 'ALL'); // wood/forest

		      // 쿼리스트링 구성
		      const params = new URLSearchParams();
		      typesParam.forEach(t => params.append('types', t));

		      console.log('[events] load with params:', params.toString());

		      fetch('${contextRoot}/usr/reservation/scheduleEvents.do?' + params.toString(), {
		        method: 'GET',
		        headers: { 'Accept': 'application/json' }
		      })
		      .then(res => {
		        if (!res.ok) throw new Error('HTTP ' + res.status);
		        return res.json();
		      })
		      .then(data => {
		        // data: [{title,start,end,backgroundColor,groupId,...}]
		        successCallback(data);
		      })
		      .catch(err => {
		        console.error('events load error', err);
		        if (failureCallback) failureCallback(err);
		        else successCallback([]);
		      });
		    },
		    eventClick: function(info) {
		        // FullCalendar는 info.event.extendedProps 안에 추가 데이터가 들어감
		        var pgId = info.event.extendedProps.pgId;
		        var pgType = info.event.extendedProps.pgType;

		        // 이동할 URL 구성
		        var url = "${contextRoot}/usr/reservation/" 
		                  + pgType 
		                  + "/detail.do?pageSize=10&pageIndex=1&pgType=" 
		                  + pgType 
		                  + "&pgId=" + pgId;

		        // 페이지 이동
		        window.location.href = url;
		      }
		  });

		  // ===== 필터/검색 트리거들 (jQuery 없이) =====
		  document.querySelectorAll('input[name="searchScTyCd"]').forEach(el => {
		    el.addEventListener('change', () => calendar.refetchEvents());
		  });

		  const searchKeyword = document.getElementById('searchKeyword');
		  if (searchKeyword) {
		    searchKeyword.addEventListener('keydown', (e) => {
		      if (e.key === 'Enter') {
		        e.preventDefault();
		        calendar.refetchEvents();
		      }
		    });
		  }

		  const resetBtn = document.querySelector('.reset');
		  if (resetBtn) {
		    resetBtn.addEventListener('click', () => {
		      if (searchKeyword) searchKeyword.value = '';
		      const selectBox = document.getElementById('selectBox');
		      if (selectBox) selectBox.selectedIndex = 0;
		      calendar.refetchEvents();
		    });
		  }

		  // 전체 체크 로직 (jQuery 없이)
		  const cbxAll = document.getElementById('cbx_chkAll');
		  if (cbxAll) {
		    cbxAll.addEventListener('click', () => {
		      cbxAll.classList.add('check');
		      document.querySelectorAll('input[name="searchScTyCd"]').forEach(el => el.checked = false);
		      // ALL만 켠 효과: 이벤트 재조회 원하면 아래 라인 추가
		      calendar.refetchEvents();
		    });
		  }

		  document.querySelectorAll('input[name="searchScTyCd"]').forEach(el => {
		    el.addEventListener('click', function() {
		      if (this.id === 'cbx_chkAll') cbxAll?.classList.add('check');
		      else cbxAll?.classList.remove('check');

		      const total = document.querySelectorAll('input[name="searchScTyCd"]').length;
		      const checked = document.querySelectorAll('input[name="searchScTyCd"]:checked').length;

		      if (total !== checked) cbxAll && (cbxAll.checked = false);
		      if (checked === 0) cbxAll?.classList.add('check');
		    });
		  });

		  calendar.render();
		});
		
		$( document ).ready(function() {
			
			const $slider = $('.post-slider').slick({
				/*autoplay: true,
				autoplaySpeed: 3000,*/
				dots: true,
				prevArrow : false,
				nextArrow : false,
				responsive: [
				{
				  breakpoint: 840
				}]
			});
			
			// 초기 append
			var pauseBtn = '<li><a href="#" role="tab" class="pause">3</a></li>';
			$(".slick-dots").append(pauseBtn);

			// slider 이벤트에서 재확인
			$('.post-slider').on('setPosition', function(){
				if ($('.slick-dots .pause').length === 0) { 
					$(".slick-dots").append(pauseBtn);
				}
			});


			// 페이지 로드 후 강제로 위치 재계산
			$slider.slick('setPosition');

			$('.prev').click(function(){
				$slider.slick('slickPrev');
			});

			$('.next').click(function(){
				$slider.slick('slickNext');
			});

			$('.pause').click(function(){
				if ($(this).attr('class') === 'pause') {
					$slider.slick('slickPause');
					$(this).attr('class','play');
				} else {
					$slider.slick('slickPlay');
					$(this).attr('class','pause');
				}
			});
			
			$('.tooltip-btn').click(function(){
				$('.tooltip').hide();
			});

			$('.gallery-list').slick({
			  infinite: false,
			  arrows: false,
			  dots: false,
			  slidesToShow: 2,
			  variableWidth: true
			});
			
			// 초기 실행
			$(window).on('load resize', initReviewSlider);
			
			// 햄버거 클릭 → 메뉴 열기/닫기
			$('.m-menu').click(function(){
				$('.mobile-nav').toggleClass('open');
				$('body').toggleClass('no-scroll');
				$('.slick-dots').toggleClass('no-dots');
			});
			
			// 닫기 버튼 클릭 → 메뉴 닫기
			$('.mobile-nav .close').click(function(){
				$('.mobile-nav').removeClass('open');
				$('body').removeClass('no-scroll');
				$('.slick-dots').removeClass('no-dots');
			});

			// 모바일 메뉴에서 서브메뉴 클릭 시 토글
			$('.mobile-nav > ul > li > a').click(function(e){
				var $submenu = $(this).next('.submenu');
				if($submenu.length){
					e.preventDefault(); // 링크 이동 막기
					$submenu.slideToggle();
					$(this).parent().toggleClass('open');
					$(this).parent().siblings().removeClass('open').find('.submenu').slideUp();
				}
			});

		});
		
		function initReviewSlider() {
		  var $reviewList = $('.review-list');
		  var windowWidth = $(window).width();

		  if (windowWidth <= 1520) { // 모바일 기준
			if (!$reviewList.hasClass('slick-initialized')) {
			  $reviewList.slick({
				infinite: false,
				arrows: false,
				dots: false,
				slidesToShow: 1,
				variableWidth: true
			  });
			}
		  } else { // 769px 이상이면 slick 제거
			if ($reviewList.hasClass('slick-initialized')) {
			  $reviewList.slick('unslick');
			}
		  }
		}
		
	</script>
	<c:if test="${not empty retMsg}">
	    <script>
	        alert("${retMsg}");
	    </script>
	</c:if>
</head>
<body>
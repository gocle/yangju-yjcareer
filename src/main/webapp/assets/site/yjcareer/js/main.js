(function ($) {
    'use strict';

    $(function () {

        var $window = $(window),
            $container = $('#container');

        //visual
        var $VisualTitleList = $('.rowgroup');
        $VisualTitleList.addClass('time_ani')
		
        //popup 슬릭
        var $popup = $container.find('.popup'),
            $popupList = $popup.find('.popup_list'),
            $popupPrev = $popup.find('.popup_prev'),
            $popupDots = $popup.find('.popup_dots'),
            $popupNext = $popup.find('.popup_next');

        $popupList.slick({
            rows: 1,
            draggable: false,
            infinite: true,
            variableWidth: true,
            slidesToShow: 2,
            slidesToScroll: 1,
            autoplay: false,
            dots: true,
            autoplaySpeed: 3000,
            prevArrow: $popupPrev,
            appendDots: $popupDots,
            nextArrow: $popupNext,
            // autoArrow: $popupAuto,
            // pauseText: '정지',
            // playText: '재생',
            responsive: [
                {
                    breakpoint: 1001,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        variableWidth: false,
                        centerMode: true,
                    }
                }
            ]
        });



    // --- TAB 구조 ---
    const $tab1 = $('.tab1');
    const $tab2 = $('.tab2');
    const $tab3 = $('.tab3');
    const $btnTab1 = $('#tabmenu1');
    const $btnTab2 = $('#tabmenu2');
    const $btnTab3 = $('#tabmenu3');

    // --- SLICK 대상 ---
    const $counselList = $('.tab1 .counsel_list');
    const $programList = $('.tab2 .program_list');
    const $eventList = $('.tab3 .event_list');

    // --- SLICK 초기화 함수 ---
    function initCounselSlider() {
		
        if (!$counselList.hasClass('slick-initialized')) {

            $counselList.slick({
                rows: 1,
                draggable: false,
                infinite: false,
                variableWidth: false,
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: false,
                prevArrow: $('.tab1 .counsel_prev'),
                nextArrow: $('.tab1 .counsel_next'),
                responsive: [
                    {
                        breakpoint: 1300,
                        settings: { slidesToShow: 2 }
                    },
					{
						breakpoint: 600,
						settings: {
							slidesToShow: 1,
							centerMode: true,
							centerPadding: '24px'
						}
					}
                ]
            });
        }
    }

    function initProgramSlider() {
		
        if (!$programList.hasClass('slick-initialized')) {
            $programList.slick({
                rows: 1,
                draggable: false,
                infinite: false,
                variableWidth: false,
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: false,
                prevArrow: $('.tab2 .program_prev'),
                nextArrow: $('.tab2 .program_next'),
                responsive: [
                    {
                        breakpoint: 1300,
                        settings: { slidesToShow: 2 }
                    },
					{
						breakpoint: 600,
						settings: {
							slidesToShow: 1,
							centerMode: true,
							centerPadding: '24px'
						}
					}
                ]
            });
        }
    }
    
    function initEventSlider() {
		
        if (!$eventList.hasClass('slick-initialized')) {
            $eventList.slick({
                rows: 1,
                draggable: false,
                infinite: false,
                variableWidth: false,
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: false,
                prevArrow: $('.tab3 .event_prev'),
                nextArrow: $('.tab3 .event_next'),
                responsive: [
                    {
                        breakpoint: 1300,
                        settings: { slidesToShow: 2 }
                    },
					{
						breakpoint: 600,
						settings: {
							slidesToShow: 1,
							centerMode: true,
							centerPadding: '24px'
						}
					}
                ]
            });
        }
    }
    
    function safeSetPosition($slider){
	  setTimeout(function(){
	    if ($slider && $slider.length && $slider.hasClass('slick-initialized')) {
	      $slider.slick('setPosition');
	    }
	  }, 50);
	}

	function updateTab() {
	  if ($btnTab1.is(':checked')) {
	    $tab1.addClass('active');
	    $tab2.removeClass('active');
	    $tab3.removeClass('active');
	    initCounselSlider();
	    safeSetPosition($counselList);
	
	  } else if ($btnTab2.is(':checked')) {
	    $tab1.removeClass('active');
	    $tab2.addClass('active');
	    $tab3.removeClass('active');
	    initProgramSlider();
	    safeSetPosition($programList);
	
	  } else if ($btnTab3.is(':checked')) {
	    $tab1.removeClass('active');
	    $tab2.removeClass('active');
	    $tab3.addClass('active');
	    initEventSlider();
	    safeSetPosition($eventList);
	  }
	}

    // --- 초기 실행 ---
    updateTab();

    // --- 탭 변경 이벤트 ---
    $btnTab1.on('change', updateTab);
    $btnTab2.on('change', updateTab);
    $btnTab3.on('change', updateTab);
	
});

$(window).on('load', function () {

  var $footerList = $('.footer-banner .fBanner-list'),
      $footerPrev = $('.footer-banner .fBanner_prev'),
      $footerNext = $('.footer-banner .fBanner_next');

  if (!$footerList.length) return;

  // 혹시 남아있을 경우 대비
  if ($footerList.hasClass('slick-initialized')) {
    $footerList.slick('unslick');
  }
 
  $footerList.slick({
    rows: 1,
    draggable: false,
    infinite: true,
    variableWidth: false,
    slidesToShow: 5,
    slidesToScroll: 1,
    autoplay: false,
    autoplaySpeed: 3000,
    prevArrow: $footerPrev,
    nextArrow: $footerNext,
    centerMode: false,
    responsive: [
      {
        breakpoint: 641,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1
        }
      }
    ]
  });

});
	
	
	
})(window.jQuery);


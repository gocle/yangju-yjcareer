(function ($) {
    'use strict';

    $(function () {

        var $window = $(window),
            $container = $('#container');

        //visual
        var $VisualTitleList = $('.rowgroup');
        $VisualTitleList.addClass('time_ani')

        //footer 슬릭
        var $footerList = $('.footer-banner').find('.fBanner-list'),
            $footerPrev = $('.footer-banner').find('.fBanner_prev'),
            $footerNext = $('.footer-banner').find('.fBanner_next');

        $footerList.slick({
            rows: 1,
            draggable: false,
            infinite: true,
            variableWidth: false,
            slidesToShow: 6,
            slidesToScroll: 1,
            autoplay: false,
            autoplaySpeed: 3000,
            prevArrow: $footerPrev,
            nextArrow: $footerNext,
            // autoArrow: $noticeAuto,
            // pauseText: '정지',
            // playText: '재생',
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
    const $btnTab1 = $('#tabmenu1');
    const $btnTab2 = $('#tabmenu2');

    // --- SLICK 대상 ---
    const $counselList = $('.tab1 .counsel_list');
    const $programList = $('.tab2 .program_list');

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
                        breakpoint: 641,
                        settings: { slidesToShow: 2 }
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
                        breakpoint: 641,
                        settings: { slidesToShow: 2 }
                    }
                ]
            });
        }
    }

    // --- 탭 전환 ---
    function updateTab() {
        if ($btnTab1.is(':checked')) {
            $tab1.addClass('active');
            $tab2.removeClass('active');
            initCounselSlider();   // 🔥 tab1 열릴 때만 slick 생성
        } else {
            $tab1.removeClass('active');
            $tab2.addClass('active');
            initProgramSlider();   // 🔥 tab2 열릴 때만 slick 생성
        }
    }

    // --- 초기 실행 ---
    updateTab();

    // --- 탭 변경 이벤트 ---
    $btnTab1.on('change', updateTab);
    $btnTab2.on('change', updateTab);



	
});
	
	
	
})(window.jQuery);
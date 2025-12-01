(function ($) {
    'use strict';

    $(function () {

        var $window = $(window),
            $container = $('#container');

        //visual
        var $VisualTitleList = $('.rowgroup');
        $VisualTitleList.addClass('time_ani')

        //notice 슬릭
        var $notice = $container.find('.notice'),
            $noticeList = $notice.find('.notice_list'),
            $noticePrev = $notice.find('.notice_prev'),
            $noticeNext = $notice.find('.notice_next');

        $noticeList.slick({
            rows: 1,
            draggable: false,
            infinite: true,
            variableWidth: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: false,
            autoplaySpeed: 3000,
            prevArrow: $noticePrev,
            nextArrow: $noticeNext,
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
    });
})(window.jQuery);
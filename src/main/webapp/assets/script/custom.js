/*************************************************************
 Preloader 관련 스크립트
 **************************************************************/

$(window).load(function() {
	$(".preloader").fadeOut("slow");
});





/*************************************************************
 상단 메뉴 네비게이션 스크롤 관련 스크립트
 **************************************************************/

$(function(){
	$(window).scroll(function(){
		var winTop = $(window).scrollTop();
		if(winTop >= 100){
			$("header").addClass("active");
		}else{
			$("header").removeClass("active");
		}
	});
});



/*************************************************************
 Top Button 관련 스크립트
 **************************************************************/

$(function() {
	$(window).scroll(function(){
		var winTop = $(window).scrollTop();

		if ($(this).scrollTop() > 50) {
			$(".btn-top").css('display','block');
		} else {
			$(".btn-top").css('display','none');
		}
	});

	$(".btn-top").on("click", function(e) {
		e.preventDefault();
		$("html, body").animate({scrollTop:0}, '1000');
		return false;
	});
});





/*************************************************************
 Program 강의 이동 관련 스크립트
 **************************************************************/
$(function() {
	$(".speaker a").click(function() {
		var scrollPosition = $($(this).attr("data-target")).offset().top;
		$("html, body").animate({scrollTop: scrollPosition - 180}, '1000');
	});
});





/*************************************************************
 Popup 관련 스크립트
 **************************************************************/

function popclose(obj) {
	obj.removeClass('popup-open').addClass('popup-close');
	setTimeout(function(e) {
		$(obj).css('display', '');
	}, 300);
}

function popopen(obj) {
	obj.removeClass('popup-close').addClass('popup-open');
	
	try{
		$("#m_id").val("");
		$("#m_pwd").val("");
	}catch (e) {
		// TODO: handle exception
	}
	
	$(obj).css('display', 'block');
}

function popup_open(id){
	var popup_object = $('#' + id);
	if(popup_object.hasClass('popup-open')) {
		popclose(popup_object);
	} else {
		popopen(popup_object);
	}
}

$(document).ready(function(e) {
	$(document).on("click",".btn-popup",function(b){
		b.preventDefault();
		$.each($('.popup-area'), function(index, obj) {
			if($(obj).hasClass('popup-open')) {
				popclose($(obj));
			}
		});
		popup_open($(this).data('target'));
		return false;
	});

	$(document).on("click",".close-popup",function(b){
		$.each($('.popup-area'), function(index, obj) {
			if($(obj).hasClass('popup-open')) {
				popclose($(obj));
			}
		});
	});

	$(document).on("click",".popup-below",function(b){
		$.each($('.popup-area'), function(index, obj) {
			if($(obj).hasClass('popup-open')) {
				popclose($(obj));
			}
		});
	});

});





/*************************************************************
 Button 링크 관련 스크립트
 **************************************************************/

$(document).ready(function(e) {
	$(document).on("click",".btn-link",function(b){
		b.preventDefault();
		location.href = $(this).data('target');
		return false;
	});

	$(document).on("click",".btn-new",function(b){
		b.preventDefault();
		var url = $(this).data('target')
		window.open(url);
		return false;
	});
});





/*************************************************************
  GNB 관련 스크립트
 **************************************************************/

$(document).ready(function(e) {
	$(".menuopen").click(function () {
		if($(".menuopen, header > div > div").hasClass("active")){
			$(".menuopen, header > div > div").removeClass("active"); 
		} else {
			$(".menuopen, header > div > div").addClass("active"); 
		}
	});
});





/*************************************************************
  채팅 관련 스크립트
 **************************************************************/

$(function() {
  var isScrollUp = false;
  var lastScrollTop;
  var moreHeight = 10;

  var divChat = document.getElementById('div_chat');

  /* 추가 버튼 클릭 시 */
  $('#btn_append_row').on("click", function() {
    // 라인 추가
    $('#table_chat').append(
      $('<div>').append(
        $('<div>').append($('#add_name').val()),
        $('<p>').append($('#add_msg').val())
      )
    );

    // 기본적으로 스크롤 최하단으로 이동 (애니메이션 적용)
    if (!isScrollUp) {
      $('#div_chat').animate({
        scrollTop: divChat.scrollHeight - divChat.clientHeight + moreHeight
      }, 100);
    }
  });
})
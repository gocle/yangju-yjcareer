/*************************************************************
 Nav Menu Dropdown Script
 **************************************************************/

$(document).ready(function(){
	var menu1 = $('.tree > a');
	var menu2 = $('.tree');

	menu1.click(function(e) {
		e.preventDefault();
		var bodyClass = $('body').attr('class');

		if(bodyClass != 'nav-mini'){
			if ($(this).parent('li').hasClass('menu-open')) {
				$(this).siblings('div').slideUp('fast');
				$(this).parent('li').removeClass('menu-open');
			} else {
				$(this).siblings('div').slideToggle('fast');
				$(this).parent('li').addClass('menu-open');
				menu1.not($(this)).siblings('div').slideUp('fast');
				menu1.not($(this)).parent('li').removeClass('menu-open');
			}
		}

		return false;
	});

	menu2.mouseenter(function() {
		var bodyClass = $('body').attr('class');

		if(bodyClass != 'nav-default'){
			$(this).addClass('menu-open');
			$(this).find('div').css('display','block');
		}

		$(this).siblings('div').mouseenter(function() {
			$(this).addClass('menu-open');
			$(this).find('div').css('display','block');
		});
	});

	menu2.mouseleave(function() {
		var bodyClass = $('body').attr('class');

		if(bodyClass != 'nav-default'){
			$(this).removeClass('menu-open');
			$(this).find('div').css('display','none');
			$(this).find('.tree-depth').css('display','block');
			$(this).find('.tree-depth > p').css('display','none');
		}
	});

});





/*************************************************************
 Nav Menu Mini Script
 **************************************************************/

$(document).ready(function(){
	var mini = $('.nav-btn');
	var nav = localStorage.getItem("nav");
	
	if(nav == "mini"){
		$('body').removeClass('nav-default');
		$('body').addClass('nav-mini');
		$('.nav-mini nav ul > li').removeClass('menu-open');
		$('.nav-mini nav ul > li > div').css('display','none');
	} else {
		$('body').removeClass('nav-mini');
		$('body').addClass('nav-default');
	}

	mini.click(function() {
		if ($('body').hasClass('nav-default')) {
			$('body').removeClass('nav-default');
			$('body').addClass('nav-mini');
			$('.nav-mini nav ul > li').removeClass('menu-open');
			$('.nav-mini nav ul > li > div').css('display','none');
			localStorage.setItem("nav", "mini");
		} else {
			$('body').removeClass('nav-mini');
			$('body').addClass('nav-default');
			localStorage.setItem("nav", "default");
		}
	});

});






/*************************************************************
 Back Button 관련 Script
 **************************************************************/

$(document).ready(function(){
	$("h1 > button").click(function(){
		window.history.back();
	});
});





/*************************************************************
 Button Link 관련 Script
 **************************************************************/

$(document).ready(function(e) {
	$(document).on("click",".btn-link",function(b){
		b.preventDefault();
		location.href = $(this).data('target');
		return false;
	});
});





/*************************************************************
 File Upload 관련 Script
 **************************************************************/

$(function(){
	$('.input_file').change(function(){
		var i = $(this).val();
		$('.upload_text').val(i);
	});
});





/*************************************************************
 Popup 관련 Script
 **************************************************************/

function popclose(obj) {
	obj.removeClass('popup-open').addClass('popup-close');
	setTimeout(function(e) {
		$(obj).css('display', '');
	}, 300);
	
	try{
		fn_pause();
	}catch (e) {
		// TODO: handle exception
	}
}

function popopen(obj) {
	obj.removeClass('popup-close').addClass('popup-open');
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

	$(document).on("click",".normal .close-popup",function(b){
		window.close();
	});

	$(document).on("click",".popup-below",function(b){
		$.each($('.popup-area'), function(index, obj) {
			if($(obj).hasClass('popup-open')) {
				popclose($(obj));
			}
		});
	});

});








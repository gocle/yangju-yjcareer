<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<!-- <head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
	<meta name="keywords" content="양주진로진학교육플랫폼" />
	<meta name="description" content="양주시 양주진로진학교육플랫폼 홈페이지에 오신것을 환영합니다." />
	<link rel="stylesheet" type="text/css" href="/yjcareer/assets/site/yjcareer/css/font.css" />
	<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/main.css">
	<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sub.css">
	<script src="/yjcareer/assets/site/yjcareer/js/jquery-1.12.4.min.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/plugins.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/common.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/main.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/sub.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/board.js"></script>
	<title>양주진로진학교육플랫폼</title>
</head> -->
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
	<meta name="keywords" content="양주진로진학교육플랫폼" />
	<meta name="description" content="양주시 양주진로진학교육플랫폼 홈페이지에 오신것을 환영합니다." />
	<link rel="stylesheet" type="text/css" href="/yjcareer/assets/site/yjcareer/css/font.css" />
	<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/main.css">
	<script src="/yjcareer/assets/site/yjcareer/js/jquery-1.12.4.min.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/plugins.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/common.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/main.js"></script>
	<title>양주진로진학교육플랫폼</title>
</head>

<body id="yjcareer">
	<script type="text/JavaScript">
		document.addEventListener("DOMContentLoaded", () => {

			/* ========= 메인 프로그램 탭 ========= */
			const tab1 = document.querySelector(".tab1");
			const tab2 = document.querySelector(".tab2");
			const tabBtn1 = document.getElementById("tabmenu1");
			const tabBtn2 = document.getElementById("tabmenu2");

			const label1 = document.querySelector("label[for='tabmenu1']");
			const label2 = document.querySelector("label[for='tabmenu2']");

			function updateMainTab() {
				if (tabBtn1.checked) {
					tab1.classList.add("active");
					tab2.classList.remove("active");
					label1.classList.add("active");
					label2.classList.remove("active");
				} else {
					tab1.classList.remove("active");
					tab2.classList.add("active");
					label1.classList.remove("active");
					label2.classList.add("active");
				}
			}

			updateMainTab();
			tabBtn1.addEventListener("change", updateMainTab);
			tabBtn2.addEventListener("change", updateMainTab);


			/* ========= 공지사항 / 자료실 탭 ========= */
			const noticeCon1 = document.querySelector(".notice_contents");
			const noticeCon2 = document.querySelector(".data_contents");

			const noticeBtn1 = document.getElementById("notice_tab1");
			const noticeBtn2 = document.getElementById("notice_tab2");

			const label3 = document.querySelector("label[for='notice_tab1']");
			const label4 = document.querySelector("label[for='notice_tab2']");

			function updateNoticeTab() {
				if (noticeBtn1.checked) {
					noticeCon1.style.display = "block";
					noticeCon2.style.display = "none";

					label3.classList.add("active");
					label4.classList.remove("active");
				} else {
					noticeCon1.style.display = "none";
					noticeCon2.style.display = "block";

					label3.classList.remove("active");
					label4.classList.add("active");
				}
			}

			updateNoticeTab();
			noticeBtn1.addEventListener("change", updateNoticeTab);
			noticeBtn2.addEventListener("change", updateNoticeTab);
			
			$(document).on('click', 'label[for^="counsel_"]', function () {
			  const id = $(this).attr('for');
				const $slider = $('.counsel_list'); 

			  if (id === 'counsel_all') {
				$('.counsel_item').show();
			  } else {
				const typeNum = id.split('_')[1];
				
				$('.counsel_item').hide();
				$('.counsel_item.type_' + typeNum).show();
			  }
				
				$slider.slick('slickGoTo', 0);

			});
			
			$(document).on('click', 'label[for^="program_"]', function () {
				const id = $(this).attr('for');
				const $slider = $('.program_list');

				if (id === 'program_all') {
				  $('.program_item').show();
				} else {
				  const typeNum = id.split('_')[1];
				  $('.program_item').hide();
				  $('.program_item.p_type_' + typeNum).show();
				}
				
				$slider.slick('slickGoTo', 0);

			  });


		});
		
				
		function reInitSlick($slider, initFn) {
		  if ($slider.hasClass('slick-initialized')) {
			$slider.slick('unslick');
		  }
		  initFn();

		}

	</script>

	<script type="text/JavaScript">
		//<![CDATA[
	function setCookie( name, value, expiredays ) {
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
//]]>

</script>
	<!-- 레이어 팝업 시작 -->
	<div id="divpopup1" class="main_popup" style="position:absolute; left:10rem; top:10rem; z-index:1001; visibility:visible;  width:500px; height:560px">
		<div class="layer_cont">
			<a href="/yjcareer/selectEduLctreWebList_4130" target="_blank" title="새창"><img src="/yjcareer/assets/DATA/popup/20251125030444599mSjjuX.jpg" style="width:500px; height:560px;" alt="설명회" /></a>
		</div>

		<form name="notice_form1">
			<div class="layer_put">
				<div>
					<input type="checkbox" name="chkbox1" id="chkbox1" value="checkbox" />
					<label for="chkbox1">오늘하루동안보지않기</label>
				</div>
				<div class="pop-btn"><a href="javascript:closeWind1();">닫기</a></div>
			</div>
		</form>
	</div>
	<script type="text/JavaScript">
		//<![CDATA[
				function closeWind1() {
					if ( document.notice_form1.chkbox1.checked ){
						setCookie( "maindiv1", "done" , 1 );
					}
					document.all['divpopup1'].style.visibility = "hidden";
				}
	
				cookiedata = document.cookie;
				if ( cookiedata.indexOf("maindiv1=done") < 0 ){
					document.all['divpopup1'].style.visibility = "visible";
				}
				else {
					document.all['divpopup1'].style.visibility = "hidden";
				}
			//]]>
			</script>
	<!-- 레이어 팝업 종료 -->
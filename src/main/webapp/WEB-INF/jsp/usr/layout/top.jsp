<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
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
</head>

<body id="yjcareer">

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
<!--	<div id="divpopup1" class="main_popup" style="position:absolute; left:0px; top:100px; z-index:1001; visibility:visible;  width:500px; height:560px">
		<div class="layer_cont">
			<a href="/yjcareer/selectEduLctreWebList_4130" target="_blank" title="새창"><img src="/yjcareer/assets/DATA/popup/20251125030444599mSjjuX.jpg" style="width:500px; height:560px;" alt="설명회" /></a>
		</div>

		<form name="notice_form1">
			<div class="layer_put clearfix" style="background:#000;padding:3px 0">
				<div style="float:left; color:#fff; font-weight:bold; "><input type="checkbox" name="chkbox1" id="chkbox1" value="checkbox" /><label for="chkbox1">오늘하루동안보지않기</label></div>

				<div style="float:right; font-weight:bold;"><a href="javascript:closeWind1();" style="color:#ffff00;">[닫기]</a></div>
			</div>
		</form>
	</div>-->
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
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
		$(document).ready(function () {

			  var depth1Text = $('.breadcrumbs_item')
			    .eq(0)
			    .find('.breadcrumbs_select')
			    .first()
			    .text()
			    .trim();

			  if (depth1Text) {
			    $('.sub_title .first_title').text(depth1Text);
			  }

			  var depth2Text =
			    $('.breadcrumbs_panel a.active').first().text().trim() ||
			    $('.breadcrumbs_item')
			      .eq(1)
			      .find('.breadcrumbs_select')
			      .first()
			      .text()
			      .trim() ||

			    depth1Text;

			  $('.sub_title h2').text(depth2Text);

			});

	</script>


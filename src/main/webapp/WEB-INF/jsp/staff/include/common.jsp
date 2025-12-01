<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/html">
	<head>
		<title>양주 산림예약 관리페이지</title>

		<!-- <meta name="Description" content="Koreatech Back Office" /> -->
		<meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no" />

		<link rel="stylesheet" type="text/css" href="${contextRoot}/assets/css/adm/adm.min.css"/>
		<link rel="stylesheet" type="text/css" href="${contextRoot}/assets/css/adm/adm_inc.css"/>

		<script type="text/javascript" src="${contextRoot}/assets/script/jquery.min.js"></script>
		<script type="text/javascript" src="${contextRoot}/assets/script/custom_admin.js"></script>
		
		<!-- 카카오 주소찾기  -->
		<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="${contextRoot}/js/common.js"></script>
		
		<!-- dataPicker -->
		<link rel="stylesheet" type="text/css" href="${contextRoot}/assets/css/jquery.datetimepicker.css"/>
		<script src="${contextRoot}/assets/script/datepicker/jquery.js"></script>
		<script src="${contextRoot}/assets/script/datepicker/build/jquery.datetimepicker.full.min.js"></script>
		<!-- dataPicker 시작일 종료일 -->
		<script type="text/javascript">
		
		//시작일 종료일
		$(function(){
				//datepicker 한국어로 사용하기 위한 언어설정
			    $.datetimepicker.setLocale('ko');
			    $('#date_timepicker_start').datetimepicker({
			        format: 'Y.m.d',  
			        onShow: function(ct) {
			            this.setOptions({
			                maxDate: jQuery('#date_timepicker_end').val() ? jQuery('#date_timepicker_end').val() : false
			            })
			        },
			        timepicker: false
			    });
	
			    $('#date_timepicker_end').datetimepicker({
			        format: 'Y.m.d',
			        onShow: function(ct) {
			            this.setOptions({
			                minDate: jQuery('#date_timepicker_start').val() ? jQuery('#date_timepicker_start').val() : false
			            })
			        },
			        timepicker: false
			    });
				 
				 
				$('#date_time').datetimepicker({
						//달력 끄고
					  datepicker:false,
					  format:'H:i'
				});

			});
		</script>
	</head>
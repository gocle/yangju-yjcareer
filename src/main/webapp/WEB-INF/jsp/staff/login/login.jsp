<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>

 <!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/html">
	<head>
		<title>양주 진로진학 관리페이지</title>

		<meta name="Description" content="Koreatech Conference Back Office" />
		<meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no" />

		<link rel="icon" href="../assets/image/title_icon.png"/>
		<link rel="stylesheet" type="text/css" href="../assets/css/adm/admLogin.min.css"/>

		<script type="text/javascript" src="../assets/script/jquery.min.js"></script>

	</head>





	<body class="login-area">
		<div>
				<fieldset>
						<legend>양주 진로진학 관리페이지</legend>
						
							<label for="memId" class="fa fa-user-circle-o"></label>
							<form name="loginForm" id="loginForm" method="post">
								<input type="text" name="memId" id="memId" maxlength="50" placeholder="Account Name" />
								<label for="memPassword" class="fa fa-lock"></label>
								<input type="password" name="memPassword" id="memPassword" maxlength="50" placeholder="Password" />
							</form>
							<button type="button"  id="loginBtn">LOGIN</button>
							<span class="hidden">Please insert your account ID.</span>
						
				</fieldset>
			

			<script type="text/javascript">
				var a=0;
				$("#memId").keyup(function(){
					if(document.getElementById("memId").value.length>=1){
						a=a+1;
						if(a==2){
							$("button").addClass("on")
						}
					}
				});
				
				$("#memPassword").keyup(function(){
					if(document.getElementById("memPassword").value.length>=1){
						a=a+1;
						if(a==2){
							$("button").addClass("on")
						}
					}
				});
				
				$(document).ready(function(){
					
					if(""!="${param.retMsgEncode}"){
						alert(decodeURI('${param.retMsgEncode}') );
					} else if ("" != "${param.retMsg}") {
						alert("${param.retMsg}");
					} 
					
					
					$("#loginBtn").click(function(){
						if($("#memId").val() == ""){
							alert("아이디를 입력하세요.");
							return;
						}
						if($("#memPassword").val() == ""){
							alert("비밀번호를 입력하세요.");
							return;
						}
						
						$("#loginForm").attr("action", "${contextRoot}/staff/login.do");
						$("#loginForm").attr("target", "_self");
						$("#loginForm").submit();
					});
					
					
					if(""!="${retMsgEncode}"){
						alert(decodeURI('${retMsgEncode}') );
					} else if ("" != "${retMsg}") {
						alert("${retMsg}");
					} 
					
				});
			</script>
		</div>
	</body>
</html>


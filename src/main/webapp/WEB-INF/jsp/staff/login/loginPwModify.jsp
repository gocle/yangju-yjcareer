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
						
							<label for="memPassword" class="fa fa-lock"></label>
							<form name="form" id="form" method="post">
								<input type="hidden" name="memId" value="<c:out value="${loginVO.memId}"/>" />		
								<input type="password" name="oldPassword" id="oldPassword" maxlength="50" placeholder="Old Password" />
								<label for="memPassword" class="fa fa-lock"></label>
								<input type="password" name="memPassword" id="memPassword" maxlength="50" placeholder="New Password" />
								<label for="memPassword" class="fa fa-lock"></label>
								<input type="password" name="memPasswordChk" id="memPasswordChk" maxlength="50" placeholder="New Password Check" />
							</form>
							<button type="button"  id="pwModifyBtn">CHANGE PASSWORD</button>
							<span class="hidden">Please insert your account PW.</span>
						
				</fieldset>
			

			<script type="text/javascript">
				var a=0;
				
				$("#memPassword").keyup(function(){
					if(document.getElementById("memPassword").value.length>=1){
						a=a+1;
						if(a==2){
							$("button").addClass("on");
						}
					}
				});
				
				$(document).ready(function(){
					
					if(""!="${param.retMsgEncode}"){
						alert(decodeURI('${param.retMsgEncode}') );
					} else if ("" != "${param.retMsg}") {
						alert("${param.retMsg}");
					}
					
					
					$("#pwModifyBtn").click(function(){
						if($("#oldPassword").val() == ""){
							alert("기존 비밀번호를 입력하세요.");
							$("#oldPassword").focus();
							return;
						}
						
						if($("#memPassword").val() == ""){
							alert("새 비밀번호를 입력하세요.");
							$("#memPassword").focus();
							return;
						}
						
						if($("#memPasswordChk").val() == ""){
							alert("새 비밀번호 확인을 입력하세요.");
							$("#memPasswordChk").focus();
							return;
						}
						
						if($("#oldPassword").val() == $("#memPassword").val()){
							alert("기존 비밀번호와 같은 비밀번호로 변경할 수 없습니다.");
							$("#memPassword").focus();
							return;
						}
						
						var passReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{9,20}$/;
						if (!passReg.test($("#memPassword").val())) {
							alert("잘못된 비밀번호 입니다. 9자 이상 20자 이내 영문 대문자,소문자,특수문자 포함해 입력하세요.");
							$("#memPassword").focus();
							return;
						}
						
						if($("#memPassword").val() != $("#memPasswordChk").val()){
							alert("동일한 비밀번호를 입력해주세요.");
							$("#memPasswordChk").focus();
							return;
						}
						
						$("#form").attr("action", "${contextRoot}/staff/modifyLoginPw.do");
						$("#form").attr("target", "_self");
						$("#form").submit();
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
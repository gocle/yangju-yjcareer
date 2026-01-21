<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.Enumeration" %>

<script src="${contextRoot}/ckeditor/ckeditor.js"></script>
<style>
.cke_notification,
.cke_notification_warning,
.cke_notification_message {
  display: none !important;
}
</style>

<body>
<div class="wrapper nav-default" >
	<header>
		<a href="#" class="logo"><img src="${contextRoot}/assets/css/adm/img/logo_admin.png" alt="Yangju 양주시"></a>
		<div>
			<span>${SESSION_MEM_NAME} 님 로그인 중입니다.</span>
			<button type="button" class="btn-link" data-target="${contextRoot}/adm/logout.do" title="Logout">로그아웃</button>
<%-- 			<button class="nav-btn" title="Toggle navigation">Toggle navigation</button>
 			<ul>
				<li>${SESSION_MEM_NAME} 님 안녕하세요. <strong id="session_timer"></strong></li>
				<li><button type="button" class="btn-link" data-target="${contextRoot}/adm/logout.do" title="Logout"><i class="fa fa-power-off"></i></button></li>
			</ul> --%>
		</div>
	</header>
		<!-- END : Header Area-->
	<nav class="side">
		<ul>
		<c:set var="upperMenuNo" value="TOP"/>
		<c:set var="menuLevel" value="1"/>
		<c:set var="menuTypeNum" value="1"/>
		<c:set var="key1" value="${ upperMenuNo}_${menuLevel}"/>
		<c:if test="${not empty menuList[key1]}">
			<c:forEach var="menu1" items="${menuList[key1]}" varStatus="status">
						<!-- S : depth-1 -->
						<c:set var="menuTypeNum" value="${menuTypeNum+1}"/>
							<li id="li_${menu1.menuId }" class="tree">
								<c:choose>
									<c:when test="${0 eq menu1.isLeafMenu}"><a id="a_${menu1.menuId }" href="#" >${menu1.menuTitle }</a></c:when>
									<c:otherwise><a id="a_${menu1.menuId }" <c:if test="${menu1.isLeaf eq 'true' }" >href="#"</c:if><c:if test="${menu1.isLeaf eq 'false' }" >href="${menu1.menuUrl}?menuId=${menu1.menuId}"</c:if> ><b></b><span>${menu1.menuTitle }</span></a></c:otherwise>
								</c:choose>
								<c:set var="key2" value="${ menu1.menuId}_${menu1.menuDepth+1}"/>
								<c:choose>
									<c:when test="${not empty menuList[key2]}">
									<div id="div_${menu1.menuId }">
										<c:forEach var="menu2" items="${menuList[key2]}" varStatus="status2">
											<!-- S : depth-2 -->
													<c:choose>
														<c:when test="${0 eq menu2.isLeafMenu}"><a id="a_${menu2.menuId }" href="#" >${menu2.menuTitle }</a></c:when>
														<c:otherwise><a id="a_${menu2.menuId }"  <c:if test="${menu2.isLeaf eq 'true' }" >href="#"</c:if><c:if test="${menu2.isLeaf eq 'false' }" >href="${menu2.menuUrl}?menuId=${menu2.menuId}"</c:if> >${menu2.menuTitle }</a></c:otherwise>
													</c:choose>
										</c:forEach>
									</div>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
								</li>
					</c:forEach>
				</c:if>
		</ul>
	</nav>
	<!-- END : Nav Area-->
<script type="text/javascript">

	
	$(document).ready(function(){
		
		var bodyClass = $('body').attr('class');
		var menuId = '${menuId}';
		var menu1 = $('.tree > a');
		var nav = localStorage.getItem("nav");
		
		if(bodyClass != 'nav-mini vsc-initialized' && nav != "mini"){
			$("#a_"+menuId).parent('div').slideToggle('fast');
			$("#a_"+menuId).parent('li').addClass('menu-open');
			$("#a_"+menuId).addClass('active');
		}
		
		
		$('#mndpassword').on('keypress', function(e){
			if(e.keyCode == '13'){
				$('#loginBtn').click();
			}
		});
		
		
		$("#loginBtn").click(function(){
			if($("#m_id").val() == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			if($("#m_pwd").val() == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			$("#loginForm").attr("action", "/login.do");
			$("#loginForm").attr("target", "_self");
			$("#loginForm").submit();
		});
		
		$("#logoutBtn").click(function(){
			$("#loginForm").attr("action", "/logout.do");
			$("#loginForm").attr("target", "_self");
			$("#loginForm").submit();
		});
		
		
		if(""!="${retMsgEncode}"){
			alert(decodeURI('${retMsgEncode}') );
		} else if ("" != "${retMsg}") {
			alert("${retMsg}");
		} 
		
	});
	
	var iSecond; //초단위로 환산

	var timerchecker = null;

	window.onload = function() {
	    fncClearTime();
	    initTimer();
	}

	function fncClearTime() {
	    //iSecond = 14400;
		iSecond = 7200;
	}

	Lpad = function(str, len) {
	    str = str + "";
	    while (str.length < len) {
	        str = "0" + str;
	    }
	    return str;

	}

	initTimer = function() {
	    var timer = document.getElementById("session_timer");

	    rHour = parseInt(iSecond / 3600);
	    rHour = rHour % 60;
	    rMinute = parseInt(iSecond / 60);
	    rMinute = rMinute % 60;
	    rSecond = iSecond % 60;

	    if (iSecond > 0) {
	        timer.innerHTML = "&nbsp;" + Lpad(rHour, 2) + " : " + Lpad(rMinute, 2)

	                + " : " + Lpad(rSecond, 2);
	        iSecond--;
	        timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크
	    } else {
	    	logoutUser();
	    }
	}
	
	
	function logoutUser() {
	    location.href="${contextRoot}/adm/logout.do";
	}
	
	/* reply 파일 다운로드 */
	function fn_egov_downFile(atchFileIdx){
		
		$("#replyAtchFileIdx").val(atchFileIdx);
		window.open("${contextRoot}/board/FileDown.do?atchFileIdx="+atchFileIdx);
	}
	function fn_egov_replyDownFile(atchFileIdx){
		window.open("${contextRoot}/board/replyFileDown.do?atchFileIdx="+atchFileIdx);
	}
	
	function siteMain(){
		
	}
	
</script>
<style>
	.list-1 a {
		text-decoration: underline;
	}
</style>
<c:set var="menuPathList" value="${fn:split(menuPathLeafNode, '@')}" />
<div class="container">
	<section>
		<h1>
			<button type="button" class=""><i class="fa fa-arrow-circle-o-left"></i>Back to Previous</button>
			<c:forEach var="menuPath" items="${menuPathList }" varStatus="status">
					<c:if test="${ status.last }">
						${menuPath }
					</c:if>
				</c:forEach>	
		</h1>

		<ol class="page-location">
			<li><a href="#"><i class="fa fa-home"></i> Home</a></li>
			
			<c:forEach var="menuPath" items="${menuPathList }" varStatus="status">
				<li>
						<c:choose>
							<c:when test="${ status.last }">
								${menuPath }
							</c:when>
							<c:otherwise>
								${menuPath }
							</c:otherwise>
						</c:choose>
						</li>
					</c:forEach>
			
		</ol>
	</section>
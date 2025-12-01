<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
   <script type="text/javascript">
   
   function fn_list(){
		  
		  $("#form").attr("action", "${contextRoot}/usr/intro/${pgType}/list.do?menuId=${menuId}");
		  $("#form").attr("method", "get");
		  $("#form").submit();
	}
   
  </script>

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>목공체험 프로그램 소개</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">프로그램 소개</a></li>
				<li><a href="<c:url value="/usr/intro/${pgType}/list.do"/>">목공체험</a></li>
			</ul>
		</div>
	</section>
    
    <section class="sub-section">
		<div class="programS-form view section">
			<div class="info-main-title flex">
				<h2>목공체험</h2>
			</div>
			<form id="form" name="form">
				<div class="view-tile table-0">
					<h3>${result.intTitle}</h3>
				</div>
				
				<div class="programS-txt">
				
					<p>${result.intContentHtml}</p>

				</div>
			</form>
		</div>

		<div class="form-btn">
			<button type="button" class="list" onclick="fn_list();">목록</button>
		</div>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
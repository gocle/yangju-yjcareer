<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
   <script type="text/javascript">
   
   function fn_list(baCategory1){
		  
		  var menuId = $("#menuId").val();
		  
		  window.location.href='${contextRoot}/usr/bbs/${bcId}/list.do?menuId='+menuId+'&baCategory1='+baCategory1;
	}
   
   //파일 다운로드
   function fn_egov_downFile(atchFileIdx){

  		window.open("${contextRoot}/board/FileDown.do?atchFileIdx="+atchFileIdx);
  	}
  
   //이전 글
   function fn_prev( preNo , menuId , baNotice, baCategory1){
   	
  		 window.location.href='${contextRoot}/usr/bbs/${bcId}/detail.do?baId='+preNo+'&menuId='+menuId+'&baNotice='+baNotice+'&baCategory1='+baCategory1;

  	 
   }
   
   
   //다음 글
   function fn_next( nextNo , menuId , baNotice, baCategory1){
  	 

  	 window.location.href='${contextRoot}/usr/bbs/${bcId}/detail.do?baId='+nextNo+'&menuId='+menuId+'&baNotice='+baNotice+'&baCategory1='+baCategory1;
  	 
  	 
   }
  
  </script>

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>프로그램 소개</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">참여 마당</a></li>
				<li><a href="<c:url value="/usr/bbs/${bcId}/list.do?menuId=${menuId}"/>">사진 게시판</a></li>
			</ul>
		</div>
	</section>
    
    <section class="sub-section">
		<div class="programS-form view section">
			<div class="info-main-title flex">
				<h2>사진 게시판</h2>
			</div>
			<form id="form" name="form">
				<div class="view-tile table-0">
					<h3>${result.baTitle}</h3>
				</div>
				
				<div class="programS-txt">
				
					<div class="attachment">
						<dl>
							<dt>첨부파일</dt>
							<dd>
								<c:forEach var="fileVO" items="${fileList}" varStatus="status">
									<c:if test="${fileVO.thumbnailCrop == 'N'}">
										<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
											<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out
												value="${fileVO.fileSize}" />]
										</a>
									</c:if>
									<br>
								</c:forEach>
							</dd>
							
						</dl>
					</div>
				
					<p style="white-space: pre-wrap;">${result.baContentHtml}</p>

				</div>
				
				<div class="arrow-btn">
				<c:if test="${not empty prevNext.preNo and prevNext.preNo ne 0 and not empty prevNext.preTitle}">
					<a href="javascript:fn_prev('${prevNext.preNo}', '${menuId}','${result.baNotice}','${baCategory1}');">이전 글</a>
				</c:if>
				<c:if test="${not empty prevNext.nextNo and prevNext.nextNo ne 0 and not empty prevNext.nextTitle}">
					<a href="javascript:fn_next('${prevNext.nextNo}', '${menuId}','${result.baNotice}','${baCategory1}');">다음 글</a>
				</c:if>
				</div>
			</form>
		</div>

		<div class="form-btn">
			<!-- <button type="button">수정</button> -->
			<button type="button" class="list" onclick="fn_list('${baCategory1}');">목록</button>
		</div>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
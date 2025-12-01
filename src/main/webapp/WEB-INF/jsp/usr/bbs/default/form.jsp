<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
  <script type="text/javascript">
  
  document.addEventListener("DOMContentLoaded", function() {
	  const input = document.getElementById("file_atchFileId");
	  const nameSpan = document.querySelector(".file-name");

	  input.addEventListener("change", function() {
	    if (this.files && this.files.length > 0) {
	      // 파일명 여러 개 → , 로 이어서 표시
	      const names = Array.from(this.files).map(f => f.name).join(", ");
	      nameSpan.textContent = names;
	    } else {
	      nameSpan.textContent = "선택된 파일 없음";
	    }
	  });
	});
  
  function fn_save() {
	  
	  var menuId = $("#menuId").val();
	  
	  var bcId = $("#bcId").val(); 
		 
		 //제목 미입력
		 if ($.trim($("#baTitle").val()) === "") {
			 	 
			alert('제목을 입력해 주세요.');
			 
			 $("#baTitle").val('');
			 
			 $("#baTitle").focus;
			 
			 return false;
			 
		 }
		 
		//내용 미입력
		 if($("#baContentHtml").val() == ""){
			 	 
			alert('내용을 입력해 주세요.');
			 
			 $("#baContentHtml").val('');
			 
			 $("#baContentHtml").focus;
			 
			 return false;
			 
		 }

		 $("#form").attr("action", "${contextRoot}/usr/bbs/"+bcId+"/form.do?menuId="+menuId);
		 $("#form").attr("method", "post");
	     $("#form").submit();
		 
	 }
  
  function fn_list(){
	  
	  var menuId = $("#menuId").val();
	  
	  var bcId = $("#bcId").val(); 
	  
	  $("#form").attr("action", "${contextRoot}/usr/bbs/"+bcId+"/list.do?menuId="+menuId);
	  $("#form").attr("method", "get");
	  $("#form").submit();
  }
  
  </script>
  
	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>${bcName}</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">참여 마당</a></li>
				<li><a href="<c:url value="/usr/bbs/${bcId}/list.do?menuId=${menuId}"/>">${bcName}</a></li>
			</ul>
		</div>
	</section>

    <section class="sub-section">
		<div class="programS-form view view-insert section">
			<div class="info-main-title flex">
				<h2>${bcName}</h2>
			</div>
			<form id="form" name="form" method="post" enctype="multipart/form-data">
			<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
			<input type="hidden" id="bcId" name="bcId" value="<c:out value='${bcId}'/>" />
				<div class="programS-txt">
					<div class="view-form">
						<dl>
							<dt>제목</dt>
							<dd>
								<input id="baTitle" name="baTitle" type="text">
							</dd>
						</dl>
						<dl>
							<dt>내용</dt>
							<dd>
								<textarea id="baContentHtml" name="baContentHtml"></textarea>
							</dd>
						</dl>
					
						<div class="attachment">
						  <dl>
						    <dt>첨부파일</dt>
						    <dd>
						      <div class="file-input-wrapper">
						        <span class="file-name">선택된 파일 없음</span>
						        <!-- 서버에서 multiRequest.getFiles("file_atchFileId")로 받음 -->
						        <input type="file" id="file_atchFileId" name="file_atchFileId" class="file-input" multiple />
						        <label for="file_atchFileId" class="file-label">파일 선택</label>
						      </div>
						    </dd>
						  </dl>
						</div>

					</div>
					
					
				</div>
				
			</form>
		</div>
		<div class="form-btn">
			<button type="button" onclick="fn_save();" >등록 하기</button>
			<button type="button" class="list" onclick="fn_list();" >목록</button>
		</div>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
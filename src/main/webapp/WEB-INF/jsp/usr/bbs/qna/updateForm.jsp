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
  
  function fn_update() {
	  var url = "${contextRoot}/usr/bbs/qna/updateForm.do";

	  if ($.trim($("#baTitle").val()) === "") {
	    alert('제목을 입력해 주세요.');
	    $("#baTitle").focus();
	    return false;
	  }

	  if ($("#baContentHtml").val() === "") {
	    alert('내용을 입력해 주세요.');
	    $("#baContentHtml").focus();
	    return false;
	  }

	  $("#form").attr("action", url);
	  $("#form").attr("method", "post");
	  $("#form").submit();
	}
  
  function fn_list(){
	  
	  var menuId = $("#menuId").val();
	  
	  $("#form").attr("action", "${contextRoot}/usr/bbs/qna/list.do?menuId="+menuId);
	  $("#form").attr("method", "get");
	  $("#form").submit();
  }
  
  //삭제하기
  function fn_egov_deleteFile(atchFileIdx,returnUrl){
  	
  	var menuId = $("#menuId").val();
  	$("#atchFileIdx").val(atchFileIdx);
  	$("#returnUrl").val(returnUrl);
  	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
  	$("#fileForm").submit();
  	
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
    
    	  <form id="fileForm" name="fileForm" method="post" enctype="multipart/form-data">
		    <input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		    <input type="hidden" name="returnUrl" id="returnUrl" />
		    <input type="hidden" id="menuId" name="menuId" value="${menuId }" />
		  </form>
    
		<div class="programS-form view view-insert section">
			<div class="info-main-title flex">
				<h2>${bcName} 등록</h2>
			</div>
			<form id="form" name="form" method="post" enctype="multipart/form-data">
			<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
			<input type="hidden" name="baId" value="${qnaUpdateResult.baId}">
     		<input type="hidden" name="bcId" value="${bcId}">
				<div class="programS-txt">
					<div class="view-form">
						<dl>
							<dt>제목</dt>
							<dd>
								<input id="baTitle" name="baTitle" type="text" value="${qnaUpdateResult.baTitle}">
							</dd>
						</dl>
						<dl>
							<dt>내용</dt>
							<dd>
								<textarea id="baContentHtml" name="baContentHtml">${qnaUpdateResult.baContentHtml}</textarea>
							</dd>
						</dl>
						
						<c:set var="hasFile" value="false" />
						<c:forEach var="f" items="${fileList}">
						  <c:if test="${f.thumbnailCrop eq 'N'}">
						    <c:set var="hasFile" value="true" />
						  </c:if>
						</c:forEach>
						
						<c:if test="${qnaUpdateResult ne null}">
						  <div class="attachment">
						    <dl>
						      <dt>첨부파일</dt>
						      <dd class="file">
						        <!-- 기존 업로드된 파일 목록 -->
								<c:forEach var="fileVO" items="${fileList}">
								  <c:if test="${fileVO.thumbnailCrop eq 'N'}">
								    <span class="uploaded-file">
								      <a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
								        <c:out value="${fileVO.orgFileName}" />
								      </a>
								      <button type="button"
								              class="file-del-btn"
								              onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','/usr/bbs/qna/updateForm.do?baId=${qnaUpdateResult.baId}');">
								        삭제
								      </button>
								    </span>
								  </c:if>
								</c:forEach>
								
								<style>
								.uploaded-file {
								  display: inline-flex;
								  align-items: center;
								  gap: 8px; /* 파일명과 버튼 간격 */
								  margin-bottom: 6px;
								}
								
								.file-del-btn {
								  background-color: #f5f5f5;
								  border: 1px solid #ccc;
								  border-radius: 4px;
								  padding: 3px 8px;
								  font-size: 13px;
								  color: #333;
								  cursor: pointer;
								  transition: all 0.2s ease;
								}
								
								.file-del-btn:hover {
								  background-color: #eaeaea;
								  border-color: #bbb;
								}
								</style>
						
						        <%-- 파일이 없을 때만 업로드 input 노출 --%>
						        <c:if test="${not hasFile}">
						          <div class="file-input-wrapper" style="margin-top:8px;">
						            <span class="file-name">선택된 파일 없음</span>
						            <input type="file" id="file_atchFileId" name="file_atchFileId" class="file-input input_file" />
						            <label for="file_atchFileId" class="file-label">파일 선택</label>
						          </div>
						        </c:if>
						      </dd>
						    </dl>
						  </div>
						</c:if>
						  
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="form-btn">
			<button type="button" onclick="fn_update();" >수정 하기</button>
			<button type="button" class="list" onclick="fn_list();" >목록</button>
		</div>
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/staff/include/common.jsp" %>
<c:import url="/${sessionScope.SESSION_MEM_TYPE}/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = [];

$(document).ready(function() {
	initEditor();		 
	
});

function initEditor() {

	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${contextRoot}/smarteditor/SmartEditor2Skin.html",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
				//alert("아싸!");	
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["textAreaContent"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
} 


function fn_save(){
	
	if ($.trim($("#baTitle").val()) === "") {
	    alert("제목을 입력 하세요");
	    $("#baTitle").focus();
	    return;
	}

	if($("#baContentHtml").val() == ""){
		alert("내용을 입력 하세요");
		
		$("#baContentHtml").focus();
		
		return;
	} 
	
	var menuId = $("#menuId").val();
	
	var data =oEditors.getById["content"].getIR();
	
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	

	
	$("#content").val(data);
	
	
	var pathId = "${boardConfigVO.bcId}";
	
	$("#form").attr("action","${contextRoot}/staff/bbs/"+pathId+"/insert.do");
	
	$("#form").attr("target","_self");
	
	$("#form").submit();
	
}


function fn_update( ) {
	
	var data =oEditors.getById["content"].getIR();
	
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	

		
	$("#content").val(data);
	
	var pathId = "${boardConfigVO.bcId}";
	
	var baId= "${boardArticleVO.baId}";
	
	$("#form").attr("action", "${contextRoot}/staff/bbs/"+pathId+"/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
	
}


//목록
function fn_list() {
	
		
		var bcId = $("#searchform_bcId").val();
		
		var menuId = $("#searchform_menuId").val();
		
	
		$("#searchform").attr("action", "${contextRoot}/staff/bbs/"+bcId+"/list.do");
		
		$("#searchform").attr("method", "get");
		
		$("#searchform").submit();
		
}




//삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl){
	
	
	var menuId = $("#menuId").val();
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "/board/deleteFile.do");
	$("#fileForm").submit();
	
	
}

//수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	
	
	var menuId = $("#menuId").val();
	
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "/board/updateFile.do");
	$("#fileForm").submit();
	
	
}


</script>
	<section>
	
	<form id="searchform" name="searchform" method="post">
			<input type="hidden" id="searchform_menuId" name="menuId" value="<c:out value='${menuId}'/>" /> 
			<input type="hidden" id="searchform_baId" name="baId" value="${boardArticleVO.baId}">
			<input type="hidden" id="searchform_bcId" name="bcId" value="${boardConfigVO.bcId}" >
			</form>
	
	<form id="fileForm" name="fileForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
		<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
	</form>

		<form id="form" name="form" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" /> 
			<input type="hidden" id="baId" name="baId" value="${boardArticleVO.baId}">
			<input type="hidden" id="bcId" name="bcId" value="${boardConfigVO.bcId}" >
			<table class="detail">
				<colgroup>
					<col width="15%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<c:if test="${boardArticleVO.baTitle eq null}">
						<input type="text" style="width: 100%" name="baTitle" id="baTitle">
						</c:if>
						<c:if test="${boardArticleVO.baTitle ne null}">
						<input type="text" style="width: 100%" name="baTitle" id="baTitle" value="${boardArticleVO.baTitle}">
						</c:if>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
						<c:if test="${boardArticleVO.baContentHtml eq null}">
						<textarea placeholder=
						" 내용을 간략히 입력해주세요."
								id="content" name="baContentHtml"></textarea>
								</c:if>
						<c:if test="${boardArticleVO.baContentHtml ne null}">
						<textarea placeholder=" 내용을 간략히 입력해주세요."
								id="content" name="baContentHtml">${boardArticleVO.baContentHtml}</textarea>
						</c:if>	
					</td>
					</tr>
				
					<c:if test="${boardArticleVO eq null}">
					<tr>
						<th>관련 자료</th>
						<td>
							 <input type="file" class="input_file"
							id="file_atchFileId1" name="file_atchFileId" title="파일찾기"><br />
						</td>
					</tr>
					</c:if>
						
					<c:if test="${boardArticleVO ne null }">
					<tr>
							<th>관련 자료</th>
														
							<td class="file">
								
								<c:forEach var="fileVO" items="${fileList}" varStatus="status">
									<c:if test="${fileVO.thumbnailCrop eq 'N'}"> <!-- 썸네일 여부가 0 일때..  -->
										<span>
											<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');"> <c:out value="${fileVO.orgFileName}"/></a>
											<button type="button" onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','${contextRoot}/staff/bbs/${boardConfigVO.bcId}/insert.do?baId=${boardArticleVO.baId}');">삭제</button>
										</span>
									</c:if>
								</c:forEach>
								<c:set var="len" value="${fn:length(fileList)}"/>
								
								<c:if test="${len < 2}">
									<c:forEach var="i" begin="1" end="${1-len}">
										<c:choose>
											<c:when test="${i == 1 and fn:length(fileList) > 0}">
											<br/><br/>
											</c:when>
											<c:otherwise><br/></c:otherwise>
										</c:choose>
									   <input style="border-top: 5px;" type="file" class="input_file" id="file_atchFileId${i}" name="file_atchFileId" title="파일찾기"><br/>
									</c:forEach>
								</c:if>
			
							</td>
						</tr>
				  </c:if>
				  
				  <!--config  사용시  반응  -->
			<c:if test="${boardConfigVO.bcSupportThumbnail eq '1'}" >
				 <c:if test="${boardArticleVO eq null}">
					 <tr>	
						<th>이미지 첨부</th>
						
							<td class="file">						
							<input type="file" class="input_file"
								id="file_thumbFileId1"
	 								name="file_thumbFileId"
								 title="이미지 찾기">
							</td>
							
						</tr>
					</c:if>
					<c:if test="${boardArticleVO ne null }">
						<tr>
							<th>이미지 첨부</th>
						
							<td class="file">
								 <c:forEach var="fileVO" items="${fileList}" varStatus="status">
					 				<c:if test="${fileVO.thumbnailCrop eq 'Y'}">
								 	<!-- 썸네일일때  -->
											<span >
												<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');"> <c:out value="${fileVO.orgFileName}"/></a>
												<button type="button" onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','${contextRoot}/staff/bbs/${boardConfigVO.bcId}/insert.do?baId=${boardArticleVO.baId}');">삭제</button>
											</span>
									</c:if>
								</c:forEach>
								
								<c:set var="len" value="${fn:length(fileList)}"/>
									
									<c:if test="${len < 1}">
										<c:forEach var="i" begin="1" end="${1-len}">	<!-- 이게 하나만 나오는거고,.input창 -->
											<c:choose>
												<c:when test="${i==1 and fn:length(fileList) > 0}">
												<br/><br/>
												</c:when>
												<c:otherwise><br/></c:otherwise>
											</c:choose>
										   <input style="border-top: 5px;" type="file" class="input_file" id="file_thumbFileId${i}" name="file_thumbFileId" title="파일찾기"><br/>
										</c:forEach>
								  </c:if>
						</td>
					</tr>
					</c:if>
				</c:if>
					<tbody></table>
		</form>
					<div class="text-right btn-area">
					<c:choose>
						<c:when test="${boardArticleVO.baId ne null}">
							<button type="button" onclick="fn_update();" class="point">수정</button>
						</c:when>
						<c:otherwise>
							<button type="button" onclick="fn_save();" class="point">등록</button>
						</c:otherwise>
					</c:choose>
						<a href="javascript:fn_list();">목록</a>
					</div>
</section>
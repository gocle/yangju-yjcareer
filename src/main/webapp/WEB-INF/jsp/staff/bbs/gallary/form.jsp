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
			}
		}, //boolean
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
} 


function fn_save(){

	if($("#baTitle").val() == ""){
		alert("제목을 입력 하세요.").
		$("#baTitle").focus();
		return;
	}
 	if($("#baContentHtml").val() == ""){
		alert("내용을 입력 하세요").
		$("#baContentHtml").focus();
		return;
	} 
	
	var data =oEditors.getById["content"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	
	$("#content").val(data);
	var pathId = "${boardConfigVO.bcId}";
	
	$("#form").attr("action", "${contextRoot}/staff/bbs/"+pathId+"/insert.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

function addFile(){
	var file_add="";
	file_add += "<p>";
	file_add +="<span>";
	file_add +="<a href=\"#@\" class=\"checkfile\">찾아보기</a>";
	file_add +="<input type=\"file\" class=\"file_input_hidden\" name=\"file_atchFileId\"  />";
	file_add +="</span>";
	file_add +="<a href=\"#!\" onclick=\"javascript:addFile();\" class=\"plus\">추가</a>";
	file_add +="</p>";
	$(".file-add").append(file_add);
} 


function fn_update() {
	
	if($("#baTitle").val() == ""){
		alert("제목을 입력 하세요.").
		$("#baTitle").focus();
		return;
	}
	
	var data =oEditors.getById["content"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	
	$("#content").val(data);
	var pathId = "${boardConfigVO.bcId}";
	
	$("#form").attr("action", "${contextRoot}/staff/bbs/"+pathId+"/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}


//목록
function fn_list() {
	var bcId = $("#searchform_bcId").val();
	var menuId = $("#searchform_menuId").val();

	$("#searchform").attr("action", "${contextRoot}/staff/bbs/"+bcId+"/list.do?menuId="+menuId);
	$("#searchform").attr("method", "get");
	$("#searchform").submit();
		
}

//삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl){
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
	$("#fileForm").submit();
}

//수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "/board/updateFile.do");
	$("#fileForm").submit();
}


</script>

<section>
	<form id="searchform" name="searchform" method="post">
		<input type="hidden" id="searchform_menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="searchform_baId" name="baId" value="${boardArticleVO.baId}" />
		<input type="hidden" id="searchform_bcId" name="bcId" value="${boardConfigVO.bcId}" />
	</form>

	<form id="fileForm" name="fileForm" method="post">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
		<input type="hidden" name="menuId" id="menuId" value="${menuId}" />
	</form>

	<form id="form" name="form" method="post" enctype="multipart/form-data">
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="baId" name="baId" value="${boardArticleVO.baId}" />
		<input type="hidden" id="bcId" name="bcId" value="${boardConfigVO.bcId}" />

		<table class="detail">
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:if test="${not empty codeSubList}">
					<tr>
						<th>분류</th>
						<td>
								<select name="baCategory1" id="baCategory1">
									<option value="">선 택</option>
									<c:forEach var="codeSubList"  items="${codeSubList}" varStatus="status">
										<option value="${codeSubList.codeCode }"
										<c:if test="${boardArticleVO.baCategory1 eq codeSubList.codeCode}">selected="selected"</c:if>>
										${codeSubList.codeName }</option>
									</c:forEach>
								</select>	
						</td>
					</tr>
				</c:if>			
				<tr>
					<th>제목<span style="color:red;"> *</span></th>
					<td>
						<c:if test="${boardArticleVO.baTitle eq null}">
							<input type="text" style="width: 100%" name="baTitle" id="baTitle" />
						</c:if>
						<c:if test="${boardArticleVO.baTitle ne null}">
							<input type="text" style="width: 100%" name="baTitle" id="baTitle" value="${boardArticleVO.baTitle}" />
						</c:if>
					</td>
				</tr>

				<tr>
					<th>내용<span style="color:red;"> *</span></th>
					<td>
						<c:if test="${boardArticleVO.baContentHtml eq null}">
							<textarea placeholder=" 내용을 간략히 입력해주세요." id="content" name="baContentHtml"></textarea>
						</c:if>
						<c:if test="${boardArticleVO.baContentHtml ne null}">
							<textarea placeholder=" 내용을 간략히 입력해주세요." id="content" name="baContentHtml">${boardArticleVO.baContentHtml}</textarea>
						</c:if>
					</td>
				</tr>

				<!-- <tr>
					<th>원문 바로가기</th>
					<td>
					</td>
				</tr> -->

				<c:if test="${boardArticleVO eq null}">
					<tr>
						<th>첨부 파일</th>
						<td>
							<input type="file" class="input_file" id="file_atchFileId0" name="file_atchFileId" title="파일찾기" /><br />
							<input type="file" class="input_file" id="file_atchFileId1" name="file_atchFileId" title="파일찾기" /><br />
							<input type="file" class="input_file" id="file_atchFileId2" name="file_atchFileId" title="파일찾기" /><br />
							<input type="file" class="input_file" id="file_atchFileId3" name="file_atchFileId" title="파일찾기" /><br />
							<input type="file" class="input_file" id="file_atchFileId4" name="file_atchFileId" title="파일찾기" />
						</td>
					</tr>
				</c:if>

				<c:if test="${boardArticleVO ne null}">
					<tr>
						<th>첨부파일</th>
						<td class="file">
							<c:forEach var="fileVO" items="${fileList}" varStatus="status">
								<c:if test="${fileVO.thumbnailCrop eq 'N'}">
									<span>
										<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
											<c:out value="${fileVO.orgFileName}" />
										</a>
										<button type="button" onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','/staff/bbs/${boardConfigVO.bcId}/updateForm.do?baId=${boardArticleVO.baId}&bcId=${boardArticleVO.bcId}');">삭제</button>
									</span>
								</c:if>
							</c:forEach>

							<c:set var="len" value="${fn:length(fileList)}" />
							<c:if test="${len < 5}">
								<c:forEach var="i" begin="1" end="${5 - len}">
									<c:choose>
										<c:when test="${i == 1 and fn:length(fileList) > 0}">
											<br /><br />
										</c:when>
										<c:otherwise><br /></c:otherwise>
									</c:choose>
									<input style="border-top: 5px;" type="file" class="input_file" id="file_atchFileId${i}" name="file_atchFileId" title="파일찾기" /><br />
								</c:forEach>
							</c:if>
						</td>
					</tr>
				</c:if>

				<c:if test="${boardArticleVO eq null}">
					<tr>
						<th>이미지 첨부</th>
						<td class="file">
							<input type="file" class="input_file" id="file_thumbFileId1" name="file_thumbFileId" title="이미지 찾기" />
							<c:choose>
								<c:when test="${boardConfigVO.bcId eq 'worklearning'}">
									<p style="color: red; font-size: 15px;">* 200 x 130 등록해주세요</p>
								</c:when>
								<c:otherwise>
									<p style="color: red; font-size: 15px;">* 275 x 180 등록해주세요</p>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:if>

				<c:if test="${boardArticleVO ne null}">
					<tr>
						<th>이미지 첨부</th>
						<td class="file">
							<c:forEach var="fileVO1" items="${fileList1}" varStatus="status">
								<c:if test="${fileVO1.thumbnailCrop eq 'Y'}">
									<span>
										<a href="javascript:fn_egov_downFile('${fileVO1.atchFileIdx}');">
											<c:out value="${fileVO1.orgFileName}" />
										</a>
										<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}','/staff/bbs/${boardConfigVO.bcId}/updateForm.do?baId=${boardArticleVO.baId}&bcId=${boardArticleVO.bcId}');">삭제</button>
									</span>
								</c:if>
							</c:forEach>

							<c:set var="len1" value="${fn:length(fileList1)}" />
							<c:if test="${len1 < 2}">
								<c:forEach var="j" begin="1" end="${1 - len1}">
									<c:choose>
										<c:when test="${j == 1 and fn:length(fileList1) > 0}">
											<br /><br />
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${boardConfigVO.bcId eq 'worklearning'}">
													<p style="color: red; font-size: 15px;">* 200 x 130 등록해주세요</p>
												</c:when>
												<c:otherwise>
													<p style="color: red; font-size: 15px;">* 275 x 180 등록해주세요</p>
												</c:otherwise>
											</c:choose>
											<br />
										</c:otherwise>
									</c:choose>
									<input style="border-top: 5px;" type="file" class="input_file" id="file_thumbFileId${j}" name="file_thumbFileId" title="파일찾기" /><br />
								</c:forEach>
							</c:if>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
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
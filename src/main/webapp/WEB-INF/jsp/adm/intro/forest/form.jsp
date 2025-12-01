<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="${contextRoot}/js/com_validation.js"></script>
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
	var pgType = '${introVO.pgType}';
	
	if($("#intTitle").val() == ""){
		alert("제목을 입력하세요.")
		$("#intTitle").focus();
		return;
	}
	
	if($("#intAge").val() == ""){
		alert("나이를 입력하세요.")
		$("#intAge").focus();
		return;
	}
	
	if($("#intDesc").val() == ""){
		alert("내용을 입력하세요.")
		$("#intTitle").focus();
		return;
	}
	
	if($("#intContentHtml").val() == ""){
		alert("내용을 입력 하세요");
		$("#intContentHtml").focus();
		return false;
	}
	
	$("#form").attr("action", "${contextRoot}/adm/intro/"+pgType+"/insert.do");
	$("#form").attr("introTarget","_self");
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
	var pgType = '${introVO.pgType}';
	
	if($("#intTitle").val() == ""){
		alert("제목을 입력하세요.")
		$("#intTitle").focus();
		return;
	}
	
	if($("#intAge").val() == ""){
		alert("나이를 입력하세요.")
		$("#intAge").focus();
		return;
	}
	
	if($("#intDesc").val() == ""){
		alert("내용을 입력하세요.")
		$("#intDesc").focus();
		return;
	}
	
	var data =oEditors.getById["content"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("상세내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	
	$("#content").val(data);
	
	$("#form").attr("action", "${contextRoot}/adm/intro/"+pgType+"/update.do");
	$("#form").attr("introTarget","_self");
	$("#form").submit();
}

//목록
function fn_list() {
	var pgType = '${introVO.pgType}';
	var menuId = $("#menuId").val();

	$("#form").attr("action", "${contextRoot}/adm/intro/"+pgType+"/list.do?menuId="+menuId);
	$("#form").attr("method", "get");
	$("#form").submit();
		
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
	
	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
	$("#fileForm").submit();
}

</script>

<section>
	<form id="fileForm" name="fileForm" method="post">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
		<input type="hidden" name="menuId" id="menuId" value="${menuId}" />
	</form>

	<form id="form" name="form" method="post" enctype="multipart/form-data">
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="intId" name="intId" value="${introVO.intId}" />

		<table class="detail">
			<colgroup>
				<col width="10%">
				<col width="23.3%">
				<col width="10%">
				<col width="23.3%">
				<col width="10%">
				<col width="23.4%">
			</colgroup>
			<tbody>
				<tr>
					<th>소개제목</th>
					<td colspan="5">
						<input type="text" style="width:100%" name="intTitle" id="intTitle" value="${introVO.intTitle}" />
					</td>
				</tr>
				<tr>
					<th>연령</th>
					<td colspan="5">
						<c:if test="${introVO.intAge eq null}">
							<select name="intAge" id="intAge" style="width: 50%;">
						        <c:forEach var="targetList" items="${targetList}">
						            <option value="${targetList.codeCode}">${targetList.codeName}</option>
						        </c:forEach>
						    </select>
						</c:if>
						<c:if test="${introVO.intAge ne null}">
						    <select name="intAge" id="intAge" style="width: 50%;">
						        <c:forEach var="item" items="${targetList}">
						            <option value="${item.codeCode}"
						                <c:if test="${item.codeCode eq introVO.intAge}">selected</c:if>>
						                ${item.codeName}
						            </option>
						        </c:forEach>
						    </select>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>소개 내용</th>
					<td colspan="5">
						<input type="text" style="width:100%" name="intDesc" id="intDesc" value="${introVO.intDesc}" />
					</td>
				</tr>
				<tr>
					<th>소개 상세내용</th>
					<td colspan="5">
						<c:if test="${introVO.intContentHtml eq null}">
			               <textarea placeholder=" 내용을 간략히 입력해주세요." id="content" name="intContentHtml" style="width: 100%"></textarea>
			            </c:if>
			            <c:if test="${introVO.intContentHtml ne null}">
			               <textarea placeholder=" 내용을 간략히 입력해주세요." id="content" name="intContentHtml" style="width: 100%">${introVO.intContentHtml}</textarea>
			            </c:if>
		            </td>
				</tr>
				<c:if test="${introVO ne null}">
					<tr>
						<c:if test="${introVO eq null}">
							<th>썸네일</th>
							<td class="file" colspan="5">
								<input type="file" class="input_file" id="file_thumbFileId1" name="file_thumbFileId" title="이미지 찾기" />
								<p style="color: red; font-size: 15px;">* 275 x 180 등록해주세요</p>
							</td>
						</c:if>
						
						<c:if test="${introVO ne null}">
							<th>썸네일</th>
							<td class="file" colspan="5">
								<c:forEach var="fileVO1" items="${fileList1}" varStatus="status">
									<c:if test="${fileVO1.thumbnailCrop eq 'Y'}">
										<span>
											<a href="javascript:fn_egov_downFile('${fileVO1.atchFileIdx}');">
												<c:out value="${fileVO1.orgFileName}" />
											</a>
											<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}','/adm/intro/${introVO.pgType}/updateForm.do?intId=${introVO.intId}');">삭제</button>
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
													<p style="color: red; font-size: 15px;">* 275 x 180 등록해주세요</p>
												<br />
											</c:otherwise>
										</c:choose>
										<input style="border-top: 5px;" type="file" class="input_file" id="file_thumbFileId${j}" name="file_thumbFileId" title="파일찾기" /><br />
									</c:forEach>
								</c:if>
							</td>
						</c:if>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form>

	<div class="text-right btn-area">
		<c:choose>
			<c:when test="${introVO.intId ne null}">
				<button type="button" onclick="fn_update();" class="point">수정</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:otherwise>
		</c:choose>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = [];

$(document).ready(function() {
	initEditor("");

});

function initEditor(contentId) {
	
	  if(contentId == null || contentId == "" ){
	         contentId = "content";
	      } 

	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: contentId,
		sSkinURI: "${contextRoot}/smarteditor/SmartEditor2Skin.html",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		}, //boolean ele
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
} 

//댓글 수정 하기
function fn_editor( brId , baId , index){
	
	var menuId = $("#menuId").val();
	var pathId = $("#bcId").val();
	
      $.ajax({
         url:"${contextRoot}/adm/bbs/"+pathId+"/reply/detail.do?menuId="+menuId,
         type:"post",
         data:{
        	 "brId":brId,
        	 "baId":baId
         },
        success:function(data){
			if(data){
				 $("#div_" + index).empty();
				 $("#div_" + index).html("<textarea id='content" + index + "' name='brContent" + index + "'>" + data.brContent + "</textarea>");
				 initEditor("content" + index);
			     $("#span_" + index).show();
			     
			     $("#updateEditorBtn_" + index).hide();
			     $("#updateBtn_" + index).show();
			     
			     $("#atchTr_" + index).show();
			     
			     // 첨부파일 처리
	             if (data.atchFileIdx && data.rDeleteYn == 'N') {
	            	 // 첨부파일이 있을 때
	            	 $("#deleteFileBtn_" + index).show();
	            	 $("#file_atchFileId_"+ index).hide();
	             } else {
	            	 // 첨부파일이 없을 때
	            	 $("#file_atchFileId_"+ index).show();
	             }
			}
        },error:function(xhr,status,error){
           //alert(xhr.status);
        }
     });
}

function fn_delete(){
	var pathId = "${boardConfigVO.bcId}";
	var baId = "${result.baId}";
	var menuId = "${menuId}";
	
	if(confirm("자료를 삭제하시겠습니까?")){
		var reqUrl = "${contextRoot}/adm/bbs/"+pathId+"/delete.do?memuId="+menuId;
		$("#form").attr("action", reqUrl);
		$("#form").submit();
	}
}

function fn_update(){
	var bcId= "${boardConfigVO.bcId}";
	var baId= "${result.baId}";	
	var menuId = "${menuId}";
	
	$("#form").attr("action", "${contextRoot}/adm/bbs/"+bcId+"/updateForm.do " );
	$("#form").attr("method", "get");
	$("#form").submit();
}

function fn_list(){
	var bcId = $("#bcId").val();
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/adm/bbs/"+bcId+"/list.do?menuId="+menuId;
	
	$("#form").attr("action", reqUrl);
	$("#form").attr("method", "get");
	$("#form").submit();
}

//저장 
function fn_reply_save(){
	
	var data =oEditors.getById["content"].getIR();
	
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	
	$("#content").val(data);
	var pathBcId = $("#bcId").val();
	var pathBaId = $("#baId").val();
	var menuId = $("#menuId").val();
	
	$("#replyForm").attr("action", "${contextRoot}/adm/bbs/"+pathBcId+"/replyInsert.do");
	$("#replyForm").attr("target","_self");
	$("#replyForm").submit();
}

function fn_reply_update(index , brId, atchFileIdx){
	
	var pathBcId = $("#bcId").val();
	var menuId = $("#menuId").val();
	var data =oEditors.getById["content"+index].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"+index].exec("FOCUS"); 
		return false;
	}
	
	$("#reply_content"+index).val(data);
	$("#reply_file"+index).val(atchFileIdx);
	$("#replyFunc"+index).attr("action","${contextRoot}/adm/bbs/"+pathBcId+"/replyUpdate.do?menuId="+menuId);
	$("#replyFunc"+index).attr("target","_self");
	$("#replyFunc"+index).submit();	 
}

/* 댓글 삭제 */
function fn_reply_delete( brId ){
	
	var pathBcId = $("#bcId").val();
	var menuId = $("#menuId").val();
	
	$("#replyId").val(brId);
	$("#replyForm").attr("action", "${contextRoot}/adm/bbs/"+pathBcId+"/replyDelete.do?menuId="+menuId);
	$("#replyForm").attr("target","_self");
	$("#replyForm").submit();
}


//댓글 첨부 삭제하기
function fn_egov_replyDeleteFile(atchFileIdx,returnUrl){
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	$("#replyFileForm").attr("action", "${contextRoot}/board/replyDeleteFile.do");
	$("#replyFileForm").submit();
}


//삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl){
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "/board/deleteFile.do");
	$("#fileForm").submit();
}

//댓글 첨부 수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	$("#fileForm").attr("action", "/board/updateFile.do");
	$("#fileForm").submit();
}

// 댓글 수정 시 첨부파일 영역
function makeReplyFileArea () {
	
}
</script>

<style>
.reply-btn-area {float:right;}
.btn_blue {background: #182142!important; color: #fff!important;}
</style>

<form id="form" name="form" method="post">
	<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
	<input type="hidden" id="baId" name="baId" value="${result.baId}">
	<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
	<table class="detail">
		<colgroup>
			<col width="10%">
			<col width="*">
		</colgroup>
		<tbody>
			<tr><th>제목</th><td>${result.baTitle}</td></tr>
			<tr><th>작성자</th><td>${result.memName}</td></tr>
			<tr><th>등록일</th><td>${result.baRegdate}</td></tr>
			<tr>
				<th>상단 공지</th>
				<td>
					<c:if test="${result.baNotice eq '1'}">사용</c:if>
					<c:if test="${result.baNotice eq '0'}">미사용</c:if>
				</td>
			</tr>
			<tr><th>내용</th><td>${result.baContentHtml}</td></tr>
			<c:if test="${fn:length(fileList) > 0}">
				<tr>
					<th>첨부파일</th>
					<td class="file">
						<c:forEach var="fileVO" items="${fileList}" varStatus="status">
							<c:if test="${fileVO.thumbnailCrop == 'N'}">
								<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
									<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out value="${fileVO.fileSize}" />]
								</a>
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<c:if test="${boardConfigVO.bcSupportThumbnail eq '1' }">
					<tr>
						<th>썸네일 자료</th>
						<td class="file">
							<c:forEach var="fileVO" items="${fileList}" varStatus="status">
								<c:if test="${fileVO.thumbnailCrop eq 'Y'}">
									<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
										<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out value="${fileVO.fileSize}" />]
									</a>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</c:if>
			</c:if>
		</tbody>
	</table>
	<div class="text-right btn-area">
		<button type="button" class="point" onclick="fn_update()">수정</button>
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_list();">목록</a>
	</div>
</form>
</section>

<c:if test="${result.bcId ne 'notice' and result.bcId ne 'referRoom' and result.bcId ne 'bbs_001' and result.bcId ne 'bbs_002'}">
<section style="margin-top:20px;">
	<div><h2>-댓글입력란-</h2></div>
	<form id="replyForm" name="replyForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="baId" name="baId" value="${result.baId}">
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
		<input type="hidden" id="replyId" name="brId" value="">
		<section>
			<table class="detail">
				<colgroup>
					<col width="10%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>댓글 내용</th>
						<td><textarea placeholder=" 내용을 간략히 입력해주세요." id="content" name="brContent"></textarea></td>
					</tr>
					<tr>
						<th>파일 첨부</th>
						<td>
							<input type="file" class="input_file" id="file_atchFileId" name="file_atchFileId" title="파일찾기">
							<div class="text-right btn-area">
								<button type="button" class="point" style="height:36px!important;" onclick="javascript:fn_reply_save()">댓글 입력</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</section>
	</form>
	
	<div><h2>-댓글 목록-</h2></div>

	<form id="replyFileForm" name="replyFileForm" method="post">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
	</form>

	<c:forEach var="boardReplyList" items="${boardReplyList}" varStatus="status">
		<form id="replyFunc${status.index}" name="replyFunc${status.index}" method="post" enctype="multipart/form-data" style="margin-top:10px;">
			<input type="hidden" id="brId" name="brId" value="${boardReplyList.brId}">
			<input type="hidden" id="menuId" name="menuId" value="${menuId}">
			<input type="hidden" id="reply_content${status.index}" name="brContent" value="">
			<input type="hidden" id="reply_file${status.index}" name="atchFileIdx" value="">
			<input type="hidden" id="baId" name="baId" value="${result.baId}">
			<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
			<table class="detail">
				<colgroup>
					<col width="10%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr><th>댓글 순번</th><td>${boardReplyList.brId}
					<c:if test="${SESSION_MEM_SEQ eq boardReplyList.regId}">
						<div class="reply-btn-area">
							<button type="button" id="updateEditorBtn_${status.index}" class="btn_blue" onclick="fn_editor('${boardReplyList.brId}','${result.baId}','${status.index}');">댓글 수정</button>
							<button type="button" id="updateBtn_${status.index}" class="btn_blue" onclick="fn_reply_update('${status.index}','${boardReplyList.brId}','${boardReplyList.atchFileIdx}');" style="display:none;">댓글 수정</button>
							<button type="button" class="btn_blue" onclick="fn_reply_delete('${boardReplyList.brId}');">댓글 삭제</button>
						</div>
					</c:if>
					</td></tr>
					<tr><th>댓글 등록자</th><td><p>${boardReplyList.memName}</p></td></tr>
					<tr>
						<th>댓글 내용</th>
						<td id="toggle_${status.index}" style="display: ">
							<div id="div_${status.index}">${boardReplyList.brContent}</div>
							<span style="display: none" id="span_${status.index}">
								<%-- <div class="text-right btn-area">
									<input type="file" class="input_file" id="file_atchFileId" name="file_atchFileId" title="파일찾기">
									<br><br>
									<button type="button" class="point">
										<a style="color:white" href="javascript:fn_reply_update('${status.index}','${boardReplyList.brId}','${boardReplyList.atchFileIdx}' );" class="btn blue">수정</a>
									</button>
								</div> --%>
							</span>
						</td>
					</tr>
					<tr><th>댓글 등록일</th><td>${boardReplyList.regDt}</td></tr>
					<%-- <c:if test="${boardReplyList.rDeleteYn eq 'N'}"> --%>
						<tr id="atchTr_${status.index}" style="display:${not empty boardReplyList.atchFileIdx and boardReplyList.rDeleteYn ne 'Y' ? '':'none'}">
							<th>첨부 파일</th>
							<td class="file">
								<%-- <a href="javascript:fn_egov_replyDownFile('${boardReplyList.atchFileIdx}');" style="color:#333; background:none"><b><c:out value="${boardReplyList.orgFileName}" /></b></a>
								<a href="javascript:fn_egov_replyDeleteFile('${boardReplyList.atchFileIdx}', '/adm/bbs/${result.bcId}/detail.do?baId=${boardReplyList.baId}&menuId=${menuId}' )" class="btn">파일삭제</a> --%>
								
								<c:if test="${not empty boardReplyList.atchFileIdx and boardReplyList.rDeleteYn ne 'Y'}">
									<span id="file${boardReplyList.atchFileIdx}">
										<a href="javascript:fn_egov_replyDownFile('${boardReplyList.atchFileIdx}');"><c:out value="${boardReplyList.orgFileName}" /></a>
										<button id="deleteFileBtn_${status.index}" type="button" onclick="fn_egov_replyDeleteFile('${boardReplyList.atchFileIdx}','/adm/bbs/${result.bcId}/detail.do?baId=${boardReplyList.baId}&menuId=${menuId}');" style="display: none">삭제</button>
									</span>
								</c:if>
								
								<input type="file" class="input_file" id="file_atchFileId_${status.index}" name="file_atchFileId" title="파일찾기" style="display: none">
							</td>
						</tr>
					<%-- </c:if> --%>
				</tbody>
			</table>
		</form>
	</c:forEach>
</section>
</c:if>
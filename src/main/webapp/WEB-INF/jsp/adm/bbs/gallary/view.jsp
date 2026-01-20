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

/* 화면이 로드된후 에디터 기본옵션 설정 초기화 */ 
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
         url:"${contextRoot}/adm/bbs/"+pathId+"/detail.do?menuId="+menuId,
         type:"post",
         data:{
        	 "brId":brId,
        	 "baId":baId
         },
         success:function(data){
			if(data){
	        	 $("#div_"+index).empty();
	        	 $("#div_"+index).html("<textarea id='content"+index+"' name='brContent"+index+"'>"+data+"</textarea>"); 
	        	 initEditor("content"+index);
	        	 $("#span_"+index).css("display","");
			}
        },
        error:function(xhr,status,error){
         }
      });
}

function fn_delete(){
	var pathId = $("#bcId").val();
	var baId = $("#baId").val();
	var menuId = $("#menuId").val();;
	
	if(confirm("자료를 삭제하시겠습니까?")){
		var reqUrl = "${contextRoot}/adm/bbs/"+pathId+"/delete.do?&memuId="+menuId;
		$("#form").attr("action", reqUrl);
		$("#form").submit();
	}
}

function fn_update(){
	
	var bcId= "${boardConfigVO.bcId}"; /* /insert.do?baId=${result.baId}&memuId=${menuId}'" */
	var baId= "${result.baId}";	
	var menuId = "${menuId}";
	var reqUrl = "${contextRoot}/adm/bbs/"+bcId+"/updateForm.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").attr("method", "get");
	$("#form").submit();
}

function fn_list(){
	
	var bcId = $("#bcId").val();
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/adm/bbs/"+bcId+"/list.do?menuId="+menuId+"&siteId="+siteId;
	
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

///댓글 수정 액션
function fn_reply_update(index , brId, atchFileIdx){
	
	var pathBcId = $("#bcId").val();
	var data =oEditors.getById["content"+index].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"+index].exec("FOCUS"); 
		return false;
	}
	
	$("#reply_content"+index).val(data);
	$("#reply_file"+index).val(atchFileIdx);
	$("#replyFunc"+index).attr("action", "${contextRoot}/adm/bbs/"+pathBcId+"/replyUpdate.do");
	$("#replyFunc"+index).attr("target","_self");
	$("#replyFunc"+index).submit();	 
}

/* 댓글 삭제 */
function fn_reply_delete( brId ){
	var pathBcId = $("#bcId").val();
	
	$("#replyId").val(brId);
	$("#replyForm").attr("action", "${contextRoot}/admin/bbs/"+pathBcId+"/replyDelete.do");
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
	
	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
	$("#fileForm").submit();
}




//댓글 첨부 수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	$("#fileForm").attr("action", "${contextRoot}/board/updateFile.do");
	$("#fileForm").submit();
}

</script>

<section>
	<form id="form" name="form" method="post">
		<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
		<input type="hidden" id="baId" name="baId" value="${result.baId}">
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="siteId" name="siteId" value="${siteId}" />

		<table class="detail">
			<colgroup>
				<col width="10%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${result.baTitle}</td>
				</tr>
				<tr>
					<th>작성자 ID</th>
					<td>${result.memName}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${result.baRegdate}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${result.baContentHtml}</td>
				</tr>
				

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
				</c:if>

				<c:if test="${fn:length(fileList1) > 0}">
					<tr>
						<th>썸네일 이미지</th>
						<td class="file">
							<c:forEach var="fileVO" items="${fileList1}" varStatus="status">
								<c:if test="${fileVO.thumbnailCrop eq 'Y'}">
									<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
										<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out value="${fileVO.fileSize}" />]
									</a>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form>

	<div class="text-right btn-area">
		<button type="button" class="point" onclick="fn_update()">수정</button>
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
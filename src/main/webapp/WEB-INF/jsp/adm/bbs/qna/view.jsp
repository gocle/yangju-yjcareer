<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />





<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.js"></script>
<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js"></script>
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
				//alert("아싸!");	
				// elPlaceHolder - > "content"
			}
		}, //boolean ele
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["textAreaContent"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
} 





//댓글 수정 하기
function fn_editor( brId , baId , index){
	
	var menuId = $("#menuId").val();
	
	var pathId = $("#bcId").val();
	
	
	      $.ajax({
	         //url:"${contextRoot}/adm/bbs/"+pathId+"/detail.do?menuId="+menuId,
	       	 url:"${contextRoot}/adm/bbs/"+pathId+"/reply/detail.do?menuId="+menuId,
	         type:"post",
	         data:{
	        	 "brId":brId,
	        	 "baId":baId
	         },
	         success:function(data){
	
			if(data){
				$("#div_"+index).empty();
		        $("#div_" + index).html("<textarea id='content" + index + "' name='brContent" + index + "'>" + data.brContent + "</textarea>");	
		        initEditor("content"+index);
		        $("#span_"+index).css("display","");
			}
	         },error:function(xhr,status,error){
	            //alert(xhr.status);
	         }
	      });
}



//댓글 수정 하기
function fn_reply_list(){
	
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
	         },error:function(xhr,status,error){
	            //alert(xhr.status);
	            //alert("등록된 아이디가 있습니다.");
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



//article
function fn_update(){
	

	
	var bcId= "${boardConfigVO.bcId}"; /* /insert.do?baId=${result.baId}&memuId=${menuId}'" */
			
	var baId= "${result.baId}";	
	
	var menuId = "${menuId}";
	
	$("#form").attr("action", "${contextRoot}/adm/bbs/"+bcId+"/update.do" );
	
	$("#form").submit();
	///이부분이 씹힌다....
	

	
	
}



function fn_list(){
	
	var bcId = $("#bcId").val();
	
	var menuId = $("#menuId").val();

	var reqUrl = "${contextRoot}/adm/bbs/"+bcId+"/list.do";
	
	$("#form").attr("action", reqUrl);
	
	$("#form").attr("method", "get");
	
	$("#form").submit();
}



/*////////*/
/* 댓글 처리  */
/*/////// */




function fn_dialog(){
	
	
	var data =oEditors.getById["content"].getIR();
	
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	
	
	var dialog = $('<p>현재 ${result.processStatus} 상태입니다.\r\n상태값을 선택하세요.</p>').dialog({
		buttons: {
            "답변대기": function() {
            	$("#processStatusArticle1").val("0001");
            	
            	dialog.dialog('close');
            	
            	fn_reply_save();
            	
          
            	},
            "답변완료":  function() {
            	$("#processStatusArticle1").val("0002");
            	
            	dialog.dialog('close');
            	
            	fn_reply_save();
            	
            	
            	}
          /*   	,
            "처리중":  function() {$("#processStatusArticle1").val("0003");
	            dialog.dialog('close');
	            
	            fn_update();
	            
	            fn_reply_save();
	            }	 */
        }
    });
	
}



//답글  저장 
function fn_reply_save(){
	
	var data =oEditors.getById["content"].getIR();
	
/* 	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	} */
	
	
	$("#content").val(data);
	
	
	var pathBcId = $("#bcId").val();
	
	var pathBaId = $("#baId").val();
	
	var menuId = $("#menuId").val();
	
	var rContent = $("#content").val();
	
	
	
	$("#replyForm").attr("action", "${contextRoot}/adm/bbs/"+pathBcId+"/replyInsert.do");
	
	$("#replyForm").attr("target","_self");
	
	$("#replyForm").submit();
	

	
}



///답변 수정 액션
function fn_reply_update(index , brId){
	
	
	var pathBcId = $("#bcId").val();
	
	var menuId = $("#menuId").val();
	
	var data =oEditors.getById["content"+index].getIR();
	
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		
		oEditors.getById["content"+index].exec("FOCUS"); 
		
		return false;
	}
	
	
	 /*해당 인덱스에 있는 값을 FORM으로 보내기  */
	$("#reply_content"+index).val(data);
	
			 
		$("#replyFunc"+index).attr("action","${contextRoot}/adm/bbs/"+pathBcId+"/replyUpdate.do");
		 
		
		$("#replyFunc"+index).attr("target","_self");
	
		
		$("#replyFunc"+index).submit();	 
			 

	
}



// 댓글 삭제 
function fn_reply_delete( brId ){
	
	var pathBcId = $("#bcId").val();
	
	var menuId = $("#menuId").val();
	
	$("#replyId").val(brId);
	
	$("#replyForm").attr("action", "${contextRoot}/adm/bbs/"+pathBcId+"/replyDelete.do");

	$("#replyForm").submit();
	
	
}




/* //댓글 첨부 삭제하기
function fn_egov_replyDeleteFile(atchFileIdx,returnUrl){
	
	//replyFileForm 
	$("#atchFileIdx").val(atchFileIdx);
	
	$("#returnUrl").val(returnUrl);
	
	$("#replyFileForm").attr("action", "/board/replyDeleteFile.do");
	
	$("#replyFileForm").submit();
	
} 
*/


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




</script>


<section>

	
		<form id="form" name="form" enctype="multipart/form-data" method="post">
			<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
			<input type="hidden" id="baId" name="baId" value="${result.baId}">
			<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
			<input type="hidden" style="width: 100%" name="baRegdate" id="baRegdate" value="${result.baRegdate}">
			<input type="hidden" style="width: 100%" name="baTitle" id="baTitle" value="${result.baTitle}">
			<input type="hidden" style="width: 100%" name="baContentHtml" id="baContentHtml" value="${result.baContentHtml}">
		<table class="detail">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tbody>
				<tr>
					<th >제 목</th>
					<td>
					  ${result.baTitle}
					</td>
					<th>
						등 록 일
					</th>
					<td>
					${result.baRegdate}
					</td>
				</tr>
				<tr>
					<th>작 성 자</th>
					<td>
						${result.memName}
					</td>
					<th>처리 상태</th>
					<td>
						<select style="width: 20%;" id="processStatusArticle" name="processStatusArticle">
							<c:forEach var="codeList" items="${codeList}" varStatus="status" >
								<option value="${codeList.codeCode}" ${result.processStatusArticle == codeList.codeCode ? 'selected="selected"' : ''}>${codeList.codeName}</option>			
							</c:forEach>
						</select>
						<button type="button" class="point" onclick="fn_update()">수정</button>						
					</td>
				</tr>
				<tr>
					<th>문의 내용</th>
					<td>
						${result.baContentHtml}
					</td>
				
										<th>관련 자료</th>
										<td class="file"><c:forEach var="fileVO" items="${fileList}"
												varStatus="status">
												<c:if test="${fileVO.thumbnailCrop == 'N'}">
													<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
														<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out
															value="${fileVO.fileSize}" />]
													</a>
												</c:if>
											</c:forEach>
										</td>
				</tr>
					
							
							<c:if test="${boardConfigVO.bcSupportThumbnail eq '1' }">
								<tr>
									<th>썸네일 자료</th>
									<td class="file"><c:forEach var="fileVO" items="${fileList}"
											varStatus="status">
											<c:if test="${fileVO.thumbnailCrop eq 'Y'}">
												<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
													<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out
														value="${fileVO.fileSize}" />]
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
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_list();">목록</a>
	</div>

</section>


<!-- 댓글 부분 -->
<section>

		
			<!-- 댓글 목록 , 쓰기 , 수정  , 삭제  -->
			<form id="replyForm" name="replyForm" method="post" enctype="multipart/form-data">
				<input type="hidden" id="baId" name="baId" value="${result.baId}">
				<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
				<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
				<input type="hidden" id="replyId" name="brId" value="">
				<input type="hidden" style="width: 100%" name="baRegdate" id="baRegdate" value="${result.baRegdate}">
				<input type="hidden" style="width: 100%" name="baTitle" id="baTitle" value="${result.baTitle}">
				<input type="hidden" style="width: 100%" name="baContentHtml" id="baContentHtml" value="${result.baContentHtml}">
				<input type="hidden" style="width: 100%" name="processStatusArticle" id="processStatusArticle1" value="">
							<div class="reply-list">
								<h3>답변 목록</h3>
									<div class="text-right">
											<textarea placeholder=" 내용을 간략히 입력해주세요." id="content" name="brContent"></textarea>
									
											<button type="button" class="reply-write" style="margin: 14px 0 " onclick="fn_dialog();">
												<i class="fa fa-edit"></i> 
												답변 등록
											</button>
									</div>
			</form>
	
				<c:forEach var="boardReplyList" items="${boardReplyList}" varStatus="status">
					<form  id="replyFunc${status.index}" name="replyFunc${status.index}" enctype="multipart/form-data" method="post">
					<input type="hidden" id="brId" name="brId" value="${boardReplyList.brId}">
					<input type="hidden" id="menuId" name="menuId" vvalue="<c:out value='${menuId}'/>">
					<input type="hidden" id="reply_content${status.index}" name="brContent" value="">
					<%-- <input type="hidden" id="reply_file${status.index}" name="atchFileIdx" value=""> --%>
					<input type="hidden" id="baId" name="baId" value="${result.baId}">
					<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
							<dl>
								<dt>${boardReplyList.memName}<span>${boardReplyList.regDt}</span>
								
								<!--현재 로그인한 세션과  글이 등록되있는 세션과 일치할때.  -->
									<c:if test="${SESSION_MEM_SEQ eq boardReplyList.regId}">
												<!--수정 클릭시  -->
											<button type="button" id="test1" title="수정" onclick="fn_editor('${boardReplyList.brId}','${result.baId}','${status.index}');">
												<i class="fa fa-gear"></i>	
											</button>
											<button type="button" title="삭제" onclick="fn_reply_delete('${boardReplyList.brId}');">
												<i class="fa fa-times-circle-o"></i>
											</button>									
									</c:if>
								</dt>
								<dd>
									<div id="toggle_${status.index}" style="display: "> 
												<div id="div_${status.index}">
													${boardReplyList.brContent}		
												</div>
											<span style="display: none" id="span_${status.index}">
												<div class="text-right btn-area">										
													 <button type="button" class="point" >
														 <a style="color:white" href="javascript:fn_reply_update('${status.index}','${boardReplyList.brId}' );" class="btn blue">
														      수정
														 </a><!-- 얘는 fileIdx 만 바꿔줄거임 -->
													 </button>
												</div>
											</span>
									</div>
								 </dd>
							</dl>
							<!-- <dl>
								<dt>고틀 관리자<span>2021-03-31 17:05</span><button type="button" title="삭제"><i class="fa fa-times-circle-o"></i>삭제</button><button type="button" title="수정"><i class="fa fa-gear"></i>수정</button></dt>
								<dd>잘못된 내용이나 추가 & 삭제하면 좋은 부분들은 자유롭게 건의 해주시면 감사하겠습니다.</dd>
							</dl>
							<dl>
								<dt>고틀 관리자<span>2021-03-31 17:05</span><button type="button" title="삭제"><i class="fa fa-times-circle-o"></i>삭제</button><button type="button" title="수정"><i class="fa fa-gear"></i>수정</button></dt>
								<dd>잘못된 내용이나 추가 & 삭제하면 좋은 부분들은 자유롭게 건의 해주시면 감사하겠습니다.</dd>
							</dl> 
							
							<c:if test="${boardReplyList.rDeleteYn eq 'N'}">
															<tr>
																<th>첨부 파일</th>
																<td>
								                     					   <a href="javascript:fn_egov_replyDownFile('${boardReplyList.atchFileIdx}');" style="color:#333; background:none"><b><c:out value="${boardReplyList.orgFileName}" /></b></a> 
								                     					   <a href="javascript:fn_egov_replyDeleteFile('${boardReplyList.atchFileIdx}', '/${siteId}/admin/bbs/${result.bcId}/detail.do?baId=${boardReplyList.baId}&menuId=${menuId}' )" class="btn">파일삭제</a>		   
								                     			</td>
															</tr>
															</c:if>
							-->
						</form>
						</c:forEach>
						</div>
					</section>
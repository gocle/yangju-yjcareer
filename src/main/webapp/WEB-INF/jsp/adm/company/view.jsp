<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"></script>
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
		sSkinURI: "/smarteditor/SmartEditor2Skin.html",	
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
	
	var pathId = $("#bcId").val();
	      $.ajax({
	         url:"/adm/bbs/"+pathId+"/detail.do",
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
	
	if(confirm("자료를 삭제하시겠습니까?")){
		var reqUrl = "/adm/bbs/"+pathId+"/delete.do?baId="+baId;
		$("#form").attr("action", reqUrl);
		$("#form").submit();
	}
}




function fn_update(){
	
	var bcId= "${boardConfigVO.bcId}"; /* /insert.do?baId=${result.baId}&memuId=${menuId}'" */
			
	var baId= "${result.baId}";	
	
	var menuId = "${menuId}";
	
	
	
	var reqUrl = "/adm/bbs/"+bcId+"/insert.do?baId="+baId+"&memuId="+menuId;
	
	$("#form").attr("action", reqUrl);
	
	$("#form").attr("method", "get");
	
	$("#form").submit();
}



function fn_list(){
	
	var bcId = $("#bcId").val();
	
	var menuId = $("#menuId").val();

	var reqUrl = "/adm/bbs/"+bcId+"/list.do?menuId="+menuId;
	
	$("#form").attr("action", reqUrl);
	
	$("#form").attr("method", "get");
	
	$("#form").submit();
}

/*////////*/
/* 댓글 처리     */
/*////////*/

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
	
	
	
	/* var rContent = $("#content").val(); */
	
	$("#replyForm").attr("action", "/adm/bbs/"+pathBcId+"/replyInsert.do");
	
	
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
	
	
	 /*해당 인덱스에 있는 값을 FORM으로 보내기  */
	$("#reply_content"+index).val(data);
	 
	$("#reply_file"+index).val(atchFileIdx);
		 
	$("#replyFunc"+index).attr("action", "/adm/bbs/"+pathBcId+"/replyUpdate.do");
	
	$("#replyFunc"+index).attr("target","_self");

	$("#replyFunc"+index).submit();	 
	
	
}


/* 댓글 삭제 */
function fn_reply_delete( brId ){
	
	var pathBcId = $("#bcId").val();
	
	$("#replyId").val(brId);
	
	$("#replyForm").attr("action", "/adm/bbs/"+pathBcId+"/replyDelete.do");
	
	$("#replyForm").attr("target","_self");

	$("#replyForm").submit();
	
	
}


//댓글 첨부 삭제하기
function fn_egov_replyDeleteFile(atchFileIdx,returnUrl){
	
	//replyFileForm 
	$("#atchFileIdx").val(atchFileIdx);
	
	$("#returnUrl").val(returnUrl);
	
	$("#replyFileForm").attr("action", "/board/replyDeleteFile.do");
	
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




</script>

<section>

	<form id="form" name="form" method="post">
		<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
		<input type="hidden" id="baId" name="baId" value="${result.baId}">
		<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
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
					<td>${result.memId}</td>
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
							</c:forEach></td>
					</tr>
				</c:if>
			<tbody>
		</table>
	</form>
	<div class="text-right btn-area">
		<button type="button" class="point" onclick="fn_update()">수정</button>
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_list();">목록</a>
	</div>

</section>


<!-- 댓글 부분 -->
<section>
	<div>
		<h2>-댓글입력란-</h2>
	</div>

	<!--목록 , 쓰기 , 수정  , 삭제  -->
	<form id="replyForm" name="replyForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="baId" name="baId" value="${result.baId}">
		<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
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
					<td><textarea placeholder=" 내용을 간략히 입력해주세요." id="content"
							name="brContent"></textarea></td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td><input type="file" class="input_file"
						id="file_atchFileId" name="file_atchFileId" title="파일찾기">
						<div class="text-right btn-area">
							<button type="button" class="point" >
								<a style="color:white;" href="javascript:fn_reply_save()">댓글 입력</a>
							</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</section>
		<br>
		<br>
		</form>
	<div>
		<h2>-댓글 목록-</h2>
	</div>	
	
	<form id="replyFileForm" name="replyFileForm" method="post">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
	</form>
	
		<c:forEach var="boardReplyList" items="${boardReplyList}" varStatus="status">
				<form  id="replyFunc${status.index}" name="replyFunc${status.index}" method="post"
				enctype="multipart/form-data">
					<input type="hidden" id="brId" name="brId" value="${boardReplyList.brId}">
					<input type="hidden" id="menuId" name="menuId" vvalue="<c:out value='${menuId}'/>">
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
							
							<tr>
								<th>
							--------------------------------------------------------
								</th>
								<td>
							=======================================================================================
								</td>
							</tr>
							<tr>
								<th>
								</th>
									<td>
										<c:if test="${mIdx eq boardReplyList.insertUser}">
										<div class="text-right btn-area">
										<!--수정 클릭시  -->
											<button type="button" id="test1" class="point" >
											<a style="color:white;" href="javascript:fn_editor('${boardReplyList.brId}','${result.baId}','${status.index}');" class="editBtn">댓글 수정</a>
											</button>
												<button type="button" class="point" onclick="fn_reply_delete('${boardReplyList.brId}');">댓글 삭제</button>
										</div>
										</c:if>
									</td>
							</tr>
							<tr>
								<th>댓글 순번</th>
								<td>
								${boardReplyList.brId}
								</td>
							</tr>
							<tr>
								<th>댓글 등록자</th>
								<td>
								<p>${boardReplyList.insertUser}</p>
								
								</td>
							</tr>
							<tr>
								<th>댓글 내용</th>
								<td id="toggle_${status.index}" style="display: ">
									<div id="div_${status.index}">
										${boardReplyList.brContent}		
									</div>
									<!--status ajax 처리  -->
								<span style="display: none" id="span_${status.index}">
									<div class="text-right btn-area">										
											
												<!-- 계속들어감  -->
												 <input type="file" class="input_file"
														id="file_atchFileId" name="file_atchFileId" title="파일찾기">
									
										<br>
										<br>
			                          <button type="button" class="point" >
			                          		<a style="color:white" href="javascript:fn_reply_update('${status.index}','${boardReplyList.brId}','${boardReplyList.atchFileIdx}' );" class="btn blue">
			                          		수정
			                          		</a><!-- 얘는 fileIdx 만 바꿔줄거임 -->
			                          </button> 	
			                        </div>
								</span>
								</td>
							</tr>
							<tr>
								<th>댓글 등록일</th>
								<td>${boardReplyList.insertDate}</td>
							</tr>
							<c:if test="${boardReplyList.rDeleteYn eq 'N'}">
							<tr>
								<th>첨부 파일</th>
								<td>
                     					   <a href="javascript:fn_egov_replyDownFile('${boardReplyList.atchFileIdx}');" style="color:#333; background:none"><b><c:out value="${boardReplyList.orgFileName}" /></b></a> 
                     					   <a href="javascript:fn_egov_replyDeleteFile('${boardReplyList.atchFileIdx}', '/adm/bbs/${result.bcId}/detail.do?baId=${boardReplyList.baId}' )" class="btn">파일삭제</a>		   
                     			</td>
							</tr>
							</c:if>
					</tbody>
				</table>
			</form>
		</c:forEach>

</section>
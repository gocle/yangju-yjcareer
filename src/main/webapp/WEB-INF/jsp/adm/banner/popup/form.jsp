<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<!--일단 추가 추후에 common으로옮기던가  -->
<link rel="stylesheet" href="${contextRoot}/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="${contextRoot}/ui/1.11.4/jquery-ui.min.js"></script>

<style>
img.ui-datepicker-trigger {
    margin-left:5px; vertical-align:middle; cursor:pointer;
}
</style>
<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">

var ckEditor;

$(document).ready(function () {
    ckEditor = CKEDITOR.replace('content', {
        height: 300,                // 필요시 조절
        // 이미지 업로드용
        filebrowserUploadUrl: '${contextRoot}/ckeditor/ckeditorUpload.jsp',
        filebrowserUploadMethod: 'form'
    });
});

/* var oEditors = [];
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
}  */

//등록하기
function fn_save(){
	var bnType = $('#bnType').val();
	var bnName = $("#bnName").val();
	
/* 	var data =oEditors.getById["content"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(bnName == ""){
		alert('제목을 입력해주세요');
		bnName.focus();	
		return false;
	} else if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	} */
	
	var data = ckEditor.getData();
	var text = data.replace(/[<][^>]*[>]/gi, "");

	if(bnName.trim() === "" ) {
		alert("제목을 입력 하세요.");
		return false;
	}
	
	if (text.trim() === "" && data.indexOf("img") <= 0) {
	    alert("내용을 입력 하세요.");
	    ckEditor.focus();   // 포커스
	    return false;
	}
	
	$("#content").val(data);
	
	var bnStartDate = $('#date_timepicker_start').val();
	var bnEndDate = $('#date_timepicker_end').val();
	
	if (bnStartDate.trim() === "" ) {
	    alert("게시 시작일을 선택 하세요.");
	    return false;
	}
	
	if (bnEndDate.trim() === "" ) {
	    alert("게시 종료일을 선택 하세요.");
	    return false;
	}
	
	var bnWidth = $('#bnWidth').val();
	var bnHeight = $('#bnHeight').val();
	var bnTop = $('#bnTop').val();
	var bnLeft = $('#bnLeft').val();
	
	if (bnWidth.trim() === "" ) {
	    alert("팝업창 가로 크기를 입력 하세요.");
	    return false;
	}
	
	if (bnHeight.trim() === "" ) {
	    alert("팝업창 세로 크기를 입력 하세요.");
	    return false;
	}
	
	if (bnTop.trim() === "" ) {
	    alert("팝업창 TOP 위치를 입력 하세요.");
	    return false;
	}
	
	if (bnLeft.trim() === "" ) {
	    alert("팝업창 LEFT 크기를 입력 하세요.");
	    return false;
	}
	
	$("#form").attr("action", "${contextRoot}/adm/banner/"+bnType+"/insert.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

//배너 수정하기
function fn_update( bnId ){ 
	var bnType = $('#bnType').val();
	var bnId = $('#bnId').val(bnId);
/* 	var data =oEditors.getById["content"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	} */
	
	var bnName = $("#bnName").val();
	
	if(bnName.trim() == "" ) {
		alert("제목을 입력 하세요.");
		return false;
	}
	
	var data = ckEditor.getData();
	var text = data.replace(/[<][^>]*[>]/gi, "");

	if (text.trim() === "" && data.indexOf("img") <= 0) {
	    alert("내용을 입력 하세요.");
	    ckEditor.focus();   // 포커스
	    return false;
	}	
	
	$("#content").val(data);
	
	var bnStartDate = $('#date_timepicker_start').val();
	var bnEndDate = $('#date_timepicker_end').val();
	
	if (bnStartDate.trim() === "" ) {
	    alert("게시 시작일을 선택 하세요.");
	    return false;
	}
	
	if (bnEndDate.trim() === "" ) {
	    alert("게시 종료일을 선택 하세요.");
	    return false;
	}
	
	var bnWidth = $('#bnWidth').val();
	var bnHeight = $('#bnHeight').val();
	var bnTop = $('#bnTop').val();
	var bnLeft = $('#bnLeft').val();
	
	if (bnWidth.trim() === "" ) {
	    alert("팝업창 가로 크기를 입력 하세요.");
	    return false;
	}
	
	if (bnHeight.trim() === "" ) {
	    alert("팝업창 세로 크기를 입력 하세요.");
	    return false;
	}
	
	if (bnTop.trim() === "" ) {
	    alert("팝업창 TOP 위치를 입력 하세요.");
	    return false;
	}
	
	if (bnLeft.trim() === "" ) {
	    alert("팝업창 LEFT 크기를 입력 하세요.");
	    return false;
	}
	
	$("#form").attr("action", "${contextRoot}/adm/banner/"+bnType+"/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

//배너 삭제하기
function fn_delete( bnId ){
	var bnType = $('#bnType').val();
	var bnId = $('#bnId').val(bnId);
	
	$("#form").attr("action", "${contextRoot}/adm/banner/"+bnType+"/delete.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}


//파일 삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl){
	alert(atchFileIdx+","+returnUrl);
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
	$("#fileForm").submit();
}

//파일 수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "${contextRoot}/board/updateFile.do");
	$("#fileForm").submit();
}

//숫자 유효성
function fn_regExp( param ){
	var bn =  $('#bn'+param).val();
	var reg = /^[0-9]*$/g;
	
	if(!reg.test(bn) ){
		alert('숫자만 입력바랍니다.');
		bn =  $('#bn'+param).val(bn.replace(/\D/g, ''));
		return false;
	} else if((bn * 1) > 1200){
		alert('1200자 이상 입력할 수 없습니다.');
		bn =  $('#bn'+param).val(bn.replace(reg, ''));
		return false;
	}
}
</script>

<section>
	<form id="fileForm" name="fileForm" method="post">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId }" />
	</form>
</section>

<section>
	<form id="form" name="form" method="post" enctype="multipart/form-data">
		<input type="hidden" id="menuId" name="menuId" value="${menuId }" />
		<input type="hidden" id="bnType" name="bnType" value="${bnType }" />
		<input type="hidden" id="bnId" name="bnId" value="" />

		<table class="detail">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tbody>
				<tr>
					<th>팝업 제목<span style="color:red;"> *</span></th>
					<td colspan="3">
						<input type="text" style="width: 100%" name="bnName" id="bnName" value="${bannerResult.bnName }">
					</td>
				</tr>
				<tr>
					<th>팝업 내용<span style="color:red;"> *</span></th>
					<td colspan="3">
						<textarea style="width: 100%" placeholder=" 내용을 간략히 입력해주세요." id="content" name="bnDescription">${bannerResult.bnDescription}</textarea>
					</td>
				</tr>
				<tr>
					<th>게시 기간<span style="color:red;"> *</span></th>
					<td>
						게시 시작일&nbsp;
						<input type="text" style="width: 20%;" id="date_timepicker_start" name="bnStartDate" value="${bannerResult.bnStartDate}">
						&nbsp;~&nbsp;
						게시 종료일&nbsp;
						<input type="text" style="width: 20%;" id="date_timepicker_end" name="bnEndDate" value="${bannerResult.bnEndDate}">
					</td>
					<th>사용 유무</th>
					<td>
						사용 <input type="radio" name="bnUse" id="bnUse" value="1" <c:if test="${bannerResult.bnUse eq '1'}">checked="checked"</c:if> />
						미사용 <input type="radio" name="bnUse" id="bnUse" value="0" <c:if test="${bannerResult.bnUse eq '0' or empty bannerResult.bnUse}">checked="checked"</c:if> />
					</td>
				</tr>
				<tr>
					<th>팝업창 가로 크기<span style="color:red;"> *</span></th>
					<td>
						<input type="text" onkeyup="fn_regExp('Width');" style="width: 100%" name="bnWidth" id="bnWidth" placeholder="예 ) 400" value="${empty bannerResult.bnWidth ? 400 : bannerResult.bnWidth}">
					</td>
					<th>팝업창 세로 크기<span style="color:red;"> *</span></th>
					<td>
						<input type="text" onkeyup="fn_regExp('Height');" style="width: 100%" name="bnHeight" id="bnHeight" placeholder="예 ) 600" value="${empty bannerResult.bnHeight ? 600 : bannerResult.bnHeight}">
					</td>
				</tr>
				<tr>
					<th>팝업창 TOP위치<span style="color:red;"> *</span></th>
					<td>
						<input type="text" onkeyup="fn_regExp('Top');" style="width: 100%" name="bnTop" id="bnTop" placeholder="예 ) 150" value="${empty bannerResult.bnTop ? 150 : bannerResult.bnTop}">
					</td>
					<th>팝업창 LEFT위치<span style="color:red;"> *</span></th>
					<td>
						<input type="text" onkeyup="fn_regExp('Left');" style="width: 100%" name="bnLeft" id="bnLeft" placeholder="예 ) 600" value="${empty bannerResult.bnLeft ? 600 : bannerResult.bnLeft}">
					</td>
				</tr>
				<tr>
					<th>팝업 링크 주소</th>
					<td>
						<input type="text" style="width: 100%" name="bnLink" id="bnLink" value="${bannerResult.bnLink }">
					</td>
				</tr>
				<!-- 미 정 -->
				<!--
				<tr>
					<th>노출 영역</th>
					<td>
						<input type="text" style="width: 100%" name="bnDisplayType" id="bnDisplayType">
					</td>
				</tr>
				-->
			</tbody>
		</table>
	</form>
</section>

<section>
	<div class="text-right btn-area">
		<c:choose>
			<c:when test="${bannerResult eq null}">
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_update('${bannerResult.bnId}');" class="point">수정</button>
				<button type="button" onclick="fn_delete('${bannerResult.bnId}');" class="point">삭제</button>
			</c:otherwise>
		</c:choose>
		<a href="${contextRoot}/adm/banner/${bnType}/list.do?menuId=${menuId}">목록</a>
	</div>
</section>
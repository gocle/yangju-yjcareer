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
	$("#startDate, #endDate, #regOpenDate, #regCloseDate").on("change", function() {
        validateDates();
    });
});

function initEditor() {

	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "pgDesc",
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
	var pgType = '${programVO.pgType}';
	
	if($("#pgName").val() == ""){
		alert("제목을 입력하세요.")
		$("#pgName").focus();
		return;
	}
	
	var data =oEditors.getById["pgDesc"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력하세요.");
		oEditors.getById["pgDesc"].exec("FOCUS"); 
		return false;
	}
	
	if($("#duration").val() == ""){
		alert("체험시간을 입력하세요.")
		$("#duration").focus();
		return;
	}
	
	$("#pgDesc").val(data);
	$("#form").attr("action", "${contextRoot}/adm/program/"+pgType+"/insert.do");
	$("#form").attr("pgTarget","_self");
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
	var pgType = '${programVO.pgType}';
	var data =oEditors.getById["pgDesc"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	
	$("#pgDesc").val(data);
	$("#form").attr("action", "${contextRoot}/adm/program/"+pgType+"/update.do");
	$("#form").attr("pgTarget","_self");
	$("#form").submit();
}

//목록
function fn_list() {
	var pgType = '${programVO.pgType}';
	var menuId = $("#menuId").val();

	$("#form").attr("action", "${contextRoot}/adm/program/"+pgType+"/list.do?menuId="+menuId);
	$("#form").attr("method", "get");
	$("#form").submit();
		
}

//삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl,fileType){
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	var formData = new FormData($("#fileForm")[0]);
	 
	$.ajax({
        url:"${contextRoot}/board/updateAtchFileInfo.do"
        , method : "POST"
        ,contentType: false
        ,processData: false
        , data: formData
        , success:function(response){
			if(response.status == 'success'){
				$("#file" + atchFileIdx).remove(); // 해당 파일 항목을 삭제
				addFileInput(fileType);
        	}
        }
        ,error: function (e) {
	    	alert("오류가 발생하여 삭제할 수 없습니다.");
        }
    });
}

//수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
	$("#fileForm").submit();
}

function validateDates() {
    let startDate = $("#startDate").val();
    let endDate = $("#endDate").val();
    let regOpenDate = $("#regOpenDate").val();
    let regCloseDate = $("#regCloseDate").val();

    if (startDate && endDate && startDate > endDate) {
        alert("체험 종료일은 시작일보다 빠를 수 없습니다.");
        $("#endDate").val(startDate).focus(); 
        return false;
    }

    if (regOpenDate && regCloseDate && regOpenDate > regCloseDate) {
        alert("예약신청 종료일은 시작일보다 빠를 수 없습니다.");
        $("#regCloseDate").val(regOpenDate).focus(); 
        return false;
    }
    
    if (regCloseDate && endDate && regCloseDate > endDate) {
        alert("예약신청 종료일은 체험 종료일을 넘을 수 없습니다.");
        $("#regCloseDate").val(endDate).focus(); 
        return false;
    }
    
    return true;
}

function addFileInput(fileType) {
    if (fileType == "attach") {
        $("#file_atchFileId1").remove();
        var inputField = $('<input>', {
            type: 'file',
            class: 'input_file',
            id: 'file_atchFileId1',
            name: 'file_atchFileId',
            title: '파일찾기'
        });
        $(".file.attach").append(inputField);
    } else {
        $("#file_thumbFileId1").remove();
        var inputField = $('<input>', {
            type: 'file',
            class: 'input_file',
            id: 'file_thumbFileId1',  // 고유한 ID
            name: 'file_thumbFileId',
            title: '파일찾기'
        });
		
        $(".file.thumbnail").append(inputField);
		
        if ($(".file.thumbnail").find('p').length === 0) {
            $(".file.thumbnail").append('<p style="color: red; font-size: 15px;">* 275 x 180 등록해주세요</p>');
        }
    }
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
		<input type="hidden" id="pgId" name="pgId" value="${programVO.pgId}" />

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
					<th>프로그램명</th>
					<td colspan="5">
						<input type="text" style="width:100%" name="pgName" id="pgName" value="${programVO.pgName}" />
					</td>
				</tr>
				<tr>
					<th>프로그램 소개</th>
					<td colspan="5">
						<textarea style="width:100%" name="pgDesc" id="pgDesc" placeholder="프로그램 설명을 입력해주세요.">${programVO.pgDesc}</textarea>
					</td>
				</tr>
				<tr>
					<th>예약신청 시작일</th>
					<td>
						<input type="date" name="regOpenDate" id="regOpenDate" value="${programVO.regOpenDate}" onclick="this.showPicker ? this.showPicker() : this.focus()" style="width:80%"/>
					</td>
					<th>예약신청 종료일</th>
					<td>
						<input type="date" name="regCloseDate" id="regCloseDate" value="${programVO.regCloseDate}" onclick="this.showPicker ? this.showPicker() : this.focus()" style="width:80%" />
					</td>
					<th>운영상태</th>
					<td>
						<select name="status" id="status" style="width:80%">
							<option value="">선택</option>
							<option value="WAIT" <c:if test="${programVO.status eq 'WAIT'}">selected</c:if>>신청대기</option>
					        <option value="OPEN" <c:if test="${programVO.status eq 'OPEN'}">selected</c:if>>접수중</option>
					        <option value="CLOSE" <c:if test="${programVO.status eq 'CLOSE'}">selected</c:if>>접수마감</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>체험시작일</th>
					<td>
						<input type="date" name="startDate" id="startDate" value="${programVO.startDate}"  onclick="this.showPicker ? this.showPicker() : this.focus()" style="width:80%"/>
					</td>
					<th>체험종료일</th>
					<td>
						<input type="date" name="endDate" id="endDate" value="${programVO.endDate}" onclick="this.showPicker ? this.showPicker() : this.focus()" style="width:80%"/>
					</td>
				</tr>
				<tr>
					<th>유형</th>
					<td>
						<select name="classType" id="classType" style="width:80%">
							<option value="">선택</option>
							<option value="ONEDAY" <c:if test="${programVO.classType eq 'ONEDAY'}">selected</c:if>>원데이클래스</option>
					        <option value="DIY" <c:if test="${programVO.classType eq 'DIY'}">selected</c:if>>DIY</option>
					        <option value="CHILD" <c:if test="${programVO.classType eq 'CHILD'}">selected</c:if>>유치원</option>
						</select>
					</td>
					<%-- <th>대상</th>
					<td>
						<select name="pgTarget" id="pgTarget" style="width:80%">
							<option value="">선택</option>
							<option value="IND" <c:if test="${programVO.pgTarget eq 'IND'}">selected</c:if>>개인</option>
   							<option value="GRP" <c:if test="${programVO.pgTarget eq 'GRP'}">selected</c:if>>단체</option>
						</select>
					</td> --%>
					<th>체험인원</th>
					<td>
						<input type="text" name="capacity" id="capacity" value="${programVO.capacity}" />&nbsp;명
					</td>
					<%-- <th>체험시간</th>
					<td>
						<input type="text" name="duration" id="duration" value="${programVO.duration}" />&nbsp;분
					</td> --%>
				</tr>
				<tr>
					<th>장소</th>
					<td>
						<input type="text" name="location" id="location" value="${programVO.location}" />
					</td>
					<th>담당자명</th>
					<td>
						<input type="text" name="instructorName" id="instructorName" value="${programVO.instructorName}" />
					</td>
					<th>문의</th>
					<td>
						<input type="text" name="contact" id="contact" class="phone_num" value="${programVO.contact}" placeholder="예) 010-1234-5678" maxlength="13" pattern="^010-\d{4}-\d{4}$"/>
					</td>
				</tr>
				<c:if test="${programVO ne null}">
					<tr>
						<th>첨부파일</th>
						<td class="file attach">
							<c:forEach var="fileVO" items="${fileList}" varStatus="status">
								<c:if test="${fileVO.thumbnailCrop eq 'N'}">
									<span id="file${fileVO.atchFileIdx}">
										<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
											<c:out value="${fileVO.orgFileName}" />
										</a>
										<button type="button" onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','/adm/program/${programVO.pgType}/updateForm.do?pgId=${programVO.pgId}', 'attach');">삭제</button>
									</span>
								</c:if>
							</c:forEach>

							<c:set var="len" value="${fn:length(fileList)}" />
							<c:if test="${len < 1}">
								<c:forEach var="i" begin="1" end="${1 - len}">
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
						
						<c:if test="${programVO eq null}">
							<th>썸네일</th>
							<td class="file thumbnail" colspan="4">
								<input type="file" class="input_file" id="file_thumbFileId1" name="file_thumbFileId" title="이미지 찾기" />
								<p style="color: red; font-size: 15px;">* 275 x 180 등록해주세요</p>
							</td>
						</c:if>
						
						<c:if test="${programVO ne null}">
							<th>썸네일</th>
							<td class="file thumbnail" colspan="4">
								<c:forEach var="fileVO1" items="${fileList1}" varStatus="status">
									<c:if test="${fileVO1.thumbnailCrop eq 'Y'}">
										<span id="file${fileVO1.atchFileIdx}">
											<a href="javascript:fn_egov_downFile('${fileVO1.atchFileIdx}');">
												<c:out value="${fileVO1.orgFileName}" />
											</a>
											<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}','/adm/program/${programVO.pgType}/updateForm.do?pgId=${programVO.pgId}', 'thumb');">삭제</button>
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
			<c:when test="${programVO.pgId ne null}">
				<button type="button" onclick="fn_update();" class="point">수정</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:otherwise>
		</c:choose>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
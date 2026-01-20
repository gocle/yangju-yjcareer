<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<c:choose>
    <c:when test="${cmd eq 'Insert'}">
        <c:set var="cmdUrl" value="SubjManageInsert.do" />
        <c:set var="buttonSaveText" value="등록" />
    </c:when>
    <c:when test="${cmd eq 'Update'}">
        <c:set var="cmdUrl" value="SubjManageUpdate.do" />
        <c:set var="buttonSaveText" value="수정" />
        <c:set var="readOnly" value="true" />
    </c:when>
</c:choose>

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>

<script src="https://cdn.ckeditor.com/4.22.1/full-all/ckeditor.js"></script> <!-- CKEditor -->

<style>
.cke_notification,
.cke_notification_warning,
.cke_notification_message {
  display: none !important;
}
</style>

<script type="text/javascript">

var ckEditor;

/* var oEditors = []; */

$(document).ready(function() {
	/* initEditor(); */
	
	ckEditor = CKEDITOR.replace('subjPlan', {
        height: 300,                // 필요시 조절
        // 이미지 업로드용
        filebrowserUploadUrl: '${contextRoot}/ckeditor/ckeditorUpload.jsp',
        filebrowserUploadMethod: 'form'
    });
	
	ckEditor = CKEDITOR.replace('subjDesc', {
        height: 300,
        filebrowserUploadUrl: '${contextRoot}/ckeditor/ckeditorUpload.jsp',
        filebrowserUploadMethod: 'form'
    });
	
	$.fn.numberOnly = function() {
	    $(this).keyup(function() {
	        this.value = this.value.replace(/[^0-9\.\-]/g, '');
	    });
	    $(this).blur(function() {
	        this.value = this.value.replace(/[^0-9\.\-]/g, '');
	    });
	}
	
	$(".numberOnly").numberOnly();
	
	$("#sgrCd").change(function() {
		var sgrCd = $(this).val();
		var selCateCd = "${resultMap.cateCd}";
		
		$("#cateCd").empty();
		$("#cateCd").append('<option value="">분류 선택</option>');
		
		$.ajax({
	     	url: "${contextRoot}/adm/chsearch/SearchCateCdList.do",
	        type: "GET",
	        data: { sgrCd: sgrCd },
	        success: function(result) {
				$.each(result, function(index, item) {
	            	$("#cateCd").append(
	            		'<option value="' + item.cateCd + '" ' 
	            		+ (selCateCd == item.cateCd ? 'selected="selected"' : '') 
	            		+ '>' + item.cateNm + '</option>'
	                );
	            });
	        },
	        error: function() {
	        	//alert("오류 발생");
	        }
		});
	});
	
	$("#sgrCd").trigger("change");
	
	var initTel = "${resultMap.tel}";
    var exists = false;
    
    $("#tel option").each(function() {
        if (this.value == initTel) {
            exists = true;
            return false;
        }
    });

    if (!exists && initTel != "") {
        $("#tel").val("ETC");
        $("#wtel").show();
    }

    $("#tel").change(function() {
        if ($(this).val() == "ETC") {
            $("#wtel").val("");
        	$("#wtel").show();
            $("#wtel").focus();
        } else {
        	$("#wtel").hide();
        }
    });
    
    var initPlace = "${resultMap.eduPlace}";
    
    if (initPlace == "온라인(비대면)") {
        $("#location").val("ONLINE");
    }else {
    	$("#location").val("ETC");
    	$("#eduPlace").show();
    }
    
    $("#location").change(function() {
        if ($(this).val() == "ETC") {
            $("#eduPlace").val("");
        	$("#eduPlace").show();
            $("#eduPlace").focus();
        } else {
        	$("#eduPlace").hide();
        }
    });
});

function initEditor() {
	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "subjPlan",
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

function fnCmdList() {
	 $("#detailForm").attr("action", "SubjManageList.do");
	 $("#detailForm").submit();
}

function valid() {
	var subjNm = $.trim($("#subjNm").val());
	var sgrCd = $("#sgrCd").val();
	var cateCd = $("#cateCd").val();
	var comId = $("#comId").val();
	var wtel = $.trim($("#wtel").val());
	var telSelect = $("#tel").val();
	var eduPlace = $.trim($("#eduPlace").val());
	var location = $("#location").val();
	
	/* 	var data = oEditors.getById["subjPlan"].getIR();
	$("#subjPlan").val(data); */
	
	var data = ckEditor.getData();
	$("#content").val(data);
	
	if (subjNm == "") {
		alert("교육강좌명을 입력해주세요.");
		subjNm.focus();
		return false;
	}
	
	if (sgrCd == "") {
		alert("분류를 선택해주세요.");
		sgrCd.focus();
		return false;
	}
	
	if (cateCd == "") {
		alert("분류를 선택해주세요.");
		cateCd.focus();
		return false;
	}
	
	if (comId == "") {
		alert("교육기관을 선택해주세요.");
		comId.focus();
		return false;
	}
	
	if(location == "ETC" && eduPlace == "") {
		alert("교육장소를 입력해주세요.");
		eduPlace.focus();
		return false;
	}
	
	var selected = [];
	for (let i = 1; i <= 5; i++) {
        var checkbox = document.getElementById("eduTarget" + i);
        if (checkbox && checkbox.checked) {
            selected.push(checkbox.value);
        }
    }
	
	if (selected.length === 0) {
        alert("교육대상을 선택해주세요.");
        document.detailForm.eduTarget.focus();
        return false;
    }
	document.detailForm.eduTarget.value = selected.join(",");
	
	if(telSelect == "ETC" && wtel == ""){
		alert("전화번호를 입력해주세요.");
		wtel.focus();
		return false;
	}
	
	return true;
}

function fnCmdSave() {
	if(valid()) {
		// 전화번호
		if($("#tel").val() == "ETC") {
            var inputVal = $.trim($("#wtel").val());
            $("#tel option[value='ETC']").val(inputVal);
        }
		// 교육장소
		if($("#location").val() == "ONLINE") {
			$("#eduPlace").val("온라인(비대면)");
		}
		
		$("#detailForm").attr("action", "${cmdUrl}");
		$("#detailForm").submit();
	}
}

// 첨부파일 삭제
function fn_egov_deleteFile(atchFileIdx, returnUrl, fileType){
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
    }
}

function fnCmdDelete() {
	if (!confirm("삭제할 경우 복구할 수 없습니다.\n그래도 삭제하시겠습니까?")) {
        return false;
    }
	
	$.ajax({
		type: "post",
		url: "${contextRoot}/adm/chsubj/SubjManageDelete.do",
		data: $("#detailForm").serialize(),
		success: function(result) {
			alert(result);
			fnCmdList();
		},
		error: function() {
	        alert("처리 중 오류가 발생했습니다.");
	    }
	});
}
</script>

<style>
.red {color:red;}
</style>

<section>
	<form id="fileForm" name="fileForm" method="post">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
		<input type="hidden" name="menuId" id="menuId" value="${menuId }" />
	</form>

  <form id="detailForm" name="detailForm" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="subjCd" id="subjCd" value="${resultMap.subjCd }"/>
  	<input type="hidden" name="eduTarget" id="eduTarget" value="${resultMap.eduTarget }"/>
  	<input type="hidden" name="menuId" id="menuId" value="${menuId }" />
  	
  	<table class="detail">
  		<colgroup>
        	<col width="15%" />
       		<col width="35%" />
       		<col width="15%" />
       		<col width="35%" />
      	</colgroup>
      	<tbody>
          	<tr>
	            <th>교육강좌명<span class="red"> *</span></th>
	            <td colspan="3"><input type="text" id="subjNm" name="subjNm" value="${resultMap.subjNm }"  style="width: 100%;"/></td>
          	</tr>
          	<tr>
	            <th>교육이미지 등록(썸네일)</th>
	            <td colspan="3" class="file thumbnail">
	            	<c:if test="${resultMap eq null}">
	            		<input type="file" class="input_file" id="file_thumbFileId1" name="file_thumbFileId" title="이미지 찾기" />
	            	</c:if>
	            	
	            	<c:if test="${resultMap ne null}">
	            		<c:forEach var="fileVO1" items="${fileList1}" varStatus="status">
		            		<c:if test="${fileVO1.thumbnailCrop eq 'Y'}">
		            			<span id="file${fileVO1.atchFileIdx}">
									<a href="javascript:fn_egov_downFile('${fileVO1.atchFileIdx}');"><c:out value="${fileVO1.orgFileName}" /></a>
									<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}', '/adm/chsubj/SubjManageUpdateForm.do?subjCd=${resultMap.subjCd}', 'thumb');">삭제</button>
								</span>
		            		</c:if>
		            	</c:forEach>
		            	<c:if test="${empty fileList1 }">
		            		<input type="file" class="input_file" id="file_thumbFileId1" name="file_thumbFileId" title="이미지 찾기" />
		            	</c:if>
	            	</c:if>
	            	<br/><b style="font-size:12px;">권장 사이즈: 520 × 300 px (최소 312 × 180 px)</b>
	            	<br/><b style="font-size:12px; color:red;">* 이미지 미등록 시 기본이미지가 노출됩니다.</b>
	            </td>
          	</tr>
          	<tr>
	            <th>분류<span class="red"> *</span></th>
	            <td colspan="3">
	            	<select id="sgrCd" name="sgrCd" style="width: 20%" value="${resultMap.sgrCd }" ${cmd eq 'Update' ? 'disabled' : '' }>
	            		<option value="">분류 전체</option>
	            		<c:forEach var="item" items="${sgrManageList}">
	            			<option value="${item.sgrCd}" <c:if test="${resultMap.sgrCd eq item.sgrCd}">selected="selected"</c:if>>${item.sgrNm}</option>
	            		</c:forEach>
	            	</select>
	            	&nbsp;
	            	<select id="cateCd" name="cateCd" style="width: 20%" value="${resultMap.cateCd }">
	            		<option value="">분류 선택</option>
	            	</select>
	            </td>
          	</tr>
          	<tr>
	            <th>교육기관<span class="red"> *</span></th>
	            <td colspan="3">
	            	<select id="comId" name="comId" style="width: 30%" value="${resultMap.comId }">
						<c:forEach var="item" items="${companyList}">
							<option value="${item.comId }" <c:if test="${resultMap.comId eq item.comId}">selected="selected"</c:if>>${item.comTitle }</option>
						</c:forEach>
					</select>
	            </td>
          	</tr>
          	<tr>
	            <th>교육장소<span class="red"> *</span></th>
	            <td colspan="3">
	            	<select id="location" name="location" style="width: 20%">
	            		<option value="ONLINE">온라인(비대면)</option>
	            		<option value="ETC">직접입력</option>
	            	</select>
	            	<input type="text" id="eduPlace" name="eduPlace" value="${resultMap.eduPlace}" style="display:none; width: 50%;" maxlength="100"/>
	            </td>
          	</tr>
          	<tr>
	            <th>교육대상<span class="red"> *</span></th>
	            <td colspan="3">
	            	<c:forEach var="code" items="${codeList}">
						<label>
						<input type="checkbox" 
			                   id="eduTarget${code.codeCode}" 
			                   value="${code.codeCode}" 
			                   ${fn:contains(resultMap.eduTarget, code.codeCode) ? 'checked' : ''} /> ${code.codeName}</label>&nbsp;&nbsp;
					</c:forEach>
	            </td>
          	</tr>
          	<tr>
	            <th>전화번호<span class="red"> *</span></th>
	            <td colspan="3">
				    <select id="tel" name="tel" style="width: 20%">
				    	<option value="031-8082-7953" ${resultMap.tel == '031-8082-7953' ? 'selected' : ''}>031-8082-7953</option>
				    	<option value="031-8082-7954" ${resultMap.tel == '031-8082-7954' ? 'selected' : ''}>031-8082-7954</option>
				    	<option value="031-857-6501" ${resultMap.tel == '031-857-6501' ? 'selected' : ''}>031-857-6501</option>
				    	<option value="031-868-5418" ${resultMap.tel == '031-868-5418' ? 'selected' : ''}>031-868-5418</option>
				    	<option value="031-837-0955" ${resultMap.tel == '031-837-0955' ? 'selected' : ''}>031-837-0955</option>
				    	<option value="031-837-0892~3" ${resultMap.tel == '031-837-0892~3' ? 'selected' : ''}>031-837-0892~3</option>
				    	<option value="ETC">직접입력</option>
				    </select>
				    <input type="text" id=wtel name="wtel" value="${resultMap.tel}" style="display:none; width:20%" maxlength="20"/>
	            </td>
          	</tr>
          	<tr>
	            <th>모집방법<span class="red"> *</span></th>
	            <td colspan="3">
	            	<label><input type="radio" name="enrollType" value="1" ${resultMap.enrollType eq '1' or empty resultMap.enrollType ? 'checked' : ''}/> 선착순</label>&nbsp;&nbsp;
		            <label><input type="radio" name="enrollType" value="2" ${resultMap.enrollType eq '2' ? 'checked' : ''}/> 승인</label>
	            </td>
          	</tr>
          	<tr>
	            <th>강의계획서</th>
	            <td colspan="3">
	            	<textarea id="subjPlan" name="subjPlan">${resultMap.subjPlan}</textarea>
	            </td>
          	</tr>
          	<tr>
	            <th>유의사항</th>
	            <td colspan="3">
	            	<textarea id="subjDesc" name="subjDesc">${resultMap.subjDesc}</textarea>
	            </td>
          	</tr>
          	<tr>
	            <th>사용여부<span class="red"> *</span></th>
	            <td>
	            	<label><input type="radio" name="useYn" value="Y" ${resultMap.useYn eq 'Y' or empty resultMap.useYn ? 'checked': ''}/> 사용</label>&nbsp;&nbsp;
		            <label><input type="radio" name="useYn" value="N" ${resultMap.useYn eq 'N' ? 'checked': ''}/> 미사용</label>
	            </td>
	            <th>중복신청 가능여부<span class="red"> *</span></th>
	            <td>
	            	<label><input type="radio" name="duplEnrollYn" value="Y" ${resultMap.duplEnrollYn eq 'Y'}/> 예</label>&nbsp;&nbsp;
		            <label><input type="radio" name="duplEnrollYn" value="N" ${resultMap.duplEnrollYn eq 'N' or empty resultMap.duplEnrollYn ? 'checked': '' }/> 아니오</label>
	            </td>
          	</tr>
      	</tbody>
  	</table>
  	
  	<!-- 버튼 영역 -->
  	<div class="text-right btn-area" style="margin-top: 20px;">
  		<!-- 저장 / 수정 -->
  		<button type="button" onclick="fnCmdSave();" class="point">
       		${buttonSaveText}
      	</button>
      	
      	<c:if test="${cmd eq 'Update'}">
        	<button type="button" onclick="fnCmdDelete();">삭제</button>
		</c:if>
		
		<!-- 목록 -->
      	<a href="javascript:fnCmdList();">목록</a>
  	</div>
  </form>
</section>
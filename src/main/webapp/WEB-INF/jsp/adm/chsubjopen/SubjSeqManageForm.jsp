<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>

<!-- <script src="https://cdn.ckeditor.com/4.22.1/full-all/ckeditor.js"></script> CKEditor

<style>
.cke_notification,
.cke_notification_warning,
.cke_notification_message {
  display: none !important;
}
</style> -->

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
	
	if("${cmd}" == "Update") {
		<fmt:parseDate var="enrollStartDtPDate" value="${resultMap.enrollStartDt}" pattern="yyyy.MM.dd HH:mm"/>
		<fmt:parseDate var="enrollEndDtPDate" value="${resultMap.enrollEndDt}" pattern="yyyy.MM.dd HH:mm"/>
		
		$("#detailForm input[name=enrollStartDtYear]").val('<fmt:formatDate value="${enrollStartDtPDate}" pattern="yyyy-MM-dd" />');
		$("#detailForm input[name=enrollStartDtHH]").val('<fmt:formatDate value="${enrollStartDtPDate}" pattern="HH" />');
		$("#detailForm input[name=enrollStartDtMI]").val('<fmt:formatDate value="${enrollStartDtPDate}" pattern="mm" />');
		$("#detailForm input[name=enrollEndDtYear]").val('<fmt:formatDate value="${enrollEndDtPDate}" pattern="yyyy-MM-dd" />');
		$("#detailForm input[name=enrollEndDtHH]").val('<fmt:formatDate value="${enrollEndDtPDate}" pattern="HH" />');
		$("#detailForm input[name=enrollEndDtMI]").val('<fmt:formatDate value="${enrollEndDtPDate}" pattern="mm" />');
		
		<fmt:parseDate var="learnStartDtPDate" value="${resultMap.learnStartDt}" pattern="yyyy.MM.dd HH:mm"/>
		<fmt:parseDate var="learnEndDtPDate" value="${resultMap.learnEndDt}" pattern="yyyy.MM.dd HH:mm"/>
			
		$("#detailForm input[name=learnStartDtYear]").val('<fmt:formatDate value="${learnStartDtPDate}" pattern="yyyy-MM-dd" />');
		$("#detailForm input[name=learnStartDtHH]").val('<fmt:formatDate value="${learnStartDtPDate}" pattern="HH" />');
		$("#detailForm input[name=learnStartDtMI]").val('<fmt:formatDate value="${learnStartDtPDate}" pattern="mm" />');
		$("#detailForm input[name=learnEndDtYear]").val('<fmt:formatDate value="${learnEndDtPDate}" pattern="yyyy-MM-dd" />');
		$("#detailForm input[name=learnEndDtHH]").val('<fmt:formatDate value="${learnEndDtPDate}" pattern="HH" />');
		$("#detailForm input[name=learnEndDtMI]").val('<fmt:formatDate value="${learnEndDtPDate}" pattern="mm" />');
	}
	
	$("#comId").change(function() {
		var comId = $(this).val();
		var selPlace = "${resultMap.eduPlace}";
		
		$("#locId").empty();
		$("#locId").append('<option value="">기타(직접입력)</option>');
		
		$.ajax({
			url: "${contextRoot}/adm/chsearch/SearchLocationList.do",
			type: "GET",
			data: { comId: comId },
			success: function(result) {
				$.each(result, function(index, item) {
					$("#locId").append(
							'<option value="' + item.locId + '" ' 
							+ (selPlace == item.location ? 'selected="selected"' : '') 
							+ '>' + item.location + '</option>'
					);
				});
			},
			error: function() {
				//alert("오류 발생");
			}
		});
	});
		
	$("#comId").trigger("change");
	
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
	    
	$("#locId").change(function() {
    	var locId = $(this).val();
    	var locText = $(this).find("option:selected").text();
    	
    	if (locId === "" || locId === "ETC") {
            $("#eduPlace").val("").focus();
        } else {
            $("#eduPlace").val(locText);
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
	var reqUrl = "";
	var menuId = $("#menuId").val();
	
	if(menuId == "2025MENU0000273") {
		reqUrl = "SubjSeqManageList.do";
	} else if(menuId == "2026MENU0000362") {
		reqUrl = "EnrollManageList.do";
	} else if(menuId == "2026MENU0000381") {
		reqUrl = "EnrollManageListC.do";
	} else {
		reqUrl = "SubjSeqManageList.do";
	}
	
	 $("#detailForm").attr("action", reqUrl);
	 $("#detailForm").submit();
}

function valid() {
	var subjNm = $("#subjNm").val();
	var comId = $("#comId").val();
	var sessionNm = $("#sessionNm").val();
	var wtel = $.trim($("#wtel").val());
	var telSelect = $("#tel").val();
	var eduPlace = $.trim($("#eduPlace").val());
	
/* 	var data = oEditors.getById["subjPlan"].getIR();
	$("#subjPlan").val(data); */
	
	var data = ckEditor.getData();
	$("#content").val(data);
	
	if (subjNm == "") {
		alert("교육강좌명을 입력해주세요.");
		subjNm.focus();
		return false;
	}
	
	if(eduPlace == "") {
		alert("교육장소를 입력해주세요.");
		eduPlace.focus();
		return false;
	}
	
	if (sessionNm == "") {
		alert("기수를 입력해주세요.");
		sessionNm.focus();
		return false;
	}
	
	// 모집기간 validation
	if($.trim($("#detailForm input[name=enrollStartDtYear]").val()) == ""){
		alert("모집기간 시작일을 선택하세요.");
		return false;
	}
	
	if($.trim($("#detailForm input[name=enrollStartDtHH]").val()) != ""){
		if(parseInt($("#detailForm input[name=enrollStartDtHH]").val(), 10) >= 24){
			alert("모집기간 시작시간의 시는 0 ~ 23까지 입력 가능합니다.");
			return false;			
		}
	}
	
	if($.trim($("#detailForm input[name=enrollStartDtMI]").val()) != ""){
		if(parseInt($("#detailForm input[name=enrollStartDtMI]").val(), 10) >= 60){
			alert("모집기간 시작시간의 분은 0 ~ 59까지 입력 가능합니다.");
			return false;
		}
	}
	
	if($.trim($("#detailForm input[name=enrollEndDtYear]").val()) == ""){
		alert("모집기간 종료일을 선택하세요.");
		return false;
	}
	
	if($.trim($("#detailForm input[name=enrollEndDtHH]").val()) != ""){
		if(parseInt($("#detailForm input[name=enrollEndDtHH]").val(), 10) >= 24){
			alert("모집기간 종료시간의 시는 0 ~ 23까지 입력 가능합니다.");
			return false;
		}
	}
	
	if($.trim($("#detailForm input[name=enrollEndDtMI]").val()) != ""){
		if(parseInt($("#detailForm input[name=enrollEndDtMI]").val(), 10) >= 60){
			alert("모집기간 종료시간의 분은 0 ~ 59까지 입력 가능합니다.");
			return false;
		}
	}
	
	var es = new Date($("#detailForm input[name=enrollStartDtYear]").val()
			+ " "
			+ ($("#detailForm input[name=enrollStartDtHH]").val() == "" ? "00" : $("#detailForm input[name=enrollStartDtHH]").val())
			+ ":"
			+ ($("#detailForm input[name=enrollStartDtMI]").val() == "" ? "00" : $("#detailForm input[name=enrollStartDtMI]").val())
		);

	var ee = new Date($("#detailForm input[name=enrollEndDtYear]").val()
				+ " "
				+ ($("#detailForm input[name=enrollEndDtHH]").val() == "" ? "23" : $("#detailForm input[name=enrollEndDtHH]").val())
				+ ":"
				+ ($("#detailForm input[name=enrollEndDtMI]").val() == "" ? "59" : $("#detailForm input[name=enrollEndDtMI]").val())
			);
	
	if(es.getTime() >= ee.getTime()){
		alert("모집기간 시작일시는 종료일시보다 같거나 클 수 없습니다.");
		return false;
	}
	
	// 교육기간 validation
	if($.trim($("#detailForm input[name=learnStartDtYear]").val()) == ""){
		alert("교육기간 시작일을 선택하세요.");
		return false;
	}
	
	if($.trim($("#detailForm input[name=learnStartDtHH]").val()) != ""){
		if(parseInt($("#detailForm input[name=learnStartDtHH]").val(), 10) >= 24){
			alert("교육기간 시작시간의 시는 0 ~ 23까지 입력 가능합니다.");
			return false;			
		}
	}
	
	if($.trim($("#detailForm input[name=learnStartDtMI]").val()) != ""){
		if(parseInt($("#detailForm input[name=learnStartDtMI]").val(), 10) >= 60){
			alert("교육기간 시작시간의 분은 0 ~ 59까지 입력 가능합니다.");
			return false;
		}
	}
	
	if($.trim($("#detailForm input[name=learnEndDtYear]").val()) == ""){
		alert("교육기간 종료일을 선택하세요.");
		return false;
	}
	
	if($.trim($("#detailForm input[name=learnEndDtHH]").val()) != ""){
		if(parseInt($("#detailForm input[name=learnEndDtHH]").val(), 10) >= 24){
			alert("교육기간 종료시간의 시는 0 ~ 23까지 입력 가능합니다.");
			return false;
		}
	}
	
	if($.trim($("#detailForm input[name=learnEndDtMI]").val()) != ""){
		if(parseInt($("#detailForm input[name=learnEndDtMI]").val(), 10) >= 60){
			alert("교육기간 종료시간의 분은 0 ~ 59까지 입력 가능합니다.");
			return false;
		}
	}
	
	var ls = new Date($("#detailForm input[name=learnStartDtYear]").val()
						+ " "
						+ ($("#detailForm input[name=learnStartDtHH]").val() == "" ? "00" : $("#detailForm input[name=learnStartDtHH]").val())
						+ ":"
						+ ($("#detailForm input[name=learnStartDtMI]").val() == "" ? "00" : $("#detailForm input[name=learnStartDtMI]").val())
					);
	
	var le = new Date($("#detailForm input[name=learnEndDtYear]").val()
						+ " "
						+ ($("#detailForm input[name=learnEndDtHH]").val() == "" ? "23" : $("#detailForm input[name=learnEndDtHH]").val())
						+ ":"
						+ ($("#detailForm input[name=learnEndDtMI]").val() == "" ? "59" : $("#detailForm input[name=learnEndDtMI]").val())
					);
	
	if(ls.getTime() >= le.getTime()){
		alert("교육기간 시작일시는 종료일시보다 같거나 클 수 없습니다.");
		return false;
	}
	
	var selected = [];
	var selLen = ${fn:length(codeList)};
	
	for (let i = 1; i <= selLen; i++) {
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
		// 모집기간
		var enrollStartDt = $("#detailForm input[name=enrollStartDtYear]").val();
		enrollStartDt += " ";
    	
    	if($.trim($("#detailForm input[name=enrollStartDtHH]").val()) == ""){
    		enrollStartDt += "00";
    	} else {
    		if(parseInt($("#detailForm input[name=enrollStartDtHH]").val(), 10) < 10){
    			enrollStartDt += "0"; 
    		}
    		enrollStartDt += parseInt($("#detailForm input[name=enrollStartDtHH]").val(), 10);
    	}
    	enrollStartDt += ":";
    	
    	if($.trim($("#detailForm input[name=enrollStartDtMI]").val()) == ""){
    		enrollStartDt += "00";	
    	} else {
    		if(parseInt($("#detailForm input[name=enrollStartDtMI]").val(), 10) < 10){
    			enrollStartDt += "0"; 
    		}
    		enrollStartDt += parseInt($("#detailForm input[name=enrollStartDtMI]").val(), 10);
    	}
    	$("#detailForm input[name=enrollStartDt]").val(enrollStartDt);
    	
    	var enrollEndDt = $("#detailForm input[name=enrollEndDtYear]").val();
    	enrollEndDt += " ";
    	
    	if($.trim($("#detailForm input[name=enrollEndDtHH]").val()) == ""){
    		enrollEndDt += "23";	
    	} else {
    		if(parseInt($("#detailForm input[name=enrollEndDtHH]").val(), 10) < 10){
    			enrollEndDt += "0"; 
    		}
    		enrollEndDt += parseInt($("#detailForm input[name=enrollEndDtHH]").val(), 10);
    	}
    	enrollEndDt += ":";
    	
    	if($.trim($("#detailForm input[name=enrollEndDtMI]").val()) == ""){
    		enrollEndDt += "59";	
    	} else {
    		if(parseInt($("#detailForm input[name=enrollEndDtMI]").val(), 10) < 10){
    			enrollEndDt += "0"; 
    		}
    		enrollEndDt += parseInt($("#detailForm input[name=enrollEndDtMI]").val(), 10);
    	}
    	$("#detailForm input[name=enrollEndDt]").val(enrollEndDt);
		
    	// 교육기간
		var learnStartDt = $("#detailForm input[name=learnStartDtYear]").val();
		learnStartDt += " ";
    	
    	if($.trim($("#detailForm input[name=learnStartDtHH]").val()) == ""){
    		learnStartDt += "00";
    	} else {
    		if(parseInt($("#detailForm input[name=learnStartDtHH]").val(), 10) < 10){
    			learnStartDt += "0"; 
    		}
    		learnStartDt += parseInt($("#detailForm input[name=learnStartDtHH]").val(), 10);
    	}
    	learnStartDt += ":";
    	
    	if($.trim($("#detailForm input[name=learnStartDtMI]").val()) == ""){
    		learnStartDt += "00";	
    	} else {
    		if(parseInt($("#detailForm input[name=learnStartDtMI]").val(), 10) < 10){
    			learnStartDt += "0"; 
    		}
    		learnStartDt += parseInt($("#detailForm input[name=learnStartDtMI]").val(), 10);
    	}
    	$("#detailForm input[name=learnStartDt]").val(learnStartDt);
    	
    	var learnEndDt = $("#detailForm input[name=learnEndDtYear]").val();
    	learnEndDt += " ";
    	
    	if($.trim($("#detailForm input[name=learnEndDtHH]").val()) == ""){
    		learnEndDt += "23";	
    	} else {
    		if(parseInt($("#detailForm input[name=learnEndDtHH]").val(), 10) < 10){
    			learnEndDt += "0"; 
    		}
    		learnEndDt += parseInt($("#detailForm input[name=learnEndDtHH]").val(), 10);
    	}
    	learnEndDt += ":";
    	
    	if($.trim($("#detailForm input[name=learnEndDtMI]").val()) == ""){
    		learnEndDt += "59";	
    	} else {
    		if(parseInt($("#detailForm input[name=learnEndDtMI]").val(), 10) < 10){
    			learnEndDt += "0"; 
    		}
    		learnEndDt += parseInt($("#detailForm input[name=learnEndDtMI]").val(), 10);
    	}
    	$("#detailForm input[name=learnEndDt]").val(learnEndDt);
    	
    	if($.trim($("#detailForm input[name=capacity]").val()) == ""){
			$("#detailForm input[name=capacity]").val("0");
		}
		
		if($.trim($("#detailForm input[name=waitEnrollCnt]").val()) == ""){
			$("#detailForm input[name=waitEnrollCnt]").val("0");
		}
    	
		// 전화번호
		if($("#tel").val() == "ETC") {
            var inputVal = $.trim($("#wtel").val());
            $("#tel option[value='ETC']").val(inputVal);
        }
		// 수강신청관리에서 수정 시 menuId 변경
		$("#detailForm input[name=menuId]").val("2025MENU0000273");
		$("#detailForm").attr("action", "SubjSeqManageUpdate.do");
		$("#detailForm").submit();
	}
}

//첨부파일 삭제
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
	
	$("#detailForm").attr("action", "SubjSeqManageDelete.do");
	$("#detailForm").submit();
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
  		<input type="hidden" name="seqCd" id="seqCd" value="${resultMap.seqCd }" />
	 	
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
									<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}', '/adm/chsubjopen/SubjSeqManageForm.do?seqCd=${resultMap.seqCd}', 'thumb');">삭제</button>
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
	            <td colspan="3">${resultMap.sgrNm} > ${resultMap.cateNm}</td>
          	</tr>
          	<tr>
	            <th>과정기수코드<span class="red"> *</span></th>
	            <td>${resultMap.seqCd}</td>
	            <th>기수<span class="red"> *</span></th>
	            <td><input type="text" id="sessionNm" name="sessionNm" maxlength="3" class="numberOnly" value="${resultMap.sessionNm }"/></td>
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
	            	<select id="locId" name="locId" style="width: 20%" value="">
	            		<option value="ETC">기타(직접입력)</option>
					</select>
	            	<input type="text" id="eduPlace" name="eduPlace" value="${resultMap.eduPlace}" style="width: 50%;" maxlength="100"/>
	            	<br/><b style="font-size:12px; color:red;">* 등록하고자하는 교육장소가 없을 경우, 관리자에게 문의바랍니다.</b>
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
	            <th>모집기간<span class="red"> *</span></th>
	            <td colspan="3">
	            	<input type="hidden" id="enrollStartDt" name="enrollStartDt" value="${resultMap.enrollStartDt}" />
	          		<input type="date" id="enrollStartDtYear" name="enrollStartDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		<input type="text" id="enrollStartDtHH" name="enrollStartDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />시
				    <input type="text" id="enrollStartDtMI" name="enrollStartDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />분   
	          		~	
	          		<input type="hidden" id="enrollEndDt" name="enrollEndDt" value="${resultMap.enrollEndDt}"/>
	          		<input type="date" id="enrollEndDtYear" name="enrollEndDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		<input type="text" id="enrollEndDtHH" name="enrollEndDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="23" />시
				    <input type="text" id="enrollEndDtMI" name="enrollEndDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="59" />분   
	            </td>
          	</tr>
          	<tr>
	            <th>교육기간<span class="red"> *</span></th>
	            <td colspan="3">
	            	<input type="hidden" id="learnStartDt" name="learnStartDt" value="${resultMap.learnStartDt}" />
	          		<input type="date" id="learnStartDtYear" name="learnStartDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		<input type="text" id="learnStartDtHH" name="learnStartDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />시
				    <input type="text" id="learnStartDtMI" name="learnStartDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />분   
	          		~	
	          		<input type="hidden" id="learnEndDt" name="learnEndDt" value="${resultMap.learnEndDt}"/>
	          		<input type="date" id="learnEndDtYear" name="learnEndDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		<input type="text" id="learnEndDtHH" name="learnEndDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="23" />시
				    <input type="text" id="learnEndDtMI" name="learnEndDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="59" />분   
	            </td>
          	</tr>
          	<tr>
	            <th>모집인원</th>
	            <td><input type="text" id="capacity" name="capacity" maxlength="3" value="${resultMap.capacity }" class="numberOnly" />&nbsp;명</td>
	            <th>대기인원</th>
	            <td><input type="text" id="waitEnrollCnt" name="waitEnrollCnt" maxlength="3" value="${resultMap.waitEnrollCnt }" class="numberOnly" />&nbsp;명</td>
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
	            <th>첨부파일</th>
	            <td colspan="3" class="file attach">
	            	<c:if test="${resultMap eq null}">
	            		<input type="file" class="input_file" id="file_atchFileId1" name="file_atchFileId" title="파일찾기" />
	            	</c:if>
	            	
	            	<c:if test="${resultMap ne null}">
	            		<c:forEach var="fileVO1" items="${fileList}" varStatus="status">
		            		<c:if test="${fileVO1.thumbnailCrop eq 'N'}">
		            			<span id="file${fileVO1.atchFileIdx}">
									<a href="javascript:fn_egov_downFile('${fileVO1.atchFileIdx}');"><c:out value="${fileVO1.orgFileName}" /></a>
									<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}', '/adm/chsubjopen/SubjSeqManageForm.do?seqCd=${resultMap.seqCd}', 'attach');">삭제</button>
								</span>
		            		</c:if>
		            	</c:forEach>
		            	<c:if test="${empty fileList}">
		            		<input type="file" class="input_file" id="file_atchFileId1" name="file_atchFileId" title="파일찾기" />
		            	</c:if>
	            	</c:if>
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
	            	<c:if test="${resultMap.duplEnrollYn eq 'Y'}">예</c:if>
	            	<c:if test="${resultMap.duplEnrollYn eq 'N'}">아니오</c:if>
	            </td>
          	</tr>
      	</tbody>
  	</table>
  	
  	<!-- 버튼 영역 -->
  	<div class="text-right btn-area" style="margin-top: 20px;">
  		<button type="button" onclick="fnCmdSave();" class="point">수정</button>
  		<c:if test="${cmd eq 'Update' && resultMap.enrollCnt == 0 }">
      	<button type="button" onclick="fnCmdDelete();">삭제</button>
      	</c:if>
      	<a href="javascript:fnCmdList();">목록</a>
  	</div>
	</form>
</section>
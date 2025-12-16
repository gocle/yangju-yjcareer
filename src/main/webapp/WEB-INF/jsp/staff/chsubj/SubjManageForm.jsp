<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/staff/include/common.jsp" %>
<c:import url="/${sessionScope.SESSION_MEM_TYPE}/menu/leftMenu.do" />

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
<script type="text/javascript">
var oEditors = [];

$(document).ready(function() {
	initEditor();
	
	$("#sgrCd").change(function() {
		var sgrCd = $(this).val();
		var selCateCd = "${resultMap.cateCd}";
		
		$("#cateCd").empty();
		$("#cateCd").append('<option value="">분류 선택</option>');
		
		$.ajax({
	     	url: "${contextRoot}/staff/chsearch/SearchCateCdList.do",
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
	
	$("#comId").change(function() {
		var comId = $(this).val();
		$("#eduPlace").val();
		
		$.ajax({
	     	url: "${contextRoot}/staff/chsearch/SearchEduPlaceAddress.do",
	        type: "GET",
	        data: { comId: comId },
	        success: function(result) {
	        	$("#eduPlace").val(result.address);
	        },
	        error: function() {
	        	//alert("오류 발생");
	        }
		});
	});
	
	$("#comId").trigger("change");
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
	var subjNm = $("#subjNm").val();
	var sgrCd = $("#sgrCd").val();
	var cateCd = $("#cateCd").val();
	var comId = $("#comId").val();
	
	var data = oEditors.getById["subjPlan"].getIR();
	$("#subjPlan").val(data);
	
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
	
	return true;
}

function fnCmdSave() {
	if(valid()) {
		$("#detailForm").attr("action", "${cmdUrl}");
		/* $("#detailForm").attr("target", "_self"); */
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
	
	$("#detailForm").attr("action", "SubjManageDelete.do");
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
									<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}', '/staff/chsubj/SubjManageUpdateForm.do?subjCd=${resultMap.subjCd}', 'thumb');">삭제</button>
								</span>
		            		</c:if>
		            	</c:forEach>
		            	<c:if test="${empty fileList1 }">
		            		<input type="file" class="input_file" id="file_thumbFileId1" name="file_thumbFileId" title="이미지 찾기" />
		            	</c:if>
	            	</c:if>
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
	            <th>교육장소</th>
	            <td colspan="3">
	            	<input type="text" id="eduPlace" name="eduPlace" value=""  style="width: 100%;" readonly/>
	            </td>
          	</tr>
          	<tr>
	            <th>교육대상<span class="red"> *</span></th>
	            <td colspan="3">
	            	<label><input type="checkbox" id="eduTarget1" name="eduTarget1" value="1" <c:if test="${fn:contains(resultMap.eduTarget,'1')}">checked</c:if>/> 초</label>&nbsp;&nbsp;
	            	<label><input type="checkbox" id="eduTarget2" name="eduTarget2" value="2" <c:if test="${fn:contains(resultMap.eduTarget,'2')}">checked</c:if>/> 중</label>&nbsp;&nbsp;
	            	<label><input type="checkbox" id="eduTarget3" name="eduTarget3" value="3" <c:if test="${fn:contains(resultMap.eduTarget,'3')}">checked</c:if>/> 고</label>&nbsp;&nbsp;
	            	<label><input type="checkbox" id="eduTarget4" name="eduTarget4" value="4" <c:if test="${fn:contains(resultMap.eduTarget,'4')}">checked</c:if>/> 학부모</label>&nbsp;&nbsp;
	            	<label><input type="checkbox" id="eduTarget5" name="eduTarget5" value="5" <c:if test="${fn:contains(resultMap.eduTarget,'5')}">checked</c:if>/> 성인</label>
	            </td>
          	</tr>
          	<tr>
	            <th>전화번호</th>
	            <td colspan="3">
	            	<input type="text" id="tel" name="tel" value="${resultMap.tel}" maxlength="20" style="width: 20%;" placeholder="031-0000-0000"/>
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
	            	<textarea style="width:100%" name="subjDesc" id="subjDesc" maxlength="100">${resultMap.subjDesc}</textarea>
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
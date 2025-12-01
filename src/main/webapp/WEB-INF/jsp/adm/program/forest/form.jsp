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
	
	const pgTarget = $('#pgTarget').val();   // 단일 선택 select
	if (!pgTarget) { alert('모집대상을 선택하세요.'); $('#pgTarget').focus(); return false; }
	
	
	// 장소 선택 필수
	syncLocationHidden(); // 최신 체크 상태 반영
	const locCsv = $('#location').val();
	if (!locCsv) { alert('장소를 선택하세요.'); $('#locationBox').focus(); return false; }
	
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
	
	const pgTarget = $('#pgTarget').val();   // 단일 선택 select
	if (!pgTarget) { alert('모집대상을 선택하세요.'); $('#pgTarget').focus(); return false; }
	
	// 장소 선택 필수
	syncLocationHidden(); // 최신 체크 상태 반영
	const locCsv = $('#location').val();
	if (!locCsv) { alert('장소를 선택하세요.'); $('#locationBox').focus(); return false; }
	
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

    if (regCloseDate && startDate && regCloseDate > startDate) {
        alert("예약신청 종료일은 체험 시작일을 넘을 수 없습니다.");
        $("#regCloseDate").val(startDate).focus();
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
					<th>프로그램 분류</th>
					<td colspan="5">
						<select name="pgCode" id="pgCode" style="width:80%">
							<c:forEach var="codeList" items="${codeList}">
						        <option value="${codeList.codeCode}"
						        <c:if test="${codeList.codeCode eq programVO.pgCode}">selected</c:if>>
						        ${codeList.codeName}</option>
						    </c:forEach>
						</select>
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
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>대상</th>
					<td>
						<input type="text" style="width:100%" name="pgTarget" id="pgTarget" value="${programVO.pgTarget}" />
					</td>
					<th>담당자별 배정인원</th>
					<td>
						<input type="text" name="capacity" id="capacity" value="${programVO.capacity}" />&nbsp;명
					</td>
					<th>체험시간</th>
					<td>
						<input type="text" name="duration" id="duration" value="${programVO.duration}" />&nbsp;분
					</td>
				</tr>
				<tr>
					<th>장소</th>
					<td>
						<%-- <input type="text" name="location" id="location" value="${programVO.location}" /> --%>
						<!-- <select name="location" id="location" style="width:80%">
						</select> -->
						<!-- 체크박스들이 들어갈 자리 -->
					    <div id="locationBox" class="location-box"></div>
					    <!-- 서버에 보낼 실제 값(콤마 구분) -->
					    <input type="hidden" name="location" id="location" value="${programVO.location}" />
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


<script>

  const IS_CREATE = '${programVO.pgId}' === '' || '${programVO.pgId}' === 'null' || !'${programVO.pgId}';

  // 프로그램→(AUDIENCE 코드, 장소그룹) 매핑
  const pgMap = {
    'FOREST_INT': {placeGroup: 'GEN_PLACE'},
    'CHILD_REG' : {placeGroup: 'KIND_PLACE'},
    'CHILD_FAM' : {placeGroup: 'FAM_PLACE'}
  };

  function loadPlaceOptions(group, selectedCsv) {
	  var pgType = '${programVO.pgType}';
	  var selected = (selectedCsv || '')
	                   .split(',')
	                   .map(function(s){ return s.trim(); })
	                   .filter(Boolean);

	  $.getJSON('${contextRoot}/adm/program/' + pgType + '/codes.do', { group: group }, function(list){
	    var $box = $('#locationBox').empty();

	    (list || []).forEach(function(c, idx){
	      var id = 'loc_' + idx;
	      // 수정 페이지면 saved 값(selected)에 따라 체크, 등록 페이지면 기본 false (아래에서 일괄 true 처리)
	      var checked = selected.indexOf(c.codeCode) !== -1 ? 'checked' : '';
	      var html = ''
	        + '<label for="'+id+'">'
	        +   '<input type="checkbox" class="location_chk" id="'+id+'" value="'+c.codeCode+'" '+checked+'/>'
	        +   c.codeName
	        + '</label>';
	      $box.append(html);
	    });

	    // ★ 등록 페이지이고, 저장된 선택이 없다면 전체 선택
	    if (IS_CREATE && selected.length === 0) {
	      $('.location_chk').prop('checked', true);
	    }

	    // hidden 동기화
	    syncLocationHidden();
	  });
	}

/*   function loadAudienceOption(code, selected) {
    var pgType = '${programVO.pgType}';
    $.getJSON('${contextRoot}/adm/program/'+pgType+'/audience.do', {code}, function(list){
      const $sel = $('#pgTarget').empty().append('<option value="">선택</option>');
      (list||[]).forEach(function(c){
          const opt = $('<option/>').val(c.codeCode).text(c.codeName);
          if (selected && selected === c.codeCode) opt.attr('selected','selected');
          $sel.append(opt);
        });
    });
  } */

  function refreshByProgram() {
	  const pgCode = $('#pgCode').val();
	  const map = pgMap[pgCode]; if (!map) return;

	  const savedVen = '${programVO.location}'; // 수정이면 값 존재, 등록이면 보통 비어있음
	  loadPlaceOptions(map.placeGroup, savedVen);
	}

	$(function(){
	  refreshByProgram();
	  $('#pgCode').on('change', function(){
	    // change 시에도 loadPlaceOptions 안에서 IS_CREATE가 true면 다시 전체 선택됨
	    refreshByProgram();
	  });
	});
  
  function syncLocationHidden(){
	  var values = $('.location_chk:checked').map(function(){ return this.value; }).get();
	  $('#location').val(values.join(','));
	}
  
  $(document).on('change', '.location_chk', syncLocationHidden);
</script>

<style>
.location-box { display:flex; flex-wrap:wrap; gap:10px; }
.location-box label { display:inline-flex; align-items:center; gap:4px; }
</style>
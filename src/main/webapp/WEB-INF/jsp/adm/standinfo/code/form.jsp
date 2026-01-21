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
            /*datepicker에서 사용한 이미지 버튼 style적용*/
            img.ui-datepicker-trigger {
                margin-left:5px; vertical-align:middle; cursor:pointer;
}
</style>

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
//등록하기
function fn_save(){
	
	var codeId = $('#codeId').val();
 	var regExp = /^[0-9]*$/;
	var codeOrder = $('#codeOrder').val();
	if($('#group').val() == ''){
		alert('구분을 선택해주세요');
		$('#group').focus();
		return false;
	}

	if($('#group').val() == 'middle'){
		if($('#codeGroup1').val() == ''){
			alert('코드그룹를 선택해주세요');
			$('#codeGroup1').focus();
			return false;
		}
	}
	if($('#group').val() == '0000'){
		if($('#codeGroupDetail').val() == ''){
			alert('코드그룹를 입력해주세요');
			$('#codeGroupDetail').focus();
			return false;
		}
	}
	
	if($('#codeCode').val() == ''){
		alert('코드를 입력해주세요');
		$('#codeCode').focus();
		return false;
	}
	
	if($('#codeName').val() == ''){
		alert('코드명를 입력해주세요');
		$('#codeName').focus();
		return false;
	}
	
	if($('#groupDesc').val() == ''){
		alert('코드설명를 입력해주세요');
		$('#groupDesc').focus();
		return false;
	}
	if($('#codeOrder').val() == ''){
		alert('코드 순서를 입력해주세요');
		$('#codeOrder').focus();
		return false;
	}
	if(!regExp.test(codeOrder)){
		alert('코드순서는 숫자만 입력해주세요.');
		$('#codeOrder').val('');
		$('#codeOrder').focus();
		return false;
	}
	$("#form").attr("action", "${contextRoot}/adm/standinfo/code/insert.do");
	
	$("#form").attr("target","_self");
	
	$("#form").submit();
	
}


function fn_update( codeId ){ 
	
	var codeId = $('#codeId').val(codeId);
	var regExp = /^[0-9]*$/;
	var codeOrder = $('#codeOrder').val();
	var regExp = /^[0-9]*$/;
	var codeOrder = $('#codeOrder').val();
	if($('#group').val() == ''){
		alert('구분을 선택해주세요');
		$('#group').focus();
		return false;
	}

	//중분류를 선택햇을때.
	if($('#group').val() == 'middle'){
		if($('#codeGroup1').val() == ''){
			alert('코드그룹를 선택해주세요');
			$('#codeGroup1').focus();
			return false;
		}
	}
	//대분류를 선택햇을때
	if($('#group').val() == '0000'){
		if($('#codeGroupDetail').val() == ''){
			alert('코드그룹를 입력해주세요');
			$('#codeGroupDetail').focus();
			return false;
		}
	}
	
	if($('#codeCode').val() == ''){
		alert('코드를 입력해주세요');
		$('#codeCode').focus();
		return false;
	}
	
	if($('#codeName').val() == ''){
		alert('코드명를 입력해주세요');
		$('#codeName').focus();
		return false;
	}
	
	if($('#groupDesc').val() == ''){
		alert('코드설명를 입력해주세요');
		$('#groupDesc').focus();
		return false;
	}
	
	if($('#codeOrder').val() == ''){
		alert('코드 순서를 입력해주세요');
		$('#codeOrder').focus();
		return false;
	}
	if(!regExp.test(codeOrder)){
		alert('코드순서는 숫자만 입력해주세요.');
		$('#codeOrder').val('');
		$('#codeOrder').focus();
		return false;
	}
	
	$("#form").attr("action", "${contextRoot}/adm/standinfo/code/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

function fn_delete( codeId ){
	var codeId = $('#codeId').val(codeId);
	
	$("#form").attr("action", "${contextRoot}/adm/standinfo/code/delete.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}


function fn_changeMid( e ) {
	//해당 select 옵션 선택한 택스트... const value = e.value;
	const text = e.options[e.selectedIndex].text;
	if(text == "선택"){
		$("#groupDesc").empty();
		$("#groupDesc").val("");	
		
	}else{
	$("#groupDesc").empty();
	$("#groupDesc").val(text);
	
	}
}

//select 박스 선택시 설명에 나오기
function fn_changeBig( e ) {
	//해당 select 옵션 선택한 택스트... const value = e.value;
	const text = e.options[e.selectedIndex].text;
	
	if(text == "대분류"){
		$("#groupDesc").val('');		//코드 설명 공백
		$("#codeCode").val(e.value);
	    $("#codeCode").attr("readonly",true);
		$("#codeGroup1").css('display','none');
		$("#codeGroup1").attr('name','codeNone');
	    $("#codeGroup2").css('display','');
	    $("#codeGroupDetail").attr('name','codeGroup');   
		
	}else if(text == "중분류"){
		$("#codeCode").attr("readonly",false);
		$("#codeCode").val('');
		$("#codeGroup1").css('display','');
		$("#codeGroup1").attr('name','codeGroup');
		$("#codeGroup2").css('display','none');
		$("#codeGroupDetail").attr('name','codeNone');
	}
}

$(document).ready(function() {
	//수정 파티 들갈때 e대분류
	if('${codeResult.codeCode}' == '0000'){	
			$("#group").empty();
			$("#group").append("<option value='0000' selected>대분류</option>");
			$("#codeGroup1").remove();
		    $("#codeGroup2").css('display','');
		    $("#codeGroupDetail").attr("readonly",true);
		    $("#codeCode").attr("readonly",true);
		    $("#codeName").attr("readonly",true);
		    $("#groupDesc").attr("readonly",true);
		    $("#codeNameEng").attr("readonly",true);
		    $("#codeOrder").attr("readonly",true);
		}else if('${codeResult.codeCode}' != '' ){	//그외에것
		/* 	alert('이상') */
			$("#group").empty();
			$("#group").append("<option value='middle' selected>중분류</option>");
			$("#codeCode").attr("readonly",false);
			$("#codeGroup1").css('display','');
			$("#codeGroup2").remove();
			$("#codeGroup1 option[value != '']").remove();
			$("#codeGroup1").append("<option value='${codeResult.codeGroup}' selected>${codeResult.groupDesc}</option>");
			
		}else if('${codeResult.codeCode}' == ''){
			/*  alert('등록')  */
			$("#group").empty();
			$("#group").append("<option value='' selected>선택</option>")
			$("#group").append("<option value='0000' >대분류</option>");
			$("#group").append("<option value='middle' >중분류</option>");
			$("#codeCode").attr("readonly",false);
			$("#codeGroup1").css('display','none');
			$("#codeGroup2").css('display','none');
		}

});

</script>

<section>
	<form id="form" name="form" method="post">
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />  	
		<input type="hidden" id="siteId" name="siteId" value="${siteId}" />
		<input type="hidden" id="codeId" name="codeId" value="" />

		<table class="detail">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>코드구분<span style="color:red;"> *</span></th>
					<td>
						<select id="group" name="group" onchange="fn_changeBig(this)">
							<option value="">선택</option>
							<option value="0000">대분류</option>
							<option value="middle">중분류</option>
						</select>

						<select id="codeGroup1" name="codeGroup" onChange="fn_changeMid(this)" style="display: none;">
							<option value="">선택</option>
							<c:forEach var="codeConfigFormList" items="${codeConfigFormList}" varStatus="status">
								<option value="${codeConfigFormList.codeGroup}" ${codeConfigFormList.codeGroup == codeResult.codeGroup ? 'selected="selected"' : ''}>${codeConfigFormList.groupDesc}</option>
							</c:forEach>
						</select>
					</td>
				</tr>

				<tr id="codeGroup2">
					<th>코드 그룹<span style="color:red;"> *</span></th>
					<td>
						<input type="text" style="width: 100%" name="codeGroup" id="codeGroupDetail" value="${codeResult.codeGroup}" maxlength="20">
					</td>
				</tr>

				<tr>
					<th>코 드<span style="color:red;"> *</span></th>
					<td>
						<input type="text" style="width: 100%" name="codeCode" id="codeCode" value="${codeResult.codeCode}" maxlength="15">
					</td>
				</tr>

				<tr>
					<th>코드명<span style="color:red;"> *</span></th>
					<td>
						<input type="text" style="width: 100%" name="codeName" id="codeName" value="${codeResult.codeName}" maxlength="15">
					</td>
				</tr>

				<tr>
					<th>코드영문명</th>
					<td>
						<input type="text" style="width: 100%" name="codeNameEng" id="codeNameEng" value="${codeResult.codeNameEng}">
					</td>
				</tr>

				<tr>
					<th>코드설명<span style="color:red;"> *</span></th>
					<td>
						<input type="text" style="width: 100%" name="groupDesc" id="groupDesc" value="${codeResult.groupDesc}" maxlength="30">
					</td>
				</tr>

				<tr>
					<th>코드순서<span style="color:red;"> *</span></th>
					<td>
						<input type="text" style="width: 100%" name="codeOrder" id="codeOrder" value="${codeResult.codeOrder}" maxlength="2">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</section>	

<section>
	<div class="text-right btn-area">
		<c:choose>
			<c:when test="${codeResult eq null}">
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_update('${codeResult.codeId}');" class="point">수정</button>
				<button type="button" onclick="fn_delete('${codeResult.codeId}');" class="point">삭제</button>
			</c:otherwise>
		</c:choose>
		<a href="${contextRoot}/adm/standinfo/code/list.do?menuId=${menuId}">목록</a>
	</div>
</section>
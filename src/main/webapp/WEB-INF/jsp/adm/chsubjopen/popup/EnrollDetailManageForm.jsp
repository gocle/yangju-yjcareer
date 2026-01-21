<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>

<style>
.red {color:red;}
.btn_blue {
	color: #FFF!important;
    background-color: #182142!important;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$.fn.numberOnly = function() {
	    $(this).keyup(function() {
	        this.value = this.value.replace(/[^0-9\.\-]/g, '');
	    });
	    $(this).blur(function() {
	        this.value = this.value.replace(/[^0-9\.\-]/g, '');
	    });
	}
	
	$(".numberOnly").numberOnly();
});

function fnCmdClose(){
	window.opener.location.reload();
	window.close();
}

function valid() {
	var memName = $("#memName").val();
	var sexdstn = $('input[name="sexdstn"]').is(":checked");
	var ageGroup = $("#ageGroup").val();
	var schoolNm = $("#schoolNm").val();
	var grade = $("#grade").val();
	var hpTel1 = $("#hpTel1").val();
	var hpTel2 = $("#hpTel2").val();
	var hpTel3 = $("#hpTel3").val();
	var zipcode = $("#zipcode").val();
	var address = $("#address").val();
	var resdncDetail = $("#resdncDetail").val();
	
	if(memName == "") {
		alert("이름을 입력해주세요.");
		return false;
	}
	
	if(!sexdstn) {
		alert("성별을 선택해주세요.");
		return false;
	}
	
	if(ageGroup == "") {
		alert("연령대를 선택해주세요.");
		return false;
	} else {
		if(ageGroup != "ADT"){
			if(schoolNm == "") {
				alert("학교를 입력해주세요.");
				return false;
			}
			if(grade == "") {
				alert("학년을 선택해주세요.");
				return false;
			}
		}	
	}
	
	if(hpTel1 == "" || hpTel2 == "" || hpTel3 == "") {
		alert("휴대전화를 입력해주세요.");
		return false;
	}
	
	if(zipcode == "" || address == "") {
		alert("주소를 입력해주세요.");
		return false;
	}
	
	if(resdncDetail == "") {
		alert("거주지를 선택해주세요.");
		return false;
	}
	
	return true;
}

function fnCmdUpdate() {
	if(valid()) {
		$.ajax({
			type: "post",
			url: "${contextRoot}/adm/chsubjopen/EnrollDetailManageUpdate.do",
			data: $("#detailForm").serialize(),
			success: function(result) {
				alert(result);
				fnCmdClose();
			},
			error: function() {
		        alert("수정 중 오류가 발생했습니다.");
		    }
		});
	}
}
</script>

<section>
	<div id="pop-wrapper">
		<div id="pop-header">
			<a href="#" onClick="javascript:fn_close();" class="btn">닫기</a>
		</div>
	
		<div id="pop-container" style="padding:10px;">
			<h3>교육생 등록</h3>
		
			<form id="detailForm" name="detailForm" method="post">
				<input type="hidden" id="seqCd" name="seqCd" value="${resultMap.seqCd }" />
				<input type="hidden" id="diKey" name="diKey" value="${userInfo.diKey }" />
				
				<table class="detail">
			  		<colgroup>
			        	<col width="15%" />
			       		<col width="35%" />
			       		<col width="15%" />
			       		<col width="35%" />
			      	</colgroup>
			      	<tbody>
			      		<tr>
				            <th>이름<span class="red"> *</span></th>
				            <td>
				            	<input type="text" id="memName" name="memName" style="width:100%;" maxlength="10" value="${userInfo.memName }" />
				            </td>
				            <th>성별<span class="red"> *</span></th>
				            <td>
					            <div class="radio_parent">
									<span class="temp_checkbox">
										<input name="sexdstn" id="sexdstn1" type="radio" value="M" ${userInfo.sexdstn eq 'M' ? 'checked':''} /><label for="sexdstn1">남</label>
									</span>&nbsp;&nbsp;
									<span class="temp_checkbox">
										<input name="sexdstn" id="sexdstn2" type="radio" value="W" required="required" ${userInfo.sexdstn eq 'W' ? 'checked':''} /><label for="sexdstn2">여</label>
									</span>
								</div>
				            </td>
			          	</tr>
			          	<tr>
			          		<th>연령대<span class="red"> *</span></th>
				            <td colspan="3">
								<select id="ageGroup" name="ageGroup" title="연령대 선택" class="select">
									<option value="" ${empty userInfo.ageGroup ? 'selected="selected"' : ''}>연령대 선택</option>
									<c:forEach var="age" items="${ageList}">
										<option value="${age.codeCode}" ${userInfo.ageGroup eq age.codeCode ? 'selected="selected"' : ''}>${age.codeName}</option>
									</c:forEach>
								</select>
			          		</td>
			          	</tr>
			          	<tr>
			          		<th>학교명</th>
			          		<td><input type="text" name="schoolNm" id="schoolNm" style="width:100%;" value="${userInfo.schoolNm }" /></td>
			          		<th>학년</th>
			          		<td colspan="3">
			          			<select id="grade" name="grade" title="학년 선택" class="select">
									<option value="" ${empty userInfo.grade ? 'selected="selected"' : ''}>학년 선택</option>
									<c:forEach var="grade" items="${gradeList}">
										<option value="${grade.codeCode}" ${userInfo.grade eq grade.codeCode ? 'selected="selected"' : ''}>${grade.codeName}</option>
									</c:forEach>
								</select>
			          		</td>
			          	</tr>
			          	<tr>
			          		<th>휴대전화<span class="red"> *</span></th>
				            <td colspan="3">
				            	<input type="text" id="hpTel1" name="hpTel1" size="3" maxlength="3" placeholder="010" value="${userInfo.hpTel1 }" class="numberOnly" />
				            	-
				            	<input type="text" id="hpTel2" name="hpTel2" size="4" maxlength="4" placeholder="0000" value="${userInfo.hpTel2 }" class="numberOnly" />
				            	-
				            	<input type="text" id="hpTel3" name="hpTel3" size="4" maxlength="4" placeholder="0000" value="${userInfo.hpTel3 }" class="numberOnly" />
				            	<div class="smsbox">
									<p class="point">※ 연락이 원활하도록 보호자의 연락처를 기재해주세요.</p>
									<span class="label">예약상황 문자 수신 여부&nbsp;&nbsp;</span>
									<span class="temp_checkbox">
										<input name="smsYn" id="smsYn" type="checkbox" value="Y" ${userInfo.smsYn eq 'Y' ? 'checked' : ''} title="예약상황 문자 수신 받음" />
									</span>
								</div>
							</td>
						</tr>
			          	<tr>
				            <th>주소<span class="red"> *</span></th>
				            <td colspan="3">
				            	<input type="text" name="zipcode" id="zipcode" value="${userInfo.zipcode}" title="우편번호" class="temp_textbox" readonly="readonly" placeholder="우편번호" /> 			
								<button type="button"  class="btn_blue" onclick="openDaumZipAddress();">도로명주소검색</button> <br/>
								<input id="address" name="address" placeholder="상세주소" class="temp_textbox margin_t_10 full_size" type="text" value="${userInfo.address}" size="50" maxlength="100"/>
								<input type="hidden" path="detailAdres" placeholder="상세주소" maxlength="250" size="50" class="temp_textbox margin_t_10 full_size" />
				            </td>
			          	</tr>
			          	<tr>
				            <th>거주지<span class="red"> *</span></th>
				            <td colspan="3">
				            	<select id="resdncDetail" name="resdncDetail" title="거주지 읍면동 선택" class="select" required="required">
									<option value="" ${empty userInfo.resdncDetail ? 'selected="selected"' : ''}>거주지 선택</option>
									<c:forEach var="resdn" items="${resdncList}">
										<option value="${resdn.codeCode}" ${userInfo.resdncDetail eq resdn.codeCode ? 'selected="selected"' : ''}>${resdn.codeName}</option>
									</c:forEach>
								</select>
				            </td>
			          	</tr>
			          	<tr>
				            <th>메모</th>
				            <td colspan="3">
				            	<textarea id="memo" name="memo" style="height:100px" maxlength="200">${userInfo.memo }</textarea>
				            	<div class="memobox">
									<p class="point">※ 신청자에는 실 수강자 이름을 적어주세요.</p>
								</div>
				            </td>
			          	</tr>
			      	</tbody>
			      </table>
			      
			      <div class="text-right btn-area">
			      	<c:if test="${cmd eq 'Update' }"><a href="javascript:;" onclick="fnCmdUpdate()">수정</a></c:if>
			      	<a href="javascript:fnCmdClose();">닫기</a>
				  </div>
			</form>
		</div>
	</div>
</section>

<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script nonce="NEOCMSSCRIPT">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				$("#zipcode").val(data.zonecode);
				$("#address").val(data.address);
				$("#detailAdres").focus();
				$("#detailAdres").show();
			}
		}).open();
	}
</script>

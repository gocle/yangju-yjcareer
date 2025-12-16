<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/staff/include/common.jsp" %>

<style>
.red {color:red;}
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

function fnCmdInsert() {
	if(valid()) {
		$.ajax({
			type: "post",
			url: "${contextRoot}/staff/chsubjopen/EnrollDetailManageInsert.do",
			data: $("#detailForm").serialize(),
			success: function(result) {
				alert(result);
				fnCmdClose();
			},
			error: function() {
		        alert("등록 중 오류가 발생했습니다.");
		    }
		});
	}
}

function fnCmdUpdate() {
	if(valid()) {
		$.ajax({
			type: "post",
			url: "${contextRoot}/staff/chsubjopen/EnrollDetailManageUpdate.do",
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
				<input type="hidden" id="memId" name="memId" value="${userInfo.memId }" />
				<input type="hidden" id="enrollNo" name="enrollNo" value="${userInfo.enrollNo }" />
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
				            	<select id="ageGroup" name="ageGroup" title="연령대 선택" class="select" required="required">
									<option value="" ${empty userInfo.ageGroup ? 'selected="selected"' : ''}>연령대선택</option>
									<option value="ELE" ${userInfo.ageGroup eq 'ELE' ? 'selected="selected"' : ''}>초등</option>
									<option value="MID" ${userInfo.ageGroup eq 'MID' ? 'selected="selected"' : ''}>중등</option>
									<option value="HIG" ${userInfo.ageGroup eq 'HIG' ? 'selected="selected"' : ''}>고등</option>
									<option value="ADT" ${userInfo.ageGroup eq 'ADT' ? 'selected="selected"' : ''}>성인</option>		
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
									<option value="1" ${userInfo.grade eq '1' ? 'selected="selected"' : ''}>1학년</option>
									<option value="2" ${userInfo.grade eq '2' ? 'selected="selected"' : ''}>2학년</option>
									<option value="3" ${userInfo.grade eq '3' ? 'selected="selected"' : ''}>3학년</option>
									<option value="4" ${userInfo.grade eq '4' ? 'selected="selected"' : ''}>4학년</option>	
									<option value="5" ${userInfo.grade eq '5' ? 'selected="selected"' : ''}>5학년</option>
									<option value="6" ${userInfo.grade eq '6' ? 'selected="selected"' : ''}>6학년</option>
									<option value="0" ${userInfo.grade eq '0' ? 'selected="selected"' : ''}>기타</option>
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
								<button type="button"  class="btn type2 small" onclick="openDaumZipAddress();">도로명주소검색</button> <br/>
								<input id="address" name="address" placeholder="상세주소" class="temp_textbox margin_t_10 full_size" type="text" value="${userInfo.address}" size="50" maxlength="100"/>
								<input type="hidden" path="detailAdres" placeholder="상세주소" maxlength="250" size="50" class="temp_textbox margin_t_10 full_size" />
				            </td>
			          	</tr>
			          	<tr>
				            <th>거주지<span class="red"> *</span></th>
				            <td colspan="3">
				            	<select id="resdncDetail" name="resdncDetail" title="거주지 읍면동 선택" class="select" required="required">
									<option value="" ${empty userInfo.resdncDetail ? 'selected="selected"' : ''}>거주지선택</option>
									<option value="A0101" ${userInfo.resdncDetail eq 'A0101' ? 'selected="selected"' : ''}>백석읍</option>
									<option value="A0102" ${userInfo.resdncDetail eq 'A0102' ? 'selected="selected"' : ''}>은현면</option>
									<option value="A0103" ${userInfo.resdncDetail eq 'A0103' ? 'selected="selected"' : ''}>남면</option>
									<option value="A0104" ${userInfo.resdncDetail eq 'A0104' ? 'selected="selected"' : ''}>광적면</option>
									<option value="A0105" ${userInfo.resdncDetail eq 'A0105' ? 'selected="selected"' : ''}>장흥면</option>
									<option value="A0106" ${userInfo.resdncDetail eq 'A0106' ? 'selected="selected"' : ''}>양주1동</option>
									<option value="A0107" ${userInfo.resdncDetail eq 'A0107' ? 'selected="selected"' : ''}>양주2동</option>
									<option value="A0108" ${userInfo.resdncDetail eq 'A0108' ? 'selected="selected"' : ''}>회천1동</option>
									<option value="A0109" ${userInfo.resdncDetail eq 'A0109' ? 'selected="selected"' : ''} >회천2동</option>
									<option value="A0110" ${userInfo.resdncDetail eq 'A0110' ? 'selected="selected"' : ''}>회천3동</option>
									<option value="A0111" ${userInfo.resdncDetail eq 'A0111' ? 'selected="selected"' : ''}>옥정1동</option>
									<option value="A0112" ${userInfo.resdncDetail eq 'A0112' ? 'selected="selected"' : ''}>옥정2동</option>
									<option value="A0113" ${userInfo.resdncDetail eq 'A0113' ? 'selected="selected"' : ''}>기타</option>			
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
			      	<c:if test="${cmd eq 'Insert' }"><a href="javascript:;" onclick="fnCmdInsert()">등록</a></c:if>
			      	<c:if test="${cmd eq 'Update' }"><a href="javascript:;" onclick="fnCmdUpdate()">수정</a></c:if>
			      	<a href="javascript:fnCmdClose();">닫기</a>
				  </div>
			</form>
		</div>
	</div>
</section>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
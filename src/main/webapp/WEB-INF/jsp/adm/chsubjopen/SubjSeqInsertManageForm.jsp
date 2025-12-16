<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">
var sessionCnt = 0;

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


function fnCmdAddSession() {
	var selSubjCd = $("#selSubjCd").val();
	
	if(selSubjCd == "") {
		alert("과정마스터를 선택해주세요.");
		return false;
	}
	
	fnCmdAddSeq('session');
}

function fnCmdAddSeq(name) {
	sessionCnt++;
	
	var oriSession = $("#" + name);
	if (oriSession.css("display") == "none") {
		oriSession.show();
    }
	
	var newSession = oriSession.clone();
	oriSession.css("display","none");
	newSession.attr("id", name + sessionCnt);
	
	newSession.find("input").each(function () {
		 var oldId = $(this).attr("id");
		 if (oldId != "") {
			 $(this).attr("id", oldId + sessionCnt);
		 }
   	});
	
	newSession.find("input").not("[id^='subjNm']").val("");
	oriSession.parent().append(newSession);
	
	$(".numberOnly").numberOnly();
}

function fnCmdDelSeq(name, obj) {
	$(obj).closest("table").remove();
	sessionCnt--;
}

function fnCmdSave() {
	if(valid()){
		// 모집기간
		$("[id^='enrollStartDtYear']").each(function(i) {
			var enrollStartDt = $(this).val();
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
    		$("#detailForm input[name=enrollStartDts]").eq(i).val(enrollStartDt);
		});
    	
		$("[id^='enrollEndDtYear']").each(function(i) {
			var enrollEndDt = $(this).val();
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
    		$("#detailForm input[name=enrollEndDts]").eq(i).val(enrollEndDt);
		});
		
		// 교육기간
		$("[id^='learnStartDtYear']").each(function(i) {
			var learnStartDt = $(this).val();
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
    		$("#detailForm input[name=learnStartDts]").eq(i).val(learnStartDt);
		});
    	
		$("[id^='learnEndDtYear']").each(function(i) {
			var learnEndDt = $(this).val();
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
    		$("#detailForm input[name=learnEndDts]").eq(i).val(learnEndDt);
		});
		
		$("#detailForm input[name=capacitys]").each(function(i) {
			if($.trim($("#detailForm input[name=capacitys]").eq(i).val()) == ""){
				$("#detailForm input[name=capacitys]").eq(i).val("0");
			}
		});
		
		$("#detailForm input[name=waitEnrollCnts]").each(function(i) {
			if($.trim($("#detailForm input[name=waitEnrollCnts]").eq(i).val()) == ""){
				$("#detailForm input[name=waitEnrollCnts]").eq(i).val("0");
			}
		});
		
    	$("#subjCd").val($("#selSubjCd").val());
    	
		$("#detailForm").attr("action", "SubjSeqManageInsert.do");
		$("#detailForm").submit();
	};
}

function valid() {
	var oriSession = document.getElementById("session");
    if (oriSession) {//복사하기 위한 table 완전 제거
    	oriSession.remove();
    }	
    
    var isValid = true;
    
    $("#detailForm input[name=subjNms]").each(function(i) {
    	if($("#detailForm select[name=selSubjCd]").val() == ""){
			alert("과정마스터를 선택해주세요.");
			isValid = false;
			return false;
		}
    	
    	if($.trim($("#detailForm input[name=subjNms]").eq(i).val()) == ""){
			alert("운영과정명을 입력해주세요.");
			isValid = false;
			return false;
		}
    	
    	if($.trim($("#detailForm input[name=sessionNms]").eq(i).val()) == ""){
			alert("기수를 입력해주세요.");
			isValid = false;
			return false;
		}
    	
    	// 모집기간
    	if($.trim($("#detailForm input[name=enrollStartDtYear]").eq(i).val()) == ""){
			alert("모집기간 시작일을 선택하세요.");
			isValid = false;
			return false;
		}
		
		if($.trim($("#detailForm input[name=enrollStartDtHH]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=enrollStartDtHH]").eq(i).val(), 10) >= 24){
				alert("모집기간 시작시간의 시는 0 ~ 23까지 입력 가능합니다.");
				isValid = false;
				return false;			
			}
		}
		
		if($.trim($("#detailForm input[name=enrollStartDtMI]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=enrollStartDtMI]").eq(i).val(), 10) >= 60){
				alert("모집기간 시작시간의 분은 0 ~ 59까지 입력 가능합니다.");
				isValid = false;
				return false;
			}
		}
		
		if($.trim($("#detailForm input[name=enrollEndDtYear]").eq(i).val()) == ""){
			alert("모집기간 종료일을 선택하세요.");
			isValid = false;
			return false;
		}
		
		if($.trim($("#detailForm input[name=enrollEndDtHH]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=enrollEndDtHH]").eq(i).val(), 10) >= 24){
				alert("모집기간 종료시간의 시는 0 ~ 23까지 입력 가능합니다.");
				isValid = false;
				return false;
			}
		}
		
		if($.trim($("#detailForm input[name=enrollEndDtMI]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=enrollEndDtMI]").eq(i).val(), 10) >= 60){
				alert("모집기간 종료시간의 분은 0 ~ 59까지 입력 가능합니다.");
				isValid = false;
				return false;
			}
		}
		
		var es = new Date($("#detailForm input[name=enrollStartDtYear]").eq(i).val()
				+ " "
				+ ($("#detailForm input[name=enrollStartDtHH]").eq(i).val() == "" ? "00" : $("#detailForm input[name=enrollStartDtHH]").eq(i).val())
				+ ":"
				+ ($("#detailForm input[name=enrollStartDtMI]").eq(i).val() == "" ? "00" : $("#detailForm input[name=enrollStartDtMI]").eq(i).val())
			);
		
		var ee = new Date($("#detailForm input[name=enrollEndDtYear]").eq(i).val()
				+ " "
				+ ($("#detailForm input[name=enrollEndDtHH]").eq(i).val() == "" ? "23" : $("#detailForm input[name=enrollEndDtHH]").eq(i).val())
				+ ":"
				+ ($("#detailForm input[name=enrollEndDtMI]").eq(i).val() == "" ? "59" : $("#detailForm input[name=enrollEndDtMI]").eq(i).val())
			);
	
		if(es.getTime() >= ee.getTime()){
			alert("모집기간 시작일시는 종료일시보다 같거나 클 수 없습니다.");
			isValid = false;
			return false;
		}
		
		// 교육기간
		if($.trim($("#detailForm input[name=learnStartDtYear]").eq(i).val()) == ""){
			alert("교육기간 시작일을 선택하세요.");
			isValid = false;
			return false;
		}
		
		if($.trim($("#detailForm input[name=learnStartDtHH]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=learnStartDtHH]").eq(i).val(), 10) >= 24){
				alert("교육기간 시작시간의 시는 0 ~ 23까지 입력 가능합니다.");
				isValid = false;
				return false;			
			}
		}
		
		if($.trim($("#detailForm input[name=learnStartDtMI]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=learnStartDtMI]").eq(i).val(), 10) >= 60){
				alert("교육기간 시작시간의 분은 0 ~ 59까지 입력 가능합니다.");
				isValid = false;
				return false;
			}
		}
		
		if($.trim($("#detailForm input[name=learnEndDtYear]").eq(i).val()) == ""){
			alert("교육기간 종료일을 선택하세요.");
			isValid = false;
			return false;
		}
		
		if($.trim($("#detailForm input[name=learnEndDtHH]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=learnEndDtHH]").eq(i).val(), 10) >= 24){
				alert("교육기간 종료시간의 시는 0 ~ 23까지 입력 가능합니다.");
				isValid = false;
				return false;
			}
		}
		
		if($.trim($("#detailForm input[name=learnEndDtMI]").eq(i).val()) != ""){
			if(parseInt($("#detailForm input[name=learnEndDtMI]").eq(i).val(), 10) >= 60){
				alert("교육기간 종료시간의 분은 0 ~ 59까지 입력 가능합니다.");
				isValid = false;
				return false;
			}
		}	
		
		var ls = new Date($("#detailForm input[name=learnStartDtYear]").eq(i).val()
				+ " "
				+ ($("#detailForm input[name=learnStartDtHH]").eq(i).val() == "" ? "00" : $("#detailForm input[name=learnStartDtHH]").eq(i).val())
				+ ":"
				+ ($("#detailForm input[name=learnStartDtMI]").eq(i).val() == "" ? "00" : $("#detailForm input[name=learnStartDtMI]").eq(i).val())
			);
		
		var le = new Date($("#detailForm input[name=learnEndDtYear]").eq(i).val()
				+ " "
				+ ($("#detailForm input[name=learnEndDtHH]").eq(i).val() == "" ? "23" : $("#detailForm input[name=learnEndDtHH]").eq(i).val())
				+ ":"
				+ ($("#detailForm input[name=learnEndDtMI]").eq(i).val() == "" ? "59" : $("#detailForm input[name=learnEndDtMI]").eq(i).val())
			);
	
		if(ls.getTime() >= le.getTime()){
			alert("교육기간 시작일시는 종료일시보다 같거나 클 수 없습니다.");
			isValid = false;
			return false;
		}
		
    });
    
    if(isValid){
    	return true;
    }
}

function fnCmdList() {
	$("#detailForm").attr("action", "SubjSeqManageList.do");
	$("#detailForm").submit();
}
</script>

<style>
.red {color:red;}
.btn_blue {
    color: #FFF!important;
    background-color: #182142!important;
}
</style>

<section>
	<form id="detailForm" name="detailForm" method="post">
 		<input type="hidden" name="menuId" id="menuId" value="${menuId }" />
 		<input type="hidden" name="subjCd" id="subjCd" value="" />
 		
 		<table class="detail">
 			<colgroup>
	        	<col width="15%" />
	       		<col width="35%" />
	       		<col width="15%" />
	       		<col width="35%" />
      		</colgroup>
      		<tbody>
      			<tr>
		            <th>과정마스터<span class="red"> *</span></th>
		            <td colspan="3">
		            	<select name="selSubjCd" id="selSubjCd" style="width:30%;">
                    		<option value="">과정마스터 선택</option>
	                    	<c:forEach var="row" items="${subjList}">
	                    		<option value="${row.subjCd}">[${row.subjCd}] ${row.subjNm}</option>
	                    	</c:forEach>
                    	</select>
		            </td>
	          	</tr>
      			<tr>
		            <th>교육강좌명<span class="red"> *</span></th>
		            <td colspan="3"><input type="text" id="subjNms" name="subjNms" style="width: 100%;"/></td>
	          	</tr>
	          	<tr>
	          		<th>기수<span class="red"> *</span></th>
	          		<td colspan="3">
	          			<input type="text" id="sessionNms" name="sessionNms" maxlength="3" class="numberOnly"/>
	          		</td>
	          	</tr>
	          	<tr>
	          		<th>모집기간<span class="red"> *</span></th>
	          		<td colspan="3">
	          			<input type="hidden" id="enrollStartDts" name="enrollStartDts"/>
	          			<input type="date" id="enrollStartDtYear" name="enrollStartDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()" />
	          			<input type="text" id="enrollStartDtHH" name="enrollStartDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />시
				        <input type="text" id="enrollStartDtMI" name="enrollStartDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />분   
	          			~	
	          			<input type="hidden" id="enrollEndDts" name="enrollEndDts"/>
	          		  	<input type="date" id="enrollEndDtYear" name="enrollEndDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		  	<input type="text" id="enrollEndDtHH" name="enrollEndDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="23" />시
				        <input type="text" id="enrollEndDtMI" name="enrollEndDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="59" />분   
	          		 </td>
	          	</tr>
	          	<tr>
	          		<th>교육기간<span class="red"> *</span></th>
	          		<td colspan="3">
	          			<input type="hidden" id="learnStartDts" name="learnStartDts"/>
	          			<input type="date" id="learnStartDtYear" name="learnStartDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          			<input type="text" id="learnStartDtHH" name="learnStartDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />시
				        <input type="text" id="learnStartDtMI" name="learnStartDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />분   
	          			~	
	          			<input type="hidden" id="learnEndDts" name="learnEndDts"/>
	          		  	<input type="date" id="learnEndDtYear" name="learnEndDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		  	<input type="text" id="learnEndDtHH" name="learnEndDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="23" />시
				        <input type="text" id="learnEndDtMI" name="learnEndDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="59" />분   
	          		 </td>
	          	</tr>
	          	<tr>
	          		<th>모집인원</th>
	          		<td><input type="text" id="capacitys" name="capacitys" maxlength="3" value="0" class="numberOnly"/>&nbsp;명</td>
	          		<th>대기인원</th>
	          		<td><input type="text" id="waitEnrollCnts" name="waitEnrollCnts" maxlength="3" value="0" class="numberOnly"/>&nbsp;명</td>
	          	</tr>	
      		</tbody>
 		</table>
 		
 		<div class="text-right btn-area" style="margin-top: 20px;">
      		<a href="javascript:;" onclick="fnCmdAddSession();">기수 추가</a>
      	</div>
      	
      	<table class="detail" id="session" style="display:none; margin-top: 20px;">
      		<colgroup>
	        	<col width="15%" />
	       		<col width="35%" />
	       		<col width="15%" />
	       		<col width="35%" />
      		</colgroup>
      		<tbody>
      			<tr>
			       	<th>교육강좌명<span class="red"> *</span></th>
			            <td colspan="3"><input type="text" id="subjNms" name="subjNms" value="${resultMap.subjNm }" style="width: 100%;"/></td>
		          	</tr>
	          	<tr>
	          		<th>기수<span class="red"> *</span></th>
	          		<td colspan="3">
	          			<input type="text" id="sessionNms" name="sessionNms" value="${resultMap.subjNm }" maxlength="3" class="numberOnly"/>
	          			&nbsp;<button type="button" onclick="fnCmdDelSeq('session', this);" class="btn_blue">기수 삭제</button>
	          		</td>
	          	</tr>
	          	<tr>
	          		<th>모집기간<span class="red"> *</span></th>
	          		<td colspan="3">
	          			<input type="hidden" id="enrollStartDts" name="enrollStartDts"/>
	          			<input type="date" id="enrollStartDtYear" name="enrollStartDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          			<input type="text" id="enrollStartDtHH" name="enrollStartDtHH" size="3" maxlength="2" value="" class="numberOnly"/>시
				        <input type="text" id="enrollStartDtMI" name="enrollStartDtMI" size="3" maxlength="2" value="" class="numberOnly"/>분   
	          			~	
	          			<input type="hidden" id="enrollEndDts" name="enrollEndDts"/>
	          		  	<input type="date" id="enrollEndDtYear" name="enrollEndDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		  	<input type="text" id="enrollEndDtHH" name="enrollEndDtHH" size="3" maxlength="2" value="" class="numberOnly"/>시
				        <input type="text" id="enrollEndDtMI" name="enrollEndDtMI" size="3" maxlength="2" value="" class="numberOnly"/>분   
	          		 </td>
	          	</tr>
	          	<tr>
	          		<th>교육기간<span class="red"> *</span></th>
	          		<td colspan="3">
	          			<input type="hidden" id="learnStartDts" name="learnStartDts"/>
	          			<input type="date" id="learnStartDtYear" name="learnStartDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          			<input type="text" id="learnStartDtHH" name="learnStartDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />시
				        <input type="text" id="learnStartDtMI" name="learnStartDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="00" />분   
	          			~	
	          			<input type="hidden" id="learnEndDts" name="learnEndDts"/>
	          		  	<input type="date" id="learnEndDtYear" name="learnEndDtYear" onclick="this.showPicker ? this.showPicker() : this.focus()"/>
	          		  	<input type="text" id="learnEndDtHH" name="learnEndDtHH" size="3" maxlength="2" value="" class="numberOnly" placeholder="23" />시
				        <input type="text" id="learnEndDtMI" name="learnEndDtMI" size="3" maxlength="2" value="" class="numberOnly" placeholder="59" />분   
	          		 </td>
	          	</tr>
	          	<tr>
	          		<th>모집인원</th>
	          		<td><input type="text" id="capacitys" name="capacitys" maxlength="3" value="" class="numberOnly"/>명</td>
	          		<th>대기인원</th>
	          		<td><input type="text" id="waitEnrollCnts" name="waitEnrollCnts" maxlength="3" value="" class="numberOnly"/>명</td>
	          	</tr>
	    	</tbody>
      	</table>
 	</form>
 	
 	<!-- 버튼 영역 -->
    <div class="text-right btn-area" style="margin-top: 20px;">
		<a href="javascript:;" onclick="fnCmdSave()">등록</a>
		<a href="javascript:fnCmdList();">목록</a>
	</div>
</section>


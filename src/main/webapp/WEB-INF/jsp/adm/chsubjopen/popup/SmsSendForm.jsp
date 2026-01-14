<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>

<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sms.css?v=20260114">

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
	
	$("#msg").on("input", function () {
		var text = $(this).val();
	    var len = text.length;

	    $("#msgLen").text(len);
	});
	
	$('.sms-recipient h4 span').html(' ('+ $('[name=phones]:checked').length +')');
	
	$('[name=phones]').on('change', function () {
		$('.sms-recipient h4 span').html(' (' + $('[name=phones]:checked').length + ')');
	});
});

function fnCmdClose(){
	window.opener.location.reload();
	window.close();
}

function fnCmdSend() {
	if($("#callback1").val().trim() == "" || $("#callback2").val().trim() == "" || $("#callback3").val().trim() == ""){
		alert("발신번호를 입력해주세요.");
		return false;
	}
	
	$("#callback").val($("#callback1").val().trim() + $("#callback2").val().trim() + $("#callback3").val().trim());
	
	if ($('[name=phones]:checked').length < 1) {
        alert("받는 사람을 1명 이상 선택해주세요.");
        return false;
    }
	
	if($("#msg").val().trim() == "") {
		alert("내용을 입력해주세요.");
		return false;
	}
	
	if(confirm("발송하시겠습니까?")) {
		$.ajax({
			type: "post",
			url: "${contextRoot}/sms/smsSend.do",
			data: $("#detailForm").serialize(),
			success: function(result) {
				alert(result);
				fnCmdClose();
			},
			error: function() {
		        alert("발송 중 오류가 발생했습니다.");
		    }
		});
	}
}
</script>

<section>
	<div id="pop-wrapper">
		<div id="pop-container" style="padding:10px;">
			<h2 style="padding-bottom:10px;">문자 발송</h2>
			<form id="detailForm" name="detailForm" method="post">
				<div class="smsCon">
					<div class="sms-contents">
						<div class="sms-text">
	                		<textarea placeholder="최대 4,000자까지 입력 가능합니다." name="msg" id="msg" maxlength="4000"></textarea>
            			</div>
						
						<div class="sms-comment">
			                <p>SMS 45자 이하 / MMS 4,000자 이하</p>
			                <p><label id="msgLen" style="font-weight:bold;font-size:16px;">0</label> / 4000자</p>
			            </div>
            
            			<div class="sms-sender">
			                <label for="smsRecipient">발신번호<label>
			                <input type="hidden" id="callback" name="callback" />
				            <input type="text" id="callback1" name="callback1" size="3" maxlength="3" class="numberOnly" placeholder="031"/>
				    		<span>-</span>
				    		<input type="text" id="callback2" name="callback2" size="4" maxlength="4" class="numberOnly" placeholder="0000"/>
				    		<span>-</span>
				    		<input type="text" id="callback3" name="callback3" size="4" maxlength="4"  class="numberOnly" placeholder="0000"/>
			            </div>
            			
            			<div class="btnCon">
			                <a href="javascript:;" onclick="fnCmdSend()">발송</a>
			            </div>
					</div>
					
				 	<div class="sms-recipient">
				 		<h4>받는 사람 <span></span></h4>
				 		<div class="recip-inner">
				 			<ul class="recip-list">
				 				<c:forEach var="item" items="${resultList}">
				 					<li><label>
				            		<input type="checkbox" name="phones" id="phones" value="${item.hpTel1}${item.hpTel2}${item.hpTel3}" ${not empty item.hpTel1 and not empty item.hpTel2 and not empty item.hpTel3 ? 'checked' : 'disabled'}>
									&nbsp;${item.memName }&nbsp;${item.hpTel1 }${item.hpTel2 }${item.hpTel3 }&nbsp;(문자 수신 여부 <input name="smsYn" id="smsYn" type="checkbox" value="Y" ${item.smsYn eq 'Y' ? 'checked' : ''} disabled/>)<br/>
									</label></li>
								</c:forEach>
							</ul>
				 		</div>
				 	</div>
				</div>
			</form>
		</div>
	</div>
</section>
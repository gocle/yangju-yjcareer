<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />


<!--일단 추가 추후에 common으로옮기던가  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}
</style>

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function memTypeChange() {
			if($("#memType").val() == "STAFF") {
				$(".comOnlyTr").show();
			}else {
				$(".comOnlyTr").hide();
			}
		}
		
		memTypeChange();
		
		$("#memType").on("change", function () {
			memTypeChange();
		});
		
		$("#startDate, #endDate").on("change", function() {
	        validateDates();
	    });
	});

	//아이디 DB 여부
	function valiId() {

		var memId = $("#memId").val();

		//아이디 정규식
		var idReg = /^[A-za-z0-9]{5,12}$/g;

		//아이디 입력여부 검사
		if (memId == "") {
			alert("아이디를 입력하지 않았습니다.")
			memId.focus();
			return false;
		}
		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
		if (!idReg.test(memId)) {
			$("#notId").html("[ 아이디는 5~12자까지  영문 대소문자, 숫자만 입력가능합니다. ]");
			$("#memId").val("");
			$("#memId").focus();
			$("#memId").select();
			return false;
		}

		//아이디에 공백 사용하지 않기
		if ($("#memId").val().indexOf(" ") >= 0) {
			$("#notId").html("[ 아이디에 공백을 사용할 수 없습니다. ]");
			$("#memId").val("");
			$("#memId").focus();
			$("#memId").select()
			return false;
		}

		$.ajax({

			url : "${contextRoot}/adm/member/idForm.do",
			type : "post",
			data : {
				"memId" : memId,
			},
			success : function(data) {
				if (data) {

					$("#notId").empty();
					$("#notId").html("[ 등록된 아이디가 있습니다. ]");
					$("#memId").val("");

				} else {
					$("#notId").empty();
					$("#notId").html("[ 정상 입력된 아이디입니다. ]");
					$("#memId").val(memId);
					$("#memPassword").focus();

				}
			},
			error : function(xhr, status, error) {
			}
		});

	}

	//등록하기
	function fn_save() {
		var idReg = /^[A-za-z0-9]{5,12}$/g;
		var passReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{9,20}$/;
		var nameReg = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var memId = $("#memId").val();
		var memPassword = $("#memPassword").val();
		var memPasswordRe = $("#memPasswordRe").val();
		var memName = $("#memName").val();
		var email = $("#email").val();
		
		if (memId == "") {
			alert("아이디를 입력하지 않았습니다.")
			memId.focus();
			return false;
		}

		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
		if (!idReg.test(memId)) {
			$("#notId").html("[ 아이디는 5~12자까지  영문 대소문자, 숫자만 입력가능합니다. ]");
			$("#memId").val("");
			$("#memId").focus();
			$("#memId").select();
			return false;
		}

		//아이디에 공백 사용하지 않기
		if ($("#memId").val().indexOf(" ") >= 0) {
			$("#notId").html("[ 아이디에 공백을 사용할 수 없습니다. ]");
			$("#memId").val("");
			$("#memId").focus();
			$("#memId").select()
			return false;
		}

		//비밀번호 입력여부 검사
		if (memPassword == "" || memPassword == "") {
			$("#notPass").empty();
			$("#notPass").html("[ 비밀번호를 입력하지 않았습니다. ]");
			$("#memPassword").val("");
			$("#memPasswordRe").val("");
			return false;
		}

		if (!passReg.test(memPassword)) {
			$("#notPass").empty();
			$("#notPass").html("[ 잘못된 비밀번호 입니다.9자 이상 20자 이내 영문 대문자,소문자,특수문자 포함해 입력하세요. ]");
			$("#memPassword").val("");
			$("#memPassword").focus();
			$("#memPassword").select();
			return false;
		}

		if (!passReg.test(memPasswordRe)) {
			$("#notPass").empty();
			$("#notPass1").empty();
			$("#notPass").html("[ 잘못된 비밀번호 입니다.9자 이상 20자 이내 영문 대문자,소문자,특수문자 포함해 입력하세요. ]");
			$("#memPasswordRe").val("");
			$("#memPasswordRe").focus();
			$("#memPasswordRe").select();
			return false;
		}

		//////////비밀번호가 일치하지않을때.
		if (memPassword != memPasswordRe) {
			$("#notPass").empty();
			$("#notPass1").empty();
			$("#notPass1").html("[비밀번호가 일치하지 않습니다.]");
			$("#memPasswordRe").val("");
			$("#memPasswordRe").focus();
			$("#memPasswordRe").select();
			return false;
		}

		//이름 유효성
		if (nameReg.test(memName)) {
			alert("유효하지 않은 이름입니다.");
			memName = $("#memName").val("");
			memName.focus();
			return false;
		}

		//이름 입력여부 검사
		if (memName == "") {
			alert("유효하지 않은 이름입니다.")
			memName = $("#memName").val("");
			memName.focus();
			return false;
		}

		//이메일 입력여부 검사
		if (email == "") {
			alert("이메일을 입력해주세요.");
			$("#notEml").empty();
			email = $("#email").val("");
			email.focus();
			return false;
		}

		//이메일 입력여부 검사
		if (!emailRule.test(email)) {
			$("#notEml").empty();
			$("#notEml").html('[ 잘못된 이메일 주소 형식입니다. ]');
			email = $("#email").val("");
			email.focus();
			return false;
		}
		console.log($("#form").serialize());
		$("#form").attr("action", "${contextRoot}/adm/member/memconfig/insertForm.do");
		$("#form").attr("target", "_self");
		$("#form").submit();
	}

	//회원 수정
	function fn_update( ) {

		var siteId = $('#siteId').val();
		var idReg = /^[A-za-z0-9]{5,12}$/g;
		var passReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{9,20}$/;
		var nameReg = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    var hpNoReg = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		var regExp = /^[0-9]*$/;
		var hpNo = $("#hpNo").val();
		var email = $("#email").val();
		var deptNo = $("#deptNo").val();
		var copNm = $("#copNm").val();
		var copNo = $('#copNo').val();
		var copCeoNm = $("#copCeoNm").val();
		var copTelNo = $("#copTelNo").val();
		var copType = $('input:radio[name=copType]').is(':checked');
		var sumAddress = $("#sumAddress").val();
		var addressDtl = $("#addressDtl").val();
		//이메일 입력여부 검사
		if (email == "") {
			alert("이메일을  입력해주세요");
			$("#notEml").empty();
			email = $("#email").val("");
			email.focus();
			return false;
		}

		//이메일 입력여부 검사
		if (!emailRule.test(email)) {
			$("#notEml").empty();
			$("#notEml").html('[ 잘못된 이메일 주소 형식입니다. ]');
			email = $("#email").val("");
			email.focus();
			return false;
		}
		
		$("#form").attr("action", "${contextRoot}/adm/member/memconfig/update.do");
		$("#form").attr("target", "_self");
		$("#form").submit();
	}
	
	//회원 삭제
	function fn_delete( memId ){
		var memId = $('#memId').val(memId);
		$("#form").attr("action", "${contextRoot}/adm/member/memconfig/delete.do");
		$("#form").attr("target","_self");
		$("#form").submit();
	}

	function validateDates() {
		let startDate = $("#startDate").val();
		let endDate = $("#endDate").val();
		
		if (startDate && endDate && startDate > endDate) {
	        alert("접속 허용 종료일은 시작일보다 빠를 수 없습니다.");
	        $("#endDate").val(startDate).focus(); 
	        return false;
	    }
	}
</script>

<style>
.red {color:red;}
</style>

<section>
	<form id="form" name="form" method="post">
		<input type="hidden" id="menuId" name="menuId" value="${menuId }" />

		<table class="detail">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody>
						<tr>
							<th>분 류<span class="red"> *</span></th>
							<td>
								<select id="memType" name="memType" style="width: 30%">
									<option value="ADM" ${adminUpdateResult.memType eq 'ADM' or adminUpdateResult.memType eq null ? 'selected="selected"' : ''}>슈퍼관리자</option>
									<option value="OPR" ${adminUpdateResult.memType eq 'OPR' ? 'selected="selected"' : ''}>운영담당자</option>
									<option value="STAFF" ${adminUpdateResult.memType eq 'STAFF' ? 'selected="selected"' : ''}>기관담당자</option>
								</select>
							</td>
						</tr>
						<tr class="comOnlyTr" style="display:none;">
							<th>기 관<span class="red"> *</span></th>
							<td>
								<select id="comId" name="comId" style="width: 30%" value="${adminUpdateResult.comId }">
									<c:forEach var="com" items="${companyList}">
										<option value="${com.comId }" ${adminUpdateResult.comId == com.comId ? 'selected : "selected"' : ''}>${com.comTitle }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>관리자 아이디<span class="red"> *</span></th>
							<td><input type="text" style="width: 50%" name="memId"
								id="memId" value="${adminUpdateResult.memId}" maxlength="12" ${adminUpdateResult.memId ne null ? 'readonly="readonly"' : ''}> <span id="notId"></span>
								<c:if test="${empty adminUpdateResult}">
									<button type="button" class="" onclick="valiId();">중복확인</button>
								</c:if>
							</td>
						</tr>
						<c:if test="${empty adminUpdateResult}">
							<tr>
								<th>관리자 비밀번호<span class="red"> *</span></th>
								<td><input type="password" style="width: 50%"
									name="memPassword" id="memPassword" value="" maxlength="20" >
									<span id="notPass"></span></td>
							</tr>
							<tr>
								<th>비밀번호 확인<span class="red"> *</span></th>
								<td><input type="password" style="width: 50%"
									id="memPasswordRe" value="" maxlength="20"> <span
									id="notPass1"></span></td>
							</tr>
						</c:if>
						<c:if test="${not empty adminUpdateResult}">
							<tr>
								<th>관리자 비밀번호<span class="red"> *</span></th>
								<td><input type="password" style="width: 50%"
									name="memPassword" id="memPassword" value="" maxlength="20" >
									<b style="font-size:14px; color:red;">*비밀민호 변경시 입력해주세요.</b></td>
							</tr>
						</c:if>
						<tr>
							<th>관리자 이름<span class="red"> *</span></th>
							<td><input type="text" style="width: 50%" name="memName"
								id="memName" value="${adminUpdateResult.memName }" ${adminUpdateResult.memName ne null ? 'readonly="readonly"' : ''}></td>
						</tr>
						<tr>
							<th>관리자 이메일<span class="red"> *</span></th>
							<td><input type="text" style="width: 50%" name="email"
								id="email" value="${adminUpdateResult.decryptEmail }"> <span id="notEml"></span></td>
						</tr>
						<tr>
							<th>관리자 부서</th>
							<td><input type="text" style="width: 50%" name="deptNm" id="deptNm" value="${adminUpdateResult.deptNm }"></td>
						</tr>
						<tr>
							<th>접속허용기간</th>
							<td><input type="date" style="width: 20%" name="startDate" id="startDate" value="${adminUpdateResult.startDate }" onclick="this.showPicker ? this.showPicker() : this.focus()">
								~ <input type="date" style="width: 20%" name="endDate" id="endDate" value="${adminUpdateResult.endDate }" onclick="this.showPicker ? this.showPicker() : this.focus()">
							</td>
						</tr>
						<tr>
							<th>허용 아이피</th>
							<td><input type="text" style="width: 50%" name="permitIp" id="permitIp" value="${adminUpdateResult.permitIp }" placeholder="예: 192.168.0.10" />
							</td>
						</tr>
						<c:if test="${not empty adminUpdateResult}">
							<tr>
								<th>등록일</th>
								<td>${adminUpdateResult.regDt }</td>
							</tr>
							<tr>
								<th>수정일</th>
								<td>${adminUpdateResult.updDt }</td>
							</tr>
							<tr>
								<th>최근 로그인</th>
								<td>${adminUpdateResult.lastLoginYmd }</td>
							</tr>
						</c:if>
			</tbody>
		</table>
	</form>
</section>

<section>

	<div class="text-right btn-area">



		<c:choose>
			<c:when test="${adminUpdateResult eq null}">
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_update();"
					class="point">수정</button>
				<button type="button" onclick="fn_delete('${adminUpdateResult.memId}');"
					class="point">삭제</button>
			</c:otherwise>
		</c:choose>
		<a href="${contextRoot}/adm/member/memconfig/list.do?menuId=${menuId}">목록</a>
	</div>

</section>


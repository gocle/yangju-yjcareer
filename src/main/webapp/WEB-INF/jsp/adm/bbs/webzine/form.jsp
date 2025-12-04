<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = [];

 $(document).ready(function() {
	
	
	initEditor();	 
}); 

function initEditor() {
	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "/smarteditor/SmartEditor2Skin.html",	
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


function fn_save(){
	if (!validateForm()) return;
	
	if (!confirm("등록하시겠습니까?")) {
        return false; // 사용자가 [취소] 누르면 저장 안 함
    }
	
	/* if($("#baContentHtml").val() == ""){
		
		alert("내용을 입력 하세요");
		
		$("#baContentHtml").focus();
		
		return false;
	}  */
	
	var siteId = $("#siteId").val();
	
	var menuId = $("#menuId").val();
	
	/* var data =oEditors.getById["content"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	

	
	$("#content").val(data); */
	
	
	var pathId = "${boardConfigVO.bcId}";
	
	$("#form").attr("action", "/"+siteId+"/admin/bbs/"+pathId+"/insert.do");
	
	$("#form").attr("target","_self");
	
	$("#form").submit();
	
}

function fn_update() {
	if (!validateForm()) return;
	
	if (!confirm("수정하시겠습니까?")) {
        return false; // 사용자가 [취소] 누르면 저장 안 함
    }
	
	/* var data =oEditors.getById["content"].getIR();
	
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	} */
	
	
	var siteId = $("#siteId").val();
	
	var menuId = $("#menuId").val();
	
/* 
	
	$("#content").val(data); */
	
	var pathId = "${boardConfigVO.bcId}";
	
	var baId= "${boardArticleVO.baId}";
	
	$("#form").attr("action", "/"+siteId+"/admin/bbs/"+pathId+"/update.do?menuId="+menuId);
	$("#form").attr("target","_self");
	$("#form").submit();
	
}

//유효성 검사 함수
function validateForm() {
	var title = $("#baTitle").val();
	
	if (title.trim() === "") {
	    alert("제목을 입력 하세요");
	    $("#baTitle").focus();
	    return false;
	}
    
    var siteId = $("#siteId").val();
    
    if (siteId === "cndual") {
    	var ceoNm = $("#ceoNm").val();
    	var comHistory = $("#comHistory").val();
    	var sales = $("#sales").val();
    	var empCnt = $("#empCnt").val();
    	var degreeSelect = $("input[name='degreeSelect']:checked")
        .map(function () {
            return this.value;
        }).get();
    	
    	if (ceoNm.trim() === "") {
            alert("대표자를 입력 하세요");
            $("#ceoNm").focus();
            return false;
        }
    	if (comHistory.trim() === "") {
            alert("설립일자를 입력 하세요");
            $("#comHistory").focus();
            return false;
        }
    	if (sales.trim() === "") {
            alert("매출액을 입력 하세요");
            $("#sales").focus();
            return false;
        }
    	if (empCnt.trim() === "") {
            alert("종업원수를  입력 하세요.");
            $("#empCnt").focus();
            return false;
        }
    	if (degreeSelect.length === 0) {
            alert("학위를 입력 하세요");
            $("#degreeSelect").focus();
            return false;
        }
    	
    	// 회사이력 유효성 검사
    	const dateList = document.getElementsByName("historyDate");
    	const infoList = document.getElementsByName("historyInfo");

    	// YYYY 또는 YYYY.MM 또는 YYYY.MM.DD 허용
    	const dateRegex = /^\d{4}(\.(0[1-9]|1[0-2])(\.(0[1-9]|[12][0-9]|3[01]))?)?$/;

    	for (var i = 0; i < dateList.length; i++) {
    	    const date = dateList[i].value.trim();
    	    const info = infoList[i].value.trim();

    	    // 하나만 입력된 경우
    	    if ((date && !info) || (!date && info)) {
    	        alert("회사 이력의 연도와 주요내용은 모두 입력해야 합니다.");
    	        if (!date) dateList[i].focus();
    	        else infoList[i].focus();
    	        return false;
    	    }

    	    // 형식이 잘못된 경우
    	    if (date && !dateRegex.test(date)) {
    	    	alert("연도는 YYYY, YYYY.MM 또는 YYYY.MM.DD 형식으로 입력해야 합니다. 예: 2024, 2024.07, 2024.07.22");
    	        dateList[i].focus();
    	        return false;
    	    }
    	}
    }

    return true;
}


//목록
function fn_list() {
	
		
		var bcId = $("#searchform_bcId").val();
		
		var menuId = $("#searchform_menuId").val();
		
		var siteId = $("#siteId").val();
		
		
		$("#searchform").attr("action", "/"+siteId+"/admin/bbs/"+bcId+"/list.do?menuId="+menuId);
		$("#searchform").attr("method", "get");
		$("#searchform").submit();
		
}

//company 삭제하기
function fn_delete(){
	
	
	var siteId = $('#siteId').val();
	
	var menuId = $("#menuId").val();
	
	var pathId = "${boardConfigVO.bcId}";
	
	var baId= "${boardArticleVO.baId}";
	
	var pathId = "${boardConfigVO.bcId}";
	
	$("#form").attr("action", "/"+siteId+"/admin/bbs/"+pathId+"/delete.do?menuId="+menuId);
	
	$("#form").attr("target","_self");
	
	$("#form").submit();
}




//삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl){
	
	
	var menuId = $("#menuId").val();
	
	$("#atchFileIdx").val(atchFileIdx);
	
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "/board/deleteFile.do");
	
	$("#fileForm").submit();
	
	
}

//수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	
	
	var menuId = $("#menuId").val();
	
	
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "/board/updateFile.do");
	$("#fileForm").submit();
	
	
}

/* 다음라이브러리를 통한 도로명 검색 팝업 호출 */
function fn_goSearchDoroCodePop(){
   new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
           // document.getElementById("zipCode").value = data.postcode; //6자리 우편번호 사용
            //document.getElementById("zipCode").value = data.zonecode; //5자리 기초구역번호 사용
            //document.getElementById("address").value = fullAddr;
            
            $("#zipCode").val(data.zonecode);
            $("#address").val(fullAddr);

            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("addressDtl").focus();
            $("#addressDtl").focus().val("");
        }
    }).open();
}

</script>
	<section>
	<form id="searchform" name="searchform" method="post">
			<input type="hidden" id="searchform_menuId" name="menuId" value="<c:out value='${menuId}'/>" /> 
			<input type="hidden" id="searchform_baId" name="baId" value="${boardArticleVO.baId}">
			<input type="hidden" id="searchform_bcId" name="bcId" value="${boardConfigVO.bcId}" >
			<input type="hidden" id="#searchform_siteId" name="searchform_siteId" value="${siteId}" >
			</form>
	
	<form id="fileForm" name="fileForm" method="post">
		<input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		<input type="hidden" name="returnUrl" id="returnUrl" />
		<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
		<input type="hidden" id="siteId" name="siteId" value="${siteId }" />
	</form>

		<form id="form" name="form" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" /> 
			<input type="hidden" id="baId" name="baId" value="${boardArticleVO.baId}">
			<input type="hidden" id="bcId" name="bcId" value="${boardConfigVO.bcId}" >
			<input type="hidden" id="siteId" name="siteId" value="${siteId}" />
			
				<h3>기업 현황</h3>
				<!-- 기업 현황 -->
				<table class="detail">
				  <colgroup>
				  <col width="15%">
				  <col width="35%">
				  <col width="15%">
				  <col width="35%">
				  </colgroup>
				  <tbody>
					<tr>
						<th>기관명</th>
						<td>
						<input type="text" style="width: 100%" name="comTitle" id="comTitle" value="${boardArticleVO.baTitle}">
						</td>
						<th>협약 기관 주소</th>
						<td>
						<span>우편번호</span>&nbsp;&nbsp;<input type="text"  style="width: 20%" name="zipCode" id="zipCode" value="${boardArticleVO.zipCode}" readonly="readonly"><br/>
						<span>주  소</span>&nbsp;&nbsp;<input type="text" style="width: 50%" name="address" id="address" value="${boardArticleVO.address}" readonly="readonly"><br/>
						<span>상세주소</span>&nbsp;&nbsp;<input type="text" style="width: 50%" name="addressDtl" id="addressDtl" value="${boardArticleVO.addressDtl}">
						&nbsp;<button class="type-4" onclick="javascript:fn_goSearchDoroCodePop( ); return false">도로명검색</button>
						</td>
					</tr>
					<tr>
						<th>기관소개</th>
						<td>
						<input type="text" style="width: 100%" name="comIntro" id="comIntro" value="${boardArticleVO.baTitle}">
						</td>
						<th>사용여부</th>
						<td>
							<label>
				              <input type="radio" name="useYn" value="Y"
				                     <c:if test="${empty boardArticleVO.useYn or boardArticleVO.useYn eq 'Y'}">checked="checked"</c:if> />
				              사용
				            </label>
				            &nbsp;&nbsp;
				            <label>
				              <input type="radio" name="useYn" value="N"
				                     <c:if test="${boardArticleVO.useYn eq 'N'}">checked="checked"</c:if> />
				              미사용
				            </label>
						</td>
					</tr>
				  </tbody>
				</table>
				
				<h3>기관 장소</h3> <!-- <button type="button" onclick="addHistoryRow()">이력 추가</button> -->
				<p style="text-align: right; margin-top: 10px;">
					<button type="button" style="display: inline-block; font-size: 12px;color: #FFF;border: none; padding: 3px 8px; background-color: black;" onclick="addHistoryRow()" class="type-3">장소 추가</button>
				</p>
				<table class="detail" id="historyTable">
				  <colgroup>
				  <col width="15%">
				  <col width="35%">
				  <col width="15%">
				  <col width="35%">
				  </colgroup>
				  <tbody>
				  	<c:if test = "${empty selectCompanyHistory}">
				    <tr>
					    <th>장소 명</th>
					    <td><input type="text" name="historyDateList" value="" style="width:50%"></td>
					    <th>주소</th>
					    <td>
					    <input type="text" name="historyInfoList" value="" style="width:50%">
					    <button type="button" style="background-color: black;" class="point" onclick="removeRow(this)">삭제</button>
					    </td>
				    </tr>
				    <c:if test = "${!empty selectCompanyHistory}">
				    <c:forEach var="list" items="${selectCompanyHistory}" varStatus="status"> 
				    <tr>
					    <th>연도</th>
					    <td><input type="text" name="historyDateList" value="${list.historyDate}" style="width:50%"></td>
					    <th>주요내용</th>
					    <td style="display: flex; align-items: center; gap: 8px;">
					    <input type="text" name="historyInfoList" value="${list.historyInfo}" style="width:50%">
					    <div>
						    <p>
								<button type="button" style="background-color: black;" class="point" onclick="removeRow(this)"><i class="fa fa-remove"></i> 삭제</button>
								<button type="button" style="background-color: black;" title="위로 이동" onclick="rowUp(this)"><i class="fa fa-arrow-up" ></i><span>위로 이동</span></button>
								<button type="button" style="background-color: black;" title="아래로 이동" onclick="rowDown(this)"><i class="fa fa-arrow-down" ></i><span>아래로 이동</span></button>
							</p>
						</div>
					    </td>
				    </tr>
				    </c:forEach>
				    </c:if>
				  </tbody>
				</table>
				
				<script>
				function addHistoryRow() {
					let row = '<tr>';
					row += '<th>연도</th>';
					row += '<td><input type="text" name="historyDateList" style="width:50%"></td>';
					row += '<th>주요내용</th>';
					row += '<td style="display: flex; align-items: center; gap: 8px;"><input type="text" name="historyInfoList" style="width:50%">';
					row += '	<div>';
					row += '		<p>';
					row += '			<button type="button" style="background-color: black;" class="point" onclick="removeRow(this)"><i class="fa fa-remove"></i> 삭제</button>';
					row += '			<button type="button" style="background-color: black;" title="위로 이동" onclick="rowUp(this)"><i class="fa fa-arrow-up"></i> <span>위로 이동</span></button>';
					row += '			<button type="button" style="background-color: black;" title="아래로 이동" onclick="rowDown(this)"><i class="fa fa-arrow-down"></i> <span>아래로 이동</span></button>';
					row += '		</p>';
					row += '	</div>';
					row += '</tr>';
					  document.querySelector("#historyTable tbody").insertAdjacentHTML("beforeend", row);
					}

					function removeRow(btn) {
					  // button이 포함된 <tr> 제거
					  btn.closest("tr").remove();
					}
					
					function rowUp(el) {
					    const $row = $(el).closest("tr");
					    const $prev = $row.prev("tr");
					    if ($prev.length) {
					        $prev.before($row);
					    }
					}

					function rowDown(el) {
					    const $row = $(el).closest("tr");
					    const $next = $row.next("tr");
					    if ($next.length) {
					        $next.after($row);
					    }
					}
				</script>
				</c:if>
		</form>
					<div class="text-right btn-area">
					<c:choose>
						<c:when test="${boardArticleVO.baId ne null}">
							<button type="button" onclick="fn_update();" class="point">수정</button>
							<button type="button" onclick="fn_delete();" class="point">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="button" onclick="fn_save();" class="point">등록</button>
						</c:otherwise>
					</c:choose>
						<a href="javascript:fn_list();">목록</a>
					</div>
</section>
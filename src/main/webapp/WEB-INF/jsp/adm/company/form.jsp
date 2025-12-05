<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<%-- <script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script> --%> <!-- 기존 스마트에디터 -->

<script src="https://cdn.ckeditor.com/ckeditor5/41.0.0/classic/ckeditor.js"></script> <!-- CKEditor -->

<script type="text/javascript">
var comIntroEditor;

<!-- 기존 스마트에디터 -->
/* var oEditors = []; */

/* $(document).ready(function() {
	
	initEditor();	 
});  */
 
/* function initEditor() {
	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "comIntro",
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
} */

<!-- CKEditor -->
//파일을 Base64로 읽어서 CKEditor에 넣어주는 업로드 어댑터
class MyUploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    // 파일 업로드 로직
    upload() {
        return this.loader.file.then(file => {
            return new Promise((resolve, reject) => {

                const data = new FormData();
                data.append('file', file);

                const uploadUrl = '${contextRoot}/ckeditor/ckeditorUpload.jsp';

                fetch(uploadUrl, {
                    method: 'POST',
                    body: data
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('HTTP error ' + response.status);
                    }
                    return response.json();
                })
                .then(res => {
                    resolve({
                        default: res.url
                    });
                })
                .catch(error => {
                    console.error(error);
                    reject(error);
                });
            });
        });
    }

    abort() {}
}

// CKEditor에 위 어댑터를 연결하는 플러그인
function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new MyUploadAdapter(loader);
    };
}

$(document).ready(function() {

    ClassicEditor
        .create(document.querySelector('#comIntro'), {
            extraPlugins: [ MyCustomUploadAdapterPlugin ]   // 여기!
        })
        .then(editor => {
            comIntroEditor = editor;
        })
        .catch(error => {
            console.error(error);
        });

});


function fn_save(){
	if (!validateForm()) return;
	
	if (!confirm("등록하시겠습니까?")) {
        return false; // 사용자가 [취소] 누르면 저장 안 함
    }
	
	/* var data =oEditors.getById["comIntro"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("소개를 입력 하세요.");
		oEditors.getById["comIntro"].exec("FOCUS"); 
		return false;
	} */
	
	// CKEditor에서 HTML 내용 가져오기
	var data = comIntroEditor.getData();

    // 태그 제거해서 실제 내용 비어있는지 확인
	var text = data.replace(/[<][^>]*[>]/gi, "");

	if (text.trim() === "" && data.indexOf("img") <= 0) {
		alert("소개를 입력 하세요.");
        // CKEditor 포커스
		comIntroEditor.editing.view.focus();
		return false;
	};
	

	
	$("#comIntro").val(data);
	
	$("#form").attr("action", "/yjcareer/adm/company/insert.do");
	
	$("#form").attr("target","_self");
	
	$("#form").submit();
	
}

function fn_update() {
	if (!validateForm()) return;
	
	if (!confirm("수정하시겠습니까?")) {
        return false; // 사용자가 [취소] 누르면 저장 안 함
    }
	
	/* var data =oEditors.getById["comIntro"].getIR();
	
	var text = data.replace(/[<][^>]*[>]/gi, "");
	
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["comIntro"].exec("FOCUS"); 
		return false;
	} */
	
	// CKEditor에서 HTML 내용 가져오기
	var data = comIntroEditor.getData();

    // 태그 제거해서 실제 내용 비어있는지 확인
	var text = data.replace(/[<][^>]*[>]/gi, "");

	if (text.trim() === "" && data.indexOf("img") <= 0) {
		alert("소개를 입력 하세요.");
        // CKEditor 포커스
		comIntroEditor.editing.view.focus();
		return false;
	};
	
    $("#comIntro").val(data);
	
	var comId= "${companyManageVo.comId}";
	
	$("#form").attr("action", "/yjcareer/adm/company/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
	
}

//유효성 검사 함수
function validateForm() {
	
	if ($.trim($("#comTitle").val()) === "") {
        alert("기관명을 입력해 주세요.");
        $("#comTitle").focus();
        return false;
    }

    return true;
}


//목록
function fn_list() {
		
		$("#searchform").attr("action", "/yjcareer/adm/company/list.do");
		$("#searchform").attr("method", "get");
		$("#searchform").submit();
		
}

//company 삭제하기
function fn_delete(){
	
	var comId= "${companyManageVo.comId}";
	
	$("#form").attr("action", "/yjcareer/adm/company/delete.do?menuId");
	
	$("#form").attr("target","_self");
	
	$("#form").submit();
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
			<input type="hidden" id="searchform_comId" name="comId" value="${boardConfigVO.comId}" >
			</form>

		<form id="form" name="form" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="comId" name="comId" value="${companyManageVo.comId}">
			
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
						<td colspan="3">
						<input type="text" style="width: 100%" name="comTitle" id="comTitle" value="${companyManageVo.comTitle}">
						</td>
					</tr>
					<tr>
						<th>기관소개</th>
						<td colspan="3">
						<textarea style="width: 100%" name="comIntro" id="comIntro">${companyManageVo.comIntro}</textarea>
						</td>
					</tr>
					<tr>
						<th>협약 기관 주소</th>
						<td>
						<span>우편번호</span>&nbsp;&nbsp;<input type="text"  style="width: 20%" name="zipCode" id="zipCode" value="${companyManageVo.zipCode}" readonly="readonly"><br/>
						<span>주  소</span>&nbsp;&nbsp;<input type="text" style="width: 50%" name="address" id="address" value="${companyManageVo.address}" readonly="readonly"><br/>
						<span>상세주소</span>&nbsp;&nbsp;<input type="text" style="width: 50%" name="addressDtl" id="addressDtl" value="${companyManageVo.addressDtl}">
						&nbsp;<button class="type-4" onclick="javascript:fn_goSearchDoroCodePop( ); return false">도로명검색</button>
						</td>
						<th>사용여부</th>
						<td>
							<label>
				              <input type="radio" name="useYn" value="Y"
				                     <c:if test="${empty companyManageVo.useYn or companyManageVo.useYn eq 'Y'}">checked="checked"</c:if> />
				              사용
				            </label>
				            &nbsp;&nbsp;
				            <label>
				              <input type="radio" name="useYn" value="N"
				                     <c:if test="${companyManageVo.useYn eq 'N'}">checked="checked"</c:if> />
				              미사용
				            </label>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td colspan="3">
						<textarea
								id="note" name="note" style="width: 100%">${companyManageVo.note}</textarea>
						</td>
					</tr>
				  </tbody>
				</table>
				
				<h3 style="margin-top:20px;">교육 장소</h3> <!-- <button type="button" onclick="addHistoryRow()">이력 추가</button> -->
				<p style="text-align: right; margin-top: 10px; width:50%;">
					<button type="button" style="display: inline-block; font-size: 12px;color: #FFF;border: none; padding: 3px 8px; background-color: black;" onclick="addHistoryRow()" class="type-3">장소 추가</button>
				</p>
				<table class="detail" id="locationTable" style="width:50%;">
				  <colgroup>
				  <col width="30%">
				  <col width="70%">
				  </colgroup>
				  <tbody>
				  	<c:if test = "${empty companyLocation}">
				    <tr>
					    <th>장소</th>
					    <td style="display: flex; align-items: center; gap: 8px; height:auto;">
					    <input type="text" name="location" value="" style="width:50%">
					    <div>
					    	<p>
					    		<button type="button" class="point" onclick="removeRow(this)"><i class="fa fa-remove"></i> 삭제</button>
					    	</p>
					    </div>
					    </td>
				    </tr>
				    </c:if>
				    <c:if test = "${!empty companyLocation}">
				    <c:forEach var="list" items="${companyLocation}" varStatus="status"> 
				    <tr>
					    <th>장소</th>
					    <td style="display: flex; align-items: center; gap: 8px; height:auto;">
					    <input type="text" name="location" value="${list.location}" style="width:50%">
					    <div>
						    <p>
								<button type="button" class="point" onclick="removeRow(this)"><i class="fa fa-remove"></i> 삭제</button>
								<button type="button" title="위로 이동" onclick="rowUp(this)"><i class="fa fa-arrow-up" ></i><span>위로 이동</span></button>
								<button type="button" title="아래로 이동" onclick="rowDown(this)"><i class="fa fa-arrow-down" ></i><span>아래로 이동</span></button>
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
					row += '<th>장소</th>';
					row += '<td style="display: flex; align-items: center; gap: 8px; height:auto;"><input type="text" name="location" style="width:50%">';
					row += '	<div>';
					row += '		<p>';
					row += '			<button type="button" class="point" onclick="removeRow(this)"><i class="fa fa-remove"></i> 삭제</button>';
					row += '			<button type="button" title="위로 이동" onclick="rowUp(this)"><i class="fa fa-arrow-up"></i> <span>위로 이동</span></button>';
					row += '			<button type="button" title="아래로 이동" onclick="rowDown(this)"><i class="fa fa-arrow-down"></i> <span>아래로 이동</span></button>';
					row += '		</p>';
					row += '	</div>';
					row += '</tr>';
					  document.querySelector("#locationTable tbody").insertAdjacentHTML("beforeend", row);
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
		</form>
					<div class="text-right btn-area">
					<c:choose>
						<c:when test="${companyManageVo.comId ne null}">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/${sessionScope.SESSION_MEM_TYPE}/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = [];

$(document).ready(function() {
	initEditor();		 
});

function initEditor() {

	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "productDesc",
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

	if($("#productName").val() == ""){
		alert("공예품명을 입력하세요.")
		$("#productName").focus();
		return;
	}
	
	var data =oEditors.getById["productDesc"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력하세요.");
		oEditors.getById["productDesc"].exec("FOCUS"); 
		return false;
	}
	
	if($("#duration").val() == ""){
		alert("체험시간을 입력하세요.")
		$("#duration").focus();
		return;
	}
	
	if($("#price").val() == ""){
		alert("가격을 입력하세요.")
		$("#price").focus();
		return;
	}
	
    // 썸네일 유효성 검사
    if ($("input[name='file_thumbFileId']").length == 0 || $("input[name='file_thumbFileId']").val() == "") {
        alert("썸네일을 등록해주세요. (275 x 180 권장)");
        $("input[name='file_thumbFileId']").focus();
        return false;
    }
	
	$("#productDesc").val(data);
	$("#form").attr("action", "${contextRoot}/staff/product/insert.do");
	$("#form").attr("target","_self");
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
	var data =oEditors.getById["productDesc"].getIR();
	var text = data.replace(/[<][^>]*[>]/gi, "");
	if(text=="" && data.indexOf("img") <= 0){
		alert("내용을 입력 하세요.");
		oEditors.getById["content"].exec("FOCUS"); 
		return false;
	}
	
	// 썸네일 유효성 검사
	var hasExistingThumb = ($("#thumbArea").data("has-thumb") === true || $("#thumbArea").data("has-thumb") === "true");
	var $thumbInput = $("input[name='file_thumbFileId']");

	// 등록 화면(신규)
	if (!hasExistingThumb) {
	    if ($thumbInput.length == 0 || $thumbInput.val() == "") {
	        alert("썸네일을 등록해주세요. (275 x 180 권장)");
	        if ($thumbInput.length > 0) {
	            $thumbInput.focus();
	        }
	        return false;
	    }
	}
	
	$("#productDesc").val(data);
	$("#form").attr("action", "${contextRoot}/staff/product/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}


//목록
function fn_list() {
	var menuId = $("#menuId").val();

	$("#form").attr("action", "${contextRoot}/staff/product/list.do?menuId="+menuId);
	$("#form").attr("method", "get");
	$("#form").submit();
		
}

//삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl){
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
	$("#fileForm").submit();
}

//수정하기
function fn_egov_updateFile(atchFileIdx,returnUrl){
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "${contextRoot}/board/updateFile.do");
	$("#fileForm").submit();
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
		<input type="hidden" id="productId" name="productId" value="${productVO.productId}" />

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
					<th>품목명</th>
					<td colspan="5">
						<c:if test="${productVO.productName eq null}">
							<input type="text" style="width: 100%" name="productName" id="productName" />
						</c:if>
						<c:if test="${productVO.productName ne null}">
							<input type="text" style="width: 100%" name="productName" id="productName" value="${productVO.productName}" />
						</c:if>
					</td>
				</tr>
				
				<tr>
					<th>사용연도</th>
					<td>
						<select id="useYear" name="useYear" style="width:80%;">
				            <%
				                java.util.Calendar cal = java.util.Calendar.getInstance();
				                int currentYear = cal.get(java.util.Calendar.YEAR);
				                pageContext.setAttribute("currentYear", currentYear);
				            %>
				            <c:forEach var="y" begin="0" end="2">
				                <option value="${currentYear + y}"
				                    <c:if test="${productVO.useYear eq (currentYear + y)}">selected</c:if>>
				                    ${currentYear + y}
				                </option>
				            </c:forEach>
				        </select>
					</td>
					<th>신제품여부</th>
					<td>
					    <select name="newYn" style="width:80%">
					        <option value="Y" ${productVO.newYn eq 'Y' ? 'selected' : ''}>신제품</option>
					        <option value="N" ${productVO.newYn eq 'N' ? 'selected' : ''}>-</option>
					    </select>
					</td>
					
					<th>품절여부</th>
					<td>
					    <select name="soldYn" style="width:80%;">
					    	<option value="N" ${productVO.soldYn eq 'N' ? 'selected' : ''}>재고있음</option>
					        <option value="Y" ${productVO.soldYn eq 'Y' ? 'selected' : ''}>품절</option>
					    </select>
					</td>
				</tr>

				<tr>
					<th>체험내용</th>
					<td colspan="5">
						<c:if test="${productVO.productDesc eq null}">
							<textarea placeholder=" 내용을 간략히 입력해주세요." id="productDesc" name="productDesc"></textarea>
						</c:if>
						<c:if test="${productVO.productDesc ne null}">
							<textarea placeholder=" 내용을 간략히 입력해주세요." id="productDesc" name="productDesc">${productVO.productDesc}</textarea>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<th>체험시간</th>
					<td colspan="1">
						<c:if test="${productVO.duration eq null}">
							<input type="text" id="duration" name="duration"/>&nbsp; 분
						</c:if>
						<c:if test="${productVO.duration ne null}">
							<input type="text" name="duration" id="duration" value="${productVO.duration}" />&nbsp; 분
						</c:if>
					</td>
					<th>체험대상</th>
					<td colspan="4">
						<c:if test="${productVO.target eq null}">
							<select name="target" id="target" style="width: 50%;">
						        <c:forEach var="targetList" items="${targetList}">
						            <option value="${targetList.codeCode}">${targetList.codeName}</option>
						        </c:forEach>
						    </select>
						</c:if>
						<c:if test="${productVO.target ne null}">
						    <select name="target" id="target" style="width: 50%;">
						        <c:forEach var="item" items="${targetList}">
						            <option value="${item.codeCode}"
						                <c:if test="${item.codeCode eq productVO.target}">selected</c:if>>
						                ${item.codeName}
						            </option>
						        </c:forEach>
						    </select>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
						<c:if test="${productVO.price eq null}">
							<input type="text" id="price" name="price"/>&nbsp; 원
						</c:if>
						<c:if test="${productVO.price ne null}">
							<input type="text" name="price" id="price" value="${productVO.price}" />&nbsp; 원
						</c:if>
					</td>
					<th>옵션명</th>
					<td>
						<c:if test="${productVO.optionName eq null}">
							<input type="text" id="optionName" name="optionName"/>
						</c:if>
						<c:if test="${productVO.optionName ne null}">
							<input type="text" name="optionName" id="optionName" value="${productVO.optionName}" />
						</c:if>
					</td>
					<th>옵션가격</th>
					<td>
						<c:if test="${productVO.optionPrice eq null}">
							<input type="text" id="optionPrice" name="optionPrice"/>
						</c:if>
						<c:if test="${productVO.optionPrice ne null}">
							<input type="text" name="optionPrice" id="optionPrice" value="${productVO.optionPrice}" />&nbsp; 원
						</c:if>
					</td>
				</tr>

				<c:if test="${productVO eq null}">
					<tr>
						<th>첨부 파일</th>
						<td>
							<input type="file" class="input_file" id="file_atchFileId0" name="file_atchFileId" title="파일찾기" /><br />
							<input type="file" class="input_file" id="file_atchFileId1" name="file_atchFileId" title="파일찾기" /><br />
							<!-- <input type="file" class="input_file" id="file_atchFileId2" name="file_atchFileId" title="파일찾기" /><br />
							<input type="file" class="input_file" id="file_atchFileId3" name="file_atchFileId" title="파일찾기" /><br />
							<input type="file" class="input_file" id="file_atchFileId4" name="file_atchFileId" title="파일찾기" /> -->
						</td>
					</tr>
				</c:if>

				<c:if test="${productVO ne null}">
					<tr>
						<%-- <th>첨부파일</th>
						<td class="file">
							<c:forEach var="fileVO" items="${fileList}" varStatus="status">
								<c:if test="${fileVO.thumbnailCrop eq 'N'}">
									<span>
										<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
											<c:out value="${fileVO.orgFileName}" />
										</a>
										<button type="button" onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','/adm/product/${boardConfigVO.bcId}/updateForm.do?productId=${productVO.productId}');">삭제</button>
										<button type="button" onclick="fn_egov_updateFile('${fileVO.atchFileIdx}','/adm/product/${boardConfigVO.bcId}/updateForm.do?productId=${productVO.productId}');" title="등록 파일 수정">수정</button>
									</span>
								</c:if>
							</c:forEach>

							<c:set var="len" value="${fn:length(fileList)}" />
							<c:if test="${len < 2}">
								<c:forEach var="i" begin="1" end="${2 - len}">
									<c:choose>
										<c:when test="${i == 1 and fn:length(fileList) > 0}">
											<br /><br />
										</c:when>
										<c:otherwise><br /></c:otherwise>
									</c:choose>
									<input style="border-top: 5px;" type="file" class="input_file" id="file_atchFileId${i}" name="file_atchFileId" title="파일찾기" /><br />
								</c:forEach>
							</c:if>
						</td> --%>
						
						<c:if test="${productVO eq null}">
							<th>썸네일</th>
							<td class="file" colspan="2">
								<input type="file" class="input_file" id="file_thumbFileId1" name="file_thumbFileId" title="이미지 찾기" />
								<p style="color: red; font-size: 15px;">* 275 x 180 등록해주세요</p>
							</td>
						</c:if>
						
						<c:if test="${productVO ne null}">
							<th>썸네일</th>
							<td class="file" colspan="2" id="thumbArea" data-has-thumb="${fn:length(fileList1) > 0}">
								<c:forEach var="fileVO1" items="${fileList1}" varStatus="status">
									<c:if test="${fileVO1.thumbnailCrop eq 'Y'}">
										<span>
											<a href="javascript:fn_egov_downFile('${fileVO1.atchFileIdx}');">
												<c:out value="${fileVO1.orgFileName}" />
											</a>
											<button type="button" onclick="fn_egov_deleteFile('${fileVO1.atchFileIdx}','/staff/product/${boardConfigVO.bcId}/updateForm.do?productId=${productVO.productId}');">삭제</button>
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
			<c:when test="${productVO.productId ne null}">
				<button type="button" onclick="fn_update();" class="point">수정</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:otherwise>
		</c:choose>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
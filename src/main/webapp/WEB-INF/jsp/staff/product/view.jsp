<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/${sessionScope.SESSION_MEM_TYPE}/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = [];

$(document).ready(function() {
	initEditor("");

});

/* 화면이 로드된후 에디터 기본옵션 설정 초기화 */ 
function initEditor(contentId) {
	
	  if(contentId == null || contentId == "" ){
	         contentId = "content";
	      } 

	//Smart Editor
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: contentId,
		sSkinURI: "${contextRoot}/smarteditor/SmartEditor2Skin.html",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		}, //boolean ele
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
} 


function fn_delete(){
	var productId = $("#productId").val();
	var menuId = $("#menuId").val();;
	
	if(confirm("자료를 삭제하시겠습니까?")){
		var reqUrl = "${contextRoot}/staff/product/delete.do?&memuId="+menuId;
		$("#form").attr("action", reqUrl);
		$("#form").submit();
	}
}

function fn_update(){
	
	var productId= "${productVO.productId}";	
	var menuId = "${menuId}";
	var reqUrl = "${contextRoot}/staff/product/updateForm.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").attr("method", "get");
	$("#form").submit();
}

function fn_list(){
	
	var productId = $("#productId").val();
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/staff/product/list.do?menuId="+menuId
	
	$("#form").attr("action", reqUrl);
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

</script>

<section>
	<form id="form" name="form" method="post">
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
				    <td colspan="5">${productVO.productName}</td>
				</tr>
				<tr>
				    <th>사용연도</th>
				    <td colspan="5">${productVO.useYear}</td>
				</tr>
				<tr>
				    <th>체험내용</th>
				    <td colspan="5">${productVO.productDesc}</td>
				</tr>
				<tr>
				    <th>체험시간</th>
				    <td>${productVO.duration} 분</td>
				    <th>체험대상</th>
				    <td>
				        <c:forEach var="item" items="${targetList}">
				            <c:if test="${item.codeCode eq productVO.target}">
				                ${item.codeName}
				            </c:if>
				        </c:forEach>
				    </td>
				    <th>등록일</th>
				    <td>${productVO.regDt}</td>
				</tr>
				<tr>
				    <th>가격</th>
				    <td>
					    <c:choose>
					        <c:when test="${productVO.price == 0}">
					            무료
					        </c:when>
					        <c:otherwise>
					            ${productVO.price} 원
					        </c:otherwise>
					    </c:choose>
					</td>
				    <th>옵션명</th>
					<td>
					    <c:choose>
					        <c:when test="${not empty productVO.optionName}">
					            ${productVO.optionName}
					        </c:when>
					        <c:otherwise>-</c:otherwise>
					    </c:choose>
					</td>
					
					<th>옵션가격</th>
					<td>
					    <c:choose>
					        <c:when test="${not empty productVO.optionPrice}">
					            ${productVO.optionPrice}
					        </c:when>
					        <c:otherwise>-</c:otherwise>
					    </c:choose>
					</td>
				</tr>
				
				<tr>
				    <th>신제품여부</th>
				    <td>
				    	<c:if test="${productVO.newYn eq 'Y'}">신제품</c:if>
				    	<c:if test="${productVO.newYn eq 'N'}">-</c:if>
				    </td>
				    <th>품절여부</th>
				    <td>
					    <c:if test="${productVO.soldYn eq 'Y'}">품절</c:if>
					    <c:if test="${productVO.soldYn eq 'N'}">재고있음</c:if>
				    </td>
					<%-- <c:if test="${fn:length(fileList) > 0}">
							<th>첨부파일</th>
							<td class="file">
								<c:forEach var="fileVO" items="${fileList}" varStatus="status">
									<c:if test="${fileVO.thumbnailCrop == 'N'}">
										<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
											<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out value="${fileVO.fileSize}" />]
										</a>
									</c:if>
								</c:forEach>
							</td>
					</c:if> --%>
					<c:if test="${fn:length(fileList1) > 0}">
						<th>썸네일 자료</th>
						<td class="file">
							<c:forEach var="fileVO" items="${fileList1}" varStatus="status">
								<c:if test="${fileVO.thumbnailCrop eq 'Y'}">
									<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
										<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out value="${fileVO.fileSize}" />]
									</a>
								</c:if>
							</c:forEach>
						</td>
					</c:if>
				</tr>
				
			</tbody>
		</table>
	</form>

	<div class="text-right btn-area">
		<button type="button" class="point" onclick="fn_update()">수정</button>
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
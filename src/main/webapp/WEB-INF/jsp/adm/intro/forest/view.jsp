<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">

function fn_delete(){
	var pgType = '${introVO.pgType}';
	var menuId = $("#menuId").val();;
	
	if(confirm("자료를 삭제하시겠습니까?")){
		var reqUrl = "${contextRoot}/adm/intro/"+pgType+"/delete.do?&memuId="+menuId;
		$("#form").attr("action", reqUrl);
		$("#form").submit();
	}
}

function fn_update(){
	
	var pgType = '${introVO.pgType}';
	var menuId = "${menuId}";
	var reqUrl = "${contextRoot}/adm/intro/"+pgType+"/updateForm.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").attr("method", "get");
	$("#form").submit();
}

function fn_list(){
	
	var pgType = '${introVO.pgType}';
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/adm/intro/"+pgType+"/list.do?menuId="+menuId
	
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
		<input type="hidden" id="intId" name="intId" value="${introVO.intId}" />
	
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
					<th>프로그램명</th>
					<td colspan="5">${introVO.intTitle}</td>
				</tr>
				<tr>
					<th>연령</th>
					<td colspan="5">
				        <c:forEach var="item" items="${targetList}">
				            <c:if test="${item.codeCode eq introVO.intAge}">
				                ${item.codeName}
				            </c:if>
				        </c:forEach>
				    </td>
				</tr>
				<tr>
					<th>프로그램 소개</th>
					<td colspan="5">${introVO.intDesc}</td>
				</tr>
	
				<c:if test="${fn:length(fileList1) > 0}">
					<tr>
						<th>썸네일</th>
						<td class="file" colspan="6">
							<c:forEach var="fileVO1" items="${fileList1}">
								<c:if test="${fileVO1.thumbnailCrop eq 'Y'}">
									<a href="javascript:fn_egov_downFile('${fileVO1.atchFileIdx}');">
										<c:out value="${fileVO1.orgFileName}" />&nbsp;[<c:out value="${fileVO1.fileSize}" />]
									</a><br/>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form>

	<div class="text-right btn-area">
		<button type="button" class="point" onclick="fn_update()">수정</button>
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
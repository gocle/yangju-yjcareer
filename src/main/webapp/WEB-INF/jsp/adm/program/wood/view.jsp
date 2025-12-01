<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

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
	var pgType = '${programVO.pgType}';
	var menuId = $("#menuId").val();;
	
	if(confirm("삭제하시겠습니까?")){
		var reqUrl = "${contextRoot}/adm/program/"+pgType+"/delete.do?&memuId="+menuId;
		$("#form").attr("action", reqUrl);
		$("#form").submit();
	}
}

function fn_update(){
	
	var pgType = '${programVO.pgType}';
	var menuId = "${menuId}";
	var reqUrl = "${contextRoot}/adm/program/"+pgType+"/updateForm.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").attr("method", "get");
	$("#form").submit();
}

function fn_list(){
	
	var pgType = '${programVO.pgType}';
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/adm/program/"+pgType+"/list.do?menuId="+menuId
	
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

function fn_copy() {
	var pgType = '${programVO.pgType}';
	
	$("#form").attr("action", "${contextRoot}/adm/program/"+pgType+"/copy.do");
	$("#form").attr("pgTarget","_self");
	$("#form").submit();
}

</script>

<section>
	<form id="form" name="form" method="post">
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="pgId" name="pgId" value="${programVO.pgId}" />
	
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
					<td colspan="5">${programVO.pgName}</td>
				</tr>
				<tr>
					<th>프로그램 소개</th>
					<td colspan="5">${programVO.pgDesc}</td>
				</tr>
				<tr>
					<th>예약신청 시작일</th>
					<td>${programVO.regOpenDate}</td>
					<th>예약신청 종료일</th>
					<td>${programVO.regCloseDate}</td>
					<th>운영상태</th>
					<td>
						<c:choose>
							<c:when test="${programVO.status eq 'WAIT'}">신청대기</c:when>
							<c:when test="${programVO.status eq 'OPEN'}">접수중</c:when>
							<c:when test="${programVO.status eq 'CLOSE'}">접수마감</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>체험시작일</th>
					<td>${programVO.startDate}</td>
					<th>체험종료일</th>
					<td>${programVO.endDate}</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>유형</th>
					<td>
						<c:choose>
							<c:when test="${programVO.classType eq 'ONEDAY'}">원데이클래스</c:when>
							<c:when test="${programVO.classType eq 'DIY'}">DIY</c:when>
							<c:when test="${programVO.classType eq 'CHILD'}">유치원</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<th>체험인원</th>
					<td>${programVO.capacity} 명</td>
					<%-- <th>체험시간</th>
					<td>${programVO.duration} 분</td> --%>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>장소</th>
					<td>${programVO.location}</td>
					<th>담당자명</th>
					<td>${programVO.instructorName}</td>
					<th>문의</th>
					<td>${programVO.contact}</td>
				</tr>
	
				<c:if test="${fn:length(fileList) > 0}">
					<tr>
						<th>첨부파일</th>
						<td class="file" colspan="5">
							<c:forEach var="fileVO" items="${fileList}">
								<c:if test="${fileVO.thumbnailCrop eq 'N'}">
									<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
										<c:out value="${fileVO.orgFileName}" />&nbsp;[<c:out value="${fileVO.fileSize}" />]
									</a><br/>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</c:if>
	
				<c:if test="${fn:length(fileList1) > 0}">
					<tr>
						<th>썸네일</th>
						<td class="file" colspan="5">
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
		<!-- <button type="button" class="point" onclick="fn_copy()">복사</button> -->
		<button type="button" class="point" onclick="fn_update()">수정</button>
		<button type="button" class="point" onclick="fn_delete()">삭제</button>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
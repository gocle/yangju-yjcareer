<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />


<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
img.ui-datepicker-trigger {
     margin-left:5px; vertical-align:middle; cursor:pointer;
}
</style>

<script type="text/javascript" src="${contextRoot}/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
function initEditor(ondde) {
	
		//Smart Editor
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
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

//등록하기
function fn_save(){
	var bnType = $('#bnType').val();
	
	$("#form").attr("action", "{contextRoot}/adm/banner/"+bnType+"/insert.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

//배너 수정하기
function fn_update( bnId ){ 
	var bnType = $('#bnType').val();
	var bnId = $('#bnId').val(bnId);
	
	$("#form").attr("action", "${contextRoot}/adm/banner/"+bnType+"/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

//배너 삭제하기
function fn_delete( bnId ){
	var bnType = $('#bnType').val();
	var bnId = $('#bnId').val(bnId);
	
	$("#form").attr("action", "${contextRoot}/adm/banner/"+bnType+"/delete.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

//파일 삭제하기
function fn_egov_deleteFile(atchFileIdx,returnUrl){
	$("#atchFileIdx").val(atchFileIdx);
	$("#returnUrl").val(returnUrl);
	
	$("#fileForm").attr("action", "${contextRoot}/board/deleteFile.do");
	$("#fileForm").submit();
}

//파일 수정하기
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
		<input type="hidden" id="menuId" name="menuId" value="${menuId }" /> 
	</form>
</section>

<section>
	<form id="form" name="form" method="post" enctype="multipart/form-data">
		<input type="hidden" id="menuId" name="menuId" value="${menuId }" />  	
		<input type="hidden" id="bnType" name="bnType" value="${bnType }" />
		<input type="hidden" id="bnId" name="bnId" value="" />

		<table class="detail">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tbody>
				<tr>
					<th>배너 명</th>
					<td colspan="3">
						<input type="text" style="width: 100%" name="bnName" id="bnName" value="${bannerResult.bnName }">
					</td>
				</tr>

				<%-- 
				<tr>
					<th>배너 링크 주소</th>
					<td>
						<input type="text" style="width: 100%" name="bnLink" id="bnLink" value="${bannerResult.bnLink }">
					</td>
					<th>배너 링크 대상 새창여부</th>
					<td>
						사용 <input type="radio" name="bnNewWin" id="bnNewWin" value="1" <c:if test="${bannerResult.bnNewWin eq '1'}">checked="checked"</c:if> />
						미사용 <input type="radio" name="bnNewWin" id="bnNewWin" value="0" <c:if test="${bannerResult.bnNewWin eq '0'}">checked="checked"</c:if> />
					</td> 
				</tr>
				--%>

				<tr>
					<th>사용 유무</th>
					<td>
						사용 <input type="radio" name="bnUse" id="bnUse" value="1" <c:if test="${bannerResult.bnUse eq '1'}">checked="checked"</c:if> />
						미사용 <input type="radio" name="bnUse" id="bnUse" value="0" <c:if test="${bannerResult.bnUse eq '0'}">checked="checked"</c:if> />
					</td>
					<th>게시 기간</th>
					<td>
						게시 시작일
						<input type="text" style="width: 20%;" id="date_timepicker_start" name="bnStartDate" value="${bannerResult.bnStartDate}">
						&nbsp;~&nbsp;
						게시 종료일
						<input type="text" style="width: 20%;" id="date_timepicker_end" name="bnEndDate" value="${bannerResult.bnEndDate}">
					</td>
				</tr>

				<c:if test="${bannerResult.bnThumb eq null}">
					<tr>
						<th>이미지 영역</th>
						<td colspan="3">
							<input type="file" class="input_file" id="image_atchFileId1" name="image_atchFileId" title="이미지 찾기">
							<p style="color: red; font-size: 15px;">* 2200 x 600 등록해주세요</p>
						</td>
					</tr>
				</c:if>

				<c:if test="${bannerResult.bnThumb ne null}">
					<tr>
						<th>이미지 영역</th>
						<td class="file" colspan="3">
							<c:forEach var="fileVO" items="${fileList}" varStatus="status">
								<span>
									<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
										<c:out value="${fileVO.orgFileName}" />
									</a>
									<button type="button" onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','/${siteId}/admin/banner/${bnType}/update.do?bnId=${bannerResult.bnId}&menuId=${menuId }');">삭제</button>
								</span>
							</c:forEach>

							<c:set var="len" value="${fn:length(fileList)}"/>
							<c:if test="${len < 1}">
								<c:forEach var="i" begin="1" end="${1-len}">
									<c:choose>
										<c:when test="${i==1 and fn:length(fileList) > 0}">
											<br/><br/>
										</c:when>
										<c:otherwise>
											<br/>
											<p style="color: red; font-size: 15px;">* 2200 x 600 등록해주세요</p>
										</c:otherwise>
									</c:choose>
									<input style="border-top: 5px;" type="file" class="input_file" id="file_atchFileId${i}" name="image_atchFileId" title="이미지 찾기"><br/>
								</c:forEach>
							</c:if>

							<br/><br/>
							<img style="width: 300px; height: 100px;" src="/bannerImage/${bannerResult.bnThumbName}" onerror="this.style.visibility='hidden'">
						</td>
					</tr>
				</c:if>

				<%-- 
				<tr>
					<th>배너 가로 크기</th>
					<td>
						<input type="text" onkeyup="fn_regExp('Width');" style="width: 100%" name="bnWidth" id="bnWidth" placeholder="예 ) 100" value="${bannerResult.bnWidth }">
					</td>
					<th>배너 세로 크기</th>
					<td>
						<input type="text" onkeyup="fn_regExp('Height');" style="width: 100%" name="bnHeight" id="bnHeight" placeholder="예 ) 100" value="${bannerResult.bnHeight }">
					</td>
				</tr>

				<tr>
					<th>팝업창 TOP위치</th>
					<td>
						<input type="text" style="width: 100%" name="bnTop" id="bnTop" placeholder="예 ) 100" value="${bannerResult.bnTop }">
					</td>
					<th>팝업창 LEFT위치</th>
					<td>
						<input type="text" style="width: 100%" name="bnLeft" id="bnLeft" placeholder="예 ) 100" value="${bannerResult.bnLeft }">
					</td>
				</tr>
				--%>
			</tbody>
		</table>
	</form>
</section>

<section>
	<div class="text-right btn-area">
		<c:choose>
			<c:when test="${bannerResult eq null}">
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_update('${bannerResult.bnId}');" class="point">수정</button>
				<button type="button" onclick="fn_delete('${bannerResult.bnId}');" class="point">삭제</button>
			</c:otherwise>
		</c:choose>
		<a href="${contextRoot}/adm/banner/${bnType}/list.do?menuId=${menuId}">목록</a>
	</div>
</section>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />



<script type="text/javascript">

//등록하기
function fn_save(){
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/adm/bbs/config/insert.do";
	$("#form").attr("action", reqUrl);
	$("#form").attr("target","_self");
	$("#form").submit();
}

//수정하기
function fn_update(){ 
	$("#form").attr("action","${contextRoot}/adm/bbs/config/update.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

//삭제하기
function fn_delete(){
	$("#form").attr("action","${contextRoot}/adm/bbs/config/delete.do");
	$("#form").attr("target","_self");
	$("#form").submit();
}

// 숫자 유효성
function fn_regExp( param ){
	var bcThumbnail =  $('#bcThumbnail'+param).val();
	
	var reg = /^[0-9]*$/g;
	if(!reg.test(bcThumbnail) ){
		alert('숫자만 입력하여주시길 바랍니다');
		bcThumbnail=  $('#bcThumbnail'+param).val(bcThumbnail.replace(/\D/g, ''));
		return false;
	} else if((bcThumbnail*1) > 1200){
		alert('1200을 초과할 수 없습니다.');
		bcThumbnail=  $('#bcThumbnail'+param).val(bcThumbnail.replace(reg, ''));
		return false;
	}
}

//썸네일 기능여부 

$(function (){
	// 이미 체크가 되있으면 true
	if($('input[type="radio"][id="bcSupportThumbnail"]:checked').val() == '1'){
		$('#bcSupportThumbnail-detail').css("display","");
	}
		
	//클릭 했을때 반응
	$('input[type="radio"][id="bcSupportThumbnail"]').on('click', function() {
	    var valueCheck = $('input[type="radio"][id="bcSupportThumbnail"]:checked').val();
	    if ( valueCheck == '1' ) {
	        $('#bcSupportThumbnail-detail').css("display","");
	    } else {
	    	 $('#bcSupportThumbnail-detail').css("display","none");
	    }
	});
});

</script>


	
<form id="form" name="form" method="post">
	<input type="hidden" id="menuId" name="menuId" value="${menuId}" />

	<table class="detail">
		<colgroup>
			<col width="15%">
			<col width="*">
			<col width="15%">
			<col width="*">
		</colgroup>
		<tbody>
			<tr>
				<th>게시판 아이디</th>
				<td>
					<c:choose>
						<c:when test="${result.bcId eq null}">
							<input type="text" style="width: 100%" name="bcId" id="bcId">
						</c:when>
						<c:otherwise>
							<input type="hidden" style="width: 100%" name="bcId" id="bcId" value="${result.bcId}">
							<input type="text" style="width: 100%" name="bcId" id="bcId" value="${result.bcId}" disabled="disabled">
						</c:otherwise>
					</c:choose>
				</td>
				<th>게시판 이름</th>
				<td>
					<input type="text" style="width: 100%" name="bcName" id="bcName" value="${result.bcName}">
				</td>
			</tr>
			<tr>
				<th>게시판 사용 상태</th>
				<td>
					<c:choose>
						<c:when test="${result.bcUse eq null}">
							사용 <input type="radio" id="bcUse" name="bcUse" value="1" checked="checked">
							&nbsp;
							미사용 <input type="radio" id="bcUse" name="bcUse" value="0">
						</c:when>
						<c:otherwise>
							사용 <input type="radio" id="bcUse" name="bcUse" value="1"
								<c:if test="${result.bcUse eq '1'}">checked="checked"</c:if> />
							&nbsp;
							미사용 <input type="radio" id="bcUse" name="bcUse" value="0"
								<c:if test="${result.bcUse eq '0'}">checked="checked"</c:if> />
						</c:otherwise>
					</c:choose>
				</td>
				<th>게시판 유형</th>
				<td>
					<c:choose>
						<c:when test="${result.bcType eq null}">
							<select id="bcType" name="bcType">
								<option value="default">기본</option>
								<option value="gallary">갤러리</option>
								<option value="webzine">웹진</option>
								<option value="movie">영상</option>
								<option value="qna">Q&A</option>
							</select>
						</c:when>
						<c:otherwise>
							<select id="bcType" name="bcType">
								<option value="default" ${result.bcType eq "default" ? "selected" : ""}>기본</option>
								<option value="gallary" ${result.bcType eq "gallary" ? "selected" : ""}>갤러리</option>
								<option value="webzine" ${result.bcType eq "webzine" ? "selected" : ""}>웹진</option>
								<option value="movie" ${result.bcType eq "movie" ? "selected" : ""}>영상</option>
								<option value="qna" ${result.bcType eq "qna" ? "selected" : ""}>Q&A</option>
							</select>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>

			<tr>
				<th>게시판 카테고리</th>
				<td>
					<select name="bcCategory1" id="bcCategory1">
						<option value="">선 택</option>
						<c:forEach var="codeList" items="${codeList}" varStatus="status">
							<option value="${codeList.codeGroup}" ${result.bcCategory1 == codeList.codeGroup ? 'selected="selected"' : ''}>${codeList.codeName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<section>
	<div class="text-right btn-area">
		<c:choose>
			<c:when test="${result eq null}">
				<button type="button" onclick="fn_save();" class="point">등록</button>
				<a href="${contextRoot}/adm/bbs/config/list.do?menuId=${menuId}">목록</a>
			</c:when>
			<c:otherwise>
				<a href="${contextRoot }/adm/bbs/config/list.do?menuId=${menuId}">목록</a>
				<button type="button" onclick="fn_update();" class="point">수정</button>
				<button type="button" onclick="fn_delete();" class="point">삭제</button>
			</c:otherwise>
		</c:choose>
	</div>
</section>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">
$(document).ready(function() {
	// 아무 초기화 필요 없음
});

function fn_save(){
	if($("#ipAddress").val().trim() === ""){
		alert("IP 주소를 입력하세요.");
		$("#ipAddress").focus();
		return;
	}
	
	if($("#accessName").val().trim() === ""){
		alert("접근명을 입력하세요.");
		$("#accessName").focus();
		return;
	}

	$("#form").attr("action", "${contextRoot}/adm/ip/insertAccessIp.do");
	$("#form").attr("method", "post");
	$("#form").submit();
}


function fn_list(){
	location.href = "${contextRoot}/adm/ip/list.do";
}
</script>

<section>
	<form id="form" name="form" method="post">
		<input type="hidden" name="ipId" id="ipId" value="${ipVO.ipId}" />
		<input type="hidden" name="menuId" id="menuId" value="${menuId}" />

		<table class="detail">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
				<tr>
					<th>IP 주소</th>
					<td>
						<input type="text" style="width:60%" id="ipAddress" name="ipAddress" 
							   value="${ipVO.ipAddress}" placeholder="예: 192.168.0.10" />
					</td>
				</tr>
				<tr>
					<th>접근명 / 설명</th>
					<td>
						<input type="text" style="width:80%" id="accessName" name="accessName" 
							   value="${ipVO.accessName}" placeholder="예: 사무실 관리자 PC" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<div class="text-right btn-area">
		<c:choose>
			<c:when test="${ipVO.ipId ne null}">
				<button type="button" onclick="fn_update();" class="point">수정</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="fn_save();" class="point">등록</button>
			</c:otherwise>
		</c:choose>
		<a href="javascript:fn_list();">목록</a>
	</div>
</section>
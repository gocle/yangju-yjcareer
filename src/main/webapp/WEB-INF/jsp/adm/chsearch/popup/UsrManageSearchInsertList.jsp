<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>

<style>
.btn_blue {
	color: #FFF!important;
    background-color: #182142!important;
}
.all_check {width:13px;height:13px;}
</style>

<script type="text/javascript">
function fn_check_all() {
    var c = $('#chkAll').is(":checked");
    $('input[name=memSeqs]').prop("checked", c);
}

function fnCmdClose(){
	window.opener.location.reload();
	window.close();
}

function fn_search(pageIndex) {
	$("#pageIndex").val(pageIndex);
	
	$("#listForm").attr("action", "UsrManageSearchInsertList.do");
	$("#listForm").submit();
}

function fnEnrollUserAdd() {
	if($("input[name=memSeqs]:checkbox:checked").length === 0) {
        alert("교육생을 선택해 주세요.");
        return false;
    }
	
	if (!confirm("선택한 교육생을 추가하시겠습니까?")) {
        return false;
    }
	
	$.ajax({
		type: "post",
		url: "${contextRoot}/adm/chsubjopen/EnrollDetailManageInsert.do",
		data: $("#listForm").serialize(),
		success: function(result) {
			alert(result);
			fnCmdClose();
		},
		error: function() {
	        alert("등록 중 오류가 발생했습니다.");
	    }
	});
}

</script>

<section>
	<div id="pop-wrapper">
		<div id="pop-header">
			<a href="#" onClick="javascript:fn_close();" class="btn">닫기</a>
		</div>
		
		<div id="pop-container" style="padding:10px;">
			<h3>교육생 등록</h3>
			<form id="listForm" name="listForm" method="post">
				<input type="hidden" id="seqCd" name="seqCd" value="${param.seqCd }" />
				
				<ul class="search-box" style="margin-bottom:0px !important;">
					<li>
						<label><i class="fa fa-angle-right"></i> 검색조건</label>
						<input type="text" style="width:300px" value="${searchVo.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
					</li>
				</ul>
				
				<div class="btn-area">
					<a href="#none" onclick="javascript:fnEnrollUserAdd();">교육생등록</a>
					<a href="#none" class="btn_blue" onclick="javascript:fn_search('1');" style="float:right;">검색</a>
				</div>
				
				<table class="list-1" width="100%;" style="margin-top:20px;">
					<thead>
						<tr>
							<th style="width: 5%"><input type="checkbox" name="chkAll" id="chkAll" class="all_check" onclick="javascript:fn_check_all();"></th>
							<th style="width: 5%">No</th>
							<th style="width: 10%">이름</th>
							<th style="width: 10%">휴대전화</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${resultList}" varStatus="status">
							<tr>
								<td><input type="checkbox" name="memSeqs" class="all_check" value="<c:out value="${item.memSeq}"/>"></td>
								<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
								<td>${item.memName}</td>
								<td>${item.hpNo}</td>
							</tr>
						</c:forEach>
						<c:if test="${fn:length(resultList) == 0}">
							<tr>
								<td colspan="4" class="no-data">
									<i class="fa fa-search"></i> 검색된 교육생이 없습니다.
								</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				
				<div class="text-center">
					<ul class="pagination">
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
					</ul>  
				</div>
				
				 <div class="text-right btn-area">
				 	<a href="javascript:fnCmdClose();">닫기</a>
				 </div>
			</form>
		</div>
	</div>
</section>
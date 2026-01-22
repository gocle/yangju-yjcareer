<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">
$(document).ready(function() {
	var selSgrCd = "${searchVo.searchSgrCd}";
    var selCateCd = "${searchVo.searchCateCd}";
    
    $("#searchCateCd").empty();
	$("#searchCateCd").append('<option value="">분류 선택</option>');
	
    $.ajax({
        url: "${contextRoot}/adm/chsearch/SearchCateCdList.do",
        type: "GET",
        data: { sgrCd: selSgrCd },
        success: function(result) {
            $.each(result, function(index, item) {
                $("#searchCateCd").append(
                    '<option value="' + item.cateCd + '" ' 
                    + (selCateCd == item.cateCd ? 'selected="selected"' : '') 
                    + '>' + item.cateNm + '</option>'
                );
            });
        },
        error: function() {
            //alert("오류 발생");
        }
    });
});

function fn_search(pageIndex) {
	$("#pageIndex").val(pageIndex);
	if($("#searchSgrCd").val() == 'B') {
		$("#listForm").attr("action", "EnrollManageList.do");
	}else {
		$("#listForm").attr("action", "EnrollManageListC.do");
	}
    $("#listForm").submit();
}

function fnCmdUpdateForm(seqCd) {
	$("#seqCd").val(seqCd);
	var reqUrl = "${contextRoot}/adm/chsubjopen/SubjSeqManageForm.do";
	
	$("#listForm").attr("action", reqUrl);
	$("#listForm").submit();
}

function fnEnrollDetailList(seqCd) {
	$("#seqCd").val(seqCd);
	$("#pageIndex").val(1);
	var reqUrl = "${contextRoot}/adm/chsubjopen/EnrollDetailManageList.do";
	
	$("#listForm").attr("action", reqUrl);
	$("#listForm").submit();
}
</script>

<style>
.wid15 {width:15%!important;}
</style>

<section>
	<form id="listForm" name="listForm" method="post">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize }" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="seqCd" name="seqCd" value="" />
		<input type="hidden" id="searchSgrCd" name="searchSgrCd" value="${searchVo.searchSgrCd}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId }" />
		
		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCateCd" name="searchCateCd" value="${searchVo.searchCateCd}" class="wid15">
	            	<option value="">분류 선택</option>
	            </select>
	            <input type="text" style="width:300px" value="${searchVo.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="100" placeholder="검색어 입력" />
	         </li>
	         <li class="search-btn">
				<button type="button" onclick="fn_search('1');">
					<i class="fa fa-search"></i> 검색
				</button>
			</li>
		</ul>
		
		<table class="list-1" width="100%">
			<thead>
				<tr>
					<th style="width: 5%">No</th>
					<th style="width: 12%">교육기관</th>
					<th style="width: 12%">분류</th>
					<th style="width: 8%">과정기수코드</th>
					<th style="width: 25%">교육강좌명</th>
					<th style="width: 5%">기수</th>
					<th style="width: 8%">신청인원</th>
					<th style="width: 12%">모집기간</th>
					<th style="width: 12%">교육기간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
						<td>${item.comTitle}</td>
						<td>${item.cateNm}</td>
						<td><a href="javascript:fnCmdUpdateForm('${item.seqCd}');">${item.seqCd}</a></td>
						<td style="text-align:left;"><a href="javascript:fnCmdUpdateForm('${item.seqCd}');">${item.subjNm}</a></td>
						<td>${item.sessionNm}</td>
						<td><a href="javascript:fnEnrollDetailList('${item.seqCd}');">${item.enrollCnt} 명</a> / ${item.capacity} 명</td>
						<td>${item.enrollStartDt} ~ ${item.enrollEndDt}</td>
						<td>${item.learnStartDt} ~ ${item.learnEndDt}</td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(resultList) == 0}">
					<tr>
						<td colspan="9" class="no-data">
							<i class="fa fa-search"></i> 등록된 과정이 없습니다.
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		
		<div class="text-center">
			<ul class="pagination">
				<ui:pagination paginationInfo="${paginationInfo }" type="image" jsFunction="fn_search" />
			</ul>  
		</div>
	</form>
</section>
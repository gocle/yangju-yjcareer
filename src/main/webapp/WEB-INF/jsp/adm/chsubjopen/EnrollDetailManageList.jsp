<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">
function fn_check_all() {
    var c = $('#chkAll').is(":checked");
    $('input[name=memSeqs]').prop("checked", c);
}

function fn_search(pageIndex) {
	$("#pageIndex").val(pageIndex);
	$("#listForm").attr("action", "EnrollDetailManageList.do");
	$("#listForm").submit();
}

function fnCmdList() {
	$("#listForm").attr("action", "EnrollManageList.do");
	$("#listForm").submit();
}

function fnEnrollAddUserPopup () {
	popOpenWindow("", "popEnrollAddUser", 650, 550);
	
	var reqUrl = "${contextRoot}/adm/chsearch/popup/UsrManageSearchInsertList.do";
	
	$("#listForm").attr("target", "popEnrollAddUser");
	$("#listForm").attr("action", reqUrl);
	$("#listForm").submit();
}

function fnEnrollUpdate(seqCd, memSeq) {
	popOpenWindow("", "popEnrollDetailUpdate", 650, 550);
	
	var reqUrl =  "${contextRoot}/adm/chsubjopen/popup/EnrollDetailManageUpdateForm.do";
	$("#seqCd").val(seqCd);
	$("#memSeq").val(memSeq);
	
	$("#listForm").attr("target", "popEnrollDetailUpdate");
	$("#listForm").attr("action", reqUrl);
	$("#listForm").submit();
}

function fnEnrollDelete() {
	if($("input[name=memSeqs]:checkbox:checked").length === 0) {
        alert("교육생을 선택해 주세요.");
        return false;
    }
	
	if (!confirm("삭제할 경우 복구할 수 없습니다.\n그래도 삭제하시겠습니까?")) {
        return false;
    }
	
	$.ajax({
		type: "post",
		url: "${contextRoot}/adm/chsubjopen/EnrollDetailManageDelete.do",
		data: $("#listForm").serialize(),
		success: function(result) {
			alert(result);
			window.location.reload();
		},
		error: function() {
	        alert("처리 중 오류가 발생했습니다.");
	    }
	});
}

function fnEnrollApply() {
	if($("input[name=memSeqs]:checkbox:checked").length === 0) {
        alert("교육생을 선택해 주세요.");
        return false;
    }
	
	if (!confirm("수강승인 처리하시겠습니까?")) {
        return false;
    }
	
	$.ajax({
		type: "post",
		url: "${contextRoot}/adm/chsubjopen/EnrollDetailManageApply.do",
		data: $("#listForm").serialize(),
		success: function(result) {
			alert(result);
			window.location.reload();
		},
		error: function() {
	        alert("처리 중 오류가 발생했습니다.");
	    }
	});
}

function fnEnrollApplyCancel() {
	if($("input[name=memSeqs]:checkbox:checked").length === 0) {
        alert("교육생을 선택해 주세요.");
        return false;
    }
	
	if (!confirm("승인취소 처리하시겠습니까?")) {
        return false;
    }
	
	$.ajax({
		type: "post",
		url: "${contextRoot}/adm/chsubjopen/EnrollDetailManageApplyCancel.do",
		data: $("#listForm").serialize(),
		success: function(result) {
			alert(result);
			window.location.reload();
		},
		error: function() {
	        alert("처리 중 오류가 발생했습니다.");
	    }
	});
}

</script>

<style>
.btn_blue {background: #182142!important; color: #fff!important;}
.all_check {width:13px;height:13px;}
</style>

<section>
	<form id="listForm" name="listForm" method="post">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize }" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" /> 
		<input type="hidden" id="seqCd" name="seqCd" value="${resultMap.seqCd }" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId }" />
		<input type="hidden" id="memSeq" name="memSeq" value="" />
		
		<table class="detail">
			<colgroup>
	        	<col width="15%" />
	       		<col width="35%" />
	       		<col width="15%" />
	       		<col width="35%" />
	      	</colgroup>
			<tbody>
				<tr>
	            	<th>교육강좌명</th>
	            	<td>${resultMap.subjNm }</td>
	            	<th>운영과정코드</th>
	            	<td>${resultMap.seqCd }</td>
          		</tr>
          		<tr>
	            	<th>분류</th>
	            	<td>${resultMap.sgrNm} > ${resultMap.cateNm}</td>
	            	<th>교육기관</th>
	            	<td>${resultMap.comTitle}</td>
          		</tr>
          		<tr>
	            	<th>교육대상</th>
	            	<td>
		            	<label><input type="checkbox" id="eduTarget1" name="eduTarget1" value="1" <c:if test="${fn:contains(resultMap.eduTarget,'1')}">checked</c:if> disabled /> 초</label>&nbsp;&nbsp;
		            	<label><input type="checkbox" id="eduTarget2" name="eduTarget2" value="2" <c:if test="${fn:contains(resultMap.eduTarget,'2')}">checked</c:if> disabled /> 중</label>&nbsp;&nbsp;
		            	<label><input type="checkbox" id="eduTarget3" name="eduTarget3" value="3" <c:if test="${fn:contains(resultMap.eduTarget,'3')}">checked</c:if> disabled /> 고</label>&nbsp;&nbsp;
		            	<label><input type="checkbox" id="eduTarget4" name="eduTarget4" value="4" <c:if test="${fn:contains(resultMap.eduTarget,'4')}">checked</c:if> disabled /> 학부모</label>&nbsp;&nbsp;
		            	<label><input type="checkbox" id="eduTarget5" name="eduTarget5" value="5" <c:if test="${fn:contains(resultMap.eduTarget,'5')}">checked</c:if> disabled /> 성인</label>
	            	</td>
	            	<th>모집방법</th>
	            	<td>
	            		<c:if test="${resultMap.enrollType eq '1'}">선착순</c:if>
	            		<c:if test="${resultMap.enrollType eq '2'}">승인</c:if>
	            	</td>
	            </tr>
	            <tr>
	            	<th>모집인원</th>
	            	<td>${resultMap.capacity } 명</td>
	            	<th>대기인원</th>
	            	<td>${resultMap.waitEnrollCnt } 명</td>
	            </tr>
			</tbody>
		</table>
		
		<ul class="search-box" style="margin-top:20px;">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchEnrollStatusCd" name="searchEnrollStatusCd" title="신청상태" value="${searchVo.searchEnrollStatusCd}" style="width:150px;">
					<option value="">신청상태 전체</option>
					<option value="A" ${searchVo.searchEnrollStatusCd eq 'A' ? 'selected="selected"':''}>승인대기</option>
					<option value="B" ${searchVo.searchEnrollStatusCd eq 'B' ? 'selected="selected"':''}>수강승인</option>
					<option value="C" ${searchVo.searchEnrollStatusCd eq 'C' ? 'selected="selected"':''}>승인취소</option>
				</select>
				<input type="text" style="width:300px" value="${searchVo.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
			</li>
			<li class="search-btn">
				<button type="button" onclick="fn_search('1');">
					<i class="fa fa-search"></i> 검색
				</button>
			</li>
		</ul>
		
		<div class="btn-area" style="margin-bottom:20px;">
			<a href="#none" class="btn_blue" onclick="javascript:fnEnrollAddUserPopup();">교육생등록</a>
            <a href="#none" onclick="javascript:fnEnrollDelete();">교육생삭제</a>
            <a href="#none" class="btn_blue" onclick="javascript:fnEnrollApply();">교육생승인</a>
            <a href="#none" onclick="javascript:fnEnrollApplyCancel();">교육생승인취소</a>
            <a href="#none" onclick="javascript:fnCmdList();" style="float:right;">목록</a>
        </div>
		
		<table class="list-1" width="100%;" style="margin-top:20px;">
			<thead>
				<tr>
					<th style="width: 5%"><input type="checkbox" name="chkAll" id="chkAll" class="all_check" onclick="javascript:fn_check_all();"></th>
					<th style="width: 5%">No</th>
					<th style="width: 10%">이름</th>
					<th style="width: 10%">휴대전화</th>
					<th style="width: 15%">신청일자</th>
					<th style="width: 15%">신청상태</th>
					<th style="width: 15%">승인일자</th>
					<th style="width: 8%">관리자 등록여부</th>
					<th style="width: 7%">수료여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${resultList}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="memSeqs" class="all_check" value="<c:out value="${item.memSeq}"/>"></td>
						<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
						<td><a href="#" onclick="javascript:fnEnrollUpdate('${item.seqCd}', '${item.memSeq}');">${item.memName }</a></td>
						<td>${item.hpTel1 }</td>
						<td>${item.regDt }</td>
						<td>
							<c:choose>
								<c:when test="${item.enrollStatusCd eq 'A'}">승인대기</c:when>
								<c:when test="${item.enrollStatusCd eq 'B'}">수강승인</c:when>
								<c:when test="${item.enrollStatusCd eq 'C'}">승인취소</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:if test="${item.enrollStatusCd eq 'B'}">
								${item.enrollAppDt }
							</c:if>
						</td>
						<td>${item.forceYn }</td>
						<td>${item.completeYn }</td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(resultList) == 0}">
					<tr>
						<td colspan="9" class="no-data">
							<i class="fa fa-search"></i> 등록된 교육생이 없습니다.
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
	</form>
</section>
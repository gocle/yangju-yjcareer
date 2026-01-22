<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">

var pageSize = '${pageSize}'; //페이지당 그리드에 조회 할 Row 갯수;
var totalCount = '${totalCount}'; //전체 데이터 갯수
var pageIndex = '${pageIndex}'; //현재 페이지 정보

$(document).ready(function() {
	if ('' == pageSize) {
		pageSize = 16;
	}
	if ('' == totalCount) {
		totalCount = 0;
	}
	if ('' == pageIndex) {
		pageIndex = 1;
	}
	loadPage();
	 $('#searchKeyword').on('keypress', function(e){
		if(e.keyCode == '13'){		//???
			$('#searchBtn').click();
		} 
	});
	
});

function loadPage() {
	/* initEvent(); */
	initHtml();
}

function initHtml() {
   	com.pageNavi( "pageNavi", totalCount , pageSize , pageIndex );

	$("#pageSize").val(pageSize); //페이지당 그리드에 조회 할 Row 갯수;
	$("#pageIndex").val(pageIndex); //현재 페이지 정보
	$("#totalRow").text(totalCount);
}

function press(event) {
	if (event.keyCode==13) {		
		fn_search('1');
	}
}
 
function fn_search(param1){
	
	$("#pageIndex").val( param1 );
	var bcId = "${boardArticleVO.bcId}";
	var reqUrl ="${contextRoot}/adm/bbs/"+bcId+"/list.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

function fn_detail( bcId , baId){
	 
	var siteId = $("#siteId").val();
	var menuId = $("#menuId").val();
	$("#baId").val( baId ); 

	var reqUrl = "${contextRoot}/adm/bbs/"+bcId+"/detail.do?baId="+baId+"&menuId="+menuId;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
} 

</script>

<section>
	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="bcType" name="bcType" value="${boardConfigVO.bcType}" />
		<input type="hidden" id="baId" name="baId" value="" />

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCondition" name="searchCondition">
					<option value="">전체</option>
					<option value="BA_TITLE" ${param.searchCondition == 'BA_TITLE' ? 'selected="selected"' : ''}>제목</option>
					<option value="BA_CONTENT_HTML" ${param.searchCondition == 'BA_CONTENT_HTML' ? 'selected="selected"' : ''}>내용</option>
				</select>
				<input type="text" style="width:300px" value="${param.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="100" placeholder="검색어 입력" />
			</li>
			<li class="search-btn">
				<button type="button" onclick="fn_search('1');"><i class="fa fa-search"></i> 검색</button>
			</li>
		</ul>
	</form>

	<div class="promotion-list">
		<c:forEach items="${articleList}" var="articleList" varStatus="status">
			<a href="javascript:fn_detail('${articleList.bcId}','${articleList.baId}');">
				<dl>
					<dd>
						<img src="${contextRoot}/thumbnail/${articleList.baThumbpath}" onerror="this.style.visibility='hidden'" alt="" />
					</dd>
					<dt>${articleList.baTitle}</dt>
				</dl>
			</a>
		</c:forEach>
		<c:if test="${fn:length(articleList) == 0}">
			<dl>
				<dt style="text-align:center;"><i class="fa fa-search"></i> 최근 게시글이 없습니다.</dt>
			</dl>
		</c:if>
	</div>

	<div class="text-center">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
		</ul>

		<div class="text-right btn-area">
			<a href="${contextRoot }/adm/bbs/${boardConfigVO.bcId}/form.do?menuId=${menuId}">등록</a>
		</div>
	</div>
</section>
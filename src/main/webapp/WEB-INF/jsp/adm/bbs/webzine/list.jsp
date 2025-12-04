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


	

/*====================================================================
	화면 초기화 
====================================================================*/
function loadPage() {
	initEvent();
	initHtml();
}



/* 화면이 로드된후 처리 초기화 */
function initHtml() {

   com.pageNavi( "pageNavi", totalCount , pageSize , pageIndex );

	$("#pageSize").val(pageSize); //페이지당 그리드에 조회 할 Row 갯수;
	$("#pageIndex").val(pageIndex); //현재 페이지 정보
	$("#totalRow").text(totalCount);
}

/*====================================================================
	사용자 정의 함수 
====================================================================*/

function press(event) {
	if (event.keyCode==13) {		
		fn_search('1');
	}
}
 
/* 리스트 조회 */

 
function fn_search(param1){
	
	$("#pageIndex").val( param1 );
	
	var siteId = $("#siteId").val();
	
	var bcId = "${boardArticleVO.bcId}";

	var reqUrl = "/"+siteId+"/admin/bbs/"+bcId+"/list.do";
	
	$("#form").attr("action", reqUrl);
	
	$("#form").submit();
}


//협약 기업은 form으로
 function fn_detail( bcId , baId){
	 
			
	 var menuId = $("#menuId").val();
	 
	 var siteId = $("#siteId").val();
	 
	 $("#baId").val( baId ); 

	var reqUrl = "/"+siteId+"/admin/bbs/"+bcId+"/update.do?";
	
	$("#form").attr("action", reqUrl);
	
	$("#form").submit();
} 
 

 function baShow(checkbox, baId) {
	  var useYn = checkbox.checked ? '0' : '1';
	  var siteId = $("#siteId").val();
	  var bcId = "${boardArticleVO.bcId}";

	  $.ajax({
	    url: '/'+siteId+'/admin/bbs/'+bcId+'/baShow.do', // 실제 서버 URL
	    type: 'POST',
	    data: {
	      baId: baId,
	      baUse: useYn
	    },
	    success: function () {
	    	fn_search('${pageIndex}');
	    },
	    error: function () {
	      alert('요청 중 오류가 발생했습니다.');
	      checkbox.checked = !checkbox.checked;
	    }
	  });
	}

</script>




				<section>

  <form id="form" name="form" method="get" >
 <input type="hidden" id="pageSize" name="pageSize" value="${pageSize }" />
	<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex }" /> 	
	<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
	<input type="hidden" id="bcType" name="bcType" value="${boardConfigVO.bcType }" /><!-- gallary -->
	<input type="hidden" id="siteId" name="siteId" value="${siteId }" />
	<input type="hidden" id="baId" name="baId" value="" /> 
					<ul class="search-box">
						<li>
							<label><i class="fa fa-angle-right"></i> 검색조건</label>
							
							 <select id="searchCondition" name="searchCondition">
								<option>전체</option>		<!--아직 미수정  -->
								<option value="BA_TITLE"  ${param.searchCondition == 'BA_TITLE' ? 'selected="selected"' : ''}>제목</option>
							</select> 
							<input type="text" style="width:300px" value="${param.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
						</li>
						<li class="search-btn">
							<button type="button" onclick="fn_search('1');"><i class="fa fa-search"></i> 검색</button>
						</li>
					</ul>
					
</form> 
			     <c:set var="i" value="0" />
				 <c:set var="j" value="4" />
				 
					<table class="list-1">
						<thead>
							<tr>
								<th style="width: 5%">순번</th>
						 		<th style="width: 10%">로고</th>
								<th style="width: 10%">학습 기업명</th>
								<th style="width: 10%">학습 기업 URL</th>
								<th style="width: 5%">우편 번호</th>
								<th style="width: 10%">학습 기업 주소</th>
								<th style="width: 4%">홈페이지에 <br>노출/숨기기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="articleList" items="${articleList}" varStatus="status">
								<tr>
									<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
									
									<td ><img style="width: 150px; height: 50px;" src="/thumbnail/${articleList.baThumbpath}" onerror="this.src ='/assets/job/image/agreement_logo_default.png'" >
									
									<td class="text-center"><a href="javascript:fn_detail('${articleList.bcId}','${articleList.baId}');">${articleList.baTitle}</a></td>
									
									<td >${articleList.baInfo}</td>
									
									<td class="text-center">${articleList.zipCode}</td>
									
									<td class="text-center">${articleList.address}&nbsp;${articleList.addressDtl}</td>
									
									<td class="text-center"><input type="checkbox" onclick="baShow(this, '${articleList.baId}')" <c:if test="${articleList.baUse eq null || articleList.baUse eq 0}">checked</c:if>  /></td>
								</tr>
							</c:forEach>
	
						<c:if test="${fn:length(articleList) == 0}">
								<tr>
									<td colspan="6" class="no-data"><i class="fa fa-search"></i> 최근 게시글이 없습니다.</td>
								</tr>
						</c:if> 
							
						<tbody>
					</table>

					<div class="text-center">
				  		<ul class="pagination">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
						</ul>  

						<div class="text-right btn-area">
							<a href="/yjcareer/adm/bbs/${boardConfigVO.bcId}/form.do?menuId=${menuId}">등록</a>
						</div>
					</div>
				</section>

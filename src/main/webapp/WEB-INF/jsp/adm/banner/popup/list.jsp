<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">
var pageSize = '${pageSize}'; //페이지당 그리드에 조회 할 Row 갯수;
var totalCount = '${totalCount}'; //전체 데이터 갯수
var pageIndex = '${pageIndex}'; //현재 페이지 정보

$(document).ready(function() {
	if ('' == pageSize) {
		pageSize = 10;
	}
	if ('' == totalCount) {
		totalCount = 0;
	}
	if ('' == pageIndex) {
		pageIndex = 1;
	}
	loadPage();
	$('#searchKeyword').on('keypress', function(e) {
		if (e.keyCode == '13') { //???
			$('#searchBtn').click();
		}
	});

});


function loadPage() {
	/* initEvent();*/
		initHtml(); 

}

function initHtml() {
	com.pageNavi("pageNavi", totalCount, pageSize, pageIndex);

	$("#pageSize").val(pageSize); //페이지당 그리드에 조회 할 Row 갯수;
	$("#pageIndex").val(pageIndex); //현재 페이지 정보
	$("#totalRow").text(totalCount);
}

function press(event) {
	if (event.keyCode == 13) {
		fn_search('1');
	}
}

// 리스트 조회 
function fn_search(param1) {
	$("#pageIndex").val(param1);
	var bnType = $("#bnType").val();
	var reqUrl = "${contextRoot}/adm/banner/" + bnType + "/list.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

//배너, 팝업  , 공지 상세보기
function fn_detail(param1) {
	var bnId = $("#bnId").val(param1); //검색 조건
	var bnType = $("#bnType").val();
	
	var reqUrl = "${contextRoot}/adm/banner/" + bnType + "/updateForm.do";
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}
	
//팝업창 미리 보기
/* function fn_preView( bnName , bnType , bnDescription) {
    $("#popup_bnName").append(bnName);
    $("#popup_bnType").append(bnType);
    $("#popup_bnContent").append(bnDescription);
 	var url = 'http://'+urlData;
	
	alert(leftData);
	
	if(urlData == ""){
		alert('해당 팝업은 주소가 설정되지 않았습니다.');
		return false;
	}
	window.open(url, "PopupWin",'width='+widthData+',height='+heightData+',top='+topData+'left='+leftData);
} */
	
function closePop(bnId){
	$("#popup_"+bnId).css('display','none');
}
</script>

<section>
	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="bnType" name="bnType" value="${bnType}" />
		<input type="hidden" id="bnId" name="bnId" value="" />

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>
				<select id="searchCondition" name="searchCondition">
					<option>전체</option>
					<option value="BN_NAME" ${param.searchCondition == 'BN_NAME' ? 'selected="selected"' : ''}>팝업 이름</option>
				</select>
				<input type="text" style="width: 300px" value="${param.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
			</li>
			<li class="search-btn">
				<button type="button" onclick="fn_search('1');">
					<i class="fa fa-search"></i> 검색
				</button>
			</li>
		</ul>
	</form>

	<c:forEach var="bnTypeList" items="${bnList}" varStatus="status">
<%-- 		<dl class="notice-popup" id="popup_${bnTypeList.bnId}" style="display: none; top: ${bnTypeList.bnTop}px; left: ${bnTypeList.bnLeft}px; width: ${bnTypeList.bnWidth}px; height: ${bnTypeList.bnHeight}px;">
			<dt>
				<div id="popup_bnName">${bnTypeList.bnName}</div>
			</dt>
			<dd>
				<div class="popup-body" style="width:${bnTypeList.bnWidth - 30}px; height:${bnTypeList.bnHeight - 120}px;">
					<span id="popup_bnContent">${bnTypeList.bnDescription}</span>
					<!-- <a href=""><img src="../assets/image/popup_img_210317_01.png" alt="공지사항 이미지" /></a> -->
				</div>

				<link rel="stylesheet" type="text/css" href="../assets/css/jquery.mCustomScrollbar.css">
				<script type="text/javascript" src="../assets/script/jquery.mCustomScrollbar.concat.min.js"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
				<script type="text/javascript">
					(function ($) {
						//레이어 팝업 움직이기
						$(".notice-popup").draggable();

						$(window).load(function () {
							$(".popup-body").mCustomScrollbar({
								axis: "yx",
								theme: "minimal-dark",
								advanced: { autoExpandHorizontalScroll: true }
							});
						});
					})(jQuery);
				</script>
			</dd>
			<dd class="close-area">
				<!-- <input type="checkbox" id="today" class="hidden" />
				<label for="today"><p class="check"></p><span>오늘 하루 안보기</span></label> -->
				<button class="close-popup" onclick="javascript:closePop('${bnTypeList.bnId}');">CLOSE</button>
			</dd>
		</dl> --%>
		
		
		<div class="notice-popup" id="popup_${bnTypeList.bnId}" style="top: ${bnTypeList.bnTop}px; left: ${bnTypeList.bnLeft}px; width: ${bnTypeList.bnWidth}px; height: ${bnTypeList.bnHeight}px;">
			<div>
				<span id="popup_bnContent">${bnTypeList.bnDescription}</span>
			</div>
			<dd class="close-area">
				<button class="close-popup" onclick="javascript:closePop('${bnTypeList.bnId}');">CLOSE</button>
			</dd>
		</div>
	</c:forEach>

	<table class="list-1">
		<thead>
			<tr>
				<th style="width: 7%">번호</th>
				<th style="width: 20%">팝 업 명</th>
				<th style="width: 20%">기 간</th>
				<th style="width: 20%">사용 여부</th>
				<th style="width: 20%">미리 보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bnTypeList" items="${bnList}" varStatus="status">
				<input type="hidden" id="bnTitle" value="${bnTypeList.bnName}" />
				<tr>
					<td><c:out value="${totalCount - ((pageIndex - 1) * pageSize + status.index)}" /></td>
					<td class="text-left"><a href="javascript:fn_detail('${bnTypeList.bnId}');">${bnTypeList.bnName}</a></td>
					<td>${bnTypeList.bnStartDate} ~ ${bnTypeList.bnEndDate}</td>
					<td class="text-center">
						<c:if test="${bnTypeList.bnUse eq '1'}">사용</c:if>
						<c:if test="${bnTypeList.bnUse eq '0'}">미사용</c:if>
					</td>
					<td class="text-center">
						<button type="button" class="type-1 btn-popup" data-target="popup_${bnTypeList.bnId}">
							<i class="fa fa-search"></i> 미리보기
						</button>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(bnList) == 0}">
				<tr>
					<td colspan="5" class="no-data"><i class="fa fa-search"></i> 최근 게시글이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

	<div class="text-center">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
		</ul>

		<div class="text-right btn-area">
			<a href="${contextRoot}/adm/banner/${bnType}/insertForm.do?menuId=${menuId}">등록</a>
		</div>
	</div>
</section>
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

function fn_search(pageIndex){
    $("#pageIndex").val(pageIndex);

    let reqUrl = "${contextRoot}/adm/chsubj/SubjCateManageList.do";

    $("#listForm").attr("action", reqUrl);
    $("#listForm").submit();
}

function fnCmdInsertForm(cateCd, sgrCd){
    $("#upperCateCd").val(cateCd);
    $("#sgrCd").val(sgrCd);

    let reqUrl = "${contextRoot}/adm/chsubj/SubjCateManageInsertForm.do";

    $("#listForm").attr("action", reqUrl);
    $("#listForm").submit();
}

function fnCmdUpdateForm(cateCd, sgrCd, upperCateCd){
    $("#cateCd").val(cateCd);
    $("#sgrCd").val(sgrCd);
    $("#upperCateCd").val(upperCateCd);

    let reqUrl = "${contextRoot}/adm/chsubj/SubjCateManageUpdateForm.do";

    $("#listForm").attr("action", reqUrl);
    $("#listForm").submit();
}

function fnCmdDelete(cateCd, sgrCd, subjCnt) {
    if (subjCnt > 0) {
        alert('해당 분류에 연결된 과정이 있습니다.');
        return false;
    }

    if (!confirm("정말 삭제하시겠습니까?")) {
        return false;
    }

    $("#cateCd").val(cateCd);
    $("#sgrCd").val(sgrCd);

    let reqUrl = "${contextRoot}/adm/chsubj/SubjCateManageDelete.do";

    $("#listForm").attr("action", reqUrl);
    $("#listForm").submit();
}

//type: 'Up' 또는 'DW'
//name: 라디오 name (예: 'sortOrder')
function fnOrderDoc(type, name) {
 var $radios = $("input[name='" + name + "']");
 var moved = 0;

 $radios.each(function () {
     if ($(this).is(":checked")) {
         var $row = $(this).closest("tr");

         if (type === "DW") { // 아래로
             var $next = $row.next("tr");
             if ($next.length) {
                 $next.after($row);
                 moved++;
             }
         } else {             // 위로
             var $prev = $row.prev("tr");
             if ($prev.length) {
                 $prev.before($row);
                 moved++;
             }
         }
     }
 });

 if (moved === 0) {
     alert("체크된 정보가 없습니다.");
 }
}


//name: 정렬용 prefix (예: 'sortOrder') -> 지금 구조에선 사실 안 써도 됨
//tbnm: 서버에 넘길 테이블명/코드 (예: 'subjCate')
function fnOrderUpdate(name, tbnm) {
 var $form = $("#listForm");
 var listOrderCnt = 1;

 // 기존 order hidden 제거
 $form.find("input[name='order']").remove();

 // 화면에 보이는 순서대로 sortKey 옆에 order 부여
 $form.find("input[name='sortKey']").each(function () {
     // 이 sortKey 뒤에 order hidden 하나씩 추가
     $("<input>", {
         type: "hidden",
         name: "order",
         value: listOrderCnt++
     }).insertAfter($(this));
 });

 // tbnm hidden 갱신
 $form.find("input[name='tbnm']").remove();
 $("<input>", {
     type: "hidden",
     name: "tbnm",
     value: tbnm
 }).appendTo($form);

 if (!confirm("정렬을 저장하시겠습니까?")) {
     return;
 }

 var reqUrl = "${contextRoot}/adm/chsubj/OrderUpdate.do";  // 필요하면 여기만 수정
 $form.attr("action", reqUrl);
 $form.submit();
}

</script>

<style>
.radio {
    width: 11px;
    height: 11px;
    transform: scale(0.5);
    cursor: pointer;
}
</style>

<section>
	<form id="listForm" name="listForm" method="post">
		<!-- 공통에서 쓸 것 같아서 숨김값 몇 개 추가 -->
		<input type="hidden" id="cateCd" name="cateCd" value="${subjCateManageVo.cateCd}" />
		<input type="hidden" id="upperCateCd" name="upperCateCd" value="${subjCateManageVo.upperCateCd}" />
		<input type="hidden" id="menuNo" name="menuNo" value="${menuNo}" />
		<input type="hidden" id="sgrCd" name="sgrCd" value="${subjCateManageVo.searchSgrCd}" />

		<!-- 페이징용 hidden (프로그램 리스트 예제 스타일 참고) -->
		<input type="hidden" id="pageSize" name="pageSize" value="${subjCateManageVo.pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${subjCateManageVo.pageIndex}" />

		<ul class="search-box">
			<li>
				<label><i class="fa fa-angle-right"></i> 검색조건</label>

				<select id="searchSgrCd" name="searchSgrCd" title="교육사이트">
					<option value="">분류 전체</option>
					<c:forEach var="item" items="${sgrManageList}">
						<option value="${item.sgrCd}"
							<c:if test="${item.sgrCd eq subjCateManageVo.searchSgrCd}">selected="selected"</c:if>>
							${item.sgrNm}
						</option>
					</c:forEach>
				</select>

			</li>
			<li class="search-btn">
				<button type="button" onclick="fn_search('1');">
					<i class="fa fa-search"></i> 검색
				</button>
			</li>
		</ul>
	

	<div class="text-right btn-area" style="padding-bottom:10px;">
		<c:if test="${0 ne fn:length(sgrManageList)}">
			<a href="#none" onclick="fnOrderDoc('Up','sortOrder')" class="btn btn_01">
				<span>↑</span>
			</a>
			<a href="#none" onclick="fnOrderDoc('DW','sortOrder')" class="btn btn_01">
				<span>↓</span>
			</a>
			<a href="#none" onclick="fnOrderUpdate('sortOrder','subjCate')" class="btn btn_03">
				정렬저장
			</a>
		</c:if>
	</div>

	<table class="list-1" width="100%">
		<thead>
			<tr>
				<th style="width: 8%">순서변경</th>
				<th style="width: 12%">분류코드</th>
				<th style="width: 40%">분류명</th>
				<th style="width: 10%">사용여부</th>
				<th style="width: 15%">하위 분류 추가</th>
				<th style="width: 7%">수정</th>
				<th style="width: 8%">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${sgrManageList}" varStatus="itemStatus">
				<!-- 루트 행 -->
				<tr>
					<td></td>
					<td class="al" style="font-weight: bold;"></td>
					<td class="al" style="font-weight: bold; text-align:left;">Root (${item.sgrNm})</td>
					<td style="text-align: center;">-</td>
					<td style="text-align: center;">
						<a href="javascript:void(0);" 
						   onclick="fnCmdInsertForm('${item.sgrCd}', '${item.sgrCd}')" 
						   class="btn btn_02">
							하위 분류 추가
						</a>
					</td>
					<td style="text-align: center;">-</td>
					<td style="text-align: center;">-</td>
				</tr>

				<!-- 하위 분류 목록 -->
				<c:forEach var="result" items="${resultList}" varStatus="resultStatus">
					<c:if test="${result.sgrCd eq item.sgrCd}">
						<tr>
							<td style="text-align: center;" class="radio">
								<c:if test="${result.underCnt eq '0'}">
									<input type="hidden" id="sortKey" name="sortKey" value="${result.cateCd}" />
									<input type="radio" id="sortOrder" name="sortOrder" value="${result.sortOrder}" />
								</c:if>
							</td>
							<td style="text-align: center;">${result.cateCd}</td>
							<td class="al" style="text-align:left;">
								<c:forEach begin="1" end="${fn:length(fn:split(result.catePath, '/'))}">
									&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								${result.cateNm}
							</td>
							<td style="text-align: center;">${result.useYn}</td>
							<td style="text-align: center;">
								<c:if test="${fn:length(fn:split(result.catePath, '/')) < 2}">
									<!-- 1depth까지 생성 가능 -->
									<a href="javascript:void(0);" 
									   onclick="fnCmdInsertForm('${result.cateCd}', '${result.sgrCd}')" 
									   class="btn btn_02">
										하위 분류 추가
									</a>
								</c:if>
							</td>
							<td style="text-align: center;">
								<a href="javascript:void(0);" 
								   onclick="fnCmdUpdateForm('${result.cateCd}', '${result.sgrCd}', '${result.upperCateCd}')" 
								   class="btn btn_02">
									수정
								</a>
							</td>
							<c:choose>
								<c:when test="${result.underCnt eq '0'}">
									<td style="text-align: center;">
										<a href="javascript:void(0);" 
										   onclick="fnCmdDelete('${result.cateCd}', '${result.sgrCd}', ${result.subjCnt}); return false;" 
										   class="btn btn_03">
											삭제
										</a>
									</td>
								</c:when>
								<c:otherwise>
									<td style="text-align: center;">-</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:if>
				</c:forEach>
			</c:forEach>

			<c:if test="${fn:length(sgrManageList) == 0}">
				<tr>
					<td colspan="7" class="no-data">
						<i class="fa fa-search"></i> 등록된 분류가 없습니다.
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	</form>
</section>
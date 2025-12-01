<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	 $('#searchKeyword').on('keypress', function(e){
		if(e.keyCode == '13'){		
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

function fn_loadYears() {
    var classType = $('#classType').val();
    /* if (!classType) {
        $('#year').empty().append('<option value="">선택</option>');
        $('#month').empty().append('<option value="">선택</option>');
        return;
    } */

    $.ajax({
        url: '${contextRoot}/adm/stats/wood/dateList.do',
        data: { classType: classType, yearYn: true },
        dataType: 'json',
        success: function(data) {
            var yearSelect = $('#year');
            yearSelect.empty().append('<option value="">선택</option>');
            data.yearList.forEach(function(year){
                yearSelect.append('<option value="' + year + '">' + year + '</option>');
            });
            $('#month').empty().append('<option value="">선택</option>');
        }
    });
}

function fn_loadMonths() {
	var classType = $('#classType').val();
    var year = $('#year').val();
    if (!classType || !year) return;

    $.ajax({
        url: '${contextRoot}/adm/stats/wood/dateList.do',
        data: { classType: classType, year: year, monthYn: true },
        dataType: 'json',
        success: function(data) {
            var monthSelect = $('#month');
            monthSelect.empty().append('<option value="">전체</option>');
            data.monthList.forEach(function(month){
                monthSelect.append('<option value="' + month + '">' + month + '월</option>');
            });
        }
    });
}

function fn_search() {
	var classType = $('#classType').val();
    var year = $('#year').val();
    var month = $('#month').val();

    if (!classType) {
        alert('유형을 선택하세요.');
        return;
    }
    if (!year || !month) {
        alert('연도와 월을 모두 선택해야 조회할 수 있습니다.');
        return;
    }

    $('#form').submit(); 
}

function fn_excel() {
    var classType = $('#classType').val();
    var year = $('#year').val();
    var month = $('#month').val();

    if (!classType || !year || !month) {
        alert('유형, 연도, 월을 모두 선택해야 합니다.');
        return;
    }

    var url = '${contextRoot}/adm/stats/' + $('#pgType').val() + '/programStatsExcel.do';
    url += '?classType=' + classType + '&year=' + year + '&month=' + month;
    window.location.href = url;
}

</script>

<section>
	<form id="form" name="form" method="get">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
		<input type="hidden" id="pgType" name="pgType" value="${statsVO.pgType}" />
		<input type="hidden" id="pgId" name="pgId" value="${statsVO.pgId}" />

		<ul class="search-box">
		    <li>
			    <label><i class="fa fa-angle-right"></i> 유형</label>
			    <select id="classType" name="classType" onchange="fn_loadYears();">
			        <option value="">선택</option>
			        <c:forEach var="type" items="${classTypeList}">
			        	<option value="${type}" <c:if test="${statsVO.classType eq type}">selected="selected"</c:if>>
					        <c:choose>
					            <c:when test="${type eq 'ONEDAY'}">원데이클래스</c:when>
					            <c:when test="${type eq 'DIY'}">DIY</c:when>
					            <c:when test="${type eq 'CHILD'}">유치원</c:when>
					            <c:otherwise>-</c:otherwise>
					        </c:choose>
					    </option>
					</c:forEach>
			    </select>
			</li>
		    <li>
		        <label><i class="fa fa-angle-right"></i> 연도</label>
		        <select id="year" name="year" onchange="fn_loadMonths();">
		            <option value="">선택</option>
		            <c:forEach var="year" items="${yearList}">
		                <option value="${year}" <c:if test="${statsVO.year eq year}">selected="selected"</c:if>>${year}년</option>
		            </c:forEach>
		        </select>
		    </li>
		    <li>
		        <label><i class="fa fa-angle-right"></i> 월</label>
		        <select id="month" name="month">
		            <option value="">선택</option>
		            <c:forEach var="month" items="${monthList}">
		                <option value="${month}" <c:if test="${statsVO.month eq month}">selected="selected"</c:if>>${month}월</option>
		            </c:forEach>
		        </select>
		    </li>
		    <li class="search-btn">
		        <button type="button" onclick="fn_search();"><i class="fa fa-search"></i> 조회</button>
		    </li>
		</ul>
	</form>
	
<c:choose>
	<c:when test="${fn:length(statsList) > 0}">
	<div class="text-right btn-area" style="margin-bottom: 5px;">
		<a href="javascript:fn_excel();" class="point" id="btn_excel">엑셀 다운로드</a>
	</div>
        <table class="list-1 top-list-1">
            <thead>
                <tr>
                    <th>총계</th>
                    <th>총 인원</th>
                    <th>총 체험금액</th>
                    <th>총 결제금액</th>
                    <th>총 남</th>
                    <th>총 여</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${statsVO.year}년 ${statsVO.month}월</td>
                    <td>${totalStats.peopleCnt}</td>
                    <td><fmt:formatNumber value="${totalStats.price}" pattern="#,###"/></td>
                    <td><fmt:formatNumber value="${totalStats.totalAmt}" pattern="#,###"/></td>
                    <td>${totalStats.totalMCnt}</td>
                    <td>${totalStats.totalFCnt}</td>
                </tr>
            </tbody>
        </table>

        <h3>일자별 상세</h3>
        <table class="list-1">
            <thead>
                <tr>
                    <th>프로그램명</th>
                    <th>체험일</th>
                    <th>체험품목</th>
                    <th>인원</th>
                    <th>체험금액</th>
                    <th>총금액</th>
                    <th>통장내역날짜(결제일)</th>
                    <th>통장내역금액(실제결제금액)</th>
                    <th>통장내역이름</th>
                    <th>남</th>
                    <th>여</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${statsList}">
                    <tr>
                        <td>${row.pgName}</td>
                        <td>${row.slotDate} ${row.slotNo}부</td>
                        <td>${row.productName}</td>
                        <td>${row.peopleCnt}</td>
                        <td><fmt:formatNumber value="${row.price + row.optionPrice}" pattern="#,###"/></td>
                        <td><fmt:formatNumber value="${(row.price + row.optionPrice) * row.peopleCnt}" pattern="#,###"/></td>
                        <td>${row.payDt}</td>
                        <td><fmt:formatNumber value="${row.amount}" pattern="#,###"/></td>
                        <td>${row.payName}</td>
                        <td>${row.mCnt}</td>
                        <td>${row.fCnt}</td>
                        <td>${row.note}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-center">
            <ul class="pagination">
                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
            </ul>
        </div>
    </c:when>

    <c:otherwise>
        <table class="list-1">
            <tbody>
                <tr>
                    <td colspan="12" class="no-data">
                        <i class="fa fa-search"></i> 조회된 데이터가 없습니다.
                    </td>
                </tr>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</section>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<c:set var="now" value="<%= new Date() %>" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>간이세금계산서</title>
<style>
    body { font-family: '맑은 고딕', Arial, sans-serif; }
    table { border-collapse: collapse; width: 700px; margin: 20px auto; }
    th, td { border: 1px solid #000; padding: 5px; text-align: center; }
    th { background-color: #f0f0f0; }
    .title { text-align: center; font-weight: bold; font-size: 18px; }
    .no-border { border: none; }

.invoice-table {
    border-collapse: collapse;
    width: 700px;
    margin: 30px auto;  /* 위아래 간격 늘림 */
}

.invoice-table th, .invoice-table td {
    border: 1px solid #000;
    padding: 8px;        /* 셀 안 여백 늘림 */
    text-align: center;
}

.invoice-table + .invoice-table {
    margin-top: 40px;    /* 테이블 사이 간격 */
}
.invoice-table .no-border {
    border: none;
}
</style>
</head>
<body>

<!-- 상단 공급자/공급받는자 -->
<table class="invoice-table">
    <tr>
        <td class="title" colspan="3">간이세금계산서</td>
    </tr>
    <tr>
        <td class="no-border">공급받는자</td>
        <td class="no-border" colspan="2">${customerName} 귀하</td>
    </tr>
    <tr>
        <th>영업자</th>
        <th>납세번호</th>
        <th>주소</th>
    </tr>
    <tr>
        <td>${supplierName}</td>
        <td>${supplierRegNo}</td>
        <td>경기도 양주시 부흥로 1533(남방동)</td>
    </tr>
    <tr>
        <th>성명</th>
        <th>업태</th>
        <th>종목</th>
    </tr>
     <tr>
        <td>공급자명</td>
        <td>업태</td>
        <td>종목</td>
    </tr>
    <tr>
        <th>작성일시</th>
        <th>금액</th>
        <th>인원</th>
    </tr>
    <tr>
        <td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm"/></td>
        <td><fmt:formatNumber value="${amount}" pattern="#,###"/> 원</td>
        <td>
            <c:choose>
                <c:when test="${peopleCnt != null}">
                   ${peopleCnt} 명
                </c:when>
                <c:otherwise>
                  	1 명
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
    	<td class="title" colspan="3">위 금액을 영수(청구)함</td>
    </tr>
</table>

<table class="invoice-table">
    <tr>
        <th>결제일</th>
        <th>품목</th>
        <th>수량</th>
        <th>단가</th>
        <th>금액</th>
        <th>비고</th>
    </tr>
    <tr>
        <td>${payDt}</td>
        <td>${productName}</td>
        <c:choose>
            <c:when test="${peopleCnt != null}">
                <td>${peopleCnt}</td>
                <td><fmt:formatNumber value="${amount * peopleCnt}" pattern="#,###"/> 원</td>
            </c:when>
            <c:otherwise>
                <td>1</td>
                <td><fmt:formatNumber value="${amount}" pattern="#,###"/> 원</td>
            </c:otherwise>
        </c:choose>
        <td><fmt:formatNumber value="${amount}" pattern="#,###"/> 원</td>
        <td>-</td>
    </tr>
</table>

<div style="text-align:center; margin-top:20px;">
    <button onclick="window.print()">출력</button>
</div>

</body>
</html>
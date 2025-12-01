<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">

function fn_search(param1){
	
	$("#pageIndex").val( param1 );
	var pgType = "${programVO.pgType}";
	var reqUrl ="${contextRoot}/adm/program/"+pgType+"/list.do";
	
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

</script>

<section>

<table class="list-1">
    <thead>
        <tr>
            <th style="width:5%">순번</th>
            <th style="width:10%">프로그램명</th>
            <th style="width:10%">체험일</th>
            <th style="width:7%">회차</th>
            <th style="width:7%">시간</th>
            <th style="width:7%">정원</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="resultList" items="${resultList}" varStatus="status">
            <tr>
                <td><c:out value="${status.index+1}" /></td>
                <td>${resultList.pgName}</td>
                <td>${programVO.startDate} ~ ${programVO.endDate}</td>
                <td>${resultList.slotNo}회차</td>
                <td>${resultList.startTime} ~ ${resultList.endTime}</td>
                <td>${resultList.capacity}</td>
            </tr>
        </c:forEach>

        <c:if test="${fn:length(resultList) == 0}">
            <tr>
                <td colspan="6" class="no-data"><i class="fa fa-search"></i> 시간표 정보가 없습니다.</td>
            </tr>
        </c:if>
    </tbody>
</table>

</section>
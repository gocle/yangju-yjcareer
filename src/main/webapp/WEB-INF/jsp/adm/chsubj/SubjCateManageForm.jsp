<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<c:choose>
    <c:when test="${cmd eq 'Insert'}">
        <c:set var="cmdUrl" value="SubjCateManageInsert.do" />
        <c:set var="buttonSaveText" value="등록" />
    </c:when>
    <c:when test="${cmd eq 'Update'}">
        <c:set var="cmdUrl" value="SubjCateManageUpdate.do" />
        <c:set var="buttonSaveText" value="수정" />
        <c:set var="readOnly" value="true" />
    </c:when>
</c:choose>

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

$(function() {
    // 숫자만 입력 (sortOrder)
    $('#sortOrder').on('input', function() {
        this.value = this.value.replace(/[^0-9]/g, '');
    });
});

// 목록으로
function fnCmdList() {
    $("#detailForm").attr("action", "SubjCateManageList.do");
    $("#detailForm").submit();
}

// 저장 (등록/수정 공용)
function fnCmdSave() {
    if ($.trim($("#cateNm").val()) === "") {
        alert("분류명을 입력해 주세요.");
        $("#cateNm").focus();
        return false;
    }

    $("#detailForm").attr("action", "${cmdUrl}");
    $("#detailForm").submit();
}

// 저장 후 계속등록
function fnCmdKeep() {
    if ($.trim($("#cateNm").val()) === "") {
        alert("분류명을 입력해 주세요.");
        $("#cateNm").focus();
        return false;
    }

    $("#detailForm").attr("action", "SubjCateManageInsert.do");
    $("#detailForm").submit();
}

// 삭제
function fnCmdDelete() {
    if (!confirm("정말 삭제하시겠습니까?")) {
        return false;
    }

    $("#detailForm").attr("action", "SubjCateManageDelete.do");
    $("#detailForm").submit();
}

</script>

 <section>
        <form id="detailForm" name="detailForm" method="post">

            <!-- hidden 값들 -->
            <input type="hidden" id="sgrCd" name="sgrCd" value="${sgrMap.sgrCd}" />
            <c:if test="${resultMap.cateCd != null}">
                <input type="hidden" id="cateCd" name="cateCd" value="${resultMap.cateCd}" />
            </c:if>
            <input type="hidden" id="upperCateCd" name="upperCateCd"
                   value="${empty resultUpperMap.cateCd ? sgrMap.sgrCd : resultUpperMap.cateCd}" />
            <input type="hidden" id="pageIndex" name="pageIndex" value="${searchVo.pageIndex}" />

            <!-- 교육사이트 정보 -->
            <table class="table00" width="80%">
                <colgroup>
                    <col width="150" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><span class="red">* </span>교육사이트</th>
                        <td><c:out value="${sgrMap.sgrNm}" /></td>
                    </tr>
                </tbody>
            </table>

            <!-- 상위 분류 -->
            <c:if test="${not empty resultUpperMap}">
                <table class="table00" width="80%">
                    <colgroup>
                        <col width="150" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>상위 분류</th>
                            <td>
                                <c:out value="${resultUpperMap.cateNm}" />
                                (<c:out value="${resultUpperMap.cateCd}" />)
                            </td>
                        </tr>
                    </tbody>
                </table>
            </c:if>

            <!-- 분류 정보 입력 -->
            <table class="table00" width="80%">
                <colgroup>
                    <col width="150" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><span class="red">* </span>분류명</th>
                        <td>
                            <input type="text"
                                   id="cateNm"
                                   name="cateNm"
                                   value="${resultMap.cateNm}"
                                   title="분류명"
                                   class="required q1" />
                        </td>
                    </tr>

                    <!-- 신규일 때만 분류코드 직접 입력 -->
                    <c:if test="${resultMap.cateCd == null}">
                        <tr>
                            <th>분류 코드</th>
                            <td>
                                <input type="text"
                                       id="cateCdInput"
                                       name="cateCd"
                                       value="${resultMap.cateCd}"
                                       title="분류 코드"
                                       class="required q1" />
                            </td>
                        </tr>
                    </c:if>

                    <tr>
                        <th>분류 설명</th>
                        <td>
                            <textarea id="cateDesc"
                                      name="cateDesc"
                                      title="분류설명"
                                      class="q4"
                                      rows="3">${resultMap.cateDesc}</textarea>
                        </td>
                    </tr>

                    <tr>
                        <th>정렬 순서</th>
                        <td>
                            <input type="text"
                                   id="sortOrder"
                                   name="sortOrder"
                                   size="3"
                                   title="정렬 순서"
                                   value="${empty resultMap.sortOrder ? sortOrder : resultMap.sortOrder}" />
                        </td>
                    </tr>

                    <tr>
                        <th>사용 여부</th>
                        <td>
                            <label>
                                <input type="radio" name="useYn" value="Y"
                                    <c:if test="${empty resultMap.useYn or resultMap.useYn eq 'Y'}">checked="checked"</c:if> />
                                사용
                            </label>
                            &nbsp;&nbsp;
                            <label>
                                <input type="radio" name="useYn" value="N"
                                    <c:if test="${resultMap.useYn eq 'N'}">checked="checked"</c:if> />
                                미사용
                            </label>
                        </td>
                    </tr>
                </tbody>
            </table>

            <br />

            <!-- 버튼 영역 -->
            <div class="text-right btn-area">
                <a href="javascript:void(0);" onclick="fnCmdSave();" class="btn btn_01">
                    ${buttonSaveText}
                </a>

                <c:if test="${cmd eq 'Insert'}">
                    <a href="javascript:void(0);" onclick="fnCmdKeep();" class="btn btn_01">
                        계속등록
                    </a>
                </c:if>

                <c:if test="${cmd eq 'Update'}">
                    <a href="javascript:void(0);" onclick="fnCmdDelete();" class="btn btn_01">
                        삭제
                    </a>
                </c:if>

                <a href="javascript:void(0);" onclick="fnCmdList();" class="btn btn_01">
                    목록
                </a>
            </div>

        </form>
    </section>
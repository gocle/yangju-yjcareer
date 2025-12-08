<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>
<c:import url="/adm/menu/leftMenu.do" />

<script type="text/javascript">

var pageSize = '${pageSize}'; 
var totalCount = '${totalCount}'; 
var pageIndex = '${pageIndex}';

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

/* 화면이 로드된후 처리 초기화 */
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

 //리스트 조회 
function fn_search( param1 ){
	$("#pageIndex").val( param1 );
	var menuId = $("#menuId").val();
	var reqUrl = "${contextRoot}/adm/member/memconfig/list.do";
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}

//상세보기
 function fn_detail( param1 ){
	var memSeq = $("#memSeq").val( param1 );   //검색 조건
	var reqUrl = "${contextRoot}/adm/member/memconfig/updateForm.do?memSeq="+memSeq;
	$("#form").attr("action", reqUrl);
	$("#form").submit();
}  

//비밀번호 초기화
function passReset(memSeq , memId , decryEmail) {
	if(confirm('비밀번호 초기화 됩니다. 초기화하시겠습니까?')){
		$.ajax({
			url:"${contextRoot}/adm/member/memconfig/resetPassword.do",
	        type:"post",
	        dataType : "json",
	        data: {
	        	"memSeq":memSeq,
	        	"memId":memId,
	        	"email": decryEmail
	        },
	        success:function(data){
			if (data == 'SUCCESS') {
					alert("초기화되었습니다.");
					window.location.href = "${contextRoot}/adm/member/memconfig/list.do?menuId=${menuId}";

				} else if (data == "FALE") {
					alert("비밀번호가 변경되지 않았습니다.");
					window.location.href = "${contextRoot}/adm/member/memconfig/list.do?menuId=${menuId}";

				} else if (data == "NODATA") {
					alert("회원정보가 없습니다.");
					window.location.href = "${contextRoot}/adm/member/memconfig/list.do?menuId=${menuId}";
				}

			},
			error : function(xhr, status, error) {
				//alert("등록된 아이디가 있습니다.");
			}
		});
		} else {
			window.location.href = "${contextRoot}/adm/member/memconfig/list.do?menuId=${menuId}";
		}

	}
	
function fn_check_all() {
    var c = $('#chkAll').is(":checked");
    $('input[name=memArr]').prop("checked", c);
}

function fn_admin_lock(lockYn) {
	let message = "잠금";
	
	if(lockYn === "N") {
        message = "잠금해제";
    }
	
	if($("input[name=memArr]:checkbox:checked").length === 0) {
        alert(message + "처리할 관리자를 선택해 주세요.");
        return false;
    }
	
	if(confirm(message+ '처리 하시겠습니까?')) {
		document.form.lockYn.value = lockYn;
		
		$.ajax({
            type: "post",
            url: "${contextRoot}/adm/member/memconfig/updateLockYnAdmin.do",
            dataType: "json",
            data: $("form[name=form]").serialize(),
            success: function(data){
                if(data == "SUCCESS") {
                    alert(message+ "처리가 완료되었습니다.");
                    window.location.href = "${contextRoot}/adm/member/memconfig/list.do?menuId=${menuId}";
                }else {
                	alert(message+ "처리 중 오류가 발생하였습니다.");
                	window.location.href = "${contextRoot}/adm/member/memconfig/list.do";
                }
            }, error : function(xhr, status, error) {
            	alert(message+ "오류가 발생하였습니다.");
			}
        });
	}
}

function fn_admin_use(useYn) {
	let message = "사용";
	
	if(useYn === "N") {
        message = "회수";
    }
	
	if($("input[name=memArr]:checkbox:checked").length === 0) {
        alert(message + "처리할 관리자를 선택해 주세요.");
        return false;
    }
	
	if(confirm(message+ '처리 하시겠습니까?')) {
		document.form.useYn.value = useYn;
		
		$.ajax({
            type: "post",
            url: "${contextRoot}/adm/member/memconfig/updateUseYnAdmin.do",
            dataType: "json",
            data: $("form[name=form]").serialize(),
            success: function(data){
                if(data == "SUCCESS") {
                    alert(message+ "처리가 완료되었습니다.");
                    window.location.href = "${contextRoot}/adm/member/memconfig/list.do?menuId=${menuId}";
                }else {
                	alert(message+ "처리 중 오류가 발생하였습니다.");
                	window.location.href = "${contextRoot}/adm/member/memconfig/list.do";
                }
            }, error : function(xhr, status, error) {
            	alert(message+ "오류가 발생하였습니다.");
			}
        });
	}
}
</script>

<style>
.btn_blue {background: #182142!important; color: #fff!important;}
.all_check {width:13px;height:13px;}
</style>

<section>

	 <form id="form" name="form" method="get" >
			<input type="hidden" id="pageSize" name="pageSize" value="${pageSize }" />
			<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" /> 
			<input type="hidden" id="menuId" name="menuId" value="${menuId }" />
			<input type="hidden" id="memSeq" name="memSeq" value="" /> 
			<input type="hidden" id="lockYn" name="lockYn" />
			<input type="hidden" id="useYn" name="useYn" />
						<ul class="search-box">
							<li>
								<label><i class="fa fa-angle-right"></i> 검색조건</label>
								<select id="searchCondition" name="searchCondition">
								 	<option value="">전체</option>
									<option value="MEM_NAME"  ${param.searchCondition == 'MEM_NAME' ? 'selected="selected"' : ''}>이름</option>
									<option value="MEM_ID"  ${param.searchCondition == 'MEM_ID' ? 'selected="selected"' : ''}>아이디</option>
								</select>
							<input type="text" style="width:300px" value="${param.searchKeyword}" name="searchKeyword" id="searchKeyword" maxlength="10" placeholder="검색어 입력" />
							</li>
							<li class="search-btn">
								<button type="button" onclick="fn_search('1');"><i class="fa fa-search"></i> 검색</button>
							</li>
						</ul>
	
					<div class="btn-area" style="margin-bottom:20px;">
						<a href="#none" class="btn_blue" onclick="javascript:fn_admin_lock('Y');">잠금</a>
                        <a href="#none" onclick="javascript:fn_admin_lock('N');">잠금해제</a>
                        <a href="#none" class="btn_blue" onclick="javascript:fn_admin_use('Y');">사용</a>
                        <a href="#none" onclick="javascript:fn_admin_use('N');">회수</a>
                    </div>
                    
					<table class="list-1">
						<thead>
							<tr>
								<th style="width: 3%"><input type="checkbox" name="chkAll" id="chkAll" class="all_check" onclick="javascript:fn_check_all();"></th>
								<th style="width: 5%">순 번</th>
								<th style="width: 5%">유형</th>
								<th style="width: 5%">성명</th>
								<th style="width: 10%">아이디</th>
								<th style="width: 10%">이메일</th>
								<th style="width: 5%">계정상태</th>
								<th style="width: 5%">잠금상태</th>
								<th style="width: 7%">비밀번호 초기화</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="memberList" items="${memberList}" varStatus="status">
								<tr>
									<td><input type="checkbox" name="memArr" class="all_check" value="<c:out value="${memberList.memSeq }"/>"></td>
									<td><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
									<td>
										<c:choose>
											<%-- <c:when test="${memberList.memType eq 'ADM' }">
											 	관리자
											</c:when>
											<c:when test="${memberList.memType eq 'WOOD_STAFF' }">
												목공체험 담당자
											</c:when>
											<c:when test="${memberList.memType eq 'FOREST_STAFF' }">
												숲체험 담당자
											</c:when > --%>
											
											<c:when test="${memberList.memType eq 'SUP' }">
											 	슈퍼관리자
											</c:when>
											<c:when test="${memberList.memType eq 'OPR' }">
												운영담당자
											</c:when>
											<c:when test="${memberList.memType eq 'ORG' }">
												기관담당자
											</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose>
									</td>
									<td><a href="javascript:fn_detail('${memberList.memSeq}');">${memberList.memName}</a></td>
									<td>${memberList.memId}</td>
									<td>${memberList.decryptEmail}</td>
									<td>
										<c:if test="${memberList.useYn eq 'Y'}">사용</c:if>
										<c:if test="${memberList.useYn eq 'N'}">회수</c:if>
									</td>
									<td>
										<c:if test="${memberList.lockYn eq 'Y'}">잠금</c:if>
										<c:if test="${memberList.lockYn eq 'N'}">잠금해제</c:if>
									</td>
									<td><button class="type-4" onclick="passReset('${memberList.memSeq}','${memberList.memId}','${memberList.decryptEmail}');">초기화</button></td>
								</tr>
							</c:forEach>
	
						<c:if test="${fn:length(memberList) == 0}">
								<tr>
									<td colspan="9" class="no-data"><i class="fa fa-search"></i> 최근 회원이 없습니다.</td>
								</tr>
						</c:if> 
						<tbody>
					</table>
		</form> 
					<div class="text-center">
					   	 <ul class="pagination">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search" />
						</ul>  
						 <div class="text-right btn-area">
							<a href="${contextRoot}/adm/member/memconfig/form.do?menuId=${menuId}">등록</a>
						</div> 
					</div>
				</section>

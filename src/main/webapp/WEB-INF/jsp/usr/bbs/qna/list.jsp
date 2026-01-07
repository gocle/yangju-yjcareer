<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
    
    <div id="container">
        <div class="wrap clearfix">
            <main class="colgroup">
                <article>
    
                    <header class="sub_head">
    
                        <div class="sub_title">
                            <!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
                            <p class="first_title">알림마당</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>Q&amp;A</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                            
							<c:import url="/usr/menu/sub.do" />
            
                            <div class="addons">
                                <ul class="addons_list">
                                    <li class="addons_item print">
                                        <button type="button" onclick="window.print();" class="addons_button">인쇄</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                    
                    
                    <div id="contents" class="cts4149">
						<script>
//<![CDATA[
function fn_recovryBbsNtt( url ) {
	if( confirm("복원하시겠습니까?") ) {
		window.location = url;
	}
}


//]]>
</script>

	
	
    <div class="bbs_search">
        <form name="bbsNttSearchForm" id="bbsNttSearch" action="./selectBbsNttList.do" method="get" class="boardSearchForm">
            <fieldset>
            <legend>게시물 검색</legend>
            <input type="hidden" name="key" value="4149"/>
            <input type="hidden" name="bbsNo" value="527"/>
            <input type="hidden" name="integrDeptCode" value=""/>
			
			<label for="searchCnd" class="skip">검색 영역 선택</label>
            <select name="searchCnd" id="searchCnd" title="검색 영역 선택">
				<option value="SJ" >제목</option>
				<option value="CN" >내용</option>
            </select>
            <label for="searchKrwd" class="skip">검색어 입력</label>
            <input name="searchKrwd" id="searchKrwd" type="text" class="input_text" title="검색어 입력" placeholder="검색어 입력" value="" />
			<input value="검색" type="submit" class="submit" />
            </fieldset>
        </form>
    </div>


    <div class="bbs_info clearfix">
        <div class="bbs_left bbs_count">
            <span>총 게시물  <strong>12</strong> 개</span>,
            <span class="division_line">페이지 <strong>1</strong> / 2</span>
        </div>
    </div>

	<table class="bbs_default list" data-rwdb="yes">
        <caption>Q&A 목록 - 번호, 제목, 파일, 조회수, 작성일정보 제공</caption>
        <colgroup>
        
                <col style="width:80px" />
                <col  />
                <col style="width:60px" />
                <col style="width:120px" />
                <col style="width:150px" />
        </colgroup>
        <thead>
        <tr>
        
			<th scope="col" >번호</th>
			<th scope="col" >제목</th>
			<th scope="col" >파일</th>
			<th scope="col" >조회수</th>
			<th scope="col" class="last">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="articleList" items="${articleList}" varStatus="status">
			<tr >
						<td ><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
						<td class="subject secret">
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=192263&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									${articleList.baTitle}
									</a>	
						</td>
						<td >
						</td>
						<td >0</td>
						<td class="last">
									${articleList.baRegdate}
						</td>
			</tr>
		</c:forEach>
					<c:if test="${fn:length(articleList) == 0 && fn:length(topNoticeList) == 0}">
						<tr>
							<td colspan="6" class="empty">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>	
		
		
        </tbody>
    </table>

    <ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_left">
        </div>
        <div class="bbs_right">
						<a href="addBbsNttView.html" class="bbs_btn write"><i class="icon"></i><span>글쓰기</span></a>
        </div>
    </div>
                    </div>
                    
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

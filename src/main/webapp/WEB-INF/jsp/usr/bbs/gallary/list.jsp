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
                            <h2>${bcName }</h2>
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
                    
                    
                    <div id="contents" class="cts4146">
						<div class="bbs_search">
        <form name="bbsNttSearchForm" id="bbsNttSearch" action="./list.do" method="get" class="boardSearchForm">
            <fieldset>
            <legend>게시물 검색</legend>
            <input type="hidden" name="menuId" Id="menuId" value="${menuId }"/>
			
			<label for="ssearchCondition" class="skip">검색 영역 선택</label>
            <select name="searchCondition" id="searchCondition" title="검색 영역 선택">
				<option value="BA_TITLE" <c:if test="${boardArticleVO.searchCondition == 'BA_TITLE'}">selected</c:if>> 제목</option>
				<option value="BA_CONTENT_HTML" <c:if test="${boardArticleVO.searchCondition == 'BA_CONTENT_HTML'}">selected</c:if>> 내용</option>
            </select>
            <label for="searchKeyword" class="skip">검색어 입력</label>
            <input name="searchKeyword" id="searchKeyword" type="text" class="input_text" title="검색어 입력" placeholder="검색어 입력" value="${boardArticleVO.searchKeyword }" />
			<input value="검색" type="submit" class="submit" />
            </fieldset>
        </form>
    </div>


    <div class="bbs_info clearfix">
        <div class="bbs_left bbs_count">
            <span>총 게시물  <strong>${totalCount }</strong> 개</span>,
            <span class="division_line">페이지 <strong>${pageIndex }</strong> / ${totalPage }</span>
        </div>
    </div>


	<div class="bbs_gallery photo_gallery">
        <ul class="list clearfix">
			<c:forEach var="articleList" items="${articleList}" varStatus="status">
            <li>
				<a href="/yjcareer/usr/bbs/photo/detail.do?menuId=${menuId }&baId=${articleList.baId}">
                    <div class="ico_group">
					</div>
                    <div class="photo_group">
								<span class="photobox">
									<span class="inner_photo" style="background-image:url(/DATA/bbs/529/thumb/t_20240904025007950unJzU4.jpg);"></span>
									<span class="photo"><img src="/DATA/bbs/529/thumb/t_20240904025007950unJzU4.jpg" alt="미래의 시작 3_언바운드랩데브 대표 조용민 &#039;AI시대, 창의적인 자기혁신법&#039; 이미지" /></span>
								</span>
                        <div class="photo_info">
									<span class="subject">${articleList.baTitle}</span>
											<span class="date">
													${articleList.baRegdate}
											</span>	                            
                        </div>
                    </div>
                </a>
            </li>
            </c:forEach>
            <c:if test="${fn:length(articleList) == 0 && fn:length(topNoticeList) == 0}">
				<tr>
					<td colspan="6" class="empty">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
        </ul>
    </div>
	
    <ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />

<!-- 	<div class="pagination">
        <span class="page_btn prev_group">
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_end">처음 페이지로</a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev">이전 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_one"><i></i>이전 페이지</a>
</span>
<span class="page">
<span class="page_wrap">
<strong title="현재 1페이지">1</strong>
</span>
</span>
<span class="page_btn next_group">
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next_one">다음 페이지<i></i></a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next">다음 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next_end">끝 페이지로</a>
</span>


    </div> -->

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_left">
        </div>
        <div class="bbs_right">
			
        </div>
    </div>
                    </div>
                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

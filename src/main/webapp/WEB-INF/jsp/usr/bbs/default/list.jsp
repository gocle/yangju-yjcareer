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
                                    <li class="addons_item share">
                                        <button type="button" class="addons_button share_show">공유하기</button>
                                        <div class="share_panel">
                                            <ul class="share_list clearfix">
                                                <li class="share_item n1">
                                                    <a href="javascript:openFacebook();" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">페이스북</a>
                                                </li>
                                                <li class="share_item n2">
                                                    <a href="javascript:openNaverbolg('여주시청');" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">블로그</a>
                                                </li>
                                                <li class="share_item n3">
                                                    <a href="javascript:openKakaoStory();" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">카카오</a>
                                                </li>
                                                <li class="share_item n4">
                                                    <a href="javascript:openTwitter('여주시청');" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">트위터</a>
                                                </li>
                                                <li class="share_item n5">
                                                    <a href="#n" onclick="copy()" title="새창" class="share_anchor copy_anchor">주소복사</a>
                                                </li>
                                                <script>
													function openFacebook(){
														var _url = encodeURIComponent(window.location.href);
														openWin2('http://www.facebook.com/sharer/sharer.php?u=' + _url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
														
													}

													function openNaverbolg(txt){
														var _txt = encodeURIComponent(txt);
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://share.naver.com/web/shareView.nhn?url=' + _url + '&title=' + _txt, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
														
													}

													function openKakaoStory(){
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://story.kakao.com/s/share?url=' + _url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
													}

													function openTwitter(txt){
														var _txt = encodeURIComponent(txt);
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://twitter.com/intent/tweet?text='+_txt+'&url='+_url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
													}
													
													function openWin2(url, winname, width, height, tbar, mbar, sbar, loc, status, resizable, fscreen, left, top, cflag) {
														if(cflag == 'yes' || cflag == 'y' || cflag == '1') {
															left = (window.screen.width - width ) / 2;
															top  = (window.screen.height- height) / 2;
														}

														opening_window = window.open(url, winname, 'width=' + width + ', height=' + height + ', toolbar=' + tbar + ', menubar=' + mbar + ', scrollbars=' + sbar + ', location=' + loc + ', status=' + status + ', resizable=' + resizable + ', fullscreen=' + fscreen + ', left=' + left + ', top=' + top);
														opening_window.focus();
													}

													function openWin2(url, winname, width, height, tbar, mbar, sbar, loc, status, resizable, fscreen, left, top, cflag) {
														if(cflag == 'yes' || cflag == 'y' || cflag == '1') {
															left = (window.screen.width - width ) / 2;
															top  = (window.screen.height- height) / 2;
														}

														opening_window = window.open(url, winname, 'width=' + width + ', height=' + height + ', toolbar=' + tbar + ', menubar=' + mbar + ', scrollbars=' + sbar + ', location=' + loc + ', status=' + status + ', resizable=' + resizable + ', fullscreen=' + fscreen + ', left=' + left + ', top=' + top);
														opening_window.focus();
													}

                                                    function copy() {
                                                        var url = '';
                                                        var textarea = document.createElement("textarea");
                                                        document.body.appendChild(textarea);
                                                        url = window.document.location.href;
                                                        textarea.value = url;
                                                        textarea.select();
                                                        document.execCommand("copy");
                                                        document.body.removeChild(textarea);
                                                        alert("URL이 복사되었습니다.")
                                                    }
                                                </script>
                                            </ul>
                                            <button type="button" class="share_hide">닫기</button>
                                        </div>
                                    </li>
                                    <li class="addons_item print">
                                        <button type="button" onclick="window.print();" class="addons_button">인쇄</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                    
                    
                    <div id="contents" class="cts4139">
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
        <form name="bbsNttSearchForm" id="bbsNttSearch" action="./list.do" method="get" class="boardSearchForm">
            <fieldset>
            <legend>게시물 검색</legend>
            <input type="hidden" name="key" value="4139"/>
            <input type="hidden" name="bbsNo" value="531"/>
            <input type="hidden" name="integrDeptCode" value=""/>
			
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

	<table class="bbs_default list" data-rwdb="yes">
        <caption>학습상담 목록 - 번호, 제목, 작성자, 파일, 조회수, 작성일정보 제공</caption>
        <colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
        </colgroup>
        <thead>
        <tr>
        
			<th scope="col" >번호</th>
			<th scope="col" >제목</th>
			<th scope="col" >작성자</th>
			<th scope="col" >파일</th>
			<th scope="col" >조회수</th>
			<th scope="col" class="last">작성일</th>
        </tr>
        </thead>
        <tbody>
        
        <c:forEach var="topNoticeList" items="${topNoticeList}" varStatus="status">
						<tr>
						 	<td data-label="번호" class="no notice"></td>
						<td data-label="제목" class="left">
							<a href="<c:url value="/usr/bbs/${topNoticeList.bcId }/detail.do?menuId=${menuId}&baId=${topNoticeList.baId}&baNotice=1"/>">${topNoticeList.baTitle}</a>
						</td>
						<td data-label="작성자">${fn:substring(topNoticeList.memName, 0, 1)}*${fn:substring(topNoticeList.memName, fn:length(topNoticeList.memName)-1, fn:length(topNoticeList.memName))}</td>
						<td class="mo-view">
							<a href="view0.html">상세 보기</a>
						</td>
						<td data-label="조회수">${topNoticeList.baHit}</td>
						<td data-label="작성일">${topNoticeList.baRegdate}</td>
					</tr>
					</c:forEach>	
					<c:forEach var="articleList" items="${articleList}" varStatus="status">
						<tr>
							<td data-label="번호" class="no"><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
							<td data-label="제목" class="left">
								<a href="<c:url value="/usr/bbs/${articleList.bcId }/detail.do?menuId=${menuId}&baId=${articleList.baId}&baNotice=0"/>">${articleList.baTitle}</a>
							</td>
							<td data-label="작성자">
								${fn:substring(articleList.memName, 0, 1)}*${fn:substring(articleList.memName, fn:length(articleList.memName)-1, fn:length(articleList.memName))}
							</td>
							<td class="mo-view">
								<a href="view0.html">상세 보기</a>
							</td>
							<td data-label="조회수">${articleList.baHit}</td>
							<td data-label="작성일">${articleList.baRegdate}</td>
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

	<c:if test="${bcId eq 'review'}">
		<div class="bbs_btn_wrap clearfix">
	        <div class="bbs_left">
	        </div>
	        <div class="bbs_right">
							<a href="/yjcareer/usr/bbs/review/form.do" class="bbs_btn write"><i class="icon"></i><span>글쓰기</span></a>
	        </div>
	    </div>
    </c:if>
                    </div>
                    
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
     <script type="text/javascript">
     
     //파일 다운로드
     function fn_egov_downFile(atchFileIdx){

    		window.open("${contextRoot}/board/FileDown.do?atchFileIdx="+atchFileIdx);
    	}
     
     //이전 글
     function fn_prev( preNo , menuId ){
     	
    		 window.location.href='/yjcareer/usr/bbs/${bcId}/detail.do?baId='+preNo+'&menuId='+menuId;

    	 
     }
     
     
     //다음 글
     function fn_next( nextNo , menuId ){
    	 

    	 window.location.href='/yjcareer/usr/bbs/${bcId}/detail.do?baId='+nextNo+'&menuId='+menuId;
    	 
    	 
     }
     
     </script>
  
    <div id="container">
        <div class="wrap clearfix">
            <main class="colgroup">
                <article>
    
                    <header class="sub_head">
    
                        <div class="sub_title">
                            <!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
                            <p class="first_title">알림마당</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>${bcName}</h2>
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
                    
                    
                    <div id="contents" class="cts4145">
						<script>
//20220804 열린시장실 포토게시판 우클릭방지


//<![CDATA[
	function fn_deleteBbsNtt( url ) {
		

		if( confirm("삭제하시겠습니까?") ) {
			window.location = url;
		}
	}

	function fn_recovryBbsNtt( url ) {
		if( confirm("복원하시겠습니까?") ) {
			window.location = url;
		}
	}

	function fn_mvmnBbsNtt( frm ) {
		if( frm.mvmnBbsNo.value == 530 ) {
			alert('같은 게시판내에서는 이동이 안됩니다.\n다른 게시판을 선택해주세요.');
			return false;
		}

		return true;
	}
//]]>
</script>

	

	<div class="bbs_info clearfix">
        <div class="bbs_left bbs_count">
        </div>
        <div class="bbs_right">
        </div>
    </div>

	<table class="bbs_default view">
        <caption>공지사항 상세보기 - 제목, 작성자, 내용, 파일 제공</caption>
        <tbody>
            <tr class="subject">		
                <th scope="row">제목</th>
					<td>
						${result.baTitle}
					</td>
            </tr>

            <tr >		
                <th scope="row">작성자</th>

		
			 
			 
					<td>${result.memName}</td>
			
		
				
            </tr>

            <tr >		
                <th scope="row">내용</th>
					<td title="내용" class="bbs_content">
						${result.baContentHtml}
					</td>
            </tr>

            <tr >		
                <th scope="row">파일</th>
					<td>
						<ul class="view_attach">
					
<!-- 						<li>
							<div class="down_view">
									
								<span><img src="/common/images/board/file/ico_jpg.gif" alt="jpg파일첨부" />강남인강 신청방법.jpg</span>
							
								<a href="/yjcareer/downloadBbsFile.do?key=4145&amp;bbsNo=530&amp;atchmnflNo=191781" title="파일 다운로드" class="file_down">다운로드</a>
							
							
								<a href="/yjcareer/previewUrl.do?key=4145&amp;bbsNo=530&amp;atchmnflNo=191781&amp;nttNo=201112" title="새창" target="_blank" class="file_view">미리보기</a>
							
							</div>
						</li>
					
						<li>
							<div class="down_view">
									
								<span><img src="/common/images/board/file/ico_jpg.gif" alt="jpg파일첨부" />무료대상자.jpg</span>
							
								<a href="/yjcareer/downloadBbsFile.do?key=4145&amp;bbsNo=530&amp;atchmnflNo=191782" title="파일 다운로드" class="file_down">다운로드</a>
							
							
								<a href="/yjcareer/previewUrl.do?key=4145&amp;bbsNo=530&amp;atchmnflNo=191782&amp;nttNo=201112" title="새창" target="_blank" class="file_view">미리보기</a>
							
							</div>
						</li> -->
						
						<c:forEach var="fileVO" items="${fileList}" varStatus="status">
						
						<li>
							<div class="down_view">
									
								<span><img src="/yjcareer/assets/common/images/board/file/ico_jpg.gif" alt="jpg파일첨부" /><c:out value="${fileVO.orgFileName}" /></span>
							
								<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');" title="파일 다운로드" class="file_down">다운로드</a>
							
							
								<a href="/yjcareer/previewUrl.do?key=4145&amp;bbsNo=530&amp;atchmnflNo=191782&amp;nttNo=201112" title="새창" target="_blank" class="file_view">미리보기</a>
							
							</div>
						</li>
						
						</c:forEach>
					
						</ul>
					</td>					
            </tr>

			
        </tbody>
    </table>

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_left">
            <a href="/yjcareer/usr/bbs/${bcId }/list.do?menuId=${menuId}" class="bbs_btn list"><i class="icon"></i><span>목록</span></a>
        </div>
        <div class="bbs_right">
			
        </div>
    </div>


   

	<ul class="bbs_view_move">
		<c:if test="${not empty prevNext.preNo and prevNext.preNo ne 0 and not empty prevNext.preTitle}">
        <li class="prev"><strong>이전글</strong> <a href="javascript:fn_prev('${prevNext.preNo}', '${menuId}', '${result.baNotice}');">${prevNext.preTitle}</a></li>
        </c:if>
        <c:if test="${not empty prevNext.nextNo and prevNext.nextNo ne 0 and not empty prevNext.nextTitle}">
        <li class="next"><strong>다음글</strong> <a href="javascript:fn_next('${prevNext.nextNo}', '${menuId}', '${result.baNotice}');">${prevNext.nextTitle}</a></li>
        </c:if>
    </ul>
    
                    </div>
                </article>
            </main>
        
        </div>
    </div>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
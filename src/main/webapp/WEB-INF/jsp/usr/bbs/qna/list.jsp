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
                            



<div class="breadcrumbs">
	<a href="./index.do" class="home">홈</a>
	<ol class="breadcrumbs_list">
		<li class="breadcrumbs_item">
			<a href="" class="breadcrumbs_anchor mobile">알림마당</a>
			<button type="button" class="breadcrumbs_select" title="목록열기">알림마당</button>
			<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4123"  target="_self" >진로진학교육</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" >프로그램 신청</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4135"  target="_self" >학습지원서비스</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4254"  target="_self" >JUMP UP 2025 양주 미래교육 페스타</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4141"  target="_self" >교육 네트워크</a></li>
					<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" class="active">알림마당</a></li>
					<li class="tab_item"><a href="/yjcareer/sitemap.do?key=4151"  target="_self" >홈페이지 가이드</a></li>
			</ul>
		</li>

				
				
				
				
				
				
					<li class="breadcrumbs_item">
						<a href="" class="breadcrumbs_anchor mobile">Q&amp;A</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">Q&amp;A</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" >공지사항</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=529&key=4146"  target="_self" >자료실(갤러리)</a>	</li>
									<li class="tab_item"><a href="https://naver.me/xyTNUiV1" title="새창" target="_blank" >온라인 설문조사</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=528&key=4148"  target="_self" >자주하는 질문</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=548&key=4185"  target="_self" >학습후기</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=527&key=4149"  target="_self" class="active">Q&amp;A</a>	</li>
						</ul>
					</li>
				

	</ol>
</div>
            
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

		
		
			<tr >
            
						<td >12</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=192263&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									
									대학 입시컨설팅
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >0</td>
						<td class="last">
							
								
								
									2025.06.21
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >11</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=192180&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									
									취소
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >0</td>
						<td class="last">
							
								
								
									2025.06.18
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >10</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=184687&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									서울대 캠퍼스 투어 관련 질문 사항입니다.
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >2</td>
						<td class="last">
							
								
								
									2024.10.17
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >9</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=184439&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									서울대투어 신청시요
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >2</td>
						<td class="last">
							
								
								
									2024.10.11
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >8</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=184437&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									서울대 캠퍼스 투어 접수 확인
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >5</td>
						<td class="last">
							
								
								
									2024.10.10
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >7</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=184021&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									신청 취소
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >2</td>
						<td class="last">
							
								
								
									2024.09.23
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >6</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=183446&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									대학 캠퍼스투어
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >4</td>
						<td class="last">
							
								
								
									2024.09.01
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >5</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=183444&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									대학 캠퍼스투어 수강 취소
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >2</td>
						<td class="last">
							
								
								
									2024.09.01
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >4</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=183413&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									대학캠퍼스투어 수강취소 방법문의
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >3</td>
						<td class="last">
							
								
								
									2024.08.30
								
							
						</td>
			</tr>
			
		
			<tr >
            
						<td >3</td>
						<td class="subject secret">
							
								
								
									
									<a href="./selectBbsNttView.do?key=4149&amp;bbsNo=527&amp;nttNo=183385&amp;searchCtgry=&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" title="비밀글">
									<span class="bbs_ico secret">비밀글</span> 
									<span class="em_blue">[답변완료]</span>&nbsp;
									대학 캠퍼스 투어 예약
									
									
									
									</a>
								
														
						</td>
						<td >
							
							
						</td>
						<td >4</td>
						<td class="last">
							
								
								
									2024.08.29
								
							
						</td>
			</tr>
			
		
		
        </tbody>
    </table>

	<div class="pagination">
        <span class="page_btn prev_group">
<a href="./selectBbsNttList.do?key=4149&amp;bbsNo=527&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_end">처음 페이지로</a>
<a href="./selectBbsNttList.do?key=4149&amp;bbsNo=527&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev">이전 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4149&amp;bbsNo=527&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_one"><i></i>이전 페이지</a>
</span>
<span class="page">
<span class="page_wrap">
<strong title="현재 1페이지">1</strong>
<a href="./selectBbsNttList.do?key=4149&amp;bbsNo=527&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=2" title="2페이지 이동">2</a>
</span>
</span>
<span class="page_btn next_group">
<a href="./selectBbsNttList.do?key=4149&amp;bbsNo=527&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=2" class="next_one">다음 페이지<i></i></a>
<a href="./selectBbsNttList.do?key=4149&amp;bbsNo=527&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=2" class="next">다음 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4149&amp;bbsNo=527&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=2" class="next_end">끝 페이지로</a>
</span>


    </div>

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

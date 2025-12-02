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
                            <h2>자료실(갤러리)</h2>
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
						<a href="" class="breadcrumbs_anchor mobile">자료실(갤러리)</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">자료실(갤러리)</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" >공지사항</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=529&key=4146"  target="_self" class="active">자료실(갤러리)</a>	</li>
									<li class="tab_item"><a href="https://naver.me/xyTNUiV1" title="새창" target="_blank" >온라인 설문조사</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=528&key=4148"  target="_self" >자주하는 질문</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=548&key=4185"  target="_self" >학습후기</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=527&key=4149"  target="_self" >Q&amp;A</a>	</li>
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
                    
                    
                    <div id="contents" class="cts4146">
						<div class="bbs_search">
        <form name="bbsNttSearchForm" id="bbsNttSearch" action="./selectBbsNttList.do" method="get" class="boardSearchForm">
            <fieldset>
            <legend>게시물 검색</legend>
            <input type="hidden" name="key" value="4146"/>
            <input type="hidden" name="bbsNo" value="529"/>
            <input type="hidden" name="integrDeptCode" value=""/>

            <select name="searchCnd" id="searchCnd" title="검색 영역 선택">
				<option value="SJ" >제목</option>
				<option value="CN" >내용</option>
            </select>
            <label for="searchKrwd" class="skip">검색어 입력</label>
            <input name="searchKrwd" id="searchKrwd" type="text" class="input_text" title="검색" placeholder="검색어 입력" value="" />
			<input value="검색" type="submit" class="submit" />
            </fieldset>
        </form>
    </div>


    <div class="bbs_info clearfix">
        <div class="bbs_left bbs_count">
            <span>총 게시물  <strong>3</strong> 개</span>,
            <span class="division_line">페이지 <strong>1</strong> / 1</span>
        </div>
    </div>


	<div class="bbs_gallery photo_gallery">
        <ul class="list clearfix">
	
            <li>
				<a href="selectBbsNttView.html">
                    <div class="ico_group">
						
						
					</div>
                    <div class="photo_group">
				
					
						
						
							
							
								<span class="photobox">
									<span class="inner_photo" style="background-image:url(/DATA/bbs/529/thumb/t_20240904025007950unJzU4.jpg);"></span>
									<span class="photo"><img src="/DATA/bbs/529/thumb/t_20240904025007950unJzU4.jpg" alt="미래의 시작 3_언바운드랩데브 대표 조용민 &#039;AI시대, 창의적인 자기혁신법&#039; 이미지" /></span>
								</span>
								
							
						
					
					
				
                        <div class="photo_info">
							
								
								
									<span class="subject">미래의 시작 3_언바운드랩데브 대표 조용민 &#039;AI시대, 창의적인 자기혁신법&#039;</span>
									  
										  
											 
											<span class="date">
													2024-09-04
											</span>
											
										
									
									
								
									                            
                        </div>
                    </div>
                </a>
            </li>
	
            <li>
				<a href="selectBbsNttView.html">
                    <div class="ico_group">
						
						
					</div>
                    <div class="photo_group">
				
					
						
						
							
							
								<span class="photobox">
									<span class="inner_photo" style="background-image:url(/DATA/bbs/529/thumb/t_202408140543425606s7Ud3.png);"></span>
									<span class="photo"><img src="/DATA/bbs/529/thumb/t_202408140543425606s7Ud3.png" alt="미래의 시작 2_뇌과학자 장동선 &#039;뇌과학자가 바라보는 AI시대의 미래&#039; 이미지" /></span>
								</span>
								
							
						
					
					
				
                        <div class="photo_info">
							
								
								
									<span class="subject">미래의 시작 2_뇌과학자 장동선 &#039;뇌과학자가 바라보는 AI시대의 미래&#039;</span>
									  
										  
											 
											<span class="date">
													2024-08-14
											</span>
											
										
									
									
								
									                            
                        </div>
                    </div>
                </a>
            </li>
	
            <li>
				<a href="selectBbsNttView.html">
                    <div class="ico_group">
						
						
					</div>
                    <div class="photo_group">
				
					
						
						
							
							
								<span class="photobox">
									<span class="inner_photo" style="background-image:url(/DATA/bbs/529/thumb/t_20240722061908311YOMv4n.png);"></span>
									<span class="photo"><img src="/DATA/bbs/529/thumb/t_20240722061908311YOMv4n.png" alt="미래의 시작 1_타일러 라쉬 &#039;원하는 대로 살고 싶다면 박스를 탈출하라&#039; 이미지" /></span>
								</span>
								
							
						
					
					
				
                        <div class="photo_info">
							
								
								
									<span class="subject">미래의 시작 1_타일러 라쉬 &#039;원하는 대로 살고 싶다면 박스를 탈출하라&#039;</span>
									  
										  
											 
											<span class="date">
													2024-07-22
											</span>
											
										
									
									
								
									                            
                        </div>
                    </div>
                </a>
            </li>
	
        </ul>
    </div>
	


	<div class="pagination">
		<span class="page_btn prev_group">
<a href="./selectBbsNttList.do?key=4146&amp;bbsNo=529&amp;searchCtgry=&amp;pageUnit=9&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_end">처음 페이지로</a>
<a href="./selectBbsNttList.do?key=4146&amp;bbsNo=529&amp;searchCtgry=&amp;pageUnit=9&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev">이전 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4146&amp;bbsNo=529&amp;searchCtgry=&amp;pageUnit=9&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_one"><i></i>이전 페이지</a>
</span>
<span class="page">
<span class="page_wrap">
<strong title="현재 1페이지">1</strong>
</span>
</span>
<span class="page_btn next_group">
<a href="./selectBbsNttList.do?key=4146&amp;bbsNo=529&amp;searchCtgry=&amp;pageUnit=9&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next_one">다음 페이지<i></i></a>
<a href="./selectBbsNttList.do?key=4146&amp;bbsNo=529&amp;searchCtgry=&amp;pageUnit=9&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next">다음 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4146&amp;bbsNo=529&amp;searchCtgry=&amp;pageUnit=9&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next_end">끝 페이지로</a>
</span>


	</div>

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

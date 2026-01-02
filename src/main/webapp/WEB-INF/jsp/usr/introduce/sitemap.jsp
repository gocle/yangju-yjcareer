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
                            <p class="first_title">진로진학교육</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>사이트맵</h2>
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
                    
                    
<div id="contents" class="cts4151">
						<div id="sitemap">
	<div class="sitemap_wrap clearfix">
		
			<div class="type1">
				<h3><a href="/yjcareer/contents.do?key=4123" target="_self">진로진학교육</a></h3>
					
						<div class="sitemap_row clearfix">
							<div class="sitemap_item">
								
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4123" target="_self">인사말</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4124" target="_self">비전 및 목표</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4125" target="_self">주요사업</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4126" target="_self">찾아오시는 길</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
			</div>
		
			<div class="type1">
				<h3><a href="/yjcareer/contents.do?key=4128" target="_self">프로그램 신청</a></h3>
					
						<div class="sitemap_row clearfix">
							<div class="sitemap_item">
								
								
									
								
									
								
									
								
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4128" target="_self">프로그램 신청 안내</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/selectEduLctreWebList.do?key=4130" target="_self">프로그램 신청</a></h4>
											
											<ul class="bu">
												
													
													<li><a href="/yjcareer/selectEduLctreWebList.do?key=4130" target="_self">진로진학 컨설팅 신청</a>
														
													</li>
													
												
													
													<li><a href="/yjcareer/selectEduLctreWebList.do?key=4131" target="_self">진로 프로그램 신청</a>
														
													</li>
													
												
													
													<li><a href="/yjcareer/selectEduLctreWebList.do?key=4132" target="_self">진학 프로그램 신청</a>
														
													</li>
													
												
													
													<li><a href="/yjcareer/selectEduLctreWebList.do?key=4133" target="_self">특별 교육 프로그램 신청</a>
														
													</li>
													
												
											</ul>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
			</div>
		
			<div class="type1">
				<h3><a href="/yjcareer/contents.do?key=4135" target="_self">학습지원서비스</a></h3>
					
						<div class="sitemap_row clearfix">
							<div class="sitemap_item">
								
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4135" target="_self">학습지원서비스안내</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="https://study4way.com/intro" target="_blank">학습유형 검사</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/selectBbsNttList.do?bbsNo=531&amp;key=4139" target="_self">학습 상담</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
			</div>
		
			<div class="type1">
				<h3><a href="/yjcareer/contents.do?key=4254" target="_self">JUMP UP 2025 양주 미래교육 페스타</a></h3>
					
						<div class="sitemap_row clearfix">
							<div class="sitemap_item">
								
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4254" target="_self">행사안내</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4256" target="_self">진로박람회 부스 안내</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4257" target="_self">오시는 길 안내</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
			</div>
		
			<div class="type1">
				<h3><a href="/yjcareer/contents.do?key=4141" target="_self">교육 네트워크</a></h3>
					
						<div class="sitemap_row clearfix">
							<div class="sitemap_item">
								
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4141" target="_self">지역 진로교사 안내</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/contents.do?key=4142" target="_self">진로교육콘텐츠</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="https://www.ggoomgil.go.kr/front/index.do" target="_blank">체험처 소개(꿈길)</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
			</div>
		
			<div class="type1">
				<h3><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&amp;key=4145" target="_self">알림마당</a></h3>
					
						<div class="sitemap_row clearfix">
							<div class="sitemap_item">
								
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<h4 class="h0"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&amp;key=4145" target="_self">공지사항</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/selectBbsNttList.do?bbsNo=529&amp;key=4146" target="_self">자료실(갤러리)</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="https://naver.me/xyTNUiV1" target="_blank">온라인 설문조사</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/selectBbsNttList.do?bbsNo=528&amp;key=4148" target="_self">자주하는 질문</a></h4>
											
										
										  </div>
										  <div class="sitemap_item">
									   
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/selectBbsNttList.do?bbsNo=548&amp;key=4185" target="_self">학습후기</a></h4>
											
										
									   
										  </div>
										  </div>
										  <div class="sitemap_row clearfix">
										  <div class="sitemap_item">
									   
										
									
								
									
										<h4 class="h0"><a href="/yjcareer/selectBbsNttList.do?bbsNo=527&amp;key=4149" target="_self">Q&amp;A</a></h4>
											
										
									   
										
									
								
							</div>
						</div>
					
			</div>
		
	</div>
</div>
                    </div>
                    
                 
					






	



                
                </article>
            </main>
        
        </div>
    </div>
    
        <c:import url="/usr/layout/footer.do" />
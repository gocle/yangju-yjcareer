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
                            <p class="first_title">교육 네트워크</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>진로교육콘텐츠</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                            



<div class="breadcrumbs">
	<a href="./index.do" class="home">홈</a>
	<ol class="breadcrumbs_list">
		<li class="breadcrumbs_item">
			<a href="" class="breadcrumbs_anchor mobile">교육 네트워크</a>
			<button type="button" class="breadcrumbs_select" title="목록열기">교육 네트워크</button>
			<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4123"  target="_self" >진로진학교육</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" >프로그램 신청</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4135"  target="_self" >학습지원서비스</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4254"  target="_self" >JUMP UP 2025 양주 미래교육 페스타</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4141"  target="_self" class="active">교육 네트워크</a></li>
					<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" >알림마당</a></li>
					<li class="tab_item"><a href="/yjcareer/sitemap.do?key=4151"  target="_self" >홈페이지 가이드</a></li>
			</ul>
		</li>

				
				
				
				
				
					<li class="breadcrumbs_item">
						<a href="" class="breadcrumbs_anchor mobile">진로교육콘텐츠</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">진로교육콘텐츠</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4141"  target="_self" >지역 진로교사 안내</a>	</li>
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4142"  target="_self" class="active">진로교육콘텐츠</a>	</li>
									<li class="tab_item"><a href="https://www.ggoomgil.go.kr/front/index.do" title="새창" target="_blank" >체험처 소개(꿈길)</a>	</li>
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
                    
                    
                    <div id="contents" class="cts4142">
						<div class="service cts4142">
	<div class="title_box n4">
		<div class="box_wrap">
			<h3 class="box_title">진로교육컨텐츠 안내</h3>
			<p>학생들이 자신의 미래 직업과 진로를 탐색하고 준비할 수 있도록 도와주는 교육 자료입니다. <br>
				이 콘텐츠는 다양한 직업군에 대한 이해를 높이고, 개인의 흥미와 적성에 맞는 직업을 찾을 수 있도록 지원합니다. </p>
			<p>체계적인 진로교육콘텐츠는 꿈길 체험처, 지역 진로교사 등으로 구성되어 있으며, 학생들의 자기 이해와 목표 설정, 문제 해결 능력 등을 향상시키는 데 큰 도움을 줍니다.<br>
				이를 통해 학생들은 자신만의 성공적인 커리어를 구축할 수 있는 토대를 마련할 수 있습니다.
			</p>
		</div>
	</div>
	
	<div class="box">
		<div class="box_inner">
			<i class="service_bg"></i>
			<div class="img_box">
				<div class="img_item">
					<a href="https://www.youtube.com/live/X9mU6fiXfx4" target="_blank" title="새창" rel="noopener noreferrer" class="img_anchor">
						<span class="img_title">2023년 양주시 펜타킬샘 대학입시설명회_최승해 입시전문가</span>
					</a>
				</div>
				<div class="img_item">
					<a href="https://www.youtube.com/live/wGkEcdnWTZw" target="_blank" title="새창" rel="noopener noreferrer" class="img_anchor">
						<span class="img_title">[LIVE] 변화의 중심 대학입시설명회 [중등대상]_최승해 입시전문가
						</span>
					</a>
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

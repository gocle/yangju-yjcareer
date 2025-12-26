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
                            <h2>주요사업</h2>
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
                    
                    
                    <div id="contents" class="cts4125">
						<div class="business">
	<div class="business_item">
		<div class="left_box"><p>Individual<span>(개성)</span></p></div>
		<div class="right_box">
			<p class="business_title">청소년의 고유한 특성을 반영한 교육</p>
			<ul class="bu dl">
				<li>
					<span class="dt">학습 유형 검사</span>
					<span class="dd">학습 스타일, 준비도 등 학생에 따른 유형 검사</span>
				</li>
				<li>
					<span class="dt">학습 코치 양성</span>
					<span class="dd">우수한 대학생 학습 코치 선발 및 양성 프로그램 운영</span>
				</li>
				<li>
					<span class="dt">청소년 학습 코칭</span>
					<span class="dd">진로진학 등 청소년에게 필요한 코칭 지원</span>
				
				</li>
			</ul>
		</div>
	</div>
	<div class="business_item">
		<div class="left_box"><p>Innovation<span>(혁신)</span></p></div>
		<div class="right_box">
			<p class="business_title">청소년의 잠재력을 매일 혁신하는 교육</p>
			<ul class="bu dl">
				<li>
					<span class="dt">지역 진로교사 양성</span>
					<span class="dd">지역 시민들과 함께 하는 지역 진로교사 양성 및 운영</span>
				</li>
				<li>
					<span class="dt">미래 대학 캠퍼스 투어</span>
					<span class="dd">청소년이 원하는 놀이 중심 수도권 대학 투어 프로그램 운영</span>
				</li>
				<li>
					<span class="dt">지역 특화 프로그램 운영</span>
					<span class="dd">지역의 대학 및 기업과 연계한 우수한 특화 프로그램 운영</span>
				</li>
				<li>
					<span class="dt">에듀테크 활용 프로그램</span>
					<span class="dd">미래기술, 신산업 중심의 프로그램 운영</span>
				
				</li>
			</ul>
		</div>
	</div>
	<div class="business_item">
		<div class="left_box"><p>Integration<span>(통합)</span></p></div>
		<div class="right_box">
			<p class="business_title">청소년이 지역과 함께 자라도록 하는 교육</p>
			<ul class="bu dl">
				<li>
					<span class="dt">전문가 특강</span>
					<span class="dd">국내외 우수한 진로교육 전문가 특강 개최</span>
				</li>
				<li>
					<span class="dt">소그룹 교육</span>
					<span class="dd">학생부 종합 전형, 농어촌 전형, 수능 대비 등 내 아이의 진학을 위한 학부모 소그룹 교육 운영</span>
				</li>
				<li>
					<span class="dt">진로교사 네트워크 운영</span>
					<span class="dd">관내 초·중·고 진로교사 네트워크 구성을 통해 학생들에게 꼭 필요한 진로교육 운영</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="business_item">
		<div class="left_box"><p>Influence<span>(확장)</span></p></div>
		<div class="right_box">
			<p class="business_title">청소년이 미래로, 세계로 확장하는 교육</p>
			<ul class="bu dl">
				<li>
					<span class="dt">진로진학 플랫폼 운영</span>
					<span class="dd">청소년과 학부모에게 꼭 필요한 진로·진학 정보를 제공</span>
				</li>
				<li>
					<span class="dt">진로진학 박람회 개최</span>
					<span class="dd">진학 컨설팅, 입시 설명회, 진로 체험 등 청소년을 위한 행사 진행</span>
				</li>
				<li>
					<span class="dt">진로 체험처 운영</span>
					<span class="dd">지역 전체가 청소년의 배움터가 될 수 있도록 꿈길 진로체험처 발굴 및 관리</span>
				</li>
			</ul>
		</div>
	</div>
</div>
                    </div>
					
					








                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

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
                            <p class="first_title">프로그램 신청</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>특별 교육 프로그램 신청</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                            



<div class="breadcrumbs">
	<a href="./index.do" class="home">홈</a>
	<ol class="breadcrumbs_list">
		<li class="breadcrumbs_item">
			<a href="" class="breadcrumbs_anchor mobile">프로그램 신청</a>
			<button type="button" class="breadcrumbs_select" title="목록열기">프로그램 신청</button>
			<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4123"  target="_self" >진로진학교육</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" class="active">프로그램 신청</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4135"  target="_self" >학습지원서비스</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4254"  target="_self" >JUMP UP 2025 양주 미래교육 페스타</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4141"  target="_self" >교육 네트워크</a></li>
					<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" >알림마당</a></li>
					<li class="tab_item"><a href="/yjcareer/sitemap.do?key=4151"  target="_self" >홈페이지 가이드</a></li>
			</ul>
		</li>

				
				
					<li class="breadcrumbs_item">
						<a href="" class="breadcrumbs_anchor mobile">프로그램 신청</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">프로그램 신청</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" >프로그램 신청 안내</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4130"  target="_self" class="active">프로그램 신청</a>	</li>
						</ul>
					</li>
				
				
				
				
				

				
					<li class="breadcrumbs_item">
						<a href="" class="breadcrumbs_anchor mobile">특별 교육 프로그램 신청</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">특별 교육 프로그램 신청</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4130"  target="_self" >진로진학 컨설팅 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4131"  target="_self" >진로 프로그램 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4132"  target="_self" >진학 프로그램 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4133"  target="_self" class="active">특별 교육 프로그램 신청</a></li>
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
                    
                    
                    <div id="contents" class="cts4133">
						<div class="education_request">
	<h3> 특별 교육 프로그램 신청 기본정보</h3>  
	<div class="education_viewtable">
		<div class="titlebox">
			
			
			
			
			
				
				
				
					
						
													
							
							 
							
							
								
											
									
									
									
								
								
									
						
						
						
				
			
			<span class="state receiving">대기접수중</span>
			<span class="title">[12월 학부모아카데미]겨울방학 대비 내 자녀 진로와 학습설계</span>
		</div>
		<div class="conbox">
			<ul class="clearfix">
				<li class="clearfix">
					<em>교육기관</em>
					<p>양주진로진학지원센터</p>
				</li>
				<li class="clearfix">
					<em>교육장소</em>
					<p>양주진로진학지원센터</p>
				</li>
				<li class="clearfix">
					<em>강의실</em>
					<p>옥정동로 7나길 18, 211호</p>
				</li>
				<li class="clearfix">
					<em>모집구분</em>
					<p>일반모집</p>
				</li>
				<li class="clearfix">
					<em>강사명</em>
					<p>진로진학전문가</p>
				</li>
				<li class="clearfix">
					<em>기수</em>
					<p></p>
				</li>
				<li class="clearfix">
					<em>분류</em>
					<p>특별 교육 프로그램</p>
				</li>
				<li class="clearfix">
					<em>수강대상</em>
					<p>
						
						
						
						성인
						
						
						
						
						
						
						
						

						
						
						
						
						
						
						
						
						
						
						
						
					</p>
				</li>
				<li class="clearfix">
					<em>접수방식</em>
					<p>
						인터넷접수
						
						
					</p>
				</li>
				<li class="clearfix">
					<em>모집방법</em>
					<p>
						
						승인
					</p>
				</li>
				<li class="clearfix">
					<em>접수기간</em>
					<p>25.11.20~25.12.17</p>
				</li>
				<li class="clearfix">
					<em>모집인원</em>
					<p>정원 : 60명 / 대기 : 0명</p>
				</li>
				<li class="clearfix">
					<em>교육기간</em>
					<p>25.12.18~25.12.18</p>
				</li>
				<li class="clearfix">
					<em>교육요일</em>
					<p>
						
						
						
						목
						
						
						
					</p>
				</li>

				
				
				
				

				<li class="clearfix">
					<em>수강료</em>
					<p>무료</p>
				</li>
				
				
				<li class="clearfix"> 
					<em>교재 및 참고자료</em>     
					<p style="color:red;">상세내용: 진로진학플랫폼&gt;알림마당&gt;공지사항 참조</p>     
				</li>
				<li class="clearfix">
					<em>전화번호</em>
					<p>031-8082-7954</p>
				</li>
				<li class="clearfix">
					<em>팩스번호</em>
					<p></p>
				</li>
				<li class="clearfix nonfloat">
					<em>강의개요</em>
					<p>12월18일(목) 오전10시~12시
<br/>진로진학지원센터(옥정동로7나길 18, 2층)</p>
				</li>
				<li class="clearfix nonfloat">
					<em>유의사항</em>
					<p></p>
				</li>
				<li class="clearfix nonfloat">
					<em>강의계획서</em>
					<p>
						
					</p>
				</li>

			</ul>
		</div>
	</div>
	<div class="bbs_btn_wrap clearfix">
		<div class="bbs_left">			
			
				
				
					<a href="./selectEduLctreWebList.do?key=4133&amp;rcritTrget=adult&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1" class="btn type1">목록</a>
				
			
		</div>
		<div class="bbs_right">
			
				
					<a href="./selectEduApplcntAgreView.do?key=4133&amp;eduLctreNo=12437&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1" class="btn type2">수강신청</a>
				
				
			
		</div>
	</div>
</div>
                    </div>
					
					








                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

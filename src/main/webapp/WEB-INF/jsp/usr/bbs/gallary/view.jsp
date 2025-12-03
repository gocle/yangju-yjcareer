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
                            <h2>공지사항</h2>
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
						<a href="" class="breadcrumbs_anchor mobile">공지사항</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">공지사항</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" class="active">공지사항</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=529&key=4146"  target="_self" >자료실(갤러리)</a>	</li>
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
						[Jump Up 2025 : 양주 진로진학 ON!] 1대1 맞춤형 진로진학컨설팅 2차 상담기간 운영 안내
					</td>
            </tr>

            <tr >		
                <th scope="row">작성자</th>

		
			 
			 
					<td>진로진학</td>
			
		
				
            </tr>

            <tr >		
                <th scope="row">내용</th>
					<td title="내용" class="bbs_content">
						안녕하세요?
<br/>양주시 진로진학지원센터는 올 7월에 옥정동에 개소했습니다.
<br/>7월부터 [교육발전특구]사업의 일환으로 4차산업을 위한 AI디지털교실 프로그램 운영하고 있으며, 진로진학 상시프로그램은 11월부터 내년 1월까지 시범운영을 하게 됩니다.
<br/>
<br/>양주시에서 준비한 첫 번째 진로진학 상시프로그램은 1대1 맞춤형 진로진학상담입니다. 1대1 진로진학컨설팅은 초4~고3까지 대상으로 청소년 스스로의 역량을 키우고 상급학교 진학 방향성 및 이에 따른 학습방법 및 입시전략을 조언해주는 1:1 상담으로서, 경험 많은 컨설턴트 선생님과 함께 진행합니다.
<br/>
<br/>1대1 컨설팅을 시작으로 내년에는 학생과 학부모님들을 위한 알찬 프로그램을 기획 중에 있습니다. 앞으로도 진로진학지원센터의 다양한 진로 진학 프로그램에 관심을 가져주시기 바랍니다. 감사합니다.
<br/>
<br/>[1대1 맞춤형 진로진학컨설팅 안내]
<br/>&lt;전체 안내&gt;
<br/>-8주 기간 동안 학생 1인당 1회만 상담 가능, 비용은 없음
<br/>-상담 1주일 전에 사전상담사가 필요한 자료를 요청드립니다.
<br/>상담준비물 예시(학년 및 학교급에 따라 생활기록부 등) 미리 준비해두시면 더 효과적인 상담을 진행할 수 있습니다.
<br/>
<br/>★취소는 다른 접수자를 위해 상담일 최소 1주일 전에 취소해주세요.
<br/>
<br/>★★사전 연락 없이 불참하거나 6일 전 취소 시 8주 상담기간 중 상담 신청 제한(질병 등 피치 못할 사정으로 취소 시, 증빙자료 제출, 신청 제한 면제)
<br/>*월요일 상담의 경우 전주 일요일까지 취소완료/ 화요일 상담의 경우 전주 월요일 18시까지 취소완료/ 토요상담의 경우 직전 주 일요일까지 취소완료 요망*
<br/>-예시: 12월15일(월) 상담-12월7일(일)까지 취소, 12월20일(토)-12월14일(일)까지 취소
<br/>
<br/>★★★신청이 마감되더라도 중간에 취소가 나올 수 있으니 신청 페이지 모니터링 해주시면 좋습니다.★★★
<br/>
<br/>-일정: 2025. 11. 17.(월)~2026. 1. 13.(화) 중 8주 매주 월, 화 16시~21시(일 5회)
<br/>※센터 사정에 따라 16:30~21:30 운영하는 날도 있음. 참고바랍니다.
<br/>-주말집중상담 2번 운영 11.22.(토), 12.20.(토)(일 6회)
<br/>-장소: 옥정동로7나길 18, 2층 211호 드림타워1(진로진학지원센터)
<br/>
<br/>◆[2차 상담 기간] 12. 15.(월)~1. 13.(화) 중 4주 운영
<br/>
<br/>◆[2차 상담 기간 중 주말 집중상담] 12.20.(토) 12:00~18:00(1일 6회)
<br/>   ※12.29.~12.30. 상담 없는 주간입니다. 추후 상세안내 예정
<br/>
<br/>◆[2차 상담 접수] 12. 2.(화) 10시~ 선착순 접수(★학생 1인당 1회 신청★ 가능)
<br/>
<br/>◆[상담 신청] 진로진학플랫폼&gt;프로그램신청&gt;진로진학 컨설팅 신청
<br/>신청바로가기 : <a href="https://www.yangju.go.kr/yjcareer/selectEduLctreWebList.do?key=4130" target="_blank" title="새창">https://www.yangju.go.kr/yjcareer/selectEduLctreWebList.do?key=4130</a>
<br/>※사용자 편의를 고려한 홈페이지 개편이 곧 있을 예정입니다.
<br/>불편하시더라도 프로그램 예약을 위해 페이지를 넘겨서 원하는 날짜와 시간을 확인 후 신청해주세요. 양해바랍니다:)
<br/>
<br/>◆◆[상담 취소] 진로진학플랫폼&gt;본인인증&gt;나의예약&gt;예약번호 클릭 후 신청취소

						<div class="photo_area clearfix">
						
							
							
							
								
								<div class="photo_view">
									<span class="photo_wrap">
										<img src="/DATA/bbs/530/20251128115419274CmBtKX.jpg" alt="[Jump Up 2025 : 양주 진로진학 ON!] 1대1 맞춤형 진로진학컨설팅 2차 상담기간 운영 안내 이미지1" />
										<span class="photo_zoom"><a href="/DATA/bbs/530/20251128115419274CmBtKX.jpg" target="_blank" title="이미지 확대보기">사진 확대보기</a></span>
									</span>
								</div>
							
						
						</div>		
						
						

					</td>
            </tr>

            <tr >		
                <th scope="row">파일</th>
					<td>
						<ul class="view_attach">
					
						<li>
							<div class="down_view">
									
								<span><img src="../common/images/board/file/ico_jpg.gif" alt="jpg파일첨부" />컨설팅 홍보물(수정).jpg</span>
							
								<a href="/yjcareer/downloadBbsFile.do?key=4145&amp;bbsNo=530&amp;atchmnflNo=190074" title="파일 다운로드" class="file_down">다운로드</a>
							
							
								<a href="/yjcareer/previewUrl.do?key=4145&amp;bbsNo=530&amp;atchmnflNo=190074&amp;nttNo=199826" title="새창" target="_blank" class="file_view">미리보기</a>
							
							</div>
						</li>
					
						</ul>
					</td>					
            </tr>

			
        </tbody>
    </table>

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_left">
            <a href="./selectBbsNttList.do?key=4145&amp;bbsNo=530&amp;nttNo=199826&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" class="bbs_btn list"><i class="icon"></i><span>목록</span></a>
        </div>
<div class="bbs_right">
			<!--학습후기의 경우 버튼-->
			
				<a href="./updateBbsNttView.do?key=4185&amp;bbsNo=548&amp;nttNo=192901&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" class="bbs_btn modify"><i class="icon"></i><span>수정</span></a>
			
			

	
	


			
				
					
					
						<a href="./deleteBbsNtt.do?key=4185&amp;bbsNo=548&amp;nttNo=192901&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=" onclick="fn_deleteBbsNtt(this.href); return false;" class="bbs_btn delete"><i class="icon"></i><span>삭제</span></a>
						
					
										
			
        </div>
    </div>


   

	<ul class="bbs_view_move">
        <li class="prev"><strong>이전글</strong> <a href="./selectBbsNttView.do?key=4145&amp;bbsNo=530&amp;nttNo=199606&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;pageIndex=1&amp;integrDeptCode=">[JUMP UP 2025: 양주 진로진학 ON!] 학부모아카데미</a></li>
        <li class="next"><strong>다음글</strong> </li>
    </ul>
                    </div>
                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

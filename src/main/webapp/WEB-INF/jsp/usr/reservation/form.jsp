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
	<div class="stepbox">
		<ol>
			<li>
				<div class="roundbox">
					<div class="tablebox">
						<div class="cellbox">
							<span class="step">STEP 01</span>
							<p>개인정보수집동의</p>
						</div>
					</div>
				</div>
			</li>
			<li class="active">
				<div class="roundbox">
					<div class="tablebox">
						<div class="cellbox">
							<span class="step">STEP 02</span>
							<p>교육생 정보입력</p>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="roundbox">
					<div class="tablebox">
						<div class="cellbox">
							<span class="step">STEP 03</span>
							<p>교육신청완료</p>
						</div>
					</div>
				</div>
			</li>
		</ol>
	</div>
	<h3>강좌 기본정보</h3>
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
					<em>접수방법</em>
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
					<p>정원 : 60명 / 대기 : 1명</p>
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
					<em>재료비</em>
					<p>무료</p> 
				</li>
				<li class="clearfix">
					<em>교재 및 참고자료</em>
					<p>상세내용: 진로진학플랫폼&gt;알림마당&gt;공지사항 참조</p>
				</li>

				<li class="clearfix">
					<em>전화번호</em>
					<p>031-8082-7954</p>
				</li>
				<li class="clearfix">
					<em>팩스번호</em>
					<p></p>
				</li>
				<li class="clearfix">
					<em>강의계획서</em>
					<p>
						
					</p>
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
			</ul>
		</div>
	</div>
	<div class="bbs_info clearfix">
        <div class="bbs_left">
			<h3>교육생 정보입력</h3>
		</div>
		<div class="bbs_right">
			<p class="write_guide"><span class="exactly y">필수</span> 표시는 필수 입력 항목입니다.</p>
		</div>
	</div>
	<div class="education_formbox">
		<form id="eduApplcntVO" name="eduApplcntVOForm" action="/yjcareer/usr/reservation/complete1.do" method="post" enctype="multipart/form-data" onsubmit="return AddSubmit(this)">
			<fieldset>
				<legend>교육생 정보입력</legend>
					<input type="hidden" name="key" id="key" value="4133"/>
					<input type="hidden" name="eduLctreNo" id="eduLctreNo" value="12437"/>
					<input type="hidden" name="memberNm" id="memberNm" value="김소현"/>
					<input type="hidden" name="pageUnit" id="pageUnit" value="10"/>
					<input type="hidden" name="searchCnd" id="searchCnd" value="all"/>
					<input type="hidden" name="searchKrwd" id="searchKrwd" value=""/>
					<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
					<input type="hidden" name="rceptMth" id="rceptMth" value="online"/>
					<input type="hidden" name="rceptSttus" id="rceptSttus" value=""/>
				<table class="bbs_default write basic_table">
					<caption>교육생 정보입력 - 신청자, 성별, 수강대상, 생년월일, 이메일, 휴대전화, 거주지 입력</caption>
					<colgroup>
						<col /><!-- css로 제어함 -->
						<col /><!-- css로 제어함 -->
						<col /><!-- css로 제어함 -->
						<col /><!-- css로 제어함 -->
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">신청자 <span class="exactly y">필수</span></th>
						<td>김소현</td>
						<th scope="row">성별 <span class="exactly y">필수</span></th>
						<td>
							<div class="radio_parent">
								<span class="temp_checkbox">
									<input name="sexdstn" id="sexdstn1" type="radio" value="M" required="required" /><label for="sexdstn1">남</label>
								</span>
								<span class="temp_checkbox">
									<input name="sexdstn" id="sexdstn2" type="radio" value="W" required="required" /><label for="sexdstn2">여</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">생년월일 <span class="exactly y">필수</span></th>
						<td>
							<div class="birthbox">
								<label for="brthdy1" class="skip">생년월일 연도</label>
								<select class="select" id="brthdy1" name="brthdy1" required="required" title="생년월일 연도선택"  style="height:30px; width:80px; color:#000; line-height:25px; font-size:15px;">
									<option value="">연도선택</option>
									
										<option value="2024" >2024</option>
									
										<option value="2023" >2023</option>
									
										<option value="2022" >2022</option>
									
										<option value="2021" >2021</option>
									
										<option value="2020" >2020</option>
									
										<option value="2019" >2019</option>
									
										<option value="2018" >2018</option>
									
										<option value="2017" >2017</option>
									
										<option value="2016" >2016</option>
									
										<option value="2015" >2015</option>
									
										<option value="2014" >2014</option>
									
										<option value="2013" >2013</option>
									
										<option value="2012" >2012</option>
									
										<option value="2011" >2011</option>
									
										<option value="2010" >2010</option>
									
										<option value="2009" >2009</option>
									
										<option value="2008" >2008</option>
									
										<option value="2007" >2007</option>
									
										<option value="2006" >2006</option>
									
										<option value="2005" >2005</option>
									
										<option value="2004" >2004</option>
									
										<option value="2003" >2003</option>
									
										<option value="2002" >2002</option>
									
										<option value="2001" >2001</option>
									
										<option value="2000" >2000</option>
									
										<option value="1999" >1999</option>
									
										<option value="1998" >1998</option>
									
										<option value="1997" >1997</option>
									
										<option value="1996" >1996</option>
									
										<option value="1995" >1995</option>
									
										<option value="1994" >1994</option>
									
										<option value="1993" >1993</option>
									
										<option value="1992" >1992</option>
									
										<option value="1991" >1991</option>
									
										<option value="1990" >1990</option>
									
										<option value="1989" >1989</option>
									
										<option value="1988" >1988</option>
									
										<option value="1987" >1987</option>
									
										<option value="1986" >1986</option>
									
										<option value="1985" >1985</option>
									
										<option value="1984" >1984</option>
									
										<option value="1983" >1983</option>
									
										<option value="1982" >1982</option>
									
										<option value="1981" >1981</option>
									
										<option value="1980" >1980</option>
									
										<option value="1979" >1979</option>
									
										<option value="1978" >1978</option>
									
										<option value="1977" >1977</option>
									
										<option value="1976" >1976</option>
									
										<option value="1975" >1975</option>
									
										<option value="1974" >1974</option>
									
										<option value="1973" >1973</option>
									
										<option value="1972" >1972</option>
									
										<option value="1971" >1971</option>
									
										<option value="1970" >1970</option>
									
										<option value="1969" >1969</option>
									
										<option value="1968" >1968</option>
									
										<option value="1967" >1967</option>
									
										<option value="1966" >1966</option>
									
										<option value="1965" >1965</option>
									
										<option value="1964" >1964</option>
									
										<option value="1963" >1963</option>
									
										<option value="1962" >1962</option>
									
										<option value="1961" >1961</option>
									
										<option value="1960" >1960</option>
									
										<option value="1959" >1959</option>
									
										<option value="1958" >1958</option>
									
										<option value="1957" >1957</option>
									
										<option value="1956" >1956</option>
									
										<option value="1955" >1955</option>
									
										<option value="1954" >1954</option>
									
										<option value="1953" >1953</option>
									
										<option value="1952" >1952</option>
									
										<option value="1951" >1951</option>
									
										<option value="1950" >1950</option>
									
										<option value="1949" >1949</option>
									
										<option value="1948" >1948</option>
									
										<option value="1947" >1947</option>
									
										<option value="1946" >1946</option>
									
										<option value="1945" >1945</option>
									
										<option value="1944" >1944</option>
									
										<option value="1943" >1943</option>
									
										<option value="1942" >1942</option>
									
										<option value="1941" >1941</option>
									
										<option value="1940" >1940</option>
									
										<option value="1939" >1939</option>
									
										<option value="1938" >1938</option>
									
										<option value="1937" >1937</option>
									
										<option value="1936" >1936</option>
									
										<option value="1935" >1935</option>
									
										<option value="1934" >1934</option>
									
										<option value="1933" >1933</option>
									
										<option value="1932" >1932</option>
									
										<option value="1931" >1931</option>
									
										<option value="1930" >1930</option>
									
										<option value="1929" >1929</option>
									
										<option value="1928" >1928</option>
									
										<option value="1927" >1927</option>
									
										<option value="1926" >1926</option>
									
										<option value="1925" >1925</option>
									
										<option value="1924" >1924</option>
									
										<option value="1923" >1923</option>
									
										<option value="1922" >1922</option>
									
										<option value="1921" >1921</option>
									
										<option value="1920" >1920</option>
									
										<option value="1919" >1919</option>
									
										<option value="1918" >1918</option>
									
										<option value="1917" >1917</option>
									
										<option value="1916" >1916</option>
									
										<option value="1915" >1915</option>
									
										<option value="1914" >1914</option>
									
										<option value="1913" >1913</option>
									
										<option value="1912" >1912</option>
									
										<option value="1911" >1911</option>
									
										<option value="1910" >1910</option>
									
										<option value="1909" >1909</option>
									
										<option value="1908" >1908</option>
									
										<option value="1907" >1907</option>
									
										<option value="1906" >1906</option>
									
										<option value="1905" >1905</option>
									
										<option value="1904" >1904</option>
									
										<option value="1903" >1903</option>
									
										<option value="1902" >1902</option>
									
										<option value="1901" >1901</option>
									
										<option value="1900" >1900</option>
									
								</select>
								<label for="brthdy2" class="skip">생년월일 월</label>
								<select class="select" id="brthdy2" name="brthdy2" required="required" title="생년월일 월선택"  style="height:30px; width:80px; color:#000; line-height:25px; font-size:15px;">
									<option value="">월선택</option>
									
										
										
										
											<option value="01">01</option>
									
									
										
										
										
											<option value="02">02</option>
									
									
										
										
										
											<option value="03">03</option>
									
									
										
										
										
											<option value="04">04</option>
									
									
										
										
										
											<option value="05">05</option>
									
									
										
										
										
											<option value="06">06</option>
									
									
										
										
										
											<option value="07">07</option>
									
									
										
										
										
											<option value="08">08</option>
									
									
										
										
										
											<option value="09">09</option>
									
									
										
										
										
											<option value="10">10</option>
									
									
										
										
										
											<option value="11">11</option>
									
									
										
										
										
											<option value="12">12</option>
									
									
								</select>
								<label for="brthdy3" class="skip">생년월일 일</label>
								<select class="select" id="brthdy3" name="brthdy3" required="required" title="생년월일 일선택"  style="height:30px; width:80px; color:#000; line-height:25px; font-size:15px;">
									<option value="">일선택</option>
									
										
										
										
										<option value="01" >01</option>
									
										
										
										
										<option value="02" >02</option>
									
										
										
										
										<option value="03" >03</option>
									
										
										
										
										<option value="04" >04</option>
									
										
										
										
										<option value="05" >05</option>
									
										
										
										
										<option value="06" >06</option>
									
										
										
										
										<option value="07" >07</option>
									
										
										
										
										<option value="08" >08</option>
									
										
										
										
										<option value="09" >09</option>
									
										
										
										
										<option value="10" >10</option>
									
										
										
										
										<option value="11" >11</option>
									
										
										
										
										<option value="12" >12</option>
									
										
										
										
										<option value="13" >13</option>
									
										
										
										
										<option value="14" >14</option>
									
										
										
										
										<option value="15" >15</option>
									
										
										
										
										<option value="16" >16</option>
									
										
										
										
										<option value="17" >17</option>
									
										
										
										
										<option value="18" >18</option>
									
										
										
										
										<option value="19" >19</option>
									
										
										
										
										<option value="20" >20</option>
									
										
										
										
										<option value="21" >21</option>
									
										
										
										
										<option value="22" >22</option>
									
										
										
										
										<option value="23" >23</option>
									
										
										
										
										<option value="24" >24</option>
									
										
										
										
										<option value="25" >25</option>
									
										
										
										
										<option value="26" >26</option>
									
										
										
										
										<option value="27" >27</option>
									
										
										
										
										<option value="28" >28</option>
									
										
										
										
										<option value="29" >29</option>
									
										
										
										
										<option value="30" >30</option>
									
										
										
										
										<option value="31" >31</option>
									
								</select>
							</div>
						</td>
						<th scope="row"><label for="email">이메일</label></th>
						<td><input type="text" class="temp_textbox" id="email" name="email" value="" /></td>
					</tr>
					<tr>
						<th scope="row"><label for="moblphon1">휴대전화</label> <span class="exactly y">필수</span></th>
						<td >
							<select name="moblphon1" id="moblphon1" required="required" class="select" title="휴대전화 앞자리 선택">
								<option value="010"  >010</option>				
								<option value="011"  >011</option>				
								<option value="016"  >016</option>				
								<option value="017"  >017</option>				
								<option value="018"  >018</option>				
								<option value="019"  >019</option>	
							</select>
							<input type="text" class="temp_textbox" name="moblphon2" id="moblphon2" value="" required="required" title="휴대전화 가운데 3~4자리 입력" size="4" maxlength="4"  /> - 
							<input type="text" class="temp_textbox" name="moblphon3" id="moblphon3" value="" required="required" title="휴대전화 뒷자리 3~4자리 입력" size="4" maxlength="4" />
							<div class="smsbox">
								<p class="point">예약진행상황을 문자로 받아 보시려면 휴대전화를 입력하여 주십시오</p>
								<span class="label">예약진행관련 SMS수신여부 : </span>
								<span class="temp_checkbox">
									<input name="smsAt" id="smsAt" type="checkbox" value="Y" title="수강신청결과 SMS 알림 받음" />
									<label for="smsAt">받음</label>
								</span>
							</div>
						</td>
                        
						<th scope="row"><label for="agrde">연령대</label> <span class="exactly y">필수</span></th>
						<td>
							<select id="agrde" name="agrde" title="연령대 선택" class="select" required="required">
								<option value="" selected="selected">연령대선택</option>
								
									<option value="AGE01">10대이하</option>
								
									<option value="AGE02">10대</option>
								
									<option value="AGE03">20대</option>
								
									<option value="AGE04">30대</option>
								
									<option value="AGE05">40대</option>
								
									<option value="AGE06">50대</option>
								
									<option value="AGE07">60대이상</option>
													
							</select>
						</td>
                        
					</tr>
					<tr>
                        
						<th scope="row"><label for="occp">직업</label> <span class="exactly y">필수</span></th>
						<td>
							<select id="occp" name="occp" title="직업 선택" class="select" required="required">
								<option value="" selected="selected">직업선택</option>
								
									<option value="OCC01">회사원</option>
								
									<option value="OCC02">공무원</option>
								
									<option value="OCC03">자영업</option>
								
									<option value="OCC04">주부</option>
								
									<option value="OCC05">농어민</option>
								
									<option value="OCC06">학생</option>
								
									<option value="OCC07">기타</option>
													
							</select>
						</td>
                        
						<th scope="row"><label for="resdncDetail">거주지</label> <span class="exactly y">필수</span></th>
						<td >
							<select id="resdncDetail" name="resdncDetail" title="거주지 읍면동 선택" class="select" required="required">
								<option value="" selected="selected">거주지선택</option>
								
									<option value="A0101">백석읍</option>
								
									<option value="A0102">은현면</option>
								
									<option value="A0103">남면</option>
								
									<option value="A0104">광적면</option>
								
									<option value="A0105">장흥면</option>
								
									<option value="A0106">양주1동</option>
								
									<option value="A0107">양주2동</option>
								
									<option value="A0108">회천1동</option>
								
									<option value="A0109">회천2동</option>
								
									<option value="A0110">회천3동</option>
								
									<option value="A0111">옥정1동</option>
								
									<option value="A0112">기타</option>
								
									<option value="A0113">옥정2동</option>
													
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="adres">주소</label> <span class="exactly y">필수</span></th>
						<td colspan="3">
							<div class="address">
								<input type="text" name="zip" id="zip" value="" title="우편번호" class="temp_textbox" readonly="readonly" placeholder="우편번호" /> 			
								<button type="button"  class="btn type2 small" onclick="openDaumZipAddress();">도로명주소검색</button> <br/>
								<input id="adres" name="adres" placeholder="상세주소" class="temp_textbox margin_t_10 full_size" type="text" value="" size="50" maxlength="100"/>
								<input type="hidden" path="detailAdres" placeholder="상세주소" maxlength="250" size="50" class="temp_textbox margin_t_10 full_size" />      

								<!-- <input id="zip" name="zip" onclick="findDoro();" placeholder="우편번호" class="temp_textbox" readonly="readonly" type="text" value="" size="8" maxlength="5"/>
								<button type="button" id="zipSearch" class="btn type2 small" onclick="findDoro();" title="새창">우편번호검색</button><br />
								<input id="adres" name="adres" onclick="findDoro();" placeholder="자동입력주소" class="temp_textbox margin_t_10 full_size" readonly="readonly" type="text" value="" size="50" maxlength="100"/><br />
								<input id="detailAdres" name="detailAdres" placeholder="상세주소" class="temp_textbox margin_t_10 full_size" type="text" value="" size="50" maxlength="250"/> -->
							</div>
						</td>
					</tr>
					
				    
			        
			        
					<tr>
						<th scope="row"><label for="adres">메모</label></th>
						<td colspan="3">
							<div class="memo clearfix">
								<div class="left">
									<textarea id="memo" name="memo" style="height:100px"></textarea>
								</div>
								
                                
								
								<div class="right">
									<p>신청자와 실제 수강생이 다를 경우 수강생 정보를 기입해 주시기 바랍니다.</p>
									<p>수강생 이름 : </p>
									<p>학교 : </p>
									<p>학년 : </p>
								</div>
                                
								
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			
		
		
				<input type="hidden" name="dscntTy" value="0|0|0" />
				<input type="hidden" name="dscntAmt" value="0" />
				<input type="hidden" name="totamt" value="0" />
		
	

				<div class="bbs_btn_wrap clearfix">
					<div class="bbs_left">
						<a href="/yjcareer/usr/reservation/list1.do" class="btn type5">목록</a>
					</div>
					<div class="bbs_right">
						<input type="submit" value="등록" class="btn type2" />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>

<input type="hidden" name="piscFlag" id="piscFlagId" value="E" />

<script>
//<![CDATA[

	function fn_piscLookupSwitch(type) {
		if(type == 'on'){
			alert("주민등록번호를 입력후 감면대상 조회버튼을 클릭해주세요.");
			$('#piscFlagId').val("E");
			jQuery('#h3Id').show();
			jQuery('#tableId').show();
		}else{
			jQuery('#h3Id').hide();
			jQuery('#tableId').hide();
		}

	}

	function fn_piscLookup() {
		var key = "4133";
		var name = "김소현";
		if(!name){
			alert("성명이 비어있습니다.");
			return false;
		}
		var juminNo =  $('#juminNoId').val();
		if(!juminNo){
			alert("주민등록번호를 입력해주세요");
			return false;
		}
		if(juminNo.length != 13){
			alert("주민등록번호는 13자리입니다.");
			return false;
		}

		var radioVal = $('input[name="dscntTy"]:checked').val();
		if(!radioVal){
			alert("선택된 감면이 없습니다.");
			return false;
		}
		var piscArr = radioVal.split('|');
		if(piscArr.length != 4){
			alert("선택된 감면이 없습니다.[1]");
			return false;
		}
		var code = piscArr[0];		//할인코드
		if(!code){
			alert("선택된 감면이 없습니다.[2]");
			return false;
		}
		var totamt = piscArr[1];	//수강료
		if(!totamt){
			alert("선택된 감면이 없습니다.[3]");
			return false;
		}
		var percent = piscArr[2];	//감면율
		if(!percent){
			alert("선택된 감면이 없습니다.[4]");
			return false;
		}
		var serviceNm = piscArr[3];
		if(!serviceNm){
			alert("선택된 감면이 없습니다.[5]");
			return false;
		}

		var juminNoAsc = juminNo;
		var strVar = new Array();
		for(var i =0; i < juminNoAsc.length; i++){
			strVar[i] = juminNoAsc.charAt(i);
		}
		var outStr = "";
		for(var i=0; i<strVar.length; i++){
			outStr += strVar[i].charCodeAt(0).toString()
			if(i != strVar.length-1){
				outStr += ",";
			}
		}

		var allData = {"key": key, "eduSiteId": "yjcareer", "juminStr": outStr, "name": name, "serviceNm": serviceNm };
		$.ajax({
			url:"./piscLookup.do",
			type:'post',
			async:false,
			data: allData,
			success:function(data){
				if("TRUE" == data.RESULT){
					if("Y" == data.PISC_AT){
						alert("감면대상자 입니다.");
						$('#piscFlagId').val("Y");
					}else{
						alert("감면대상자가 아닙니다.\n해당없음 또는 다른감면을 선택해주세요.");
						$('#piscFlagId').val("N");
					}
				}else{
					alert(data.RESULT_MSG);
					$('#piscFlagId').val("ERROR");
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				alert("[ERROR] 관리자에게 문의바랍니다. \n" + textStatus + " : " + errorThrown);
				$('#piscFlagId').val("ERROR");
			}
		});

		return true
	}

	function AddSubmit( form ) {
		var sexdstnCnt=0;
		for(var i=0; i<form.sexdstn.length;i++){             
			if (form.sexdstn[i].checked==true) {
				sexdstnCnt++;
			}
		}
		if (sexdstnCnt == 0) {
			alert("성별를 선택해주세요.");
			form.sexdstn1.focus();
			return false;
		}

		if( !form.brthdy1.value ) {
			alert("생년월일 연도를 선택해주세요.");
			form.brthdy1.focus();
			return false;
		}

		if( !form.brthdy2.value ) {
			alert("생년월일 월를 선택해주세요.");
			form.brthdy2.focus();
			return false;
		}

		if( !form.brthdy3.value ) {
			alert("생년월일 일를 선택해주세요.");
			form.brthdy3.focus();
			return false;
		}

		if (!form.moblphon2.value) {
			alert("휴대폰 중간자리를 입력하세요.");
			form.moblphon2.focus();
			return false;
		}

		if (!isNumber(form.moblphon2.value)) {
			alert('휴대폰 중간자리를 숫자로 입력하세요');
			form.moblphon2.focus();
			return false;
		}	

		if (!form.moblphon3.value) {
			alert("휴대폰 끝자리를 입력하세요.");
			form.moblphon3.focus();
			return false;
		}

		if (!isNumber(form.moblphon3.value)) {
			alert('휴대폰 끝자리를 숫자로 입력하세요');
			form.moblphon3.focus();
			return false;
		}

		if( !form.agrde.value ) {
			alert("연령대를 선택해주세요.");
			form.agrde.focus();
			return false;
		}

		if( !form.occp.value ) {
			alert("직업을 선택해주세요.");
			form.occp.focus();
			return false;
		}

		if( !form.resdncDetail.value ) {
			alert("거주지를 선택해주세요.");
			form.resdncDetail.focus();
			return false;
		}

		if( !form.adres.value ) {
			alert("주소를 입력해주세요.");
			form.adres.focus();
			return false;
		}

		/*if( !form.detailAdres.value ) {
			alert("상세주소를 입력해주세요.");
			form.detailAdres.focus();
			return false;
		}*/






	
	
			
			if( confirm("아래 강좌의 승인대기자로 신청하시겠습니까?\n- 강좌명 : [12월 학부모아카데미]겨울방학 대비 내 자녀 진로와 학습설계\n- 교육기간 : 25.12.18~25.12.18\n확인을 클릭하시면 승인대기자 신청이 완료됩니다.") ) {
				form.rceptSttus.value = 'reqst';
			} else {
				return false;
			}				
	
	

		return true;
	}

	function findDoro(){
        var pop = window.open("/common/doro/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo){
        $('#zip').val(zipNo);
        $('#adres').val(roadAddrPart1 + ' ' + roadAddrPart2);
        $('#detailAdres').val(addrDetail);
    }

	function isNumber(msg) {
		if (isEmpty(msg)) return false;
		var	i	= 0;
		for (i=0; i <= msg.length-1; i++) {
		   ch = msg.substring(i,i+1);
		   if (ch < "0" || ch > "9") {
		      return false;
		   }
		}
		return true;
	}

	function isEmpty(str) {
		str	= trim(str);
		return str == '' ? true : false;
	}

	function trim(str) {
		str	+= '';
		return str.replace(/^\s*|\s*$/g, '');
	}

	function fn_changeResdncDetail( val ) {
		val = 'key=4133&resdncCd='+val;
		$.ajax({
			type: 'POST',  
			url: './selectResdncCdDetailJsonList.do',   
			data: val,
			success: changeResdncDetail,
			error: function(xhr, txtStatus, errorThrown){
				 alert(xhr.status + " : "+ txtStatus +" : "+errorThrown);

			}
		});
	}

	function changeResdncDetail(HTMLSource){
		$("#resdncDetail").html(HTMLSource);
	} 

	function fn_changeDscntAmt( val ) {

		var dscnt = val.split("|")[0]
		if (0 > 0 && dscnt != 'dscnt99') {
			alert('요금할인은 분기별 1인 1강좌에 한합니다.');
			document.getElementsByName("dscntTy")[0].checked = true;
			fn_changeDscntAmt("");
			return false;
		}

		var rate = val.split("|")[2] / 100;

		var dscntAmt = val.split("|")[1] * rate;
		eduApplcntVOForm.dscntAmt.value = dscntAmt;

	//var matAmt = eduApplcntVOForm.matAmt.value;  

		var totamt = val.split("|")[1] - dscntAmt;
	//totamt = totamt + parseInt(matAmt);    //재료비는 할인적용 X  

		eduApplcntVOForm.totamt.value = totamt;
	}
//]]>
</script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script nonce="NEOCMSSCRIPT">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				$("#zip").val(data.zonecode);
				$("#adres").val(data.address);
				$("#detailAdres").focus();
				$("#detailAdres").show();
				console.log(data);
			}
		}).open();
	}
</script>
                    </div>
					
					








                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

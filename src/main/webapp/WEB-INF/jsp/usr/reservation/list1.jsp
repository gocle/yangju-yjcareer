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
                            <h2>진로진학 컨설팅 신청</h2>
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
                    
                    
                    <div id="contents" class="cts4130">
						<div class="education_list">
 





	<div class="bbs_search">
		<form name="bbsNttSearchForm" id="bbsNttSearch" action="./selectEduLctreWebList.do" method="get" class="boardSearchForm">
		<input type="hidden" name="key" id="key" value="4130"/>	
			<fieldset>
				<legend>교육강좌 검색</legend>
                
				<div class="listbox con01">
					<ul class="clearfix">
						<li class="list01">
							<label for="searchEduInsttNo">교육기관</label>
							<select name="searchEduInsttNo" id="searchEduInsttNo" class="select" title="교육기관" onchange="fn_changeEduPlace(this.value)">
								<option value="">교육기관선택</option>
								
									<option value="2" >양주시평생학습관</option>
								
									<option value="3" >양주시청소년수련원</option>
								
									<option value="1" >여성일생활균형지원센터</option>
								
									<option value="4" >양주청소년문화의집</option>
								
									<option value="5" >양주시립장욱진미술관</option>
								
									<option value="8" >양주시립회암사지박물관</option>
								
									<option value="9" >혁신교육지구</option>
								
									<option value="10" >백석읍주민자치센터</option>
								
									<option value="11" >은현면주민자치센터</option>
								
									<option value="12" >남면주민자치센터</option>
								
									<option value="13" >광적면주민자치센터</option>
								
									<option value="14" >장흥면주민자치센터</option>
								
									<option value="15" >양주1동주민자치센터</option>
								
									<option value="16" >양주2동삼숭주민자치센터</option>
								
									<option value="17" >양주2동고읍주민자치센터</option>
								
									<option value="18" >회천1동주민자치센터</option>
								
									<option value="19" >회천2동주민자치센터</option>
								
									<option value="20" >회천3동주민자치센터</option>
								
									<option value="21" >옥정1동주민자치센터</option>
								
									<option value="22" >양주시청년센터</option>
								
									<option value="23" >양주시사회적경제지원센터</option>
								
									<option value="24" >건강생활지원센터</option>
								
									<option value="27" >양주시립민복진미술관</option>
								
									<option value="28" >양주생활문화센터</option>
								
									<option value="29" >양주시농업기술센터</option>
								
									<option value="30" >도시환경사업소</option>
								
									<option value="32" >양주진로진학지원센터</option>
								
									<option value="34" >자족도시조성과</option>
								
									<option value="35" >드론봇인재교육센터</option>
								
									<option value="36" >양주시보건소</option>
								
									<option value="37" >옥정2동주민자치센터</option>
								
									<option value="38" >양주시립미술창작스튜디오</option>
								
							</select>
						</li>
						<li class="list02">
							<label for="searchEduPlaceNo">교육장소</label>
							<select name="searchEduPlaceNo" id="searchEduPlaceNo" class="select" title="교육장소">
								<option value="">교육장소선택</option>
											
							</select>
						</li>
						<li class="list03">
							<label for="searchEduSttus">접수상태</label>
							<select name="searchEduSttus" id="searchEduSttus" class="select" title="접수상태">
								<option value="">접수상태선택</option>
								<option value="rceptPrearnge" >접수대기</option>
								<option value="rceptProgrs" >접수중</option>
								<option value="rceptClos" >접수종료</option>
								<option value="eduProgrs" >교육중</option>
								<option value="eduClos" >교육종료</option>
							</select>
						</li>
					</ul>
				</div>
				<div class="listbox con02">
					<ul class="clearfix">
						<li class="list01">
							<span class="label">접수기간</span>
							<span class="date_wrap">
								<input type="text" name="searchRceptBgnde" id="searchRceptBgnde" class="date" title="접수기간 시작 입력" value="" placeholder="시작 선택" readonly="readonly"  />
								<span class="ico_calenedar"><button type="button" onclick="getCalendar(document.bbsNttSearchForm.searchRceptBgnde);">시작 선택</button></span>
							</span>
							<span class="gap">~</span>
                            <span class="date_wrap">
								<input type="text" name="searchRceptEndde" id="searchRceptEndde" class="date" title="접수기간 종료 입력" value="" placeholder="종료 선택" readonly="readonly"  />
								<span class="ico_calenedar"><button type="button" onclick="getCalendar(document.bbsNttSearchForm.searchRceptEndde);">종료 선택</button></span>
							</span>
						</li>
						<li class="list02">
							<select name="searchCnd" id="searchCnd" class="select" title="검색범위선택">
								<option value="all">전체</option>
								<option value="eduLctreSj" >교육명</option>
							</select>
							<span class="submitbox">
								<input name="searchKrwd" id="searchKrwd" type="text" class="temp_textbox" title="검색" placeholder="검색어 입력" value="" />
								<input type="submit" value="검색" />
							</span>
						</li>
					</ul>
				</div>
                
								
                
                
                
			</fieldset>
		</form>
	</div>


	

		

	


	<div class="bbs_info clearfix">
		<div class="bbs_left bbs_count">
			<span>총 <strong>56</strong> 건</span>,
			<span class="division_line">[<strong>1</strong> / 3 페이지]</span>
		</div>
		<div class="bbs_right">TODAY : 2025-11-27</div>
	</div>
	
	<!-- 20210617 디자인수정 -->
	
		
	
		
		<div class="table_scroll scroll both">
		<table class="table tr_over type2 list_table responsive">
			<caption>교육강좌 리스트이며, No., 강좌명, 모집방법, 접수기간 교육기간, 교육일시/시간, 정원/대기, 수강료, 접수상태, 수강신청 항목에 대한 정보를 제공</caption>
			<colgroup>
				<col style="width:6%;" />
				<col />
				<col style="width:9%;" />
				<col style="width:18%;" />
				<col style="width:12%;" />
				<col style="width:10%;" />
				<col style="width:9%;" />
				<col style="width:9%;" />
				<col style="width:10%;" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">강좌명</th>
				<th scope="col">모집방법</th>
				<th scope="col"><em class="em_blue">접수기간</em><br />교육기간</th>
				<th scope="col"><em class="em_blue">교육일시</em><br />시간</th>
				<th scope="col">정원/대기</th>
				<th scope="col">수강료</th>
				<th scope="col">접수상태</th>
				<th scope="col">수강신청</th>
			</tr>
			</thead>
			<tbody class="text_center">
				<tr>
					<td>56</td>
					<td>
						<a href="/yjcareer/usr/reservation/view1.do" class="subject">[진로진학컨설팅]1.13.(화) 16시 </a> 
					</td>
					<td>선착순</td>
					<td>
						<p><em class="em_blue">접수 : 25.12.02~26.01.05</em></p>
						<p>교육 : 26.01.13~26.01.13</p>
					</td>
					<td>
						<em class="em_blue">화</em>
						<br />(16:00 ~ 16:50)
						
	                </td>
					<td>정원 : 0/1<br />대기 : (0/0)</td>
					<td>무료	</td>
					<td>접수대기</td>
					<td data-content="수강신청">
						<a href="/yjcareer/usr/reservation/privacyPolicy1.do" class="request btn type2 small">수강신청</a>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		
	

	<div class="pagination">
		<span class="page_btn prev_group">
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=1" class="prev_end">처음 페이지로</a>
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=1" class="prev">이전 10페이지 이동</a>
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=1" class="prev_one"><i></i>이전 페이지</a>
</span>
<span class="page">
<span class="page_wrap">
<strong title="현재 1페이지">1</strong>
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=2" title="2페이지 이동">2</a>
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=3" title="3페이지 이동">3</a>
</span>
</span>
<span class="page_btn next_group">
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=2" class="next_one">다음 페이지<i></i></a>
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=3" class="next">다음 10페이지 이동</a>
<a href="./selectEduLctreWebList.do?key=4130&amp;searchEduInsttNo=&amp;searchEduPlaceNo=&amp;searchEduSttus=&amp;searchRceptBgnde=&amp;searchRceptEndde=&amp;pageUnit=20&amp;searchCnd=all&amp;searchKrwd=&amp;eduCl=eduCl16&amp;rcritTrget=&amp;searchArea=&amp;lllKind=&amp;pageIndex=3" class="next_end">끝 페이지로</a>
</span>


	</div>
	
</div>

<script>
//<![CDATA[
	function fn_changeEduPlace( val ) {
		if (!val) {
			val = -1;
		}

		val = 'key=4130&eduInsttNo='+val;
		$.ajax({
			type: 'POST',  
			url: './selectEduPlaceJsonWebList.do',   
			data: val,
			success: changeEduPlace,
			error: function(xhr, txtStatus, errorThrown){
				 alert(xhr.status + " : "+ txtStatus +" : "+errorThrown);

			}
		});
	}

	function changeEduPlace(HTMLSource){
		$("#searchEduPlaceNo").html(HTMLSource);
	} 

//]]>
</script>

                    </div>
					
					








                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

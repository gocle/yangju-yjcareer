<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />
	
<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sub.css">
<script src="/yjcareer/assets/site/yjcareer/js/program.min.js"></script>
<script src="/yjcareer/assets/site/yjcareer/js/sub.js"></script>
<script src="/yjcareer/assets/common/js/board.js"></script>

<script>
	$(function () {
		  const $wrap  = $('.bbs-search-checkbox');
		  const $all   = $wrap.find('#checkbox-1'); // 전체
		  const $items = $wrap.find('input[type="checkbox"][name="target"]').not($all);

		  $all.on('change', function () {
			const checked = $(this).is(':checked');
			$items.prop('checked', checked).trigger('change.sync');
		  });

		  $items.on('change change.sync', function () {
			const total = $items.length;
			const onCnt = $items.filter(':checked').length;

			if (onCnt === total) {
			  $all.prop('checked', true);
			} else {
			  $all.prop('checked', false);
			}
		  });

		  $items.trigger('change.sync');
	});
</script>

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
 
 <div class="breadcrumbs">
	<a href="${contextRoot}/usr/main.do" class="home">홈</a>
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
						<a href="" class="breadcrumbs_anchor mobile">진로진학 컨설팅 신청</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">진로진학 컨설팅 신청</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4130"  target="_self" class="active">진로진학 컨설팅 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4131"  target="_self" >진로 프로그램 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4132"  target="_self" >진학 프로그램 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4133"  target="_self" >특별 교육 프로그램 신청</a></li>
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
                    
                    
                    <div id="contents" class="cts4130">
						<div class="education_list">
 





	<div class="bbs_search">
		<form name="bbsNttSearchForm" id="bbsNttSearch" action="./selectEduLctreWebList.do" method="get" class="boardSearchForm">
		<input type="hidden" name="key" id="key" value="4130"/>	
			<fieldset>
				<legend>교육강좌 검색</legend>
                
				<div class="listbox con01">
					<ul class="clearfix bbs-search-flex">

						<li class="list02">
												
							<div class="bbs-search-radio">
						  		<span class="radio-label">장소</span>		
						  
							  <input type="radio" id="radio-0" name="eduPlace" checked>
							  <label for="radio-0" class="radio-btn">
								<span class="icon"></span>
								<span class="text">전체</span>
							  </label>

							  <input type="radio" id="radio-1" name="eduPlace">
							  <label for="radio-1" class="radio-btn">
								<span class="icon"></span>
								<span class="text">동부권</span>
							  </label>
							  
							  <input type="radio" id="radio-2" name="eduPlace">
							  <label for="radio-2" class="radio-btn">
								<span class="icon"></span>
								<span class="text">서부권</span>
							  </label>
							</div>
						</li>
						<li class="list03">
							<div class="bbs-search-radio">
						  		<span class="radio-label">구분</span>		
						  
							  <input type="radio" id="radio-3" name="type" checked>
							  <label for="radio-3" class="radio-btn">
								<span class="icon"></span>
								<span class="text">전체</span>
							  </label>

							  <input type="radio" id="radio-4" name="type">
							  <label for="radio-4" class="radio-btn">
								<span class="icon"></span>
								<span class="text">진로진학</span>
							  </label>
							  
							  <input type="radio" id="radio-5" name="type">
							  <label for="radio-5" class="radio-btn">
								<span class="icon"></span>
								<span class="text">AI디지털</span>
							  </label>
							  
							  <input type="radio" id="radio-6" name="type">
							  <label for="radio-6" class="radio-btn">
								<span class="icon"></span>
								<span class="text">돌봄</span>
							  </label>
							</div>
						</li>
						<li class="list03">
							<div class="bbs-search-radio">
						  		<span class="radio-label">진행상태</span>		
						  
							  <input type="radio" id="radio-7" name="status" checked>
							  <label for="radio-7" class="radio-btn">
								<span class="icon"></span>
								<span class="text">전체</span>
							  </label>

							  <input type="radio" id="radio-8" name="status">
							  <label for="radio-8" class="radio-btn">
								<span class="icon"></span>
								<span class="text">접수예정</span>
							  </label>
							  
							  <input type="radio" id="radio-9" name="status">
							  <label for="radio-9" class="radio-btn">
								<span class="icon"></span>
								<span class="text">접수진행중</span>
							  </label>
							  
							  <input type="radio" id="radio-10" name="status">
							  <label for="radio-10" class="radio-btn">
								<span class="icon"></span>
								<span class="text">접수마감</span>
							  </label>
							</div>
						</li>
						<li>
							<div class="bbs-search-checkbox">
						  		<span class="checkbox-label">신청대상</span>		
						  
							  <input type="checkbox" id="checkbox-1" name="target" checked>
							  <label for="checkbox-1" class="checkbox-btn">
								<span class="text">전체</span>
							  </label>

							  <input type="checkbox" id="checkbox-2" name="target">
							  <label for="checkbox-2" class="checkbox-btn">
								<span class="text">초등</span>
							  </label>
							  
							  <input type="checkbox" id="checkbox-3" name="target">
							  <label for="checkbox-3" class="checkbox-btn">
								<span class="text">중등</span>
							  </label>
							  
							  <input type="checkbox" id="checkbox-4" name="target">
							  <label for="checkbox-4" class="checkbox-btn">
								<span class="text">고등</span>
							  </label>
							  
							  <input type="checkbox" id="checkbox-5" name="target">
							  <label for="checkbox-5" class="checkbox-btn">
								<span class="text">학부모</span>
							  </label>
							</div>
						</li>
					</ul>
				</div>
				<div class="listbox con02">
					<ul class="clearfix">
						<li class="list02">
							<select name="searchCnd" id="searchCnd" class="select" title="검색범위선택">
								<option value="all">전체</option>
								<option value="eduLctreSj" >교육명</option>
							</select>
							<div class="submitbox">
								<input name="searchKrwd" id="searchKrwd" type="text" class="temp_textbox" title="검색" placeholder="검색어 입력" value="" />
								<input type="submit" value="검색" />
								<span class="reset">검색초기화</span>
							</div>
							
						</li>
					</ul>
				</div>
			</fieldset>
		</form>
	</div>

	<div class="bbs_info clearfix">
		<div class="bbs_left">
			<input type="checkbox" id="checkbox-00" name="myProgram" checked>
		  	<label for="checkbox-00" class="checkbox-btn">
				<span class="text">내가 신청한 프로그램 보기</span>
		  	</label>
		</div>
		<div class="bbs_right bbs_count">
			<span>총 <strong>56</strong> 건</span>,
			<span class="division_line">[<strong>1</strong> / 3 페이지]</span>
		</div>
		<!--<div class="bbs_right">TODAY : 2025-11-27</div>-->
	</div>
		
		<div>
		<table class="table tr_over type2 list_table responsive responsive-new">
			<caption>교육강좌 리스트이며, No., 강좌명, 모집방법, 접수기간 교육기간, 교육일시/시간, 정원/대기, 수강료, 접수상태, 수강신청 항목에 대한 정보를 제공</caption>
			<colgroup>
				<col style="width:5%;" />
				<col style="width:20%;" />
				<col style="width:20%;" />
				<col style="width:15%;" />
				<col style="width:8%;" />
				<col style="width:8%;" />
				<col style="width:8%;" />
				<col style="width:8%;" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">대표 이미지</th>
				<th scope="col">강좌명</th>
				<th scope="col"><em class="em_blue">접수기간</em><br />교육기간</th>
				<th scope="col">정원/대기</th>
				<th scope="col">수강료</th>
				<th scope="col">신청대상</th>
				<th scope="col">수강신청</th>
			</tr>
			</thead>
			<tbody class="text_center">
				<tr>
					<td class="td-no">3</td>
					<td class="td-img">
						<a href="eduLctreWebView.html" class="subject">
							<img src="/yjcareer/assets/DATA/popupZone/7.png" />
						</a>
					</td>
					<td class="td-subject">
						<a href="eduLctreWebView.html" class="subject">
							<span class="li-label be">접수예정</span>
							원스톱 학습 코칭 2기(학습유형 검사, 대학생 학습코칭 지원)원스톱 학습 코칭 2기(학습유형 검사, 대학생 학습코칭 지원)
						</a> 
					</td>
					<td class="td-date">
						<p><span class="td-span">접수기간</span>25.12.02~26.01.05</p>
						<p><span class="td-span">교육기간</span>26.01.13~26.01.13</p>
					</td>
					<td class="td-pson">
						<p><span class="td-span">정원 : </span>0/1</p>
						<p><span class="td-span">대기 : </span>(0/0)</p>
					</td>
					<td class="td-cost">무료</td>
					<td class="td-type">
						<span class="type-4">학부모</span>
					</td>
					<td>
						<a href="selectEduApplcntAgreView.html" class="request btn type2 small">수강신청</a>
					</td>
				</tr>
				<tr>
					<td class="td-no">2</td>
					<td class="td-img">
						<a href="eduLctreWebView.html" class="subject">
							<img src="/yjcareer/assets/DATA/popupZone/6.png" />
						</a>
					</td>
					<td class="td-subject">
						<a href="eduLctreWebView.html" class="subject">
							<span class="li-label ing">접수진행중</span>
							원스톱 학습 코칭 2기(학습유형 검사, 대학생 학습코칭 지원)
						</a> 
					</td>
					<td class="td-date">
						<p><span class="td-span">접수기간</span>25.12.02~26.01.05</p>
						<p><span class="td-span">교육기간</span>26.01.13~26.01.13</p>
					</td>
					<td class="td-pson">
						<p><span class="td-span">정원 : </span>0/1</p>
						<p><span class="td-span">대기 : </span>(0/0)</p>
					</td>
					<td class="td-cost">무료</td>
					<td class="td-type">
						<span class="type-1">초등</span>
					</td>
					<td>
						<a href="selectEduApplcntAgreView.html" class="request btn type2 small">수강신청</a>
					</td>
				</tr>
				<tr>
					<td class="td-no">1</td>
					<td class="td-img">
						<a href="eduLctreWebView.html" class="subject">
							<img src="/yjcareer/assets/DATA/popupZone/5.png" />
						</a>
					</td>
					<td class="td-subject">
						<a href="eduLctreWebView.html" class="subject">
							<span class="li-label end">접수마감</span>
							[진로진학컨설팅]1.13.(화) 16시
						</a> 
					</td>
					<td class="td-date">
						<p><span class="td-span">접수기간</span>25.12.02~26.01.05</p>
						<p><span class="td-span">교육기간</span>26.01.13~26.01.13</p>
					</td>
					<td class="td-pson">
						<p><span class="td-span">정원 : </span>0/1</p>
						<p><span class="td-span">대기 : </span>(0/0)</p>
					</td>
					<td class="td-cost">무료</td>
					<td class="td-type">
						<span class="type-2">중등</span>
						<span class="type-3">고등</span>
					</td>
					<td>
						<a href="selectEduApplcntAgreView.html" class="request btn type2 small">수강신청</a>
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
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
                    
                    <div id="contents" class="cts4133">
						<div class="agreecontent">
	<form name="agreeForm" id="agreeForm" method="post" action="/yjcareer/usr/reservation/form.do" onsubmit="return agreeSubmit(this)">
	<input type="hidden" name="key" value="4133"/>
	<input type="hidden" name="eduLctreNo" value="12437"/>
	<input type="hidden" name="pageUnit" value="10"/>
	<input type="hidden" name="searchCnd" value="all"/>
	<input type="hidden" name="searchKrwd" value=""/>
	<input type="hidden" name="pageIndex" value="1"/>

		<fieldset>
			<legend>개인정보수집동의</legend>
			<div class="stepbox">
				<ol>
					<li class="active">
						<div class="roundbox">
							<div class="tablebox">
								<div class="cellbox">
									<span class="step">STEP 01</span>
									<p>개인정보수집동의</p>
								</div>
							</div>
						</div>
					</li>
					<li>
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
			<div class="temp_box">
				<div class="box_wrap">
					<p>홈페이지 이용과 관련하여 「개인정보보호법」제15조(개인정보의 수집ㆍ이용) 및 제 22조에 따라 귀하의 개인정보를 <br />아래와 같이 수집 및 이용하고자 합니다.</p>
				</div>
			</div>
			<h4>개인정보 수집ㆍ이용 내역 (필수사항)</h4>
			<table class="table responsive">
				<caption>
					개인정보 수집ㆍ이용 내역 (필수사항) - 수집ㆍ이용 항목, 수집ㆍ이용 목적, 보유기간
				</caption>
				<thead>
				<tr>
					<th scope="col">수집 ㆍ이용하려는 개인정보의 항목</th>
					<th scope="col">개인정보의 수집ㆍ이용 목적</th>
					<th scope="col">개인정보 이용 및 보유기간</th>
				</tr>
				</thead>
				<tbody class="text_center">
				<tr>
					<td style="font-weight:600">성명, 성별, 핸드폰, 주소, 수업참여 사진</td>
					<td>
						<ul class="bu">
							<li>교육과정 각종 안내 및 협의에 관한 사항</li>
							<li>만족도조사 및 설문조사를 위한 정보제공</li>
							<li>통계자료</li>
							<li>대면/비대면 교육운영 확인 및 수강생 출결확인</li>
							
						</ul>
					</td>
					<td style="font-weight:600">2년</td>
				</tr>
				</tbody>
			</table>
			<p class="point margin_t_15">귀하께서는 개인정보 제공 및 활용에 거부할 권리가 있습니다.<br />거부에 따른 불이익 : 위 제공사항은 프로그램 진행을 위해 필요한 사항으로 거부하실 경우 원활한 사업추진에 어려움이 있을 수 있습니다.</p>
			<div class="linebox agreebox">
				<p>위와 같이 개인정보를 수집ㆍ이용하는데 동의하십니까?</p>
				<div class="input_area">
					<span class="temp_checkbox">
						<input type="radio" name="agree_check01" id="agree_check011" value="1" title="예" checked="checked" />
						<label for="agree_check011">예</label>
					</span>
					<span class="temp_checkbox">
						<input type="radio" name="agree_check01" id="agree_check012" value="0" title="아니오" />
						<label for="agree_check012">아니오</label>
					</span>
				</div>
			</div>
			<h4>선택적 개인정보 수집ㆍ이용내역(동의거부 가능)</h4>
			<table class="table responsive">
				<caption>
					선택적 개인정보 수집ㆍ이용내역(동의거부 가능) - 수집ㆍ이용 항목, 수집ㆍ이용 목적, 보유기간
				</caption>
				<thead>
				<tr>
					<th scope="col">수집 ㆍ이용하려는 개인정보의 항목</th>
					<th scope="col">개인정보의 수집ㆍ이용 목적</th>
					<th scope="col">개인정보 이용 및 보유기간</th>
				</tr>
				</thead>
				<tbody class="text_center">
				<tr>
					<td style="font-weight:600">전화번호, 이메일</td>
					<td>
						<ul class="bu">
							<li>교육과정 각종 안내 및 협의에 관한 사항</li>
							<li>만족도조사 및 설문조사를 위한 정보제공</li>
						</ul>
					</td>
					<td style="font-weight:600">2년</td>
				</tr>
				</tbody>
			</table>
			<p class="point margin_t_15">귀하께서는 개인정보 제공 및 활용에 거부할 권리가 있습니다.<br />거부에 따른 불이익 : 위 제공사항은 프로그램 진행을 위해 필요한 사항으로 거부하실 경우 원활한 사업추진에 어려움이 있을 수 있습니다.</p>
			<div class="linebox agreebox">
				<p>위와 같이 개인정보를 수집ㆍ이용하는데 동의하십니까?</p>
				<div class="input_area">
					<span class="temp_checkbox">
						<input type="radio" name="agree_check02" id="agree_check021" value="1" title="예" checked="checked" />
						<label for="agree_check021">예</label>
					</span>
					<span class="temp_checkbox">
						<input type="radio" name="agree_check02" id="agree_check022" value="0" title="아니오" />
						<label for="agree_check022">아니오</label>
					</span>
				</div>
			</div>
			<div class="bbs_btn_wrap clearfix">
				<div class="bbs_left">
					<a href="/yjcareer/usr/reservation/list1.do" class="btn link2 reverse list">뒤로가기</a>
				</div>
				<div class="bbs_right">
					<input type="submit" class="btn type2" value="확인" />
				</div>
			</div>
		</fieldset>
	</form>
</div>

<script> 
//<![CDATA[
	function agreeSubmit(form){
		if(form.agree_check011.checked != true){
			alert('개인정보 수집 및 이용에 동의를 하셔야 수강신청을 할 수 있습니다.');
			return false;
		}

		return true;
	}
//]]>
</script>
                    </div>
                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:import url="/usr/layout/top.do" />
	
<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sub.css">
<script src="/yjcareer/assets/site/yjcareer/js/program.min.js"></script>
<script src="/yjcareer/assets/site/yjcareer/js/sub.js"></script>
<script src="/yjcareer/assets/common/js/board.js"></script>

<script type="text/javascript">
function fnCalendarView() {
	window.location.href = "${contextRoot}/usr/reservation/consulting/addCalendarView.do";
}
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
	<h3>프로그램 기본정보</h3>
	<div class="education_viewtable">
		<div class="titlebox">
			<span class="state receiving">
				<c:choose>
					<c:when test="${resultMap.status eq 'be'}">접수예정</c:when>
					<c:when test="${resultMap.status eq 'ing'}">접수진행중</c:when>
					<c:when test="${resultMap.status eq 'end'}">접수마감</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</span>
			<span class="title">${resultMap.subjNm }</span>
		</div>
		<div class="conbox">
			<ul class="clearfix">
				<li class="clearfix">
					<em>교육기관</em>
					<p>${resultMap.comTitle }</p>
				</li>
				<li class="clearfix">
					<em>교육장소</em>
					<p>${resultMap.location }</p>
				</li>
				<li class="clearfix">
					<em>기수</em>
					<p>${resultMap.sessionNm}</p>
				</li>
				<li class="clearfix">
					<em>분류</em>
					<p>${resultMap.cateNm }</p>
				</li>
				
				<c:set var="lastCode" value="" />
				<c:forEach var="code" items="${codeList}">
				    <c:if test="${fn:contains(resultMap.eduTarget, code.codeCode)}">
				        <c:set var="lastCode" value="${code.codeCode}" />
				    </c:if>
				</c:forEach>
				
				<li class="clearfix">
					<em>수강대상</em>
					<p>
						<c:forEach var="code" items="${codeList}">
							 <c:if test="${fn:contains(resultMap.eduTarget, code.codeCode)}">
				                ${code.codeName}<c:if test="${code.codeCode ne lastCode}">, </c:if>
				            </c:if>
						</c:forEach>
					</p>
				</li>
				<li class="clearfix">
					<em>모집방법</em>
					<p>
						<c:if test="${resultMap.enrollType eq '1'}">선착순</c:if>
						<c:if test="${resultMap.enrollType eq '2'}">승인</c:if>
					</p>
				</li>
				<li class="clearfix">
					<em>접수기간</em>
					<p>${resultMap.enrollStartDt }~${resultMap.enrollEndDt }</p>
				</li>
				<li class="clearfix">
					<em>모집인원</em>
					<p>정원 : ${resultMap.capacity }명 / 대기 : ${resultMap.waitEnrollCnt }명</p>
				</li>
				<li class="clearfix">
					<em>교육기간</em>
					<p>${resultMap.learnStartDt }~${resultMap.learnEndDt }</p>
				</li>
				<li class="clearfix">
					<em>전화번호</em>
					<p>${resultMap.tel }</p>
				</li>
				<li class="clearfix">
					<em>강의계획서</em>
					<p>${resultMap.subjPlan }</p>
				</li>
				<li class="clearfix nonfloat">
					<em>유의사항</em>
					<p>${resultMap.subjDesc }</p>
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
		<!-- <form id="eduApplcntVO" name="eduApplcntVOForm" action="addWebEduApplcnt.do" method="post" enctype="multipart/form-data" onsubmit="return AddSubmit(this)"> -->
		<form id="eduApplcntVO" name="eduApplcntVOForm" action="addWebEduApplcnt.do" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>교육생 정보입력</legend>
					<input type="hidden" name="seqCd" id="seqCd" value="${resultMap.seqCd}"/>
					<input type="hidden" name="subjCd" id="subjCd" value="${resultMap.subjCd}"/>
					<input type="hidden" name="sgrCd" id="sgrCd" value="${resultMap.sgrCd}"/>
					<input type="hidden" name="pageUnit" id="pageUnit" value="10"/>
					<input type="hidden" name="searchCnd" id="searchCnd" value="all"/>
					<input type="hidden" name="searchKrwd" id="searchKrwd" value=""/>
					<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
					<!-- <input type="hidden" name="rceptSttus" id="rceptSttus" value=""/> -->
				<table class="bbs_default write basic_table">
					<caption>교육생 정보입력 - 신청자, 성별, 수강대상, 휴대전화, 거주지 입력</caption>
					<colgroup>
						<col /><!-- css로 제어함 -->
						<col /><!-- css로 제어함 -->
						<col /><!-- css로 제어함 -->
						<col /><!-- css로 제어함 -->
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">신청자 <span class="exactly y">필수</span></th>
						<td>${sessionScope.SESSION_MEM_NAME}</td>
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
						<th scope="row"><label for="agrde">연령대</label> <span class="exactly y">필수</span></th>
						<td colspan="3">
							<select id="ageGroup" name="ageGroup" title="연령대 선택" class="select" required="required">
								<option value="">연령대 선택</option>
								<c:forEach var="age" items="${ageList}">
									<option value="${age.codeCode}">${age.codeName}</option>
								</c:forEach>
							</select>
							
						</td>
					</tr>
					<tr>
						<th>학교명</th>
			          	<td><input type="text" name="schoolNm" id="schoolNm" style="width:100%;" value="" class="temp_textbox"/></td>
			          	<th>학년</th>
			          	<td colspan="3">
			          		<select id="grade" name="grade" title="학년 선택" class="select">
								<option value="">학년 선택</option>
								<c:forEach var="grade" items="${gradeList}">
									<option value="${grade.codeCode}">${grade.codeName}</option>
								</c:forEach>
							</select>
			          	</td>
					</tr>
					<tr>
						<th scope="row"><label for="moblphon1">휴대전화</label> <span class="exactly y">필수</span></th>
						<td colspan="3">
				            <input type="text" id="hpTel1" name="hpTel1" size="3" maxlength="3" value="" class="temp_textbox numberOnly" />
				            -
				            <input type="text" id="hpTel2" name="hpTel2" size="4" maxlength="4" value="" class="temp_textbox numberOnly" />
				            -
				            <input type="text" id="hpTel3" name="hpTel3" size="4" maxlength="4" value="" class="temp_textbox numberOnly" />
				            <div class="smsbox">
								<p class="point">※ 연락이 원활하도록 보호자의 연락처를 기재해주세요.</p>
								<span class="label">예약상황 문자 수신 여부&nbsp;&nbsp;</span>
								<span class="temp_checkbox">
									<input name="smsYn" id="smsYn" type="checkbox" value="Y" title="예약상황 문자 수신 받음" />
									<label for="smsYn">받음</label>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="adres">주소</label> <span class="exactly y">필수</span></th>
						<td colspan="3">
							<div class="address">
								<input type="text" name="zipcode" id="zipcode" value="" title="우편번호" class="temp_textbox" readonly="readonly" placeholder="우편번호" /> 			
								<button type="button"  class="btn type2 small" onclick="openDaumZipAddress();">도로명주소검색</button> <br/>
								<input id="address" name="address" placeholder="상세주소" class="temp_textbox margin_t_10 full_size" type="text" value="" size="50" maxlength="100"/>
								<input type="hidden" path="detailAdres" placeholder="상세주소" maxlength="250" size="50" class="temp_textbox margin_t_10 full_size" />      
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="resdncDetail">거주지</label> <span class="exactly y">필수</span></th>
						<td colspan="3">
							<select id="resdncDetail" name="resdncDetail" title="거주지 읍면동 선택" class="select" required="required">
								<option value="">거주지 선택</option>
								<c:forEach var="resdn" items="${resdncList}">
									<option value="${resdn.codeCode}">${resdn.codeName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="adres">메모</label></th>
						<td colspan="3">
							<div class="memo clearfix">
								<div class="left">
									<textarea id="memo" name="memo" style="height:100px"></textarea>
								</div>
								<div class="memobox">
									<p class="point">※ 신청자에는 실 수강자 이름을 적어주세요.</p>
								</div>
							</div>
						</td>
					</tr>
					</tbody>
				</table>

				<div class="bbs_btn_wrap clearfix">
					<div class="bbs_left">
						<a href="#" onclick="fnCalendarView();" class="btn type5">목록</a>
					</div>
					<div class="bbs_right">
						<!-- <input type="submit" value="등록" class="btn type2" /> -->
						<input type="button" value="등록" class="btn type2" onclick="AddSubmit()" />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>

<input type="hidden" name="piscFlag" id="piscFlagId" value="E" />

<script>
//<![CDATA[
	function AddSubmit() {//form
		var form = document.getElementById("eduApplcntVO"); 
		
		var sexdstnCnt=0;
		for(var i=0; i<form.sexdstn.length;i++){             
			if (form.sexdstn[i].checked==true) {
				sexdstnCnt++;
			}
		}
		if (sexdstnCnt == 0) {
			alert("성별을 선택해주세요.");
			form.sexdstn1.focus();
			return false;
		}
	
		if( !form.ageGroup.value ) {
			alert("연령대를 선택해주세요.");
			form.ageGroup.focus();
			return false;
		}
		
		if (form.ageGroup.value != "ADT") {
			if( !form.schoolNm.value ) {
				alert("학교명을 입력해주세요.");
				form.schoolNm.focus();
				return false;
			}
			
			if( !form.grade.value ) {
				alert("학년을 선택해주세요.");
				form.grade.focus();
				return false;
			}
		}
		
		if (!form.hpTel2.value) {
			alert("휴대폰 중간자리를 입력하세요.");
			form.moblphon2.focus();
			return false;
		}

		if (!isNumber(form.hpTel2.value)) {
			alert('휴대폰 중간자리를 숫자로 입력하세요');
			form.hpTel2.focus();
			return false;
		}	

		if (!form.hpTel3.value) {
			alert("휴대폰 끝자리를 입력하세요.");
			form.hpTel3.focus();
			return false;
		}

		if (!isNumber(form.hpTel3.value)) {
			alert('휴대폰 끝자리를 숫자로 입력하세요');
			form.hpTel3.focus();
			return false;
		}

		if( !form.address.value ) {
			alert("주소를 입력해주세요.");
			form.address.focus();
			return false;
		}
		
		if( !form.resdncDetail.value ) {
			alert("거주지를 선택해주세요.");
			form.resdncDetail.focus();
			return false;
		}

		/*if( !form.detailAdres.value ) {
			alert("상세주소를 입력해주세요.");
			form.detailAdres.focus();
			return false;
		}*/
		
		var subjNm = "${resultMap.subjNm}";
		var learnStartDt = "${resultMap.learnStartDt}";
		var learnEndDt = "${resultMap.learnEndDt}";
		
		if( confirm("아래 강좌에 신청하시겠습니까?\n- 강좌명 : "+ subjNm +"\n- 교육기간 : "+learnStartDt+" ~ "+learnEndDt+"\n확인을 클릭하시면 신청이 완료됩니다.") ) {
			//form.rceptSttus.value = 'reqst';
			
			$.ajax({
				type: "post",
				url: "${contextRoot}/usr/reservation/addWebEduApplcnt.do",
				data: $("#eduApplcntVO").serialize(),
				success: function(result) {
					if(result == "") {
						$("#eduApplcntVO").attr("action", "${contextRoot}/usr/reservation/comptEduApplcntWebView.do");
						$("#eduApplcntVO").submit();
						
						return;
					} else {
						var msg = "수강신청을 진행 할 수 없습니다.";
						
						if(result == "11") {
							msg += "\n수강신청 시작일 전 입니다.";
							msg += "\n수강신청기간 : ${resultMap.enrollStartDt} ~ ${resultMap.enrollEndDt}";
						}else if(result == "12"){
							msg += "\n수강신청 기간이 종료되었습니다.";
							msg += "\n수강신청기간 : ${resultMap.enrollStartDt} ~ ${resultMap.enrollEndDt}";
						} else if(result == "31"){
							msg += "\n해당 과정의 수강신청이 마감되었습니다.";
						} else if(result == "22"){
							msg += "\n중복신청이 불가능한 과정입니다.";
						} else if(result == "A" || result == "B" || result == "C" || result == "Z" ){
							msg += "\n이미 수강 신청한 과정입니다.";
							
							var cdNm = "";
							
							if(result == "A"){
								cdNm = "승인대기";
							} else if(result == "B"){
								cdNm = "수강승인";
							} else if(result == "C"){
								cdNm = "승인취소";
							} else if("${errCd}" == "D"){
								cdNm = "신청취소";
							} else if("${errCd}" == "E"){
								cdNm = "취소완료";
							} else {
								cdNm = "알수 없는 상태";
							}
							msg += "\n현재 수강 상태 : " + cdNm;
						} else if(result == "99"){
							msg += "해당 과정이 삭제되었거나 존재하지 않은 과정입니다.";
						} else if(result == "91"){
							msg += "수강신청은 로그인 후 이용 가능합니다.";
						} else {
							msg += "시스템 장애가 발생하였습니다.\n잠시 후에 다시 시도하세요.";
						}
						alert(msg);
					}
				},
				error: function() {
			        alert("처리 중 오류가 발생했습니다.");
			    }
			});
		} else {
			return false;
		}				
		return true;
	}

	function findDoro(){
        var pop = window.open("/common/doro/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo){
        $('#zipcode').val(zipNo);
        $('#address').val(roadAddrPart1 + ' ' + roadAddrPart2);
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

//]]>
</script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script nonce="NEOCMSSCRIPT">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				$("#zipcode").val(data.zonecode);
				$("#address").val(data.address);
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
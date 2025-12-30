<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />

<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sub.css">
<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/evo-calendar.css">
<script src="/yjcareer/assets/site/yjcareer/js/program.min.js"></script>
<script src="/yjcareer/assets/site/yjcareer/js/sub.js"></script>
<script src="/yjcareer/assets/common/js/board.js"></script>

<script type="text/javascript">
function fnReservation(seqCd) {
	var di_key = '${sessionScope.SESSION_DI_KEY}';
	
	if (!di_key) {
		alert('로그인 후 이용가능합니다.');
	} else {
		$("#detailForm").attr("action", "selectEduApplcntAgreView.do");
		$("#detailForm").submit();
	}
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
                            <h2>1:1 상담 프로그램 신청</h2>
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
						<a href="" class="breadcrumbs_anchor mobile">1:1 상담 프로그램 신청</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">1:1 상담 프로그램 신청</button>
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
    
    <form id="detailForm" name="detailForm" method="post">
		<input type="hidden" name="seqCd" id="seqCd" value="${resultMap.seqCd}" />
		<input type="hidden" name="subjCd" id="subjCd" value="${resultMap.subjCd}" />
		<input type="hidden" name="sgrCd" id="sgrCd" value="${resultMap.sgrCd}" />
		
	<div id="contents" class="cts4133">
	<div class="education_request">
	<h3> 1:1 상담 프로그램 신청 기본정보</h3>  
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
					<p>${resultMap.sessionNm }</p>
				</li>
				<li class="clearfix">
					<em>분류</em>
					<p>${resultMap.cateNm}</p>
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
					<p>${resultMap.enrollStartDt} ~ ${resultMap.enrollEndDt}</p>
				</li>
				<li class="clearfix">
					<em>모집인원</em>
					<p>정원 : ${resultMap.capacity}명 / 대기 : ${resultMap.waitEnrollCnt}명</p>
				</li>
				<li class="clearfix">
					<em>교육기간</em>
					<p>${resultMap.learnStartDt} ~ ${resultMap.learnEndDt}</p>
				</li>
				<li class="clearfix">
					<em>전화번호</em>
					<p>${resultMap.tel }</p>
				</li>
				<li class="clearfix nonfloat">
					<em>유의사항</em>
					<p>${resultMap.subjDesc}</p>
				</li>
				<li class="clearfix nonfloat">
					<em>강의계획서</em>
					<p>${resultMap.subjPlan}</p>
				</li>

			</ul>
		</div>
	</div>
	<div class="bbs_btn_wrap clearfix">
		<div class="bbs_left">
			<c:if test="${resultMap.sgrCd eq 'A'}">
				<a href="${contextRoot}/usr/reservation/consulting/addCalendarView.do" class="btn type1">목록</a>
			</c:if>
			<c:if test="${resultMap.sgrCd eq 'B'}">
				<a href="${contextRoot}/usr/reservation/program/eduLctreNewList.do" class="btn type1">목록</a>
			</c:if>
		</div>
		<div class="bbs_right">
			<c:choose>
				<c:when test="${resultMap.status eq 'ing'}">
					<a href="#" onclick="fnReservation('${resultMap.seqCd}');" class="btn type2">수강신청</a>
				</c:when>
				<c:when test="${resultMap.status eq 'be'}"><span class="btn type4">접수예정</span></c:when>
				<c:when test="${resultMap.status eq 'end'}"><span class="btn type4">접수마감</span></c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
                    </div>
					</form>
                </article>
            </main>
        
        </div>
    </div>
	

	<c:import url="/usr/layout/footer.do" />
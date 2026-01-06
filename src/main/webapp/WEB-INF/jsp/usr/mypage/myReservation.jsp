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
                            <h2>나의 예약</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                            
						<%-- <c:import url="/usr/menu/sub.do" /> --%>
            			<div class="breadcrumbs">
  							<a href="/yjcareer/usr/main.do" class="home">홈</a>

							  <ol class="breadcrumbs_list">
							
							    <!-- 1뎁스 (상위메뉴) -->
							    <li class="breadcrumbs_item">
							      <a href="javascript:void(0);" class="breadcrumbs_anchor mobile">나의 예약</a>
							      <button type="button" class="breadcrumbs_select" data-target="bc-drop1" aria-haspopup="listbox" aria-expanded="false" title="목록열기">나의 예약</button>
							
							      <ul class="breadcrumbs_panel" id="bc-drop1" role="listbox">
							          <li class="tab_item">
										    <a href="/yjcareer//usr/introduce/intro.do?menuId=2025MENU0000145" target="_self">
										      센터 소개
										    </a>
							          </li>
							          <li class="tab_item">
										    <a href="/yjcareer//usr/reservation/consulting/addCalendarView.do?menuId=2025MENU0000151" target="_self">
										      1:1 상시 상담
										    </a>
							          </li>
							          <li class="tab_item">
										    <a href="/yjcareer/?menuId=" target="_self">
										      행사 및 강좌
										    </a>
							          </li>
							          <li class="tab_item">
										    <a href="/yjcareer//usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000147" target="_self">
										      꿈자람센터 프로그램
										    </a>
							          </li>
							          <li class="tab_item">
										    <a href="/yjcareer//usr/bbs/notice/list.do?menuId=2025MENU0000262" target="_self">
										      알림마당
										    </a>
							          </li>
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
                    
                    
                    <div id="contents" class="cts4157">
						<div class="my_reservation">
	<div class="cancel_layer"><!-- 예약취소하기레이어 -->
		<div class="curtain"></div>
		<div class="layerbox">
			<div class="titlebox">
				<div class="title">예약취소하기</div>
				<button type="button" class="close">닫기</button>
			</div>
			<div class="conbox">
				<form action="">
					<fieldset>
						<legend>예약취소사유</legend>
						<div class="sub_title">예약취소사유 선택</div>
						<ul>
							<li>
								<span class="temp_checkbox">
									<input type="radio" name="" id="" />
									<label for="">일정변경</label>
								</span>
							</li>
							<li>
								<span class="temp_checkbox">
									<input type="radio" name="" id="" />
									<label for="">중복신청</label>
								</span>
							</li>
							<li>
								<span class="temp_checkbox">
									<input type="radio" name="" id="" />
									<label for="">태풍, 지진 등 자연재해</label>
								</span>
							</li>
							<li>
								<span class="temp_checkbox">
									<input type="radio" name="" id="" />
									<label for="">자격 미충족</label>
								</span>
							</li>
							<li>
								<span class="temp_checkbox">
									<input type="radio" name="" id="" />
									<label for="">기타</label>
								</span>
								<label for="" class="skip">취소사유 직접입력</label>
								<input type="text" class="temp_textbox" id="" />
							</li>
						</ul>
						<div class="submitbox">
							<input type="submit" value="예약취소" class="btn link2" />
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<div class="bbs_info clearfix">
		<div class="bbs_left bbs_count">
			<span>총 <strong>${totalCount}</strong> 건</span>,
			<span class="division_line">[<strong>${paginationInfo.currentPageNo }</strong> / ${paginationInfo.lastPageNoOnPageList } 페이지]</span>
		</div>
		<div class="bbs_right"><em class="em_blue">교육강좌명를 클릭하시면 상세 내역을 확인할 수 있습니다.</em></div>
	</div>
	<form id="listForm" name="listForm">
		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize }" />
		<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" /> 
		<input type="hidden" id="seqCd" name="seqCd" value="" />
		<input type="hidden" id="menuId" name="menuId" value="${menuId}" />
	<div class="table_scroll scroll both">
	<table class="table responsive check_reservation">
		<caption>나의 예약현황(교육강좌)에 대한 표이며, No., 교육강좌명, 모집방법, 접수상태, 수료증, 예약상태, 결제상태 항목에 대한 정보를 제공</caption>
		<colgroup>
			<col width="8%" />
			<col width="20%" />
			<col width="10%" />
			<col width="15%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">교육강좌명</th>
				<th scope="col">모집방법</th>
				<th scope="col">예약일</th>
				<th scope="col">예약상태</th>
			</tr>
		</thead>
		<tbody class="text_center">
			<c:forEach var="item" items="${resultList}" varStatus="status">
				<tr>
					<td data-content="No.">
						<c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/>
					</td>
					<td data-content="교육강좌명"><a href="#" onclick="fnDetailView('${item.seqCd}');">${item.subjNm}</a></td>
					<td data-content="모집방법">
						<c:if test="${item.enrollType eq '1'}">선착순</c:if>
						<c:if test="${item.enrollType eq '2'}">승인</c:if>
					</td>
					<td ata-content="예약일">${item.regDt}</td>
					<td data-content="예약상태">${item.enrollStatusNm}</td>
				</tr>
			</c:forEach>
			<c:if test="${totalCount eq 0}">
				<tr>
					<td colspan="5" class="empty">신청한 교육프로그램이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	</div>
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
	</div>
	</form>
</div>

<script>
//<![CDATA[
	function fn_popWindow( url, name, style) {
		window.open(url, name, style);
	}
//]]>

	function fn_search(pageIndex) {
		$("#pageIndex").val(param1);
		var reqUrl = "${contextRoot}/usr/mypage/myReservation.do";
		$("#listForm").attr("action", reqUrl);
		$("#listForm").submit();
	}
	
	function fnDetailView(seqCd) {
		$("#seqCd").val(seqCd);
		var reqUrl = "${contextRoot}/usr/mypage/myReservationView.do";
		$("#listForm").attr("action", reqUrl);
		$("#listForm").submit();
	}
</script>
                    </div>
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

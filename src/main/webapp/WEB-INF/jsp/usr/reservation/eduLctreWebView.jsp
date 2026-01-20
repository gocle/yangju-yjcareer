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
                            <p class="first_title">${resultMap.sgrNm }</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>${resultMap.cateNm }</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                            <div class="breadcrumbs">
  							<a href="/yjcareer/usr/main.do" class="home">홈</a>

							  <ol class="breadcrumbs_list">
							
							    <!-- 1뎁스 (상위메뉴) -->
							    <li class="breadcrumbs_item">
							      <a href="javascript:void(0);" class="breadcrumbs_anchor mobile">${resultMap.sgrNm }</a>
							      <button type="button" class="breadcrumbs_select" data-target="bc-drop1" aria-haspopup="listbox" aria-expanded="false" title="목록열기">${resultMap.sgrNm }</button>
							
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
							    
							    <li class="breadcrumbs_item">
							        <a href="javascript:void(0);" class="breadcrumbs_anchor mobile"> ${resultMap.cateNm}</a>
							
							        <button type="button"
							                class="breadcrumbs_select"
							                data-target="bc-drop2"
							                aria-haspopup="listbox"
							                aria-expanded="false"
							                title="목록열기">
							          ${resultMap.cateNm}
							        </button>

							        <ul class="breadcrumbs_panel" id="bc-drop2" role="listbox">
							          <c:choose>
							          	<c:when test="${resultMap.sgrCd eq 'A' }">
							          		<li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/consulting/addCalendarView.do?menuId=2025MENU0000151"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>맞춤컨설팅</span>
						                      </a>
						                    </li>
						                    
						                    <li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/consulting/addCalendarView.do?menuId=2025MENU0000152"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>학습심리상담</span>
						                      </a>
						                    </li>
						
											<li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/consulting/addCalendarView.do?menuId=2025MENU0000153"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>수시·정시상담</span>
						                      </a>
						                    </li>
						                    
						                     <li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/consulting/addCalendarView.do?menuId=2025MENU0000334"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>면접컨설팅</span>
						                      </a>
						                    </li>
							          	</c:when>
							          	<c:otherwise>
							          		 <li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000147"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>양주진로진학지원센터 프로그램</span>
						                      </a>
						                    </li>

						                    <li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000148"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>동부권 AI디지털 프로그램</span>
						                      </a>
						                    </li>
						
						                    <li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000331"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>서부권 AI디지털 프로그램</span>
						                      </a>
						                    </li>
						
						                    <li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000332"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>동부권 돌봄프로그램</span>
						                      </a>
						                    </li>
						
						                    <li class="depth_item depth2_item">
						                      <a href="/yjcareer/usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000333"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>서부권 돌봄프로그램</span>
						                      </a>
						                    </li>
							          	</c:otherwise>
							          </c:choose>
							        </ul>
							      </li>
							  </ol>
						</div>
                            <%-- <c:import url="/usr/menu/sub.do" /> --%>
                            
                            <div class="addons">
                                <ul class="addons_list">
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
					<p>${resultMap.eduPlace }</p>
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
				<a href="${contextRoot}/usr/reservation/consulting/addCalendarView.do?menuId=2025MENU0000143" class="btn type1">목록</a>
			</c:if>
			<c:if test="${resultMap.sgrCd eq 'B'}">
				<a href="${contextRoot}/usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000142" class="btn type1">목록</a>
			</c:if>
			<c:if test="${resultMap.sgrCd eq 'C'}">
				<a href="${contextRoot}/usr/reservation/event/list.do?menuId=2025MENU0000144" class="btn type1">목록</a>
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
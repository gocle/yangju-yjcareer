<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
function openLoginPopup() {
	var currentUrl = window.location.pathname + window.location.search;
	// currentUrl : /yjcareer/usr/main.do
	$.ajax({
        url: '${contextRoot}/usr/login/requestAuth.do',
        method: 'GET',
        data: { redirectUrl: currentUrl },
        dataType: 'json',
        success: function(data) {
            if (!data || !data.encData) {
                alert('인증 요청 실패');
                return;
            }

            var form = $('<form/>', {
                method: 'post',
                action: 'https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb',
                target: 'popupChk'
            }).appendTo('body');

            $('<input/>', { type: 'hidden', name: 'm', value: 'checkplusService' }).appendTo(form);
            $('<input/>', { type: 'hidden', name: 'EncodeData', value: data.encData }).appendTo(form);

            window.open('', 'popupChk', 'width=500,height=550,top=100,left=100,fullscreen=no,menubar=no,status=no,toolbar=no,titlebar=yes,location=no,scrollbar=no');
            form.submit();
            form.remove();
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('서버 오류: ' + textStatus);
        }
    })
}
</script>

<div id="wrapper">

		<header id="header">
			<div class="accessibility">
				<a href="#contents">본문 바로가기</a>
			</div>

			<div class="gnb">
				<div class="wrap">
					<div class="link">
						<ul class="link_list">
							<li><a href="#" target="_blank" class="btn">양주시 강남인강</a></li>
							<c:choose>
								<c:when test="${not empty sessionScope.SESSION_DI_KEY}">						
									<li class="link_item logout"><a href="/yjcareer/usr/login/logout.do" class="link_anchor" title="로그아웃">로그아웃</a></li>
                            		<li class="link_item mypage"><a href="/yjcareer/usr/mypage/myReservation.do" class="link_anchor">나의예약</a></li>
								</c:when>
								<c:otherwise>
									<li class="link_item login"><a href="javascript:void(0);" onclick="openLoginPopup();" class="link_anchor" title="로그인">로그인</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>

			<div class="group">
				<div class="wrap">
					<div class="logo">
						<a href="/yjcareer/usr/main.do" class="logo_anchor"><img src="/yjcareer/assets/site/yjcareer/images/common/logo.png" alt="시민과함께 도약하는양주"><span>양주 진로진학교육플랫폼</span></a>
					</div>
				</div>


				<div class="lnb">

					<div class="menu_show">
						<button type="button" class="menu_btn">주메뉴 열기</button>
					</div>

					<nav class="menu after eachdown">




						<h2 class="skip">주메뉴</h2>

						<div class="menu_header">
							<div class="link">
								<ul class="link_list clearfix">

									<!--<li class="link_item login"><a href="/loginForm.do?siteId=yjcareer&amp;TARGET=/yjcareer/index.do" class="link_anchor" title="로그인">로그인</a></li>-->
									<li class="link_item logout"><a href="/logout.do?siteId=yjcareer" class="link_anchor" title="로그아웃">로그아웃</a></li>
                            		<li class="link_item mypage"><a href="selectEduApplcntResveWebList.html" class="link_anchor">나의예약</a></li>

								</ul>
							</div>
						</div>

						<div class="wrap">
							<div class="depth depth1">
								<ul class="depth_list depth1_list cut">
									<li class="depth_item depth1_item n1">
										<a href="contents_4123.html" target="_self" class="depth_text depth1_text"><span>센터 소개</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/introduce/intro.do" target="_self" class="depth_text depth2_text"><span>진로진학교육플랫폼 소개</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/introduce/business.do" target="_self" class="depth_text depth2_text"><span>주요사업</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/introduce/map.do" target="_self" class="depth_text depth2_text"><span>찾아오시는 길</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/usr/reservation/consulting/addCalendarView.do" target="_self" class="depth_text depth1_text"><span>1:1 상시 상담</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/consulting/addCalendarView.do" target="_self" class="depth_text depth2_text"><span>맞춤컨설팅</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/consulting/addCalendarView.do" target="_self" class="depth_text depth2_text"><span>학습심리상담</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/consulting/addCalendarView.do" target="_self" class="depth_text depth2_text"><span>수시·정시상담</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/consulting/addCalendarView.do" target="_self" class="depth_text depth2_text"><span>면접컨설팅</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="contents_4135.html" target="_self" class="depth_text depth1_text"><span>행사 및 강좌</span></a>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do" target="_self" class="depth_text depth1_text"><span>꿈자람센터 프로그램</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do" target="_self" class="depth_text depth2_text"><span>양주진로진학지원센터 프로그램</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do" target="_self" class="depth_text depth2_text"><span>동부권 AI디지털 프로그램</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do" target="_self" class="depth_text depth2_text"><span>서부권 AI디지털 프로그램</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do" target="_self" class="depth_text depth2_text"><span>동부권 돌봄프로그램</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do" target="_self" class="depth_text depth2_text"><span>서부권 돌봄프로그램</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/selectBbsNttList.do?bbsNo=530&amp;key=4145" target="_self" class="depth_text depth1_text"><span>알림마당</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/bbs/notice/list.do" target="_self" class="depth_text depth2_text"><span>공지사항</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/bbs/photo/list.do" target="_self" class="depth_text depth2_text"><span>교육 자료실</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer//usr/bbs/review/list.do" target="_self" class="depth_text depth2_text"><span>교육후기</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="menu_hide">
							<button type="button" class="menu_btn">주메뉴 닫기</button>
						</div>
					</nav>

				</div>
			</div>

		</header>
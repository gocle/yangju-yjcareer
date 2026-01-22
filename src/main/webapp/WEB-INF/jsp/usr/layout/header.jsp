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
							<li><a href="https://www.yangju.go.kr/www/index.do" target="_blank" class="btn">양주시청 바로가기</a></li>
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
						<a href="/yjcareer/usr/main.do" class="logo_anchor"><img src="/yjcareer/assets/site/yjcareer/images/common/logo_new.png" alt="교육발전특구 양주 진로진학플랫폼"></a>
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

						<c:set var="upperMenuNo" value="TOP"/>
						<c:set var="menuLevel" value="1"/>
						<c:set var="key1" value="${upperMenuNo}_${menuLevel}"/>
						
						<div class="wrap">
						  <div class="depth depth1">
						    <ul class="depth_list depth1_list cut">
						
						      <c:forEach var="m1" items="${menuList[key1]}" varStatus="st1">
						
						        <%-- 1depth URL 정규화 --%>
						        <c:set var="raw1" value="${m1.menuUrl}" />
						        <c:set var="path1"
						               value="${fn:startsWith(raw1, ctx) ? fn:substring(raw1, fn:length(ctx), fn:length(raw1)) : raw1}" />
						        <c:if test="${not fn:startsWith(path1,'/')}">
						          <c:set var="path1" value='/${path1}'/>
						        </c:if>
						
						        <c:set var="key2" value="${m1.menuId}_${m1.menuDepth + 1}" />
						
						        <li class="depth_item depth1_item n${st1.index + 1}">
						          <a href="<c:url value='${path1}'/>?menuId=${m1.menuId}"
						             target="_self"
						             class="depth_text depth1_text">
						            <span>${m1.menuTitle}</span>
						          </a>
						
						          <%-- 2뎁스 있으면 샘플 구조대로 그대로 출력 --%>
						          <c:if test="${not empty menuList[key2]}">
						            <div class="depth depth2">
						              <div class="depth2_content">
						                <ul class="depth_list depth2_list cut">
						
						                  <c:forEach var="m2" items="${menuList[key2]}">
						
						                    <c:set var="key3" value="${m2.menuId}_${m2.menuDepth + 1}" />
						
						                    <%-- 2depth URL 정규화 --%>
						                    <c:set var="raw2" value="${m2.menuUrl}" />
						                    <c:set var="path2"
						                           value="${fn:startsWith(raw2, ctx) ? fn:substring(raw2, fn:length(ctx), fn:length(raw2)) : raw2}" />
						                    <c:if test="${not fn:startsWith(path2,'/')}">
						                      <c:set var="path2" value='/${path2}'/>
						                    </c:if>
						
						                    <li class="depth_item depth2_item">
						                      <a href="<c:url value='${path2}'/>?menuId=${m2.menuId}"
						                         target="_self"
						                         class="depth_text depth2_text">
						                        <span>${m2.menuTitle}</span>
						                      </a>
						
						                      <%-- 3뎁스 있으면(샘플이 depth3를 li 아래에 두는 형태라면 그대로) --%>
						                      <c:if test="${not empty menuList[key3]}">
						                        <div class="depth depth3">
						                          <ul class="depth_list depth3_list">
						                            <c:forEach var="m3" items="${menuList[key3]}">
						
						                              <%-- 3depth URL 정규화 --%>
						                              <c:set var="raw3" value="${m3.menuUrl}" />
						                              <c:set var="path3"
						                                     value="${fn:startsWith(raw3, ctx) ? fn:substring(raw3, fn:length(ctx), fn:length(raw3)) : raw3}" />
						                              <c:if test="${not fn:startsWith(path3,'/')}">
						                                <c:set var="path3" value='/${path3}'/>
						                              </c:if>
						
						                              <li class="depth_item depth3_item">
						                                <a href="<c:url value='${path3}'/>?menuId=${m3.menuId}"
						                                   target="_self"
						                                   class="depth_text depth3_text">
						                                  ${m3.menuTitle}
						                                </a>
						                              </li>
						
						                            </c:forEach>
						                          </ul>
						                        </div>
						                      </c:if>
						                    </li>
						
						                  </c:forEach>
						                </ul>
						              </div>
						            </div>
						          </c:if>
						        </li>
						
						      </c:forEach>
						
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
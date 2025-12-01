<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="logoUrl"       value="/assets/css/usr/img/logo.png" />
<c:set var="menuIconUrl"   value="/assets/css/usr/img/menu-03.png" />
<c:set var="logoMobileUrl" value="/assets/css/usr/img/logo.png" />

<script>
function openLoginPopup() {
	var currentUrl = window.location.pathname + window.location.search;
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
    });
}
</script>

<header class="header">
  <div class="header-inner">
    <!-- 로고 -->
    <div class="logo pointer" onclick="location.href='<c:url value="/usr/main.do"/>'">
      <img src="<c:url value='${logoUrl}'/>" alt="Yangju 양주시" />
    </div>

    <!-- 데스크탑 네비 + 유저메뉴 -->
    <div class="flex center">
      <nav class="nav">
        <c:set var="upperMenuNo" value="TOP"/>
        <c:set var="menuLevel" value="1"/>
        <c:set var="key1" value="${upperMenuNo}_${menuLevel}"/>

        <ul>
          <c:forEach var="m1" items="${menuList[key1]}">
            <li>
              <a href="#">${m1.menuTitle}</a>

              <c:set var="key2" value="${m1.menuId}_${m1.menuDepth + 1}" />
              <c:if test="${not empty menuList[key2]}">
                <ul class="submenu"><!-- 2depth -->
                  <c:forEach var="m2" items="${menuList[key2]}">
                    <c:set var="key3" value="${m2.menuId}_${m2.menuDepth + 1}"/>

                    <%-- m2 URL 정규화(컨텍스트가 이미 포함돼 있으면 제거) --%>
                    <c:set var="raw2" value="${m2.menuUrl}" />
                    <c:set var="path2"
                           value="${fn:startsWith(raw2, ctx) ? fn:substring(raw2, fn:length(ctx), fn:length(raw2)) : raw2}" />
                    <c:if test="${not fn:startsWith(path2,'/')}">
                      <c:set var="path2" value='/${path2}'/>
                    </c:if>

                    <c:choose>
                      <c:when test="${not empty menuList[key3]}">
                        <li>
                          <a id="a_${m2.menuId}" href="<c:url value='${path2}'/>?menuId=${m2.menuId}">
                            ${m2.menuTitle}
                          </a>

                          <ul class="depth3-menu"><!-- 3depth -->
                            <c:forEach var="m3" items="${menuList[key3]}">
                              <%-- m3 URL 정규화 --%>
                              <c:set var="raw3" value="${m3.menuUrl}" />
                              <c:set var="path3"
                                     value="${fn:startsWith(raw3, ctx) ? fn:substring(raw3, fn:length(ctx), fn:length(raw3)) : raw3}" />
                              <c:if test="${not fn:startsWith(path3,'/')}">
                                <c:set var="path3" value='/${path3}'/>
                              </c:if>

                              <li>
                                <a id="a_${m3.menuId}" href="<c:url value='${path3}'/>?menuId=${m3.menuId}">
                                  ${m3.menuTitle}
                                </a>
                              </li>
                            </c:forEach>
                          </ul>
                        </li>
                      </c:when>
                      <c:otherwise>
                        <li>
                          <a id="a_${m2.menuId}" href="<c:url value='${path2}'/>?menuId=${m2.menuId}">
                            ${m2.menuTitle}
                          </a>
                        </li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                </ul>
              </c:if>
            </li>
          </c:forEach>
        </ul>
      </nav>
	
      <c:choose>
		    <c:when test="${not empty sessionScope.SESSION_DI_KEY}">
		        <div class="user-on-menu">
					<a href="<c:url value='/usr/mypage/myReservation.do'/>">나의 예약</a>
					<a href="<c:url value='/usr/login/logout.do'/>" class="logout">로그아웃</a>
				</div>
		    </c:when>
		    <c:otherwise>
		        <div class="user-menu">
					<a href="javascript:void(0);" onclick="openLoginPopup();">로그인</a>
				</div>
		    </c:otherwise>
	  </c:choose>
    </div>
  </div>

  <!-- 모바일 메뉴 버튼 -->
  <button type="button" class="m-menu" aria-label="모바일 메뉴 열기">
    <img src="<c:url value='${menuIconUrl}'/>" alt="메뉴" />
  </button>

  <!-- 모바일 네비 -->
  <nav class="mobile-nav" aria-hidden="true">
    <div class="mo-top">
      <img src="<c:url value='${logoMobileUrl}'/>" alt="Yangju 양주시" />
      <button type="button" class="close" aria-label="닫기"></button>
    </div>

    <ul>
      <c:forEach var="mm1" items="${menuList[key1]}">
        <li>
          <a href="#" class="mo-toggle">${mm1.menuTitle}</a>

          <c:set var="k2" value="${mm1.menuId}_${mm1.menuDepth + 1}" />
          <c:if test="${not empty menuList[k2]}">
            <ul class="submenu">
              <c:forEach var="mm2" items="${menuList[k2]}">
                <c:set var="k3" value="${mm2.menuId}_${mm2.menuDepth + 1}" />

                <%-- m2 mobile URL 정규화 --%>
                <c:set var="raw2m" value="${mm2.menuUrl}" />
                <c:set var="path2m"
                       value="${fn:startsWith(raw2m, ctx) ? fn:substring(raw2m, fn:length(ctx), fn:length(raw2m)) : raw2m}" />
                <c:if test="${not fn:startsWith(path2m,'/')}">
                  <c:set var="path2m" value='/${path2m}'/>
                </c:if>

                <c:choose>
                  <c:when test="${not empty menuList[k3]}">
                    <li>
                      <a href="#" class="mo-toggle">${mm2.menuTitle}</a>
                      <ul class="depth3-menu">
                        <c:forEach var="mm3" items="${menuList[k3]}">
                          <%-- m3 mobile URL 정규화 --%>
                          <c:set var="raw3m" value="${mm3.menuUrl}" />
                          <c:set var="path3m"
                                 value="${fn:startsWith(raw3m, ctx) ? fn:substring(raw3m, fn:length(ctx), fn:length(raw3m)) : raw3m}" />
                          <c:if test="${not fn:startsWith(path3m,'/')}">
                            <c:set var="path3m" value='/${path3m}'/>
                          </c:if>

                          <li>
                            <a id="a_${mm3.menuId}" href="<c:url value='${path3m}'/>?menuId=${mm3.menuId}">
                              ${mm3.menuTitle}
                            </a>
                          </li>
                        </c:forEach>
                      </ul>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li>
                      <a id="a_${mm2.menuId}" href="<c:url value='${path2m}'/>?menuId=${mm2.menuId}">
                        ${mm2.menuTitle}
                      </a>
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
          </c:if>
        </li>
      </c:forEach>

      <%-- <li class="login-li">
        <a href="<c:url value='/usr/login/loginForm.do'/>">
          <img src="${contextRoot}/assets/css/usr/img/login.png" alt="로그인">
          <span>로그인</span>
        </a>
      </li> --%>
      <li class="login-li my-li">
        <a href="<c:url value='/usr/main/myReservation.do'/>">
          <img src="${contextRoot}/assets/css/usr/img/date_w.png" alt="나의 예약">
          <span>나의 예약</span>
        </a>
      </li>
      <li class="login-li">
        <a href="<c:url value='/usr/login/logout.do'/>">
          <img src="${contextRoot}/assets/css/usr/img/logout.png" alt="로그아웃">
          <span>로그아웃</span>
        </a>
      </li>
    </ul>
  </nav>
</header>
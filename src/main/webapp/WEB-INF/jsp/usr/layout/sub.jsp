<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="breadcrumbs">
  <a href="/yjcareer/usr/main.do" class="home">홈</a>

  <ol class="breadcrumbs_list">

    <!-- 1뎁스 (상위메뉴) -->
    <li class="breadcrumbs_item">
      <a href="javascript:void(0);" class="breadcrumbs_anchor mobile">${menuVO.upMenuTitle}</a>

      <button type="button"
              class="breadcrumbs_select"
              data-target="bc-drop1"
              aria-haspopup="listbox"
              aria-expanded="false"
              title="목록열기">
        ${menuVO.upMenuTitle}
      </button>

      <ul class="breadcrumbs_panel" id="bc-drop1" role="listbox">
        <c:forEach var="menu" items="${listTopMenu}">
          <c:set var="menuPathList" value="${fn:split(menu.menuUrl, '@')}" />
          <li class="tab_item">
           <c:choose>
			  <c:when test="${fn:startsWith(menuPathList[0], 'http')}">
			    <a href="${menuPathList[0]}"
			       target="_blank"
			       rel="noopener noreferrer">
			      ${menu.menuTitle}
			    </a>
			  </c:when>
			  <c:otherwise>
			    <a href="/yjcareer/${menuPathList[0]}?menuId=${menuPathList[1]}"
			       target="_self">
			      ${menu.menuTitle}
			    </a>
			  </c:otherwise>
			</c:choose>
          </li>
        </c:forEach>
      </ul>
    </li>

    <!-- 2뎁스 (현재 메뉴가 3뎁스가 아니면: 현재메뉴 목록) -->
    <c:if test="${menuInfo.menuDepth != '3'}">
      <li class="breadcrumbs_item">
        <a href="javascript:void(0);" class="breadcrumbs_anchor mobile">${menuVO.menuTitle}</a>

        <button type="button"
                class="breadcrumbs_select"
                data-target="bc-drop2"
                aria-haspopup="listbox"
                aria-expanded="false"
                title="목록열기">
          ${menuVO.menuTitle}
        </button>

        <ul class="breadcrumbs_panel" id="bc-drop2" role="listbox">
          <c:forEach var="menu" items="${listSubMenu}">
            <li class="tab_item">
              <c:choose>
				  <c:when test="${fn:startsWith(menu.menuUrl, 'http')}">
				    <a href="${menu.menuUrl}"
				       target="_blank"
				       rel="noopener noreferrer"
				       class="${menu.menuId eq menuVO.menuId ? 'active' : ''}">
				      ${menu.menuTitle}
				    </a>
				  </c:when>
				  <c:otherwise>
				    <a href="/yjcareer/${menu.menuUrl}?menuId=${menu.menuId}"
				       target="_self"
				       class="${menu.menuId eq menuVO.menuId ? 'active' : ''}">
				      ${menu.menuTitle}
				    </a>
				  </c:otherwise>
				</c:choose>
            </li>
          </c:forEach>
        </ul>
      </li>
    </c:if>

    <!-- 2뎁스 + 3뎁스 (현재가 3뎁스인 경우) -->
    <c:if test="${menuInfo.menuDepth == '3'}">
      <!-- 2뎁스 -->
      <li class="breadcrumbs_item">
        <a href="javascript:void(0);" class="breadcrumbs_anchor mobile">${menuVO.menuTitle}</a>

        <button type="button"
                class="breadcrumbs_select"
                data-target="bc-drop2"
                aria-haspopup="listbox"
                aria-expanded="false"
                title="목록열기">
          ${menuVO.menuTitle}
        </button>

        <ul class="breadcrumbs_panel" id="bc-drop2" role="listbox">
          <c:forEach var="menu" items="${listSubMenu}">
            <li class="tab_item">
              <c:choose>
				  <c:when test="${fn:startsWith(menu.menuUrl, 'http')}">
				    <a href="${menu.menuUrl}"
				       target="_blank"
				       rel="noopener noreferrer"
				       class="${menu.menuId eq menuVO.menuId ? 'active' : ''}">
				      ${menu.menuTitle}
				    </a>
				  </c:when>
				  <c:otherwise>
				    <a href="/yjcareer/${menu.menuUrl}?menuId=${menu.menuId}"
				       target="_self"
				       class="${menu.menuId eq menuVO.menuId ? 'active' : ''}">
				      ${menu.menuTitle}
				    </a>
				  </c:otherwise>
				</c:choose>
            </li>
          </c:forEach>
        </ul>
      </li>

      <!-- 3뎁스 -->
      <li class="breadcrumbs_item">
        <a href="javascript:void(0);" class="breadcrumbs_anchor mobile">${menuInfo.menuTitle}</a>

        <button type="button"
                class="breadcrumbs_select"
                data-target="bc-drop3"
                aria-haspopup="listbox"
                aria-expanded="false"
                title="목록열기">
          ${menuInfo.menuTitle}
        </button>

        <ul class="breadcrumbs_panel" id="bc-drop3" role="listbox">
          <c:forEach var="menu" items="${listSubSubMenu}">
            <li class="tab_item">
              <a href="/yjcareer/${menu.menuUrl}?menuId=${menu.menuId}"
                 target="_self"
                 class="${menu.menuId eq menuInfo.menuId ? 'active' : ''}">
                ${menu.menuTitle}
              </a>
            </li>
          </c:forEach>
        </ul>
      </li>
    </c:if>

  </ol>
</div>

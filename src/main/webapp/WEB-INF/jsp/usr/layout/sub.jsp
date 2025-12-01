<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<div class="sub-banner sub-banner-01">
		<div class="banner-txt sub-banner-txt">	
			<p><span>${menuVO.upMenuTitle}</span></p>
		</div>
	</div>
	
	<div class="contents-layout">
			
		<div class="sub-nav-menu flex">
			<img src="/assets/cndual/image/sub_01/home.png" class="home_icon"/>
			<ul class="flex">
				<!-- 1레벨 메뉴 드롭박스 -->
				<li>
					<dl class="dropdown-wrap">
						<dt class="btn-lang drop1" data-target="lang-drop1">${menuVO.upMenuTitle}</dt>
						<dd class="lang-area" id="lang-drop1">
							<c:forEach var="menu" items="${listTopMenu}">
								<c:set var="menuPathList" value="${fn:split(menu.menuUrl, '@')}" />
								<a href="${menuPathList[0]}?menuId=${menuPathList[1]}">${menu.menuTitle}</a>
							</c:forEach>
						</dd>
					</dl>
				</li>
				<c:if test = "${menuInfo.menuDepth != '3'}">
				<!-- 2레벨 메뉴 드롭박스 -->
				<li>
					<dl class="dropdown-wrap">
						<dt class="btn-lang text drop2" data-target="lang-drop2">${menuVO.menuTitle}</dt>
						<dd class="lang-area" id="lang-drop2">
							<c:forEach var="menu" items="${listSubMenu}">
								<a href="${menu.menuUrl}?menuId=${menu.menuId}">${menu.menuTitle}</a>
							</c:forEach>
						</dd>
					</dl>
				</li>
				</c:if>
				<c:if test = "${menuInfo.menuDepth == '3'}">
				<!-- 2레벨 메뉴 드롭박스 -->
				<li>
					<dl class="dropdown-wrap">
						<dt class="btn-lang drop2" data-target="lang-drop2">${menuVO.menuTitle}</dt>
						<dd class="lang-area" id="lang-drop2">
							<c:forEach var="menu" items="${listSubMenu}">
								<a href="${menu.menuUrl}?menuId=${menu.menuId}">${menu.menuTitle}</a>
							</c:forEach>
						</dd>
					</dl>
				</li>
				<!-- 3레벨 메뉴 드롭박스 -->
				<li>
					<dl class="dropdown-wrap">
						<dt class="btn-lang drop3" data-target="lang-drop3">${menuInfo.menuTitle}</dt>
						<dd class="lang-area" id="lang-drop3">
							<c:forEach var="menu" items="${listSubSubMenu}">
								<a href="${menu.menuUrl}?menuId=${menu.menuId}">${menu.menuTitle}</a>
							</c:forEach>
						</dd>
					</dl>
				</li>
				</c:if>
			</ul>
		</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
	const buttons = document.querySelectorAll('.btn-lang');

	buttons.forEach(function (btn) {
		btn.addEventListener('click', function () {
			const targetId = btn.getAttribute('data-target');
			const targetEl = document.getElementById(targetId);

			// 다른 드롭다운 닫기
			document.querySelectorAll('.lang-area').forEach(function (el) {
				if (el !== targetEl) el.style.display = 'none';
			});

			// 현재 드롭다운 토글
			if (targetEl.style.display === 'block') {
				targetEl.style.display = 'none';
			} else {
				targetEl.style.display = 'block';
			}
		});
	});

	// 외부 클릭 시 닫기
	document.addEventListener('click', function (e) {
		if (!e.target.closest('.dropdown-wrap')) {
			document.querySelectorAll('.lang-area').forEach(function (el) {
				el.style.display = 'none';
			});
		}
	});
});
</script>

<style>
/* 드롭다운 래퍼 */
.dropdown-wrap {
	position: relative;
	display: inline-block;
	font-family: inherit;
}

/* 드롭다운 버튼 */
.dropdown-wrap .btn-lang {
    display: inline-block;
    cursor: pointer;
    user-select: none;
    border-radius: 4px;
    font-size: 14px;
    min-width: 150px;
    white-space: nowrap;
    background: url(/assets/cndual/image/sub_01/arrow.png) right no-repeat;
    padding: 0 1.5rem;
    line-height: 23px;
    font-size: 17px;
}

/* 드롭다운 영역 */
.dropdown-wrap .lang-area {
	display: none; /* 기본은 닫힘 */
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 999;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: 0 2px 8px rgba(0,0,0,0.1);
	min-width: 150px;
	width:100%;
	padding: 1rem 0;
    margin-top: 5%;
}

/* 드롭다운 항목 */
.dropdown-wrap .lang-area a {
	display: block;
	padding: 8px 12px;
	text-decoration: none;
	color: #333;
	white-space: nowrap;
	font-size: 14px;
}

.dropdown-wrap .lang-area a:hover {
	background-color: #f0f0f0;
}
</style>




 


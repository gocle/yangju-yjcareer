<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>프로그램 일정</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="#">홈</a></li>
				<li><a href="#">프로그램 일정</a></li>
			</ul>
		</div>
	</section>

    <!-- 프로그램 리스트 -->
	<section class="calendar">
		<form id="searchForm" name="searchForm">
			<div class="calendar_searchBox">
				<div class="tab_left">
					<div class="search_tab">
						<input type="checkbox" name="searchScTyCd" id="cbx_chkAll" value="ALL"  class="check">
						<label for="cbx_chkAll">전체</label>
						<input type="checkbox" name="searchScTyCd" id="chk1" value="wood">
						<label for="chk1">목재문화체험장</label>
						<input type="checkbox" name="searchScTyCd" id="chk2" value="forest">
						<label for="chk2">산림교육</label>
					</div>
				</div>
				<!-- <div class="select_search_box">
					<select id="selectBox" name="searchCondition">
						<option value="">전체</option>
						<option value="scTitle">제목</option>
						<option value="scContent">내용</option>
					</select>
					<input type="text" value="" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해 주세요." />
				</div> -->
			</div>
		</form>
		
		<div id='calendar'></div>

	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
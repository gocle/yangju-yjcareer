<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />

	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>목재문화체험장</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">휴양림 소개</a></li>
				<li><a href="<c:url value="/usr/introduce/woodCenter.do"/>">목재문화체험장</a></li>
			</ul>
		</div>
	</section>
    
    <!--서브 네비2-->
   	<section class="nav-btn">
		<div class="nav-btn-inner">
			<ul>
				<li><a href="<c:url value='/usr/introduce/woodCenter.do'/>">인사말</a></li>
				<li><a href="<c:url value='/usr/introduce/woodInfo.do'/>">연혁 및 시설 안내</a></li>
				<li class="on"><a href="<c:url value='/usr/introduce/woodLoad.do'/>">오시는 길</a></li>
			</ul>
		</div>
	</section>

    <!-- 연혁 및 시설 안내 -->

	<section class="road sub-section">
		<div class="info-main-title flex section">
			<h2>양주 목재문화체험장 오시는길</h2>
		</div>
		<div class="road-info section">
			<dl>
				<dt></dt>
				<dd><span>주소</span> (우) 11469 경기도 양주시 새터로92(양주숲복지센터)</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd><span>전화번호</span> 031-8082-6202</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd><span>팩스번호</span> 0505-041-2159</dd>
			</dl>
		</div>
		<div class="road-img section" id="map"></div>

		<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=${appKey}"></script>

		<script>
		document.addEventListener("DOMContentLoaded", function() {
			  var lat = 37.826956;
			  var lng = 127.083670;

			  var mapContainer = document.getElementById('map');
			  var mapOption = {
			      center: new kakao.maps.LatLng(lat, lng),
			      level: 3
			  };

			  var map = new kakao.maps.Map(mapContainer, mapOption);

			  var marker = new kakao.maps.Marker({
			      position: new kakao.maps.LatLng(lat, lng)
			  });
			  marker.setMap(map);

			  var infowindow = new kakao.maps.InfoWindow({
			      content: '<div style="padding:5px;font-size:18px;">양주 숲 복지센터</div>'
			  });
			  infowindow.open(map, marker);
			  
			  var zoomControl = new kakao.maps.ZoomControl();
			  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			});
		</script>
		
	</section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
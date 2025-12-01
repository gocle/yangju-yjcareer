<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
    $(".linkSelect").change(function(){
        var url = $(this).val();
        if(url) {
            window.open(url, "_blank");
            $(this).prop("selectedIndex", 0);
        }
    });
});
</script>

<div class="link">
		<div class="link-inner">
			<!-- <ul class="flex">
				<li><a href="#"></a></li>
				<li><a href="#">유관기관</a></li>
				<li><a href="#"></a></li>
				<li><a href="#"></a></li>
			</ul> -->
			<select class="linkSelect">
				<option>직속ㆍ사업소/읍면동</option>
				<option value="https://www.yangju.go.kr/health/index.do">보건소</option>
			    <option value="https://www.yangju.go.kr/atc/index.do">농업기술센터</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=616">도시환경사업소</option>
			    <option value="https://www.libyj.go.kr/intro/index.do">양주시 도서관</option>
			    <option value="https://www.yangju.go.kr/lll/index.do">평생학습관</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=391">백석읍</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=395">은현면</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=399">남면</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=403">광적면</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=407">장흥면</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=411">양주1동</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=415">양주2동</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=419">회천1동</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=423">회천2동</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=427">회천3동</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=431">옥정1동</option>
			    <option value="https://www.yangju.go.kr/www/contents.do?key=4039">옥정2동</option>
			</select>
			<select class="linkSelect">
				<option>유관기관</option>
				<option value="https://www.yangju.go.kr/www/index.do">양주시청</option>
			    <option value="http://uijeongbu.scourt.go.kr/">의정부지방법원</option>
			    <option value="http://www.spo.go.kr/uijeongbu/">의정부지방검찰청</option>
			    <option value="http://www.ggpolice.go.kr/yangju/">양주경찰서</option>
			    <option value="https://119.gg.go.kr/yangju/">양주소방서</option>
			    <option value="http://www.immigration.go.kr/immigration/1658/subview.do">양주출입국·외국인사무소</option>
			    <option value="https://www.yjuc.or.kr/main/index.asp">양주도시공사</option>
			    <option value="https://in.nts.go.kr/uijeongbu/main.do">의정부 세무서</option>
			    <option value="http://gg.nec.go.kr/gg/ggyangju/sub1.jsp">양주시 선거관리위원회</option>
			    <option value="http://www.yjsports.kr">양주시 체육회</option>
			    <option value="https://www.nts.go.kr/nts/main.do">국세청</option>
			    <option value="http://www.gncci.or.kr/">경기북부상공회의소</option>
			    <option value="https://www.goedy.kr/goedy/main.do">경기도동두천양주교육지원청</option>
			    <option value="https://www.goese.kr/">경기도교육청 안전교육관</option>
			    <option value="http://www.yjdream.kr">양주시 희망장학재단</option>
			    <option value="http://baekseok.nonghyup.com/user/indexMain.do?siteId=baekseok">백석농협</option>
			    <option value="http://eh.nonghyup.com/user/indexMain.do?siteId=eh">은현농협</option>
			    <option value="http://gwangjeok.nonghyup.com/">광적농협</option>
			    <option value="http://jangheung.nonghyup.com/">장흥농협</option>
			    <option value="http://hoecheon.nonghyup.com/">회천농협</option>
			    <option value="http://www.seojeong.ac.kr/">서정대학교</option>
			    <option value="https://kduniv.ac.kr/kor/Main.do">경동대학교</option>
			    <option value="http://www.yewon.ac.kr/">예원예술대학교</option>
			    <option value="https://goe-aha.goedy.kr/goe-aha/main.do">경기도교육청 북부유아체험교육원</option>
			</select>
			<select class="linkSelect">
				<option>타시군</option>
				<option value="http://www.gg.go.kr/">경기도청</option>
			    <option value="http://www.suwon.go.kr/">수원시</option>
			    <option value="http://www.seongnam.go.kr/">성남시</option>
			    <option value="http://www.goyang.go.kr/">고양시</option>
			    <option value="http://www.bucheon.go.kr/">부천시</option>
			    <option value="http://www.anyang.go.kr/">안양시</option>
			    <option value="http://www.ansan.go.kr/">안산시</option>
			    <option value="http://www.yongin.go.kr/">용인시</option>
			    <option value="http://www.ui4u.go.kr/">의정부시</option>
			    <option value="http://www.nyj.go.kr/">남양주시</option>
			    <option value="http://www.pyeongtaek.go.kr/">평택시</option>
			    <option value="http://www.gm.go.kr/">광명시</option>
			    <option value="http://www.siheung.go.kr/">시흥시</option>
			    <option value="http://www.gunpo.go.kr/">군포시</option>
			    <option value="http://www.gjcity.go.kr/">광주시</option>
			    <option value="http://www.hscity.go.kr">화성시</option>
			    <option value="http://www.paju.go.kr/">파주시</option>
			    <option value="http://www.icheon.go.kr/">이천시</option>
			    <option value="http://www.guri.go.kr">구리시</option>
			    <option value="http://www.gimpo.go.kr/">김포시</option>
			    <option value="http://www.ddc.go.kr/">동두천시</option>
			    <option value="http://www.pocheon.go.kr/">포천시</option>
			    <option value="http://www.anseong.go.kr/">안성시</option>
			    <option value="http://www.hanam.go.kr/">하남시</option>
			    <option value="http://www.uiwang.go.kr/">의왕시</option>
			    <option value="http://www.osan.go.kr/">오산시</option>
			    <option value="http://www.gccity.go.kr/">과천시</option>
			    <option value="http://www.yeoju.go.kr/">여주시</option>
			    <option value="http://www.yp21.go.kr/">양평군</option>
			    <option value="http://www.gp.go.kr/">가평군</option>
			    <option value="http://www.yeoncheon.go.kr/">연천군</option>
			</select>
			<select class="linkSelect">
				<option>기타홈페이지</option>
				<option value="https://www.yangju.go.kr/edu/index.do">혁신교육지구 원클릭</option>
			    <option value="http://www.libyj.go.kr">도서관</option>
			    <option value="https://www.yangju.go.kr//lll/index.do">평생학습관</option>
			    <option value="https://www.yangju.go.kr//tour/index.do">문화관광</option>
			    <option value="https://www.yangju.go.kr//changucchin/index.do">장욱진미술관</option>
			    <option value="https://www.yangju.go.kr//museum/index.do">회암사지박물관</option>
			    <option value="https://www.yangju.go.kr//minbokjin/index.do">양주시립민복진미술관</option>
			    <option value="https://www.yangju.go.kr//photo/index.do">사진DB서비스</option>
			    <option value="https://www.yangju.go.kr//orchestra/index.do">양주시립예술단</option>
			    <option value="https://www.yangju.go.kr//secenter/index.do">사회적경제지원센터</option>
			    <option value="http://www.yjscic.or.kr">육아종합지원센터</option>
			    <option value="https://www.ccfsm.foodnara.go.kr/yangju/">어린이급식관리지원센터</option>
			    <option value="http://smartbokji.com">옥정종합사회복지관</option>
			    <option value="https://www.yangju.go.kr//vision/index.do">양주시여성일생활균형지원센터</option>
			    <option value="https://www.yangju.go.kr//yj1318/index.do">청소년상담복지센터</option>
			    <option value="https://www.yangju.go.kr//yjyouth1318/index.do">청소년문화의집</option>
			    <option value="https://www.yangju.go.kr//ytc/index.do">청소년수련원</option>
			    <option value="https://www.yangju.go.kr//yangjucare/index.do">무한돌봄센터</option>
			    <option value="http://www.yjwel.or.kr/">장애인종합복지관</option>
			    <option value="http://www.yjgreenmind.com/">양주시 정신건강복지센터</option>
			    <option value="https://www.yangju.go.kr/car/index.gs">주정차위반</option>
			    <option value="http://www.yjv1365.or.kr">자원봉사센터</option>
			    <option value="http://rtms.yangju.go.kr">부동산거래관리시스템</option>
			    <option value="http://water-pos.kwater.or.kr/index.jsp">수도서비스포털</option>
			    <option value="https://www.yangju.go.kr//yjcareer/index.do">진로진학교육플랫폼</option>
			</select>
		</div>
	</div>
	
<div class="up_arrow">
	<a href="#">
		<img src="${contextRoot}/assets/css/usr/img/up.png">
	</a>
</div>

<!--   푸터 -->
  <footer class="footer flex">
   	<img src="${contextRoot}/assets/css/usr/img/logo_footer.png">
   	<div>
   		<ul class="flex">
			<li><a href="https://www.yangju.go.kr/www/contents.do?key=743">개인정보처리방침</a></li>
			<li><a href="https://www.yangju.go.kr/www/contents.do?key=757">저작권정책</a></li>
			<li><a href="#">이용약관</a></li>
   		</ul>
   		<p>
   			[11498] 경기도 양주시 부흥로 1533(남방동)<br>
   			대표전화 031-8082-6202 FAX 0505-041-2159
   		</p>
    	<p>COPYRIGHT © 2025 YANGJU CITY. ALL RIGHTS RESERVED</p>
    </div>
  </footer>
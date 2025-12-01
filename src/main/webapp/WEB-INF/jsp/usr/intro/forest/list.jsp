<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
  
 <script type="text/javascript">
var pageSize = '${pageSize}'; //페이지당 그리드에 조회 할 Row 갯수;
var totalCount = '${totalCount}'; //전체 데이터 갯수
var pageIndex = '${pageIndex}'; //현재 페이지 정보

$(document).ready(function() {
	if ('' == pageSize) {
		pageSize = 10;
	}
	if ('' == totalCount) {
		totalCount = 0;
	}
	if ('' == pageIndex) {
		pageIndex = 1;
	}
	
	$(".forest-1").hide();

  $(".nav-btn li").on("click", function(e) {
    e.preventDefault();

    $(".nav-btn li").removeClass("on");
    $(this).addClass("on");

    var target = $(this).find("a").attr("id");
    if( $(this).find("a").attr("id") == "forest-0" ) {
    	$(".forest-0").show();
    	$(".forest-1").hide();
    } else {
    	$(".forest-0").hide();
    	$(".forest-1").show();
    }
  });
		
});
</script>
  
	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>산림교육 프로그램 소개</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">프로그램 소개</a></li>
				<li><a href="<c:url value="/usr/intro/${pgType}/list.do"/>">산림교육</a></li>
			</ul>
		</div>
	</section>

    <!-- <section class="sub-section program program-sub">
		<div class="preparing">
	   	 	<div class="section">
	   	 		<img src="/forest/assets/css/usr/img/logo_footer.png">
				<h2></h2>
			</div>
			<h3>페이지 준비중입니다.</h3>
			<p>빠른시일내에 준비하여 찾아뵙겠습니다.</p>
		</div>
    </section> -->
    
    <section class="nav-btn">
		<div class="nav-btn-inner">
			<ul>
				<li class="on"><a href="javascript:;" id="forest-0">유아숲체험</a></li>
				<li><a href="javascript:;" id="forest-1">숲해설</a></li>
			</ul>
		</div>
	</section>
    
    <section class="sub-section program program-sub forest-0">
    	<div class="info-main-title section flex">
			<h2>유아숲체험 프로그램 소개</h2>
		</div>
		<div class="program-title-list section">
			<a href="#program-title-list-1"><span>1</span>유아숲교육 정기형(관내기관,단체) 프로그램</a>
			<a href="#program-title-list-2"><span>2</span>유아숲교육 비정기형(관내기관,단체) 프로그램</a>
			<a href="#program-title-list-3"><span>3</span>유아숲 비정기형(양주시민 개인) 프로그램(시범사업)</a>
		</div>

		<div class="program-info-list section" id="program-title-list-1">
			<h2>1.정기형(관내기관,단체)프로그램</h2>
			<div class="program-info-con flex center">
				<h3>모집방법</h3>
				<div>
					<p>사업 초기에 신청접수 후 추첨방식(3월~11월 매월1회9번 수업)</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>수업내용</h3>
				<div>
					<p>매월 계절에 맞는 주제로 해당 유아숲체험원 내에서 숲체험 진행.</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>유아숲체험원</h3>
				<div>
					<p>(도토리/하늘물/독바위/회암사지 유아숲체험원–4개소)</p>
				</div>
			</div>
		</div>
		
		<div class="program-info-list section" id="program-title-list-2">
			<h2>2.비정기형(관내기관,단체)프로그램–수시형</h2>
			<div class="program-info-con flex center">
				<h3>모집방법</h3>
				<div>
					<p>사업 초기에 신청접수 후 추첨방식</p>
				</div>
			</div>
			<div class="program-info-con program-info-table">
				<h3 class="table-title">개별 프로그램</h3>
				<div class="table-pc">
					<table class="table-0 table-program-info">
						<thead>
							<tr>
								<th>프로그램명</th>
								<th>모집대상</th>
								<th>참여가능 기관수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>자담숲</td>
								<td class="item-col-2">어린이(개인)팀별 신청</td>
								<td>4개팀<span>(10명/팀)</span></td>
							</tr>
							<tr>
								<td>깨담숲<span>(찾아가는 숲학교)</span></td>
								<td class="item-col-2">
									-초등학교 돌봄교실<br>
									-지역아동센터
								</td>
								<td>16개 기관</td>
							</tr>
							<tr>
								<td>소담숲<span>(교사프로그램)</span></td>
								<td class="item-col-2">
									어린이집 및 유치원 교사<br>
									기관교사
								</td>
								<td>4개 팀<span>(10명~20명)</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="program-info-list section" id="program-title-list-3">
			<h2>3.비정기형(양주시민 개인)프로그램–시범사업</h2>
			<div class="program-info-con flex center">
				<h3>모집방법</h3>
				<div>
					<p>신청 접수 후 개별 공지(SNS홍보 접수)</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>프로그램</h3>
				<div>
					<p>가족숲체험 프로그램(5월,6월, 9월, 10월 세 번째 토요일)</p>
					<p>(홍죽/오산산들/산마루 유아숲체험원- 3개소)</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>대상</h3>
				<div>
					<p>4세~초등 저학년 아동과 보호자1인</p>
				</div>
			</div>	
		</div>
    </section>
    
    <section class="sub-section program program-sub forest-1">
    	<div class="info-main-title section flex active">
			<h2>숲해설 프로그램 소개</h2>
		</div>
		<div class="program-title-list section active">
			<a href="#program-title-list-4"><span>1</span>숲해설 정기형(관내기관,단체,개인)프로그램</a>
			<a href="#program-title-list-6"><span>2</span>숲해설 비정기형(관내기관,단체,개인)프로그램</a>
		</div>
		<!-- 숲해설 -->
		<div class="program-info-list section active" id="program-title-list-4">
		  <h2>1.정기형(관내기관,단체,개인)프로그램</h2>
		  
		  <div class="program-info-table">
				<div class="table-pc-2">
					<table class="table-0 table-program-info">
						<thead>
							<tr>
							    <th>유형</th>
							    <th>구분<br>(프로그램명)</th>
							    <th>참여대상/내용</th>
							    <th>참여가능<br>기관수</th>
							    <th>비고</th>
							  </tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="2">정기형</td>
							  <td>달콤상콤 맛숲</td>
							  <td class="item-col-2">
							    - 초등학교 (매월 1회)<br>
							    - 초등생 프로그램<br>
							    - 교과과정 연계
							  </td>
							  <td rowspan="2">10개 학교<br>(일부학년)</td>
							  <td rowspan="2">신청접수 후<br>추첨방식</td>
							</tr>
							<tr>
							  <td>꿈담 숲</td>
							  <td class="item-col-2">
							    - 고등학교 (매월 1회)<br>
							    - 자유학기제 진로체험<br>
							    - 진로탐색 인성함양
							  </td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table-mo">
					<table class="table-0 table-program-info">
						<tr>
							<th>유형</th>
							<th>정기형</th>
						</tr>
						<tr>
							<th>구분<br>(프로그램명)</th>
							<td>달콤상콤 맛숲</td>
						</tr>
						<tr>
							<th>참여대상/내용</th>
							<td class="item-col-2">
								- 초등학교 (매월 1회)<br>
								- 초등생 프로그램<br>
								- 교과과정 연계<br>
							</td>
						</tr>
						<tr>
							<th>구분<br>(프로그램명)</th>
							<td>꿈담 숲</td>
						</tr>
						<tr>
							<th>참여대상/내용</th>
							<td class="item-col-2">
								- 고등학교 (매월 1회)<br>
								- 자유학기제 진로체험<br>
								- 진로탐색 인성함양
							</td>
						</tr>
						<tr>
							<th>참여가능<br>기관수</th>
							<td>
								10개 학교<br>
								(일부학년)
							</td>
						</tr>
					</table>
					<div class="program-info-table-bottom flex center">
						<h3>비고</h3>
						<div>
							<p>신청접수 후 추첨방식</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="program-info-list section" id="program-title-list-6">
		  <h2>2.비정기형(관내기관,단체,개인)프로그램</h2>
		  
		  <div class="program-info-table">
				<div class="table-pc-2">
					<table class="table-0 table-program-info">
						<thead>
							<tr>
							    <th>유형</th>
							    <th>구분<br>(프로그램명)</th>
							    <th>참여대상/내용</th>
							    <th>참여가능<br>기관수</th>
							    <th>비고</th>
							  </tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3">비정기형</td>
							    <td>마이라이프 힐링</td>
							    <td class="item-col-2">
							      - 단체, 기관, 기업, 사회복지시설, 동호회, 일반성인 등<br>
							      - 숲해설 프로그램
							    </td>
							    <td>4개 학교<br>(한 학년)</td>
							    <td rowspan="3">신청접수 후<br>추첨방식</td>
							  </tr>
							  <tr>
							    <td>소담 숲<br>(교사프로그램)</td>
							    <td class="item-col-2">
							      - 어린이집 및 유치원교사, 초중고 교사<br>
							      - 스트레스 해소를 위한 산림치유프로그램
							    </td>
							    <td>수시형</td>
							  </tr>
							  <tr>
							    
							    <td>거꾸로 가는 숲<br>(항노화프로그램)</td>
							    <td class="item-col-2">
							      - 주간보호센터, 사회복지시설 기관<br>
							      - 어르신, 노약자, 산림치유 프로그램
							    </td>
							    <td>8개 팀<br>(10명~20명)</td>
							  </tr>
						</tbody>
					</table>
				</div>
				<div class="table-mo">
					<table class="table-0 table-program-info">
						<tr>
							<th>유형</th>
							<td>정기형</td>
						</tr>
						<tr>
							<th>구분<br>(프로그램명)</th>
							<td>마이라이프 힐링</td>
						</tr>
						<tr>
							<th>참여대상/내용</th>
							<td class="item-col-2">
								- 단체, 기관, 기업, 사회복지시설, 동호회, 일반성인 등<br>
								- 숲해설 프로그램
							</td>
						</tr>
						<tr>
							<th>참여가능<br>기관수</th>
							<td>4개 학교<br>(한 학년)</td>
						</tr>
						<tr>
							<th>구분<br>(프로그램명)</th>
							<td>소담 숲<br>(교사프로그램)</td>    
						</tr>
						<tr>
							<th>참여대상/내용</th>
							<td class="item-col-2">
						      - 어린이집 및 유치원교사, 초중고 교사<br>
						      - 스트레스 해소를 위한 산림치유프로그램
						    </td>
						</tr>
						<tr>
							<th>참여가능<br>기관수</th>
							<td>수시형</td>
						</tr>
						<tr>
							<th>구분<br>(프로그램명)</th>
							<td>거꾸로 가는 숲<br>(항노화프로그램)</td>
						</tr>
						<tr>
							<th>참여대상/내용</th>
							<td class="item-col-2">
								- 주간보호센터, 사회복지시설 기관<br>
								- 어르신, 노약자, 산림치유 프로그램
							</td>
						</tr>
						<tr>
							<th>참여가능<br>기관수</th>
							<td>8개 팀<br>(10명~20명)</td>
						</tr>
					</table>
					<div class="program-info-table-bottom flex center">
						<h3>비고</h3>
						<div>
							<p>신청접수 후 추첨방식</p>
						</div>
					</div>
				</div>
			</div>
		</div>	
    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
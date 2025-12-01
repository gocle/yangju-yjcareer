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
});
</script>
  
	<!-- 서브 배너 -->
	<section class="sub-banner">
		<div class="sub-banner-text">
			<h1>목공체험 프로그램 소개</h1>
		</div>
	</section>

	<section class="breadcrumb">
		<div class="hero-inner">
			<ul>
				<li><a href="<c:url value="/usr/main.do"/>">홈</a></li>
				<li><a href="#">프로그램 소개</a></li>
				<li><a href="<c:url value="/usr/intro/${pgType}/list.do"/>">목공체험</a></li>
			</ul>
		</div>
	</section>

    <section class="sub-section program program-sub">
    	<div class="info-main-title section flex">
			<h2>목공체험 프로그램 소개</h2>
		</div>
		<div class="program-title-list section">
			<a href="#program-title-list-1"><span>1</span>일일체험(원데이 클래스)</a>
			<a href="#program-title-list-2"><span>2</span>성인반(DIY)</a>
			<a href="#program-title-list-3"><span>3</span>유치원 체험</a>
			<a href="#program-title-list-4"><span>4</span>찾아가는 목공학교</a>
			<a href="#program-title-list-5"><span>5</span>특화 프로그램</a>
		</div>
		
		<div class="program-info-list section" id="program-title-list-1">
			<h2>1. 일일체험(원데이 클래스)</h2>
			<div class="program-info-con flex center">
				<h3>접수시 유의사항</h3>
				<div>
					<p>- 1회 체험시 연령에 따라 여러가지 품목으로 신청하면 체험이 불가합니다.
						<span class="light">(품목당 1강사가 체험지도를 하기때문에 여러품목을 지도하기 어렵습니다)</span>
					</p>
					<p>- 아이와 부모님이 함께 체험에 참여하시면 모든품목 체험이 가능합니다.
						<span class="light">(품목당 1강사가 체험지도를 하기때문에 여러품목을 지도하기 어렵습니다)</span>
					</p>
					<p>- 예약일자 중복 시 체험품목이 같으면 인원에 따라 추가 예약이 가능합니다.</p>
					<p>예약 신청은 최소 3일 전에 하셔야 합니다.
						<span class="light">(당일 예약 불가)</span>
					</p>
					<p>- 선정 후 체험프로그램 완료 후 해당 계좌로 체험료를 송금 또는 현장결제가 가능합니다.
						<span>(체험료 송금은 체험전 7일 이내에 입금해주세요)</span>
						<span>입금계좌 : 농협 301-0201-2126-01 양주시</span>
					</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>운영시간</h3>
				<div>
					<p>1일 4회(10:00~10:40 / 14:00~14:40 / 15:00~15:40 / 16:00~16:40)
						<span class="light">유치원 단체와 중복시 유치원 단체 체험 우선</span>
					</p>
					<p>- 수업시간은 60분 내외 진행</p>
					<p>- 체험 최소인원 미달 또는 인원 초과 시 일정이 조율될 수 있습니다.</p>
				</div>
			</div>
		</div>
		
		<div class="program-info-list section" id="program-title-list-2">
			<h2>2. 성인반(DIY)</h2>
			<div class="program-info-con flex center">
				<h3>개요</h3>
				<div>
					<p>- 일일 체험에서 다룰 수 없는 품목을 2회~10회차 진행하는 프로그램</p>
					<p>- 실생활에서 활용할 수 있는 가구의 구조와 철물을 사용할 수 있도록 프로그램  구성</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>운영기간</h3>
				<div>
					<p>3월~11월</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>모집</h3>
				<div>
					<p>- 6명~10명(3명 미만 폐강)</p>
					<p>- 홈페이지 팝업창을 통해 접수하며 선착순 마감</p>
				</div>
			</div>
			<div class="program-info-con program-info-table">
				<h3 class="table-title">수업내용</h3>
				<div>
					<table class="table-0 table-program-info">
						<thead>
							<tr>
								<th>구분</th>
								<th>항목</th>
								<th>교육내용</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="7">기초편</td>
								<td rowspan="2" class="item-col">수공구(톱, 끌, 망치)</td>
								<td>수공구 안전 사용법</td>
							</tr>
							<tr>
								<td>수공구 사용법 숙지</td>
							</tr>
							<tr>
								<td rowspan="4" class="item-col">전동공구</td>
								<td>드릴의 기능 및 안전 사용법</td>
							</tr>
							<tr>
								<td>임팩드릴의 기능 및 안전 사용법</td>
							</tr>
							<tr>
								<td>트리머 공구의 안전 사용법</td>
							</tr>
							<tr>
								<td>원형샌딩기의 안전 사용법</td>
							</tr>
							<tr>
								<td class="item-col">클램프 / 바이스</td>
								<td>클램프, 바이스의 용도와 사용법</td>
							</tr>
							<tr>
								<td rowspan="6">실용편</td>
								<td rowspan="2" class="item-col">이중기리, 나사</td>
								<td>이중기리의 사용법</td>
							</tr>
							<tr>
								<td>나사의 선택요령</td>
							</tr>
							<tr>
								<td class="item-col">3단 레일</td>
								<td>3단레일 설치 및 교환방법</td>
							</tr>
							<tr>
								<td rowspan="3" class="item-col">싱크경첩</td>
								<td>싱크경첩 종류 및 구분</td>
							</tr>
							<tr>
								<td>싱크경첩 설치와 교환방법</td>
							</tr>
							<tr>
								<td>기타 가구철물 사용법</td>
							</tr>
							<tr>
								<td>마감</td>
								<td class="item-col">샌딩 / 오일 / 바니시</td>
								<td>나무의 샌딩방법과 마감법 익힘</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="program-info-table-bottom flex center">
				<h3>기타</h3>
				<div>
					<p>2~3품목을 이수시 희망자에 한해 3급자격증 발급 가능(자격증 비용 개인부담)</p>
				</div>
			</div>
		</div>
		
		<div class="program-info-list section" id="program-title-list-3">
			<h2>3. 유치원 체험</h2>
			<div class="program-info-con flex center">
				<h3>운영기간</h3>
				<div>
					<p>3월~11월(8월은 학교 방학기간으로 유치원 체험 중단합니다.)</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>운영일시</h3>
				<div>
					<p>- 화, 수, 목, 금 (일요일, 월요일, 공휴일 휴무)</p>
					<p>
						<span>1부 : 10:00~10:30</span>
						<span>2부 : 10:50~11:20</span>
						<span>3부 : 13:30~14:00</span>
					</p>
				</div>
			</div>
			<div class="program-info-con flex center">
				<h3>세부사항</h3>
				<div>
					<p>ㄱ. 유치원별로 체험은 월 3회로 제한합니다.</p>
					<p>ㄴ. 체험장 이용 인원은 30명 이내로 제한합니다.</p>
					<p>ㄷ. 체험 연령은 5세부터 신청가능 (공구 안전교육 불능으로 유아는 체험 불가)</p>
					<p>ㄹ. 결제
						<span>- 결제는 당일 인원체크 후 카드 또는 계좌이체(세금계산서 발행) 가능</span>
						<span>- 클린카드는 결제불가(계좌이체 후 세금계산서 발행)</span>
					</p>
				</div>
			</div>
			<div class="program-info-con flex center check_info">
				<h3>유의사항</h3>
				<div>
					<p>신청시 원활한 프로그램 진행을 위하여 체험 품목은 1가지로 제한합니다. </p>
					<p>예약 신청은 최소 5일 전에 하여야 함(재료 준비시간 필요)</p>
					<p>체험품목 연령대 확인 부탁드립니다.(초등학생 품목 체험불가)</p>
					<p>일일체험 동시 수용인원 최대 30명까지 가능</p>
				</div>
			</div>			
		</div>
		
		<div class="program-info-list section" id="program-title-list-4">
		  <h2>4. 찾아가는 목공학교</h2>
		  
		  <div class="program-info-con flex center">
		    <h3>참여대상</h3>
		    <div>
		      <p>- 양주시 관내 초등학교</p>
		    </div>
		  </div>
		  
		  <div class="program-info-con flex center">
		    <h3>운영기간</h3>
		    <div>
		      <p>- 4월~11월 (8월은 학교 방학기간으로 운영중지)</p>
		    </div>
		  </div>
		  
		  <div class="program-info-con flex center">
		    <h3>운영일시</h3>
		    <div>
		      <p>- 화, 수, 목, 금 (일요일, 월요일, 공휴일 휴무) 오전</p>
		      <p>- 1일 2회 수업, 시간은 60분 내외로 진행</p>
		      <p>- 단, 저학년의 경우 난이도가 낮은 제품일 경우 1일 3회 가능</p>
		    </div>
		  </div>
		  
		  <div class="program-info-con flex center">
		    <h3>장소</h3>
		    <div>
		      <p>- 신청학교 내 목공실 또는 전담교실 (화물 운반이 편리한 곳)</p>
		    </div>
		  </div>
		  
		  <div class="program-info-con flex center">
		    <h3>신청 / 접수</h3>
		    <div>
		      <p>- 신청기간(2월~3월) 내 현장접수 및 온라인 접수</p>
		      <p>- 신청기간 내 접수학교가 적을 시 선착순 마감, 초과 시 추첨을 통해 결과 통보</p>
		    </div>
		  </div>
		  
		  <div class="program-info-con flex center">
		    <h3>기타</h3>
		    <div>
		      <p>- 첨부 #1 찾아가는 목공학교 신청서 및 시간 운영표</p>
		    </div>
		  </div>
		  
		  <div class="program-info-con flex center check_info">
		    <h3>유의사항</h3>
		    <div>
		      <p>신청 시 원활한 프로그램 진행을 위하여 체험 품목은 1가지로 제한합니다.</p>
		      <p>신청학교 내 전담교실 또는 목공실이 있어야 함 (교실 수업 불가)</p>
		      <p>체험기간이 길어 체험 부자재와 체험키트 적재 공간이 필요함</p>
		    </div>
		  </div>
		</div>		
				
		<div class="program-info-list section" id="program-title-list-5">
		  <h2>5. 특화 프로그램</h2>
		  
		  <div class="program-info-con-5">
			  <!-- 방학내 특별기획 -->
			  <div class="program-info-con flex center">
			    <h3>방학내 특별기획</h3>
			    <div>
			      <p>- 품목 : 기획품목이므로 매해 다름</p>
			      <p>- 장소 : 양주 숲 복지센터(양주 목재문화체험장) - 새터로 92(옥정동)</p>
			      <p>- 대상 : 5세~초등학생 (보호자 1인 동반 가능)</p>
			      <p>- 신청/마감 : 홈페이지 팝업창을 통해 접수하며 선착순 마감</p>
			      <p>- 문의 : 031-821-7351</p>
			    </div>
			  </div>
			  
			  <!-- 주말 특화프로그램 -->
			  <div class="program-info-con flex center">
			    <h3>주말 특화프로그램</h3>
			    <div>
			      <p>- 품목 : 신제품 또는 기획품</p>
			      <p>- 장소 : 양주 숲 복지센터(양주 목재문화체험장) - 새터로 92(옥정동)</p>
			      <p>- 대상 : 품목에 따라 다름 (난이도가 높은 품목일 경우 보호자 동반 시 체험 가능)</p>
			      <p>- 신청/마감 : 홈페이지 팝업창을 통해 접수하며 선착순 마감</p>
			      <p>- 문의 : 031-821-7351</p>
			    </div>
			  </div>
			</div>
		</div>

    </section>

	<c:import url="/usr/layout/footer.do" />
	
</body>
</html>
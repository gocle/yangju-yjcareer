<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
	<meta name="keywords" content="양주진로진학교육플랫폼" />
	<meta name="description" content="양주시 양주진로진학교육플랫폼 홈페이지에 오신것을 환영합니다." />
	<link rel="stylesheet" type="text/css" href="/yjcareer/assets/site/yjcareer/css/font.css" />
	<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/main.css">
	<script src="/yjcareer/assets/site/yjcareer/js/jquery-1.12.4.min.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/plugins.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/common.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/main.js"></script>
	<title>양주진로진학교육플랫폼</title>
</head>

<body id="yjcareer">
	<script type="text/JavaScript">
		document.addEventListener("DOMContentLoaded", () => {

			/* ========= 메인 프로그램 탭 ========= */
			const tab1 = document.querySelector(".tab1");
			const tab2 = document.querySelector(".tab2");
			const tabBtn1 = document.getElementById("tabmenu1");
			const tabBtn2 = document.getElementById("tabmenu2");

			const label1 = document.querySelector("label[for='tabmenu1']");
			const label2 = document.querySelector("label[for='tabmenu2']");

			function updateMainTab() {
				if (tabBtn1.checked) {
					tab1.classList.add("active");
					tab2.classList.remove("active");
					label1.classList.add("active");
					label2.classList.remove("active");
				} else {
					tab1.classList.remove("active");
					tab2.classList.add("active");
					label1.classList.remove("active");
					label2.classList.add("active");
				}
			}

			updateMainTab();
			tabBtn1.addEventListener("change", updateMainTab);
			tabBtn2.addEventListener("change", updateMainTab);


			/* ========= 공지사항 / 자료실 탭 ========= */
			const noticeCon1 = document.querySelector(".notice_contents");
			const noticeCon2 = document.querySelector(".data_contents");

			const noticeBtn1 = document.getElementById("notice_tab1");
			const noticeBtn2 = document.getElementById("notice_tab2");

			const label3 = document.querySelector("label[for='notice_tab1']");
			const label4 = document.querySelector("label[for='notice_tab2']");

			function updateNoticeTab() {
				if (noticeBtn1.checked) {
					noticeCon1.style.display = "block";
					noticeCon2.style.display = "none";

					label3.classList.add("active");
					label4.classList.remove("active");
				} else {
					noticeCon1.style.display = "none";
					noticeCon2.style.display = "block";

					label3.classList.remove("active");
					label4.classList.add("active");
				}
			}

			updateNoticeTab();
			noticeBtn1.addEventListener("change", updateNoticeTab);
			noticeBtn2.addEventListener("change", updateNoticeTab);
			
			$(document).on('click', 'label[for^="counsel_"]', function () {
			  const id = $(this).attr('for');
				const $slider = $('.counsel_list'); 

			  if (id === 'counsel_all') {
				$('.counsel_item').show();
			  } else {
				const typeNum = id.split('_')[1];
				
				$('.counsel_item').hide();
				$('.counsel_item.type_' + typeNum).show();
			  }
				
				$slider.slick('slickGoTo', 0);

			});
			
			$(document).on('click', 'label[for^="program_"]', function () {
				const id = $(this).attr('for');
				const $slider = $('.program_list');

				if (id === 'program_all') {
				  $('.program_item').show();
				} else {
				  const typeNum = id.split('_')[1];
				  $('.program_item').hide();
				  $('.program_item.p_type_' + typeNum).show();
				}
				
				$slider.slick('slickGoTo', 0);

			  });


		});
		
				
		function reInitSlick($slider, initFn) {
		  if ($slider.hasClass('slick-initialized')) {
			$slider.slick('unslick');
		  }
		  initFn();

		}

	</script>

	<script type="text/JavaScript">
		//<![CDATA[
	function setCookie( name, value, expiredays ) {
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
//]]>

</script>
	<!-- 레이어 팝업 시작 -->
	<div id="divpopup1" class="main_popup" style="position:absolute; left:10rem; top:10rem; z-index:1001; visibility:visible;  width:500px; height:560px">
		<div class="layer_cont">
			<a href="/yjcareer/selectEduLctreWebList_4130" target="_blank" title="새창"><img src="/yjcareer/assets/DATA/popup/20251125030444599mSjjuX.jpg" style="width:500px; height:560px;" alt="설명회" /></a>
		</div>

		<form name="notice_form1">
			<div class="layer_put">
				<div>
					<input type="checkbox" name="chkbox1" id="chkbox1" value="checkbox" />
					<label for="chkbox1">오늘하루동안보지않기</label>
				</div>
				<div class="pop-btn"><a href="javascript:closeWind1();">닫기</a></div>
			</div>
		</form>
	</div>
	<script type="text/JavaScript">
		//<![CDATA[
				function closeWind1() {
					if ( document.notice_form1.chkbox1.checked ){
						setCookie( "maindiv1", "done" , 1 );
					}
					document.all['divpopup1'].style.visibility = "hidden";
				}
	
				cookiedata = document.cookie;
				if ( cookiedata.indexOf("maindiv1=done") < 0 ){
					document.all['divpopup1'].style.visibility = "visible";
				}
				else {
					document.all['divpopup1'].style.visibility = "hidden";
				}
			//]]>
			</script>
	<!-- 레이어 팝업 종료 -->

  <c:import url="/usr/menu/header.do" />

			<div id="container">
			<main>

				<div class="rowgroup visual-wrap">
					<div class="wrap">
						<section class="visual">
							<h2 class="skip">비주얼 영역</h2>
							<div class="visual-left">
								<p class="visual_title">
									<span class="sub_title">
										<span class="n01">양주시 진로진학교육플랫폼</span>
									</span>
									<span class="n02">
										<span>미래로 도약하는</span>
									</span>
									<span class="n03">
										<span>양주 청소년진로진학</span>
									</span>
								</p>
								<div class="visual_more">
									<a href="/yjcareer/contents_4125" class="visual_more_btn">주요사업 보러가기</a>
								</div>
							</div>
							<div class="visual-right">
								<div class="visual-btn">
									<span class="tit">1:1 맞춤형 상담(상시상담)</span>
									<div class="btn-wrap">
										<a href="/yjcareer/usr/reservation/consulting/addCalendarView.do"><span>예약 및 조회</span></a>
									</div>
								</div>
								<div class="visual-btn">
									<span class="tit">꿈자람센터 AI디지털교실</span>
									<div class="btn-wrap">
										<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do"><span>예약 및 조회</span></a>
									</div>
								</div>
								<div class="visual-btn">
									<span class="tit">꿈자람센터 거점돌봄교실</span>
									<div class="btn-wrap">
										<a href="/yjcareer/usr/reservation/program/eduLctreNewList.do"><span>예약 및 조회</span></a>
									</div>
								</div>
								<div class="bottom">
									<div class="visual-btn">
										<span class="tit">양주진로진학지원센터</span>
										<img src="/yjcareer/assets/site/yjcareer/images/main/sideBar_6.png"/>
										<a href="#" class="btn" target="_blank" title="새창열림"><span>센터안내</span></a>
									</div>
									<div class="visual-btn">
										<span class="tit">꿈자람센터</span>
										<img src="/yjcareer/assets/site/yjcareer/images/main/sideBar_6.png"/>
										<a href="#" class="btn" target="_blank" title="새창열림"><span>센터안내</span></a>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				
				<div class="rowgroup3">                
                   <div class="wrap">
						<section class="program">
							<h2 class="program_top_title">
								<span class="title">신청하기</span>
								<div class="tabmenu">
									<input type="radio" checked name="tabmenu" id="tabmenu1">
									<label for="tabmenu1">1:1 상시상담</label>
									<input type="radio" name="tabmenu" id="tabmenu2">
									<label for="tabmenu2">꿈자람센터 프로그램</label>
								</div>
								<div class="program_more">
									<a href="#" class="program_more_btn"><span>더보기</span></a>
								</div>
							</h2>
							
							<div class="program-area">

								<div class="tab_contents">

									<!--tab1-->
									<div class="tab1">
										<div class="tabCon1">
											<div class="program-control">
												<div class="radio-group">
													<input type="radio" id="counsel_all" name="counsel" checked>
													<label for="counsel_all">전체</label>

													<input type="radio" id="counsel_AA" name="counsel">
													<label for="counsel_AA">맞춤컨설팅</label>

													<input type="radio" id="counsel_AB" name="counsel">
													<label for="counsel_AB">학습심리상담</label>

													<input type="radio" id="counsel_AC" name="counsel">
													<label for="counsel_AC">수시·정시상담</label>

													<input type="radio" id="counsel_AD" name="counsel">
													<label for="counsel_AD">면접컨설팅</label>
												</div>
											</div>
											
											<div class="program-item-area">
											
											<div class="counsel_control">
												<button class="counsel_prev">이전</button>
											</div>
											
											<div class="counsel_list slider-list">
												<!-- <div class="counsel_item item type_1">
													<a href="#" class="program_anchor">
														<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/1.png" /></div>
														<div class="item_txt">
															<p class="staus ing">접수진행중</p>
															<p class="program_title">[Jump Up 2025 : 양주 진로진학 ON!] 1대1 맞춤형 진로진학컨설팅 2차 상담기간 운영 안내</p>
															<p class="program_date">
																<span>접수기간</span>25.11.20~25.12.17
															</p>
														</div>
													</a>
												</div>
												<div class="counsel_item item type_2">
													<a href="#" class="program_anchor">
														<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/2.png" /></div>
														<div class="item_txt">
															<p class="staus be">접수예정</p>
															<p class="program_title">[진로진학컨설팅] 12.16.(화) 19시</p>
															<p class="program_date">
																<span>접수기간</span>25.11.20~25.12.17
															</p>
														</div>
													</a>
												</div>
												<div class="counsel_item item type_3">
													<a href="#" class="program_anchor">
														<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/3.png" /></div>
														<div class="item_txt">
															<p class="staus end">접수마감</p>
															<p class="program_title">[Jump Up 2025 : 양주 진로진학 ON!] 1대1 맞춤형 진로진학컨설팅 2차 상담기간 운영 안내</p>
															<p class="program_date">
																<span>접수기간</span>25.11.20~25.12.17
															</p>
														</div>
													</a>
												</div>
												<div class="counsel_item item type_4">
													<a href="#" class="program_anchor">
													<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/4.png" /></div>
														<div class="item_txt">
															<p class="staus ing">접수진행중</p>
															<p class="program_title">[진로진학컨설팅] 12.16.(화) 19시</p>
															<p class="program_date">
																<span>접수기간</span>25.11.20~25.12.17
															</p>
														</div>
													</a>
												</div>
												<div class="counsel_item item type_2">
													<a href="#" class="program_anchor">
													<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/1.png" /></div>
														<div class="item_txt">
															<p class="staus ing">접수진행중</p>
															<p class="program_title">[진로진학컨설팅] 12.16.(화) 19시</p>
															<p class="program_date">
																<span>접수기간</span>25.11.20~25.12.17
															</p>
														</div>
													</a>
												</div>
												<div class="counsel_item item type_1">
													<a href="#" class="program_anchor">
													<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/2.png" /></div>
														<div class="item_txt">
															<p class="staus ing">접수진행중</p>
															<p class="program_title">[진로진학컨설팅] 12.16.(화) 19시</p>
															<p class="program_date">
																<span>접수기간</span>25.11.20~25.12.17
															</p>
														</div>
													</a>
												</div> -->
												
												<c:forEach var="row" items="${subjManageListA}" varStatus="i">
													<c:if test="${i.index > 0 && (i.index % 4) == 0}">
														<c:set var="pageCnt" value="${pageCnt + 1}" />
													</c:if>
												
													<div class="counsel_item item type_${row.cateCd}">
														<a href="#" class="program_anchor">
														<div class="item_img">
															<c:if test="${empty row.thumbpath}">
																<img src="/yjcareer/assets/DATA/popupZone/2.png" />
															</c:if>
															<c:if test="${not empty row.thumbpath}">
																<img src="${contextRoot}/thumbnail/${row.thumbpath}" />
															</c:if>
														</div>
															<div class="item_txt">
																<p class="staus ${row.status}">
																	<c:if test="${row.status eq 'ing'}">접수진행중</c:if>
																	<c:if test="${row.status eq 'be'}">접수예정</c:if>
																	<c:if test="${row.status eq 'end'}">접수마감</c:if>
																</p>
																<p class="program_title">${row.subjNm }</p>
																<p class="program_date">
																	<span>접수기간</span>${row.enrollStartDt }~${row.enrollEndDt }
																</p>
															</div>
														</a>
													</div>
												</c:forEach>
											</div>
											
											<div class="counsel_control">
												<button class="counsel_next">다음</button>
											</div>
											
											</div>
										</div>
									</div>
									<!-- /tab1-->

									<!--tab2-->
									<div class="tab2">
										<div class="tabCon2">
											<div class="program-control">
												<div class="radio-group">
													<input type="radio" id="program_all" name="program" checked>
													<label for="program_all">전체</label>

													<input type="radio" id="program_BA" name="program">
													<label for="program_BA">진로진학</label>

													<input type="radio" id="program_BB" name="program">
													<label for="program_BB">AI디지털</label>

													<input type="radio" id="program_BD" name="program">
													<label for="program_BD">돌봄</label>
												</div>	
											</div>
											
											<div class="program-item-area">
											
												<div class="program_control">
													<button class="program_prev">이전</button>
												</div>
												
												<div class="program_list slider-list">
													<!-- <div class="program_item item p_type_1">
														<a href="#" class="program_anchor">
															<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/5.png" /></div>
															<div class="item_txt">
																<p class="staus ing">접수진행중</p>
																<p class="program_title">[12월 학부모아카데미]겨울방학 대비 내 자녀 진로와 학습설계</p>
																<p class="program_date">
																	<span>접수기간</span>25.11.20~25.12.17
																</p>
															</div>
														</a>
													</div>
													<div class="program_item item p_type_2">
														<a href="#" class="program_anchor">
														<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/6.png" /></div>
															<div class="item_txt">
																<p class="staus end">접수마감</p>
																<p class="program_title">(입시전문가와 함께 하는)학부모 입시 교육1</p>
																<p class="program_date">
																	<span>접수기간</span>25.11.20~25.12.17
																</p>
															</div>
														</a>
													</div>
													<div class="program_item item p_type_3">
														<a href="#" class="program_anchor">
															<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/6.png" /></div>
															<div class="item_txt">
																<p class="staus be">접수예정</p>
																<p class="program_title">[12월 학부모아카데미]겨울방학 대비 내 자녀 진로와 학습설계</p>
																<p class="program_date">
																	<span>접수기간</span>25.11.20~25.12.17
																</p>
															</div>
														</a>
													</div>
													<div class="program_item item p_type_4">
														<a href="#" class="program_anchor">
														<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/7.png" /></div>
															<div class="item_txt">
																<p class="staus ing">접수진행중</p>
																<p class="program_title">(입시전문가와 함께 하는)학부모 입시 교육</p>
																<p class="program_date">
																	<span>접수기간</span>25.11.20~25.12.17
																</p>
															</div>
														</a>
													</div>
													<div class="program_item item p_type_1">
														<a href="#" class="program_anchor">
														<div class="item_img"><img src="/yjcareer/assets/DATA/popupZone/8.png" /></div>
															<div class="item_txt">
																<p class="staus ing">접수진행중</p>
																<p class="program_title">(입시전문가와 함께 하는)학부모 입시 교육</p>
																<p class="program_date">
																	<span>접수기간</span>25.11.20~25.12.17
																</p>
															</div>
														</a>
													</div> -->
													
													<c:forEach var="row" items="${subjManageListB}" varStatus="i">
														<c:if test="${i.index > 0 && (i.index % 4) == 0}">
															<c:set var="pageCnt" value="${pageCnt + 1}" />
														</c:if>
												
														<div class="program_item item p_type_${row.cateCd eq 'BC' ? 'BB' : 
																	(row.cateCd eq 'BE') ? 'BD' : row.cateCd}">
															<a href="#" class="program_anchor">
																<div class="item_img">
																	<c:if test="${empty row.thumbpath}">
																		<img src="/yjcareer/assets/DATA/popupZone/8.png" />
																	</c:if>
																	<c:if test="${not empty row.thumbpath}">
																		<img src="${contextRoot}/thumbnail/${row.thumbpath}" />
																	</c:if>
																</div>
																<div class="item_txt">
																	<p class="staus ${row.status}">
																		<c:if test="${row.status eq 'ing'}">접수진행중</c:if>
																		<c:if test="${row.status eq 'be'}">접수예정</c:if>
																		<c:if test="${row.status eq 'end'}">접수마감</c:if>
																	</p>
																	<p class="program_title">${row.subjNm }</p>
																	<p class="program_date">
																		<span>접수기간</span>${row.enrollStartDt }~${row.enrollEndDt }
																	</p>
																</div>
															</a>
														</div>
													</c:forEach>
												</div>
												
												<div class="program_control">
													<button class="program_next">다음</button>
												</div>
											
										</div>
									</div>
									<!-- /tab2-->
								
								</div>
							
							</div>
							</div>
							
						</section>

					</div>
				</div>
				
				
				<div class="rowgroup3">
					<div class="wrap">
						<section class="notice">
							
							
							<div class="notice_list">
								<div class="notice-top-area">
									<h2 class="notice_top_title">
										<span class="title">알려드립니다</span>
									</h2>
									<div class="tabmenu">
										<input type="radio" checked name="noticeTab" id="notice_tab1">
										<label for="notice_tab1">공지사항</label>
										<input type="radio" name="noticeTab" id="notice_tab2">
										<label for="notice_tab2">자료실</label>
									</div>
									<div class="notice_more">
										<a href="/yjcareer/selectBbsNttList.do?bbsNo=530&amp;key=4145" class="notice_more_btn"><span>더보기</span> </a>
									</div>
								</div>
								
								<div class="notice_contents">

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=199606" class="notice_anchor">
											<p class="notice_title">[학부모아카데미] JUMP UP 2025: 양주 진로진학 ON! JUMP UP 2025: 양주 진로진학 ON JUMP UP 2025: 양주 진로진학 ON!</p>
											<p class="notice_date">2025.11.19</p>
											
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=199305" class="notice_anchor">
											<p class="notice_title">[교육특구] 전문가특강 3차 이호 교수편 &#039;법의학자가 전하는 삶을 택하는 힘</p>
											<p class="notice_date">2025.11.11</p>
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=199024" class="notice_anchor">
											<p class="notice_title">[특강]26학년도 수능결과로 본 대입동향과 진학전략_11.22.(토) 10시 옥정호수도서관</p>
											<p class="notice_date">2025.11.01</p>
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=198877" class="notice_anchor">
											<p class="notice_title">수정: [Jump Up 2025 : 양주 진로진학 ON!] 1대1 맞춤형 진로진학컨설팅 운영 안내</p>
											<p class="notice_date">2025.10.27</p>
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=198854" class="notice_anchor">
											<p class="notice_title">[교육특구] 전문가특강 2차 항성 강사편 &#039; 지구를 넘어서는 꿈을 위하여&#039;</p>
											<p class="notice_date">2025.10.27</p>
										</a>
									</div>
								
								</div>
								
								<div class="data_contents">

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=199606" class="notice_anchor">
											<p class="notice_title">[학부모아카데미] JUMP UP 2025: 양주 진로진학 ON! JUMP UP 2025: 양주 진로진학 ON JUMP UP 2025: 양주 진로진학 ON!</p>
											<p class="notice_date">2025.11.19</p>
											
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=199305" class="notice_anchor">
											<p class="notice_title">[교육특구] 전문가특강 3차 이호 교수편 &#039;법의학자가 전하는 삶을 택하는 힘</p>
											<p class="notice_date">2025.11.11</p>
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=199024" class="notice_anchor">
											<p class="notice_title">[특강]26학년도 수능결과로 본 대입동향과 진학전략_11.22.(토) 10시 옥정호수도서관</p>
											<p class="notice_date">2025.11.01</p>
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=198877" class="notice_anchor">
											<p class="notice_title">수정: [Jump Up 2025 : 양주 진로진학 ON!] 1대1 맞춤형 진로진학컨설팅 운영 안내</p>
											<p class="notice_date">2025.10.27</p>
										</a>
									</div>
									
									<div class="notice_line"></div>

									<div class="notice_item">
										<a href="./selectBbsNttView_4145&amp;bbsNo=530&amp;nttNo=198854" class="notice_anchor">
											<p class="notice_title">[교육특구] 전문가특강 2차 항성 강사편 &#039; 지구를 넘어서는 꿈을 위하여&#039;</p>
											<p class="notice_date">2025.10.27</p>
										</a>
									</div>
								
								</div>


							</div>
							<div class="schedule-list">
								<h2 class="notice_top_title">
									<span class="title">관련 일정</span>
									<div class="notice_more">
										<a href="/yjcareer/selectBbsNttList.do?bbsNo=530&amp;key=4145" class="notice_more_btn"><span>더보기</span> </a>
									</div>
								</h2>
								<div class="schedule_contents">
									<div class="timeline">
										<div class="time-top">
											<img src="/yjcareer/assets/site/yjcareer/images/main/calc.png" alt="달력 아이콘">
											<div class="notice_control">
												<button class="notice_prev slick-arrow" style="">이전</button>	
												<h2 class="month-title">2025.12</h2>
												<button class="notice_next slick-arrow" style="">다음</button>
											</div>
										</div>
										
										<div class="timeline-inner">

										<!-- Day block -->
										<div class="day-block">
											<div class="events">
												<div class="event blue">
													<span class="day-number">12</span>
													<span class="event-title">[학부모아카데미] JUMP UP 2025: 양주 진로진학 ON!</span>
												</div>
											</div>
										</div>

										<!-- Day block -->
										<div class="day-block">
											<div class="events">
												<div class="event yellow">
													<span class="day-number">17</span>
													<span class="event-title">[특강]26학년도 수능결과로 본 대입동향과 진학전략_11.22.(토) 10시 옥정호수도서관</span>
												</div>
											</div>
										</div>

										<!-- Day block -->
										<div class="day-block">
											<div class="events">
												<div class="event pink">
													<span class="day-number">28</span>
													<span class="event-title">[학부모아카데미] JUMP UP 2025: 양주 진로진학 ON!</span>
												</div>
											</div>
										</div>
										
										<!-- Day block -->
										<div class="day-block">
											<div class="events">
												<div class="event blue">
													<span class="day-number">12</span>
													<span class="event-title">[학부모아카데미] JUMP UP 2025: 양주 진로진학 ON!</span>
												</div>
											</div>
										</div>

										<!-- Day block -->
										<div class="day-block">
											<div class="events">
												<div class="event yellow">
													<span class="day-number">17</span>
													<span class="event-title">[특강]26학년도 수능결과로 본 대입동향과 진학전략_11.22.(토) 10시 옥정호수도서관</span>
												</div>
											</div>
										</div>

										<!-- Day block -->
										<div class="day-block">
											<div class="events">
												<div class="event pink">
													<span class="day-number">28</span>
													<span class="event-title">[학부모아카데미] JUMP UP 2025: 양주 진로진학 ON!</span>
												</div>
											</div>
										</div>


										</div>
									</div>
								</div>
							</div>

							
						</section>
					</div>
				</div>

			</main>
		</div>

		<div class="footer-banner">
			<div class="f-b-inner">
				<div class="fBanner_control">
					<button class="fBanner_prev">이전</button>
				</div>
				<div class="fBanner-list">
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/ebs_ele.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/ebs_mi.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/ebs_hi.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/adiga.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/km.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/cur.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/yangju.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/ebs_ele.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/ebs_mi.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/ebs_hi.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/adiga.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/km.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/cur.jpg" /></div>
					<div class="fBanner-item"><img src="/yjcareer/assets/site/yjcareer/images/common/yangju.jpg" /></div>
				</div>

				<div class="fBanner_control">
					<button class="fBanner_next">다음</button>
				</div>

			</div>
		</div>
		
	<c:import url="/usr/layout/footer.do" />
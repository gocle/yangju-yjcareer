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
	<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sub.css">
	<script src="/yjcareer/assets/site/yjcareer/js/jquery-1.12.4.min.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/plugins.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/common.js"></script>
	<script src="/yjcareer/assets/site/yjcareer/js/main.js"></script>
	<title>양주진로진학교육플랫폼</title>
</head>

<body id="yjcareer">
	<script type="text/JavaScript">
		document.addEventListener("DOMContentLoaded", () => {

			/* ========= 신청하기 탭 ========= */
			var tabs = [
			  document.querySelector(".tab1"),
			  document.querySelector(".tab2"),
			  document.querySelector(".tab3")
			];

			var tabBtns = [
			  document.getElementById("tabmenu1"),
			  document.getElementById("tabmenu2"),
			  document.getElementById("tabmenu3")
			];

			var labels = [];
			for (var i = 0; i < tabBtns.length; i++) {
			  labels.push(document.querySelector("label[for='" + tabBtns[i].id + "']"));
			}

			function updateMainTab() {
			  for (var i = 0; i < tabBtns.length; i++) {
			    var isActive = tabBtns[i].checked;

			    if (isActive) {
			      tabs[i].classList.add("active");
			      labels[i].classList.add("active");
			    } else {
			      tabs[i].classList.remove("active");
			      labels[i].classList.remove("active");
			    }
			  }
			}

			updateMainTab();

			for (var i = 0; i < tabBtns.length; i++) {
			  tabBtns[i].addEventListener("change", updateMainTab);
			}


			/* ========= 공지사항 / 자료실 탭 ========= */
			const noticeCon1 = document.querySelector(".notice_contents");
			const noticeCon2 = document.querySelector(".data_contents");

			const noticeBtn1 = document.getElementById("notice_tab1");
			const noticeBtn2 = document.getElementById("notice_tab2");

			const label3 = document.querySelector("label[for='notice_tab1']");
			const label4 = document.querySelector("label[for='notice_tab2']");
			
			const moreLink = document.querySelector(".notice_more_btn");
			
			const NOTICE_URL = "/yjcareer/usr/bbs/notice/list.do?menuId=2025MENU0000262";
			const DATA_URL   = "/yjcareer/usr/bbs/photo/list.do?menuId=2025MENU0000263";

			function updateNoticeTab() {
				if (noticeBtn1.checked) {
					noticeCon1.style.display = "block";
					noticeCon2.style.display = "none";

					label3.classList.add("active");
					label4.classList.remove("active");
					
					moreLink.setAttribute("href", NOTICE_URL);
					
				} else {
					noticeCon1.style.display = "none";
					noticeCon2.style.display = "block";

					label3.classList.remove("active");
					label4.classList.add("active");
					
					moreLink.setAttribute("href", DATA_URL);
				}
			}

			updateNoticeTab();
			noticeBtn1.addEventListener("change", updateNoticeTab);
			noticeBtn2.addEventListener("change", updateNoticeTab);
			
		    
			function filterSlickList(option) {
			  const {
			    id,
			    allId,
			    itemSelector,
			    typePrefix,
			    sliderSelector,
			    prevBtnSelector,
			    nextBtnSelector
			  } = option;

			  const $slider = $(sliderSelector);
			  const $items = $(itemSelector);
			  const $empty = $('#common_empty');
			  const $prevBtn = $(prevBtnSelector);
			  const $nextBtn = $(nextBtnSelector);

			  if (id === allId) {
			    $items.show();
			  } else {
			    const typeNum = id.split('_')[1];
			    $items.hide();
			    $items.filter('.' + typePrefix + typeNum).show();
			  }

			  const visibleCount = $items.filter(':visible').length;

			  if (visibleCount === 0) {
			    if (!$slider.find('#common_empty').length) {
			      $slider.append($empty);
			    }

			    $empty.show();

			    $prevBtn.addClass('is-disabled').prop('disabled', true);
			    $nextBtn.addClass('is-disabled').prop('disabled', true);

			  } else {
			    $empty.hide();

			    $prevBtn.removeClass('is-disabled').prop('disabled', false);
			    $nextBtn.removeClass('is-disabled').prop('disabled', false);
			  }

			  $slider.slick('slickGoTo', 0);
			  $slider.slick('setPosition');
			}
			
			$(document).on('click', 'label[for^="counsel_"]', function () {
				  filterSlickList({
				    id: $(this).attr('for'),
				    allId: 'counsel_all',
				    itemSelector: '.counsel_item',
				    typePrefix: 'type_',
				    sliderSelector: '.counsel_list',
				    prevBtnSelector: '.counsel_prev',
				    nextBtnSelector: '.counsel_next'
				  });
				});
			
			$(document).on('click', 'label[for^="program_"]', function () {
				  filterSlickList({
				    id: $(this).attr('for'),
				    allId: 'program_all',
				    itemSelector: '.program_item',
				    typePrefix: 'p_type_',
				    sliderSelector: '.program_list',
				    prevBtnSelector: '.program_prev',
				    nextBtnSelector: '.program_next'
				  });
				});
			
			$(document).on('click', 'label[for^="event_"]', function () {
				  filterSlickList({
				    id: $(this).attr('for'),
				    allId: 'event_all',
				    itemSelector: '.event_item',
				    typePrefix: 'e_type_',
				    sliderSelector: '.event_list',
				    prevBtnSelector: '.event_prev',
				    nextBtnSelector: '.event_next'
				  });
				});
			
			
			// 신청가기 탭 변경 url
			const $moreBtn = $('.program_more_btn');

			function updateMoreLink() {
			    if ($('#tabmenu1').is(':checked')) {
			        $moreBtn.attr('href', '/yjcareer/usr/reservation/consulting/addCalendarView.do?menuId=2025MENU0000143&searchCateCd=AA'); // 1:1 상시상담
			    } else if ($('#tabmenu2').is(':checked')) {
			        $moreBtn.attr('href', '/yjcareer/usr/reservation/program/eduLctreNewList.do?menuId=2025MENU0000142&searchCateCd=BA'); // 꿈자람센터 프로그램
			    } else {
			    	$moreBtn.attr('href', '/yjcareer/usr/reservation/event/list.do?menuId=2025MENU0000144&searchCateCd=CD'); // 행사 및 강좌
			    }
			}

			updateMoreLink();
			$('#tabmenu1, #tabmenu2 , #tabmenu3').on('change', function () {
			    updateMoreLink();
			});


		});
		
				
		function reInitSlick($slider, initFn) {
		  if ($slider.hasClass('slick-initialized')) {
			$slider.slick('unslick');
		  }
		  initFn();

		}
		
		//관련일정 js
		let currentMonth = new Date().toISOString().slice(0, 7);

		function loadSchedule(month) {
			  $.ajax({
			    url: "/yjcareer/usr/loadSchedule.do",
			    type: "get",
			    data: { searchScheduleDt: month },
			    success: function (list) {
			      renderSchedule(list, month);
			    },
			    error: function () {
			      alert("일정을 불러오지 못했습니다.");
			    }
			  });
			}

		function renderSchedule(list, month) {
			  const wrap = $("#scheduleTimeline");
			  wrap.empty();

			  if (!list || list.length === 0) {
			    wrap.append(
			    		'<div class="day-block">' +
				          '<div class="events">' +
				            '<div class="event">' +
				              '<span class="event-title">등록된 일정이 없습니다.</span>' +
				            '</div>' +
				          '</div>' +
				        '</div>'
			    		);
			  } else {
			    $.each(list, function (i, item) {
			      wrap.append(
			        '<div class="day-block">' +
			          '<div class="events">' +
			            '<div class="event">' +
			              '<span class="day-number">' + item.LEARN_START_DAY + '</span>' +
			              '<span class="event-title">' + item.SUBJ_NM + '</span>' +
			            '</div>' +
			          '</div>' +
			        '</div>'
			      );
			    });
			  }

			  $(".month-title").text(month.replace("-", "."));
			}
		
		function moveMonth(diff) {
		  const arr = currentMonth.split("-");
		  const d = new Date(arr[0], arr[1] - 1 + diff, 1);

		  currentMonth =
		    d.getFullYear() + "-" + String(d.getMonth() + 1).padStart(2, "0");

		  loadSchedule(currentMonth);
		}
		
		
		$(function () {
		  loadSchedule(currentMonth);

		  $(".notice_prev").on("click", function () {
		    moveMonth(-1);
		  });

		  $(".notice_next").on("click", function () {
		    moveMonth(1);
		  });
		});
		
		// 관련일정 clik
		$(document).on("click", ".events", function () {
		  location.href = "/yjcareer/usr/bbs/schedule/list.do?menuId=2025MENU0000341";
		});

	</script>

	<script type="text/JavaScript">
		function setCookie( name, value, expiredays ) {
			var todayDate = new Date();
			todayDate.setDate( todayDate.getDate() + expiredays );
			document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
		}
		
		function fnDetailView(seqCd) {
			$("#detailForm input[name=seqCd]").val(seqCd);
			let reqUrl = "${contextRoot}/usr/reservation/eduLctreWebView.do";
			$("#detailForm").attr("action", reqUrl);
			$("#detailForm").submit();
		}
	</script>
	
	<style>
		.layer_cont p > br {
		  display: none;
		}
		.layer_cont {
			background: #fff;
    		box-shadow: 0 2px 6px rgba(0, 0, 0, .5);
    		overflow-y : auto
		}
	</style>

	<!-- 레이어 팝업 시작 -->
	<c:forEach var="bn" items="${popupList}" varStatus="status">
	    <div id="divpopup${status.index}"
	         class="main_popup"
	         style="
	            position:absolute;
	            left:${bn.bnLeft}px;
	            top:${bn.bnTop}px;
	            z-index:1001;
	            visibility:hidden;
	         ">
	         
	        <c:if test="${empty bn.bnLink}">
	        	<div class="layer_cont" style="width:${bn.bnWidth}px; height:${bn.bnHeight}px">
	        		${bn.bnDescription}
	        	</div>
	        </c:if>
	        
	        <c:if test="${not empty bn.bnLink}">
		        <div class="layer_cont" style="width:${bn.bnWidth}px; height:${bn.bnHeight}px">
		            <a href="${bn.bnLink}" style="display: block; width: 100%; text-decoration: none;"
		               <c:if test="${bn.bnNewWin eq '1'}">target="_blank"</c:if>
		               title="새창">
		                ${bn.bnDescription}
		            </a>
		        </div>
	        </c:if>
	        
	        <form name="notice_form${status.index}">
	            <div class="layer_put">
	                <div>
	                    <input type="checkbox"
	                           id="chkbox${status.index}" />
	                    <label for="chkbox${status.index}">
	                        오늘하루동안보지않기
	                    </label>
	                </div>
	                <div class="pop-btn">
	                    <a href="javascript:closeWind${status.index}();">닫기</a>
	                </div>
	            </div>
	        </form>
	    </div>
	
	    <script>
	        function closeWind${status.index}() {
	            if (document.getElementById("chkbox${status.index}").checked) {
	                setCookie("popup_${bn.bnId}", "done", 1);
	            }
	            document.getElementById("divpopup${status.index}").style.visibility = "hidden";
	        }
	
	        (function () {
	            if (document.cookie.indexOf("popup_${bn.bnId}=done") < 0) {
	                document.getElementById("divpopup${status.index}").style.visibility = "visible";
	            }
	        })();
	    </script>
	</c:forEach>
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
									<a href="/yjcareer/usr/introduce/business.do?menuId=2025MENU0000251" class="visual_more_btn">주요사업 보러가기</a>
								</div>
							</div>
							<div class="visual-right">
								<div class="top">
									<div class="visual-btn">
										<span class="tit">진로진학지원센터</span>
										<a href="${contextRoot}/usr/introduce/map.do?menuId=2025MENU0000252#loc-1" target="_self" title="이동"><span><img src="/yjcareer/assets/site/yjcareer/images/main/phone_w.png"/></span></a>
									</div>
									<div class="visual-btn">
										<span class="tit">동부권 AI디지털교실</span>
										<a href="${contextRoot}/usr/introduce/map.do?menuId=2025MENU0000252#loc-2" target="_self" title="이동"><span><img src="/yjcareer/assets/site/yjcareer/images/main/phone_w.png"/></span></a>
									</div>
								</div>
								<div class="middle">
									<div class="visual-btn">
										<span class="tit">동부권 거점돌봄교실</span>
										<a href="${contextRoot}/usr/introduce/map.do?menuId=2025MENU0000252#loc-3" target="_self" title="이동"><span><img src="/yjcareer/assets/site/yjcareer/images/main/phone_w.png"/></span></a>
									</div>
									<div class="visual-btn">
										<span class="tit">서부권 AI디지털교실</span>
										<a href="${contextRoot}/usr/introduce/map.do?menuId=2025MENU0000252#loc-4" target="_self" title="이동"><span><img src="/yjcareer/assets/site/yjcareer/images/main/phone_w.png"/></span></a>
									</div>
								</div>
								<div class="bottom">
									<div class="visual-btn">
										<span class="tit">서부권 거점돌봄교실</span>
										<a href="${contextRoot}/usr/introduce/map.do?menuId=2025MENU0000252#loc-5" target="_self" title="이동"><span><img src="/yjcareer/assets/site/yjcareer/images/main/phone_w.png"/></span></a>
									</div>
									<div class="visual-btn dubble-btn">
										<span class="tit dubble">양주고읍 LH14단지<br>자기주도학습센터</span>
										<a href="${contextRoot}/usr/introduce/map.do?menuId=2025MENU0000252#loc-6" target="_self" title="이동"><span><img src="/yjcareer/assets/site/yjcareer/images/main/phone_w.png"/></span></a>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				
				<form id="detailForm" name="detailForm">
					<input type="hidden" name="seqCd" id="seqCd" value="">
				</form>
				
				<div class="rowgroup3">                
                   <div class="wrap">
						<section class="program">
							<h2 class="program_top_title">
								<span class="title">신청</span>
								<div class="tabmenu">
									<input type="radio" checked name="tabmenu" id="tabmenu1">
									<label for="tabmenu1">1:1 상시상담</label>
									<input type="radio" name="tabmenu" id="tabmenu2">
									<label for="tabmenu2">꿈자람센터 프로그램</label>
									<input type="radio" name="tabmenu" id="tabmenu3">
									<label for="tabmenu3">행사 및 강좌</label>
								</div>
								<div class="program_more">
									<a href="#" class="program_more_btn"><span class="ico-plus"></span></a>
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
											
											<div class="counsel_control program-control-btn-area">
												<button class="counsel_prev btn_prev">이전</button>
											</div>
											
											<div class="counsel_list slider-list">
												<c:forEach var="row" items="${subjManageListA}" varStatus="i">
													<c:if test="${i.index > 0 && (i.index % 4) == 0}">
														<c:set var="pageCnt" value="${pageCnt + 1}" />
													</c:if>
												
													<div class="counsel_item item type_${row.cateCd}">
														<a href="javascript:;" onclick="fnDetailView('${row.seqCd}');" class="program_anchor">
														<div class="item_img">
															<c:if test="${empty row.thumbpath}">
																<img src="/yjcareer/assets/DATA/popupZone/no-img.png" />
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
											
											<div class="counsel_control program-control-btn-area">
												<button class="counsel_next btn-next">다음</button>
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
													<label for="program_BB">동부 AI디지털</label>
													
													<input type="radio" id="program_BD" name="program">
													<label for="program_BD">동부 돌봄</label>
													
													<input type="radio" id="program_BC" name="program">
													<label for="program_BC">서부 AI디지털</label>
													
													<input type="radio" id="program_BE" name="program">
													<label for="program_BE">서부 돌봄</label>
												</div>	
											</div>
											
											<div class="program-item-area">
											
												<div class="program_control program-control-btn-area">
													<button class="program_prev btn_prev">이전</button>
												</div>
												
												<div class="program_list slider-list">
													<c:forEach var="row" items="${subjManageListB}" varStatus="i">
														<c:if test="${i.index > 0 && (i.index % 4) == 0}">
															<c:set var="pageCnt" value="${pageCnt + 1}" />
														</c:if>
												
														<div class="program_item item p_type_${row.cateCd}">
															<a href="javascript:;" onclick="fnDetailView('${row.seqCd}');" class="program_anchor">
																<div class="item_img">
																	<c:if test="${empty row.thumbpath}">
																		<img src="/yjcareer/assets/DATA/popupZone/no-img.png" />
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
												
												<div class="program_control program-control-btn-area">
													<button class="program_next btn-next">다음</button>
												</div>
											
											</div>
										</div>
									</div>
									<!-- /tab2-->
									<!--tab3-->
									<div class="tab3">
										<div class="tabCon3">
											<div class="program-control">
												<div class="radio-group">
													<input type="radio" id="event_all" name="event" checked>
													<label for="event_all">전체</label>

													<input  type="radio" id="event_CD" name="event">
													<label for="event_CD">특강</label>
													
													<input  type="radio" id="event_CC" name="event">
													<label for="event_CC">학부모아카데미</label>

													<input type="radio" id="event_CB" name="event">
													<label for="event_CB">입시설명회</label>
													
													<input type="radio" id="event_CA" name="event">
													<label for="event_CA">진로교육박람회</label>
												</div>	
											</div>
											
											<div class="program-item-area">
											
												<div class="event_control program-control-btn-area">
													<button class="event_prev btn_prev">이전</button>
												</div>
												
												<div class="event_list slider-list">
													<c:forEach var="row" items="${subjManageListC}" varStatus="i">
														<c:if test="${i.index > 0 && (i.index % 4) == 0}">
															<c:set var="pageCnt" value="${pageCnt + 1}" />
														</c:if>
												
														<div class="event_item item e_type_${row.cateCd}">
															<a href="javascript:;" onclick="fnDetailView('${row.seqCd}');" class="program_anchor">
																<div class="item_img">
																	<c:if test="${empty row.thumbpath}">
																		<img src="/yjcareer/assets/DATA/popupZone/no-img.png" />
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
												
												<div class="event_control program-control-btn-area">
													<button class="event_next btn-next">다음</button>
												</div>
											
											</div>
										</div>
									</div>
									<!-- /tab3-->
							
							</div>
							
							<div id="common_empty" style="display:none;">
							  <div class="empty_inner">
							  	<img src="${contextRoot}/assets/site/yjcareer/images/main/no-pro.png" alt="신청 가능 항목 없음">
							    <p class="empty_title">현재 신청 가능한 항목이 없습니다.</p>
							    <p class="empty_desc">선택한 조건에 해당하는 프로그램이 없습니다.</p>
							  </div>
							</div>
							
						</section>

					</div>
				</div>
				
				
				<div class="rowgroup3">
					<div class="wrap">
						<section class="notice">
							<div class="notice_list">
								<span class="bookmark"></span>
								<div class="notice-top-area">
									<div class="tabmenu">
										<input type="radio" checked name="noticeTab" id="notice_tab1">
										<label for="notice_tab1">공지사항</label>
										<input type="radio" name="noticeTab" id="notice_tab2">
										<label for="notice_tab2">교육자료</label>
									</div>
									<div class="notice_more">
										<a href="/yjcareer/usr/bbs/notice/list.do?menuId=2025MENU0000262" class="notice_more_btn"><span class="ico-plus"></span></a>
									</div>
								</div>
								<div class="notice_contents">
									<c:set var="totalCount" value="0" />
									<c:set var="maxCount" value="5" />
									
									<c:forEach var="row" items="${topNoticeList}" varStatus="i" begin="0" end="4">
										<c:if test="${totalCount < maxCount}">
											<div class="notice_item top_item">
												<a href="/yjcareer/usr/bbs/notice/detail.do?menuId=2025MENU0000262&baId=${row.baId }&baNotice=0" class="notice_anchor">
													<p class="notice_title">${row.baTitle }</p>
													<p class="notice_date">
														<fmt:parseDate value="${row.baRegdate}" var="parsedDate" pattern="yyyy.MM.dd" />
														<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
													</p>
												</a>
											</div>
											<c:set var="totalCount" value="${totalCount + 1}" />
									    </c:if>
									</c:forEach>
									<c:forEach var="row" items="${noticList}" varStatus="i">
										<c:if test="${totalCount < maxCount}">
									        <div class="notice_item">
									            <a href="/yjcareer/usr/bbs/notice/detail.do?menuId=2025MENU0000262&baId=${row.baId}&baNotice=0" class="notice_anchor">
									                <p class="notice_title">${row.baTitle}</p>
									                <p class="notice_date">${row.regDate}</p>
									            </a>
									        </div>
									        <c:set var="totalCount" value="${totalCount + 1}" />
									    </c:if>
									</c:forEach>
								</div>
								<div class="data_contents">
									<c:forEach var="row" items="${photoList}" varStatus="i" begin="0" end="4">
										<div class="notice_item">
											<a href="/yjcareer/usr/bbs/photo/detail.do?menuId=2025MENU0000263&baId=${row.baId }&baNotice=0" class="notice_anchor">
												<p class="notice_title">${row.baTitle }</p>
												<p class="notice_date">${row.regDate }</p>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="schedule-list">
								<div class="schedule_contents">
									<div class="timeline">
										<div class="time-top">
											<img src="/yjcareer/assets/site/yjcareer/images/main/calc.png" alt="달력 아이콘">
											<div class="notice_control">
												<button class="notice_prev slick-arrow" style="">이전</button>	
												<h2 class="month-title">2025.12</h2>
												<button class="notice_next slick-arrow" style="">다음</button>
											</div>
											<div class="notice_more">
												<a href="/yjcareer/usr/bbs/schedule/list.do?menuId=2025MENU0000341" class="notice_more_btn"><span class="ico-plus"></span></a>
											</div>
										</div>
										
										<div class="timeline-inner" id="scheduleTimeline"></div>
									</div>
								</div>
							</div>

							
						</section>
					</div>
				</div>

			</main>
		</div>

		<div class="footer-banner">
		  <div class="f-b-inner wrap">
		
		    <div class="fBanner_control">
		      <button class="fBanner_prev">이전</button>
		    </div>
		
		    <div class="fBanner-list">
		      <div class="fBanner-item">
		        <a href="https://satp.goe.go.kr/intro.do" target="_blank" rel="noopener">
		          <img src="/yjcareer/assets/site/yjcareer/images/common/satp.jpg" alt="고입정보포털" />
		        </a>
		      </div>
		
		      <div class="fBanner-item">
		        <a href="https://www.adiga.kr" target="_blank" rel="noopener">
		          <img src="/yjcareer/assets/site/yjcareer/images/common/adiga.jpg" alt="대입정보포털 어디가" />
		        </a>
		      </div>
		
		      <div class="fBanner-item">
		        <a href="https://www.career.go.kr/cloud/w/main/home" target="_blank" rel="noopener">
		          <img src="/yjcareer/assets/site/yjcareer/images/common/career.jpg" alt="커리어넷" />
		        </a>
		      </div>
		
		      <div class="fBanner-item">
		        <a href="https://www.schoolinfo.go.kr/Main.do" target="_blank" rel="noopener">
		          <img src="/yjcareer/assets/site/yjcareer/images/common/schoolinfo.jpg" alt="학교알리미" />
		        </a>
		      </div>
		
		      <div class="fBanner-item">
		        <a href="https://online.goe.go.kr/main/index.jsp" target="_blank" rel="noopener">
		          <img src="/yjcareer/assets/site/yjcareer/images/common/online.jpg" alt="경기온라인학교" />
		        </a>
		      </div>
		    </div>
		
		    <div class="fBanner_control">
		      <button class="fBanner_next">다음</button>
		    </div>
		
		  </div>
		</div>
		
	<c:import url="/usr/layout/footer.do" />
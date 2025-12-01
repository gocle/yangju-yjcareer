<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="wrapper">

		<header id="header">
			<div class="accessibility">
				<a href="#contents">본문 바로가기</a>
			</div>

			<div class="gnb">
				<div class="wrap">
					<div class="link">
						<ul class="link_list">

							<!--<li class="link_item login"><a href="/loginForm.do?siteId=yjcareer&amp;TARGET=/yjcareer/index.do" class="link_anchor" title="로그인">로그인</a></li>-->
							<li class="link_item logout"><a href="/logout.do?siteId=yjcareer" class="link_anchor" title="로그아웃">로그아웃</a></li>
                            <li class="link_item mypage"><a href="/yjcareer/usr/mypage/myReservation.do" class="link_anchor">나의예약</a></li>


						</ul>
					</div>
					<div class="site">
						<ul class="site_list">
							<li class="site_item n1"><a href="/www/index.do" class="site_anchor">양주시청</a></li>
							<li class="site_item n2"><a href="/ytc/index.do" class="site_anchor">청소년수련원</a></li>
							<li class="site_item n3"><a href="/yjyouth1318/index.do" class="site_anchor">청소년문화의집</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="group">
				<div class="wrap">
					<div class="logo">
						<a href="/yjcareer/usr/main.do" class="logo_anchor"><img src="/yjcareer/assets/css/usr/img/common/logo.png" alt="시민과함께 도약하는양주"><span>진로진학지원센터</span></a>
					</div>
				</div>


				<div class="lnb">

					<div class="menu_show">
						<button type="button" class="menu_btn">주메뉴 열기</button>
					</div>

					<nav class="menu after eachdown">




						<h2 class="skip">주메뉴</h2>

						<div class="menu_header">
							<div class="link">
								<ul class="link_list clearfix">

									<!--<li class="link_item login"><a href="/loginForm.do?siteId=yjcareer&amp;TARGET=/yjcareer/index.do" class="link_anchor" title="로그인">로그인</a></li>-->
									<li class="link_item logout"><a href="/logout.do?siteId=yjcareer" class="link_anchor" title="로그아웃">로그아웃</a></li>
                            		<li class="link_item mypage"><a href="selectEduApplcntResveWebList.html" class="link_anchor">나의예약</a></li>

								</ul>
							</div>
						</div>

						<div class="wrap">
							<div class="depth depth1">
								<ul class="depth_list depth1_list cut">
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/usr/introduce/intro.do" target="_self" class="depth_text depth1_text"><span>진로진학교육</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/introduce/intro.do" target="_self" class="depth_text depth2_text"><span>인사말</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/introduce/vision.do" target="_self" class="depth_text depth2_text"><span>비전 및 목표</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/introduce/business.do" target="_self" class="depth_text depth2_text"><span>주요사업</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/introduce/map.do" target="_self" class="depth_text depth2_text"><span>찾아오시는 길</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/usr/reservation/intro.do" target="_self" class="depth_text depth1_text"><span>프로그램 신청</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/intro.do" target="_self" class="depth_text depth2_text"><span>프로그램 신청 안내</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/reservation/list1.do" target="_self" class="depth_text depth2_text"><span>프로그램 신청</span></a>
														<div class="depth depth3">
															<ul class="depth_list depth3_list">
																<li class="depth_item depth3_item"><a href="/yjcareer/usr/reservation/list1.do" target="_self" class="depth_text depth3_text">진로진학 컨설팅 신청</a>
																</li>
																<li class="depth_item depth3_item"><a href="/yjcareer/usr/reservation/list2.do" target="_self" class="depth_text depth3_text">진로 프로그램 신청</a>
																</li>
																<li class="depth_item depth3_item"><a href="/yjcareer/usr/reservation/list3.do" target="_self" class="depth_text depth3_text">진학 프로그램 신청</a>
																</li>
																<li class="depth_item depth3_item"><a href="/yjcareer/usr/reservation/list4.do" target="_self" class="depth_text depth3_text">특별 교육 프로그램 신청</a>
																</li>
															</ul>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/usr/support/intro.do" target="_self" class="depth_text depth1_text"><span>학습지원서비스</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/support/intro.do" target="_self" class="depth_text depth2_text"><span>학습지원서비스안내</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="https://study4way.com/intro" target="_blank" title="새창" class="depth_text depth2_text"><span>학습유형 검사</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/usr/support/list.do" target="_self" class="depth_text depth2_text"><span>학습 상담</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/contents_4254" target="_self" class="depth_text depth1_text"><span>JUMP UP 2025 양주 미래교육 페스타</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/contents_4254" target="_self" class="depth_text depth2_text"><span>행사안내</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/contents_4256" target="_self" class="depth_text depth2_text"><span>진로박람회 부스 안내</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/contents_4257" target="_self" class="depth_text depth2_text"><span>오시는 길 안내</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/contents_4141" target="_self" class="depth_text depth1_text"><span>교육 네트워크</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/contents_4141" target="_self" class="depth_text depth2_text"><span>지역 진로교사 안내</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/contents_4142" target="_self" class="depth_text depth2_text"><span>진로교육콘텐츠</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="https://www.ggoomgil.go.kr/front/index.do" target="_blank" title="새창" class="depth_text depth2_text"><span>체험처 소개(꿈길)</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="depth_item depth1_item n1">
										<a href="/yjcareer/selectBbsNttList.do?bbsNo=530&amp;key=4145" target="_self" class="depth_text depth1_text"><span>알림마당</span></a>
										<div class="depth depth2">
											<div class="depth2_content">
												<ul class="depth_list depth2_list cut">
													<li class="depth_item depth2_item">
														<a href="/yjcareer/selectBbsNttList.do?bbsNo=530&amp;key=4145" target="_self" class="depth_text depth2_text"><span>공지사항</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/selectBbsNttList.do?bbsNo=529&amp;key=4146" target="_self" class="depth_text depth2_text"><span>자료실(갤러리)</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="https://naver.me/xyTNUiV1" target="_blank" title="새창" class="depth_text depth2_text"><span>온라인 설문조사</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/selectBbsNttList.do?bbsNo=528&amp;key=4148" target="_self" class="depth_text depth2_text"><span>자주하는 질문</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/selectBbsNttList.do?bbsNo=548&amp;key=4185" target="_self" class="depth_text depth2_text"><span>학습후기</span></a>
													</li>
													<li class="depth_item depth2_item">
														<a href="/yjcareer/selectBbsNttList.do?bbsNo=527&amp;key=4149" target="_self" class="depth_text depth2_text"><span>Q&amp;A</span></a>
													</li>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="menu_hide">
							<button type="button" class="menu_btn">주메뉴 닫기</button>
						</div>
					</nav>

				</div>
			</div>

		</header>
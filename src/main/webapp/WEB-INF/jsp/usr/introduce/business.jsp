<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
    
    <div id="container">
        <div class="wrap clearfix">
            <main class="colgroup">
                <article>
    
                    <header class="sub_head">
    
                        <div class="sub_title">
                            <!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
                            <p class="first_title">센터 소개</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>주요사업</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                            
							<c:import url="/usr/menu/sub.do" />
            
                            <div class="addons">
                                <ul class="addons_list">
                                    <li class="addons_item print">
                                        <button type="button" onclick="window.print();" class="addons_button">인쇄</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                    
                    
                    <div id="contents" class="cts4125">
						<div class="business">
							<div class="business_item">
								<div class="left_box"><p>01</p></div>
								<div class="right_box">
									<p class="business_title">진로 발달단계별 진로로드맵 실현</p>
									<ul class="bu dl">
										<li>
											<span class="dd">진로탐색지원(대학캠퍼스 투어)</span>
										</li>
										<li>
											<span class="dd">진로체험 활성화(교육부 누리집 ’꿈길’ 운영)</span>
										</li>
										<li>
											<span class="dd">진로교육박람회</span>
										</li>
									</ul>
								</div>
							</div>
							<div class="business_item">
								<div class="left_box"><p>02</span></p></div>
								<div class="right_box">
									<p class="business_title">내실있는 진학·학습 종합지원</p>
									<ul class="bu dl">
										<li>
											<span class="dd">진로진학설계 구체화 지원(1대1 맞춤형 진로진학 상담)</span>
										</li>
										<li>
											<span class="dd">학습지원(초중고 학습튜터링, 온라인수강권 지원)</span>
										</li>
										<li>
											<span class="dd">양주형 입시설명회</span>
										</li>
									</ul>
								</div>
							</div>
							<div class="business_item">
								<div class="left_box"><p>03</p></div>
								<div class="right_box">
									<p class="business_title">진로진학 네트워크 확장</p>
									<ul class="bu dl">
										<li>
											<span class="dd">지역 대학 연계 창의혁신 프로그램(여름방학 예체능특강)</span>
										</li>
										<li>
											<span class="dd">진로교육 협력체 구성(초중고 진로교사 협의회)</span>
										</li>
										<li>
											<span class="dd">학부모교육(학부모아카데미)</span>
										</li>
									</ul>
								</div>
							</div>
							<div class="business_item">
								<div class="left_box"><p>04</p></div>
								<div class="right_box">
									<p class="business_title">진로진학종합플랫폼 활성화</p>
									<ul class="bu dl">
										<li>
											<span class="dd">온라인 플랫폼 기능 강화</span>
										</li>
										<li>
											<span class="dd">교육 사각지대 해소</span>
										</li>
										<li>
											<span class="dd">진로진학플랫폼 홍보 활성화</span>
										</li>
									</ul>
								</div>
							</div>
							<div class="business_item">
								<div class="left_box"><p>05</p></div>
								<div class="right_box">
									<p class="business_title">양주시 교육특구</p>
									<ul class="bu dl">
										<li>
											<span class="dt">양주 꿈자람 제1센터</span>
											<span class="dd">동부권 AI디지털 교실, 진로진학지원센터</span>
										</li>
										<li>
											<span class="dt">양주 꿈자람 제2센터</span>
											<span class="dd">서부권 AI디지털 교실, 서부권 거점돌봄교실</span>
										</li>
										<li>
											<span class="dt">양주 꿈자람 제3센터</span>
											<span class="dd">동부권 거점돌봄교실</span>
										</li>
										<li>
											<span class="dt">양주 꿈자람 제4센터</span>
											<span class="dd">양주고읍 LH14단지 자기주도학습센터</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>

                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

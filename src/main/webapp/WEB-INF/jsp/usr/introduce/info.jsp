<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />
<c:import url="/usr/menu/header.do" />

<script>

	$(function(){
	  $(".vision").hide();
	  $(".vision-1").show();
	});
	
	function goTab(no, menuId){

	  $(".vision").hide();
	  $(".vision-" + no).show();

	}
</script>
    
    <div id="container">
        <div class="wrap clearfix">
            <main class="colgroup">
                <article>
    
                    <header class="sub_head">
    
                        <div class="sub_title">
                            <!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
                            <p class="first_title">센터 소개</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>꿈자람센터 소개</h2>
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
					
					<div id="contents" class="cts4124">
					
						<div class="sub-info sub-tab sub-tab-center">
							<input id="intro-1" name="btn" type="radio" class="hidden" checked="checked">
							<label for="intro-1" class="btn" onclick="goTab('1','0280')">양주 꿈자람센터</label>
							<input id="intro-2" name="btn" type="radio" class="hidden">
							<label for="intro-2" class="btn" onclick="goTab('2','0280')">진로진학지원센터</label>
							<input id="intro-3" name="btn" type="radio" class="hidden">
							<label for="intro-3" class="btn" onclick="goTab('3','0280')">AI디지털교실</label>
							<input id="intro-4" name="btn" type="radio" class="hidden">
							<label for="intro-4" class="btn" onclick="goTab('4','0280')">거점돌봄교실</label>
						</div>
						
						<div class="vision vision-1">
						
							<div class="section one">
								<div class="right_box">
									<p class="title">양주 꿈자람센터</p>
								</div>
							</div>
	
							<div class="section four">
								<div class="left_title"><p>소개</p></div>
								<div class="right_box">
									<div class="text_wrap">
										<p class="text">양주시에 거주하는 아이들의 꿈이 자라나고 성장하는 거점, <span>돌봄과 배움</span>이 함께 이루어지는 공간입니다.</p>
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="vision vision-2">
							
							<div class="section one">
								<div class="right_box">
									<p class="title">진로진학지원센터</p>
								</div>
							</div>
	
							<div class="section four">
								<div class="left_title"><p>소개</p></div>
								<div class="right_box">
									<div class="text_wrap">
										<p class="text">시대 요구 상에 부응하는 진로직업 체험 활성화와 진학 지원을 통해 자신의 꿈을 주도적으로 개척할 수 있도록 하고자
										<br><span>1:1 맞춤형 상담</span>, <span>대학 캠퍼스 투어</span>, <span>진로교육박람회</span> 등 운영하고 있습니다. </p>
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="vision vision-3">
							
							<div class="section one">
								<div class="right_box">
									<p class="title">AI디지털교실</p>
								</div>
							</div>
	
							<div class="section four">
								<div class="left_title"><p>소개</p></div>
								<div class="right_box">
									<div class="text_wrap">
										<p class="text">
											청소년들이 디지털 기술의 원리를 이해하고 직접 활용해 보는 미래형 교육 공간으로 <span>코딩</span>, <span>로봇</span>, <span>영상편집</span> 등 다양한 프로그램을 통해
											<br>창의력과 디지털 리터러시를 체계적으로 키울 수 있도록 운영되고 있습니다.
										</p>
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="vision vision-4">
							
							<div class="section one">
								<div class="right_box">
									<p class="title">거점돌봄교실</p>
								</div>
							</div>
	
							<div class="section four">
								<div class="left_title"><p>소개</p></div>
								<div class="right_box">
									<div class="text_wrap">
										<p class="text">
											동부권 거점돌봄교실은 옥정호수초 다 함께 돌봄교실에서 <span>양주시 초등학생 누구나</span> <span>방과 후 시간에</span> 음악, 우리 동네 이야기·현장 체험활동,
											생성형 AI·창의 로봇, 스마트 K-POP 놀이 체육, 경계선 장애 아동 정서교육을 제공하여 양주 아이들이 즐기며 배우고 성장할 기회를<br>제공합니다.
										</p>
										<p class="text">
											서부권 거점돌봄교실은 서부권 돌봄교실(광적로 5)을 중심으로 양주시 초등학생 누구나 방과 후 시간에 양주시를 주제로 논술, 발표 활동, 영어 회화, 기초학력 학습, 스마트 놀이 체육, 음악프로그램 등을
											제공하여 서부권 아이들의 <span>학습 정서발달을 적극 지원</span>하고 있습니다.  
										</p>
									</div>
								</div>
							</div>
							
						</div>
							
						
                    </div>
                
                </article>
            </main>
        
        </div>
    </div>
    
    <div class="back-before"></div>
    
    <c:import url="/usr/layout/footer.do" />

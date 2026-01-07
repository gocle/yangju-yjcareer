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
                            <h2>진로진학교육플랫폼 소개</h2>
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
                    
                    
                    <div id="contents" class="cts4123">
						<div class="greeting">
	<div class="left_box">
		<i class="left_bg"></i>
		<img src="/yjcareer/assets/css/usr/img/contents/greeting_img01.png" alt="양주시장 강수현">
	</div>
	<div class="right_box">
		<h3 class="h0">안녕하십니까? <br><span>양주시장 강수현</span>입니다.</h3>
		
		<div class="text_box">
			<p>우리시는 교육부 ‘교육발전특구 시범지역’으로 선정되어 경기북부 교육신도시로 발돋움하고 있습니다. 교육발전특구 선정과 함께 진로진학플랫폼을 개설하여 청소년과 학부모들에게 양질의 진로진학 교육 정보를 제공하고 다양한 프로그램을 통해 청소년의 미래를 열어갈 계획입니다.</p>
			<p>우리시는 명실상부 미래선도의 교육도시로서 청소년들이 자신의 꿈을 발견하고 이루어갈 수 있는 환경을 만드는 데 온 힘을 쏟고 있습니다. 또한 학부모들에게는 막연한 자녀의 진로 설계에 도움을 드리고자 최선을 다할 것입니다. <br>
				4차 산업혁명, AI 혁명 등으로 청소년들이 만나게 될 미래는 더욱 복잡하고 빠르게 변하게 될 것입니다. AI의 발전으로 우리는 이전에 있던 직업을 못 보게 될 수도 있고, 새로 생겨난 다양한 직업을 만나게 될 수도 있습니다.
			</p>
			<p>우리시는 이런 상황에서 지역과 함께 청소년을 위한 다양한 진로진학 프로그램을 운영하는 것이 반드시 필요한 일임을 인식하고 미래 사회에 꼭 필요한 인재로 우리 청소년들을 육성해 나가겠습니다.</p>
			<p>진로진학플랫폼을 통해 청소년 누구나, 언제나, 어디서나 원하는 학습을 할 수 있도록 청소년과 학부모의 의견을 적극적으로 반영하여 운영해 나가겠습니다. <br>
				시민 여러분의 적극적인 많은 관심과 참여를 부탁드립니다.</p>
		</div>
		
		<div class="sign_box">
			<p>양주시장 <span>강수현</span></p>
		</div>
	</div>

</div>
                    </div>
					
					






	


	


	


	<footer class="sub_foot">
		<div class="satisfaction">
			<h3 class="h0 skip">담당자 정보</h3>
				<div class="manager_info clearfix">
					<ul class="clearfix">
									
							<li><span>담당부서</span> 복지교육국</li>
						
									
							<li><span>담당팀</span> 교육특구TF팀</li>
						
						
							<li><span>전화번호</span> 031-8082-7954</li>
							
						
						
							<li class="date"><span>최종수정일</span> 2024.06.12</li>
														
					</ul>
				</div>
		</div>
	</footer>
                
                </article>
            </main>
        
        </div>
    </div>

    <c:import url="/usr/layout/footer.do" />
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
                            <h2>인사말</h2>
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
								<h3 class="h0">안녕하십니까.<br><span>양주시장 강수현</span>입니다.</h3>
								
								<div class="text_box">
									<p>
										양주시는 교육부의「교육발전특구 시범지역」으로 선정되어 경기북부를 대표하는 교육도시로 도약하고 있습니다.
										<br>이러한 변화의 흐름 속에서, <span>청소년과 학부모께</span> 보다 체계적이고 신뢰할 수 있는 진로·진학 정보를 <span>제공하고자 「양주시 진로·진학 플랫폼」</span>을 구축하였습니다.
									</p>
									<p>
										진로와 진학은 단순한 선택을 넘어, 학생 개개인의 <span>삶의 방향과 미래를</span> 설계하는 중요한 과정입니다.
										교육과정과 입시제도의 <span>지속적인 변화는 물론</span>, 4차 산업혁명과 AI 기술 확산 등 급변하는 교육·산업 환경 속에서 청소년들이 자신의 적성과 가능성을 발견하고 미래를 준비할 수 있도록 공공의 역할은 더욱 중요해지고 있습니다.
									</p>
									<p>
										양주시는 본 플랫폼을 통해 <span>학생 개개인의 특성과 성장 단계에 맞춘 맞춤형 진로·진학 지원을 제공</span>하고,
										AI·디지털 교육을 비롯한 미래역량 강화 프로그램과 방과후 돌봄·활동을 <span>유기적으로 연계하여</span> 청소년이 균형 있게 성장할 수 있는 교육 환경을 조성해 나가고자 합니다. 
									</p>
									<p>
										이를 통해 청소년들이 변화하는 사회에 능동적으로 대응하며, 지역과 함께 성장하는 미래 인재로 나아갈 수 있도록 적극 지원하겠습니다.
										앞으로도 양주시는 청소년과 학부모의 목소리에 귀 기울이며, 누구나 언제 어디서나 자신의 진로와 미래를 준비할 수 있는 열린 진로·진학 지원체계를 지속적으로 발전시켜 나가겠습니다.<br>
										시민 여러분의 많은 관심과 적극적인 참여를 부탁드립니다. 감사합니다.
									</p>
								</div>
								
								<div class="sign_box">
									<p>양주시장 <span>강수현</span></p>
								</div>
							</div>
						</div>
					</div>

<style>
	.text_box span {
		color : #e14900
	}
</style>
					
					






	


	


	


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
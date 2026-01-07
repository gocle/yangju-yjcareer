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
                            <p class="first_title">교육 네트워크</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>진로교육콘텐츠</h2>
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
                    
                    
                    <div id="contents" class="cts4142">
						<div class="service cts4142">
							<div class="title_box n4">
								<div class="box_wrap">
									<h3 class="box_title">진로교육컨텐츠 안내</h3>
									<p>학생들이 자신의 미래 직업과 진로를 탐색하고 준비할 수 있도록 도와주는 교육 자료입니다. <br>
										이 콘텐츠는 다양한 직업군에 대한 이해를 높이고, 개인의 흥미와 적성에 맞는 직업을 찾을 수 있도록 지원합니다. </p>
									<p>체계적인 진로교육콘텐츠는 꿈길 체험처, 지역 진로교사 등으로 구성되어 있으며, 학생들의 자기 이해와 목표 설정, 문제 해결 능력 등을 향상시키는 데 큰 도움을 줍니다.<br>
										이를 통해 학생들은 자신만의 성공적인 커리어를 구축할 수 있는 토대를 마련할 수 있습니다.
									</p>
								</div>
							</div>
	
	<div class="box">
		<div class="box_inner">
			<i class="service_bg"></i>
			<div class="img_box">
				<div class="img_item">
					<a href="https://www.youtube.com/live/X9mU6fiXfx4" target="_blank" title="새창" rel="noopener noreferrer" class="img_anchor">
						<span class="img_title">2023년 양주시 펜타킬샘 대학입시설명회_최승해 입시전문가</span>
					</a>
				</div>
				<div class="img_item">
					<a href="https://www.youtube.com/live/wGkEcdnWTZw" target="_blank" title="새창" rel="noopener noreferrer" class="img_anchor">
						<span class="img_title">[LIVE] 변화의 중심 대학입시설명회 [중등대상]_최승해 입시전문가
						</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
                    </div>
                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

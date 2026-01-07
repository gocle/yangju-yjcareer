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
                            <h2>지역 진로교사 안내</h2>
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
                    
                    
                    <div id="contents" class="cts4141">
						<div class="service cts4141">
	<div class="title_box n3">
		<div class="box_wrap">
			<h3 class="box_title">지역 진로교사 안내</h3>
			<p>청소년의 다양한 직업 체험을 위해 지역의 다양한 전문가와 함께하고 있습니다. 소정의 교육 과정을 이수하고 우리시의 청소년들을 위해 양질의 강의를 진행해주시는
				지역 진로교사 분들의 강의를 많이 시청하여 주시고 응원 부탁드립니다.</p>
			<p class="caution_call">지역의 청소년을 위해 참여를 원하시는 경우 양주진로진학지원센터<span>(031-8082-7954)</span>로 연락 바랍니다.</p>
		</div>
	</div>
	
	<div class="box">
		<div class="box_inner">
			<i class="service_bg"></i>
			<div class="img_box">
				<div class="img_item">
					<img src="/yjcareer/assets/site/yjcareer/images/contents/cts4141_img01.png" alt="지역 진로교사 안내1">
				</div>
				<div class="img_item">
					<img src="/yjcareer/assets/site/yjcareer/images/contents/cts4141_img02.png" alt="지역 진로교사 안내2">
				</div>
				<div class="img_item">
					<img src="/yjcareer/assets/site/yjcareer/images/contents/cts4141_img03.png" alt="지역 진로교사 안내3">
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

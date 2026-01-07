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
                            <p class="first_title">학습지원서비스</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>학습지원서비스안내</h2>
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
                    
                    
                    <div id="contents" class="cts4135">
						<div class="service">
	<div class="title_box n2">
		<div class="box_wrap">
			<h3 class="box_title">학습지원 서비스 안내</h3>
			<p>학습코치 양성 프로그램을 국내 우수한 대학생들에게 교육하고 학습코치로 양성하여 도움이 필요한 청소년과 연결하여 체계적인 학습 코칭을 지원하겠습니다.</p>
		</div>
	</div>
	
	<div class="box">
		<div class="box_inner">
			<i class="service_bg"></i>
			<div class="img_box">
				<div class="img_item">
					<img src="/yjcareer/assets/site/yjcareer/images/contents/service_img01.png" alt="학습지원 서비스 안내1">
				</div>
				<div class="img_item">
					<img src="/yjcareer/assets/site/yjcareer/images/contents/service_img02.png" alt="학습지원 서비스 안내2">
				</div>
				<div class="img_item">
					<img src="/yjcareer/assets/site/yjcareer/images/contents/service_img03.png" alt="학습지원 서비스 안내3">
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

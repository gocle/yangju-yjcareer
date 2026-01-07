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
                            <p class="first_title">진로진학교육</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>비전 및 목표</h2>
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
						<div class="vision">
	<div class="section one">
		<div class="left_title"><p>비전</p></div>
		<div class="right_box">
			<p class="title">미래선도의 교육도시</p>
		</div>
	</div>
	<div class="section two">
		<div class="left_title"><p>추진목표</p></div>
		<div class="right_box">
			<div class="sub_title_wrap">
				<p class="sub_title">미래로 도약하는 Jump-Up 양주 아이(I)</p>
			</div>
		</div>
	</div>
	<div class="section three">
		<div class="left_title"><p>추진전략</p></div>
		<div class="right_box">
			<ul class="clearfix">
				<li>
					<div class="top"><p>Individual<span>(개성)</span></p></div>
					<div class="bottom">청소년의 고유한 <br> 특성을 반영한 교육</div>
				</li>
				<li>
					<div class="top"><p>Innovation<span>(혁신)</span></p></div>
					<div class="bottom">청소년의 잠재력을 <br> 매일 혁신하는 교육</div>
				</li>
				<li>
					<div class="top"><p>Integration<span>(통합)</span></p></div>
					<div class="bottom">청소년이 지역과 함께 <br> 자라도록 하는 교육</div>
				</li>
				<li>
					<div class="top"><p>Influence<span>(확장)</span></p></div>
					<div class="bottom">청소년이 미래로, 세계로 <br> 확장하는 교육</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="section four">
		<div class="left_title"><p>추진근거</p></div>
		<div class="right_box">
			<div class="text_wrap">
				<p class="text">진로교육법 제 5조(국가 및 지방자치단체 책무)</p>
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

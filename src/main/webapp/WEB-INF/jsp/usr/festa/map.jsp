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
                            <p class="first_title">JUMP UP 2025 양주 미래교육 페스타</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>오시는 길 안내</h2>
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
                    
                    
                    <div id="contents" class="cts4257">
						<div id="contents" class="cts4257">

  <p style="font-size:30px;padding-bottom:10px">행사장의 <span style="color:red;font-weight:bold">*주차장이 협소*</span>하오니 <span style="color:red;font-weight:bold">임시주차장 이용 및 셔틀버스를 이용</span>해주시기를 바랍니다.</p>
  <img src="/yjcareer/assets/site/yjcareer/images/contents/0623_4.jpg?250702" alt="">




</div>
<!-- content End -->
                    </div>
                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

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
                            <h2>사이트맵</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
						<c:import url="/usr/menu/sub.do" />
						
            
                            <div class="addons">
                                <ul class="addons_list">
                                    <li class="addons_item share">
                                        <button type="button" class="addons_button share_show">공유하기</button>
                                        <div class="share_panel">
                                            <ul class="share_list clearfix">
                                                <li class="share_item n1">
                                                    <a href="javascript:openFacebook();" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">페이스북</a>
                                                </li>
                                                <li class="share_item n2">
                                                    <a href="javascript:openNaverbolg('여주시청');" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">블로그</a>
                                                </li>
                                                <li class="share_item n3">
                                                    <a href="javascript:openKakaoStory();" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">카카오</a>
                                                </li>
                                                <li class="share_item n4">
                                                    <a href="javascript:openTwitter('여주시청');" target="_blank" title="새창" rel="noopener noreferrer" class="share_anchor">트위터</a>
                                                </li>
                                                <li class="share_item n5">
                                                    <a href="#n" onclick="copy()" title="새창" class="share_anchor copy_anchor">주소복사</a>
                                                </li>
                                                <script>
													function openFacebook(){
														var _url = encodeURIComponent(window.location.href);
														openWin2('http://www.facebook.com/sharer/sharer.php?u=' + _url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
														
													}

													function openNaverbolg(txt){
														var _txt = encodeURIComponent(txt);
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://share.naver.com/web/shareView.nhn?url=' + _url + '&title=' + _txt, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
														
													}

													function openKakaoStory(){
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://story.kakao.com/s/share?url=' + _url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
													}

													function openTwitter(txt){
														var _txt = encodeURIComponent(txt);
														var _url = encodeURIComponent(window.location.href);
														openWin2('https://twitter.com/intent/tweet?text='+_txt+'&url='+_url, '', 1000, 800, 0, 0, 1, 1, 0, 0, 0, (screen.width/2), (screen.height/2), 1);
													}
													
													function openWin2(url, winname, width, height, tbar, mbar, sbar, loc, status, resizable, fscreen, left, top, cflag) {
														if(cflag == 'yes' || cflag == 'y' || cflag == '1') {
															left = (window.screen.width - width ) / 2;
															top  = (window.screen.height- height) / 2;
														}

														opening_window = window.open(url, winname, 'width=' + width + ', height=' + height + ', toolbar=' + tbar + ', menubar=' + mbar + ', scrollbars=' + sbar + ', location=' + loc + ', status=' + status + ', resizable=' + resizable + ', fullscreen=' + fscreen + ', left=' + left + ', top=' + top);
														opening_window.focus();
													}

													function openWin2(url, winname, width, height, tbar, mbar, sbar, loc, status, resizable, fscreen, left, top, cflag) {
														if(cflag == 'yes' || cflag == 'y' || cflag == '1') {
															left = (window.screen.width - width ) / 2;
															top  = (window.screen.height- height) / 2;
														}

														opening_window = window.open(url, winname, 'width=' + width + ', height=' + height + ', toolbar=' + tbar + ', menubar=' + mbar + ', scrollbars=' + sbar + ', location=' + loc + ', status=' + status + ', resizable=' + resizable + ', fullscreen=' + fscreen + ', left=' + left + ', top=' + top);
														opening_window.focus();
													}

                                                    function copy() {
                                                        var url = '';
                                                        var textarea = document.createElement("textarea");
                                                        document.body.appendChild(textarea);
                                                        url = window.document.location.href;
                                                        textarea.value = url;
                                                        textarea.select();
                                                        document.execCommand("copy");
                                                        document.body.removeChild(textarea);
                                                        alert("URL이 복사되었습니다.")
                                                    }
                                                </script>
                                            </ul>
                                            <button type="button" class="share_hide">닫기</button>
                                        </div>
                                    </li>
                                    <li class="addons_item print">
                                        <button type="button" onclick="window.print();" class="addons_button">인쇄</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                    
                    
					<div id="contents" class="cts4151">
						<div id="sitemap">
							<div class="sitemap_wrap clearfix">
								<c:set var="upperMenuNo" value="TOP"/>
								<c:set var="menuLevel" value="1"/>
								<c:set var="key1" value="${upperMenuNo}_${menuLevel}"/>
								
						         <c:forEach var="m1" items="${menuList[key1]}" varStatus="st1">
							        <div class="type1">
				         				<c:set var="menuPathList" value="${fn:split(menu.menuUrl, '@')}" />
				         				<%-- 1depth URL 정규화 --%>
								        <c:set var="raw1" value="${m1.menuUrl}" />
								        <c:set var="path1"
								               value="${fn:startsWith(raw1, ctx) ? fn:substring(raw1, fn:length(ctx), fn:length(raw1)) : raw1}" />
								        <c:if test="${not fn:startsWith(path1,'/')}">
								          <c:set var="path1" value='/${path1}'/>
							        	</c:if>
					
					        			<c:set var="key2" value="${m1.menuId}_${m1.menuDepth + 1}" />
					        
					  					<h3>
								           	 <a href="<c:url value='${path1}'/>?menuId=${m1.menuId}">
									            ${m1.menuTitle}
									          </a>
										</h3>
										
										<c:if test="${not empty menuList[key2]}">
											<div class="sitemap_row clearfix">
												<c:forEach var="m2" items="${menuList[key2]}">
							
								                    <c:set var="key3" value="${m2.menuId}_${m2.menuDepth + 1}" />
								
								                    <%-- 2depth URL 정규화 --%>
								                    <c:set var="raw2" value="${m2.menuUrl}" />
								                    <c:set var="path2"
								                           value="${fn:startsWith(raw2, ctx) ? fn:substring(raw2, fn:length(ctx), fn:length(raw2)) : raw2}" />
								                    <c:if test="${not fn:startsWith(path2,'/')}">
								                      <c:set var="path2" value='/${path2}'/>
								                    </c:if>
								                    
								                    
														<div class="sitemap_item">
															<h4 class="h0">
																<a href="<c:url value='${path2}'/>?menuId=${m2.menuId}">${m2.menuTitle}</a>
															</h4>
															<c:if test="${not empty menuList[key3]}">
															<ul class="bu">
																<c:forEach var="m3" items="${menuList[key3]}">
								
									                              <%-- 3depth URL 정규화 --%>
									                              <c:set var="raw3" value="${m3.menuUrl}" />
									                              <c:set var="path3"
									                                     value="${fn:startsWith(raw3, ctx) ? fn:substring(raw3, fn:length(ctx), fn:length(raw3)) : raw3}" />
									                              <c:if test="${not fn:startsWith(path3,'/')}">
									                                <c:set var="path3" value='/${path3}'/>
									                              </c:if>
									
									                              <li>
									                                <a href="<c:url value='${path3}'/>?menuId=${m3.menuId}"
									                                   target="_self">
									                                  ${m3.menuTitle}
									                                </a>
									                              </li>
									                              </c:forEach>
									                              </ul>
															</c:if>
		
														</div>
							                    </c:forEach>
						                    </div>
						                    
										</c:if>
									</div>

			        			</c:forEach>
				        	</div>
				      	</div>
				   </div>

                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />
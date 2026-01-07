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
                            <p class="first_title">프로그램 신청</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>프로그램 신청 안내</h2>
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
                    
                    
                    <div id="contents" class="cts4128">
						<div class="application">
	<div class="title_box">
		<div class="box_wrap">
			<h3 class="box_title">프로그램신청 안내</h3>
			<p>우리시는 미래 사회에 살아갈 청소년이 세계 속에서 경쟁력을 갖출 수 있도록 다양한 프로그램을 지원하고 있습니다. 많은 관심과 참여 부탁드립니다. </p>
		</div>
	</div>
	<h3>인터넷 접수</h3>
	<p>인터넷 수강신청은 아래와 같은 절차로 이용하시면 빠르고 편리하게 이용하실 수 있습니다.</p>
	<div class="box color">
		<div class="box_inner">
			<ol class="num">
				<li>
					<span class="list">1</span>
					<P class="num_title">본인인증</P>
					<p class="sub_title">(우측상단)</p>
				</li>
				<li>
					<span class="list">2</span>
					<P class="num_title">수강신청</P>
				</li>
				<li>
					<span class="list">3</span>
					<P class="num_title">강좌선택 <br> 수강신청 버튼클릭</P>
				</li>
				<li>
					<span class="list">4</span>
					<ul>
						<li>
							<P class="num_title">1.선착순 수강신청</P>
							<p class="sub_title">예약확인 클릭 후 전자결제</p>
						</li>
						<li>
							<P class="num_title">2.승인 수강신청</P>
							<p class="sub_title">나의예약 클릭 후 전자결제 <span>(신용카드/실시간계좌이체/가상계좌 결제가능) </span></p>
						</li>
					</ul>
				</li>
				<li>
					<span class="list">5</span>
					<P class="num_title">완료</P>
				</li>
			</ol>
		</div>
	</div>
	
	<h3>수강신청시 유의사항</h3>
	<ul class="bu bottom_bu">
		<li>학부모가 청소년을 대신해서 신청 시에는 반드시 학생의 정보를 기재해 주시기 바랍니다.</li>
                <li>프로그램 신청은 한 번에 1명만 가능합니다. (메모란에 자녀 2명 이상 기재하여도 1명의 자녀만 신청이 된 것으로 봅니다.)</li>
		<li>프로그램별 등록 정원의 60% 미만으로 모집된 경우 폐강될 수 있습니다.</li>
		<li>수업 방해 및 다른 학습자에게 피해를 주는 경우 수강이 제한될 수 있습니다.</li>
		<li>프로그램 신청 시 프로그램 운영에 참여를 위한 개인정보를 기재하는 경우 「개인정보보호법」 제15조, 제17조 및 제22조에 따라 본인의 개인 정보의 처리(수집·이용·제공) 및 초상권 사용에 관한 사항을<br>아래와 같이 동의하는 것으로 간주합니다.<br>※ 만14세 미만은 법정대리인의 동의가 필요합니다.<br>
- 수집‧이용 항목(기재한 내용 및 초상권이 인정되는 사진)<br>
- 수집‧이용 목적(진로진학지원센터 프로그램 운영‧참여, 초상권: 사업 결과 공유와 사업홍보를 위한 보도자료 및 양주시 공식 SNS 등 온라인 매체 게재)<br>
- 이용‧보유기간: 서비스 종료 후 1년 동안 보관하고 이후에는 폐기합니다. <br>※ 초상권의 경우 언론 매체 및 온라인매체 등에 보도/게재되는 경우 즉각 폐기되지 않습니다.<br>
- 제3자제공(진로진학지원센터 프로그램 위탁운영기관, 초상권: 보도자료 활용기관 신문사 등, 양주시 공식 SNS 계정)<br>
※ 위의 개인정보, 초상권 수집‧이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 프로그램 운영(신청자 연락 및 여행자보험가입 등)에 제한을 받을 수가 있습니다.<br>
※ 수집한 개인정보는 정보주체의 동의 없이 수집한 목적 외로 사용하거나 사업운영관련 외 제3자에게 제공되지 않습니다.<br>
※ 정보주체는 개인정보 열람 및 정정요구, 초상권 사용 중지 요구 등을 할 수 있습니다.  
</li>

	</ul>
</div>
                    </div>
					
					








                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

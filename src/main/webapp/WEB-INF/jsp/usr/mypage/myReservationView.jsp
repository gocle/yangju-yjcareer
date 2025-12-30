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
                            <h2>특별 교육 프로그램 신청</h2>
                        </div>
                        
                        <div class="sub_head_wrap">
                            



<div class="breadcrumbs">
	<a href="./index.do" class="home">홈</a>
	<ol class="breadcrumbs_list">
		<li class="breadcrumbs_item">
			<a href="" class="breadcrumbs_anchor mobile">프로그램 신청</a>
			<button type="button" class="breadcrumbs_select" title="목록열기">프로그램 신청</button>
			<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4123"  target="_self" >진로진학교육</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" class="active">프로그램 신청</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4135"  target="_self" >학습지원서비스</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4254"  target="_self" >JUMP UP 2025 양주 미래교육 페스타</a></li>
					<li class="tab_item"><a href="/yjcareer/contents.do?key=4141"  target="_self" >교육 네트워크</a></li>
					<li class="tab_item"><a href="/yjcareer/selectBbsNttList.do?bbsNo=530&key=4145"  target="_self" >알림마당</a></li>
					<li class="tab_item"><a href="/yjcareer/sitemap.do?key=4151"  target="_self" >홈페이지 가이드</a></li>
			</ul>
		</li>

				
				
					<li class="breadcrumbs_item">
						<a href="" class="breadcrumbs_anchor mobile">프로그램 신청</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">프로그램 신청</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/contents.do?key=4128"  target="_self" >프로그램 신청 안내</a>	</li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4130"  target="_self" class="active">프로그램 신청</a>	</li>
						</ul>
					</li>
				
				
				
				
				

				
					<li class="breadcrumbs_item">
						<a href="" class="breadcrumbs_anchor mobile">특별 교육 프로그램 신청</a>
						<button type="button" class="breadcrumbs_select" title="목록열기">특별 교육 프로그램 신청</button>
						<ul class="breadcrumbs_panel">
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4130"  target="_self" >진로진학 컨설팅 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4131"  target="_self" >진로 프로그램 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4132"  target="_self" >진학 프로그램 신청</a></li>
									<li class="tab_item"><a href="/yjcareer/selectEduLctreWebList.do?key=4133"  target="_self" class="active">특별 교육 프로그램 신청</a></li>
						</ul>
					</li>
				
	</ol>
</div>
            
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
                    
                    
                    <div id="contents" class="cts4133">
						<div class="education_request">
	<h3>프로그램 기본정보</h3>
	<div class="education_viewtable">
		<div class="titlebox">
			<span class="state receiving">
				<c:choose>
					<c:when test="${resultMap.status eq 'be'}">접수예정</c:when>
					<c:when test="${resultMap.status eq 'ing'}">접수진행중</c:when>
					<c:when test="${resultMap.status eq 'end'}">접수마감</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</span>
			<span class="title">${resultMap.subjNm }</span>
		</div>
		<div class="conbox">
			<ul class="clearfix">
				<li class="clearfix">
					<em>교육기관</em>
					<p>${resultMap.comTitle }</p>
				</li>
				<li class="clearfix">
					<em>교육장소</em>
					<p>${resultMap.location }</p>
				</li>
				<li class="clearfix">
					<em>기수</em>
					<p>${resultMap.sessionNm}</p>
				</li>
				<li class="clearfix">
					<em>분류</em>
					<p>${resultMap.cateNm }</p>
				</li>
				
				<c:set var="lastCode" value="" />
				<c:forEach var="code" items="${codeList}">
				    <c:if test="${fn:contains(resultMap.eduTarget, code.codeCode)}">
				        <c:set var="lastCode" value="${code.codeCode}" />
				    </c:if>
				</c:forEach>
				
				<li class="clearfix">
					<em>수강대상</em>
					<p>
						<c:forEach var="code" items="${codeList}">
							 <c:if test="${fn:contains(resultMap.eduTarget, code.codeCode)}">
				                ${code.codeName}<c:if test="${code.codeCode ne lastCode}">, </c:if>
				            </c:if>
						</c:forEach>
					</p>
				</li>
				<li class="clearfix">
					<em>모집방법</em>
					<p>
						<c:if test="${resultMap.enrollType eq '1'}">선착순</c:if>
						<c:if test="${resultMap.enrollType eq '2'}">승인</c:if>
					</p>
				</li>
				<li class="clearfix">
					<em>접수기간</em>
					<p>${resultMap.enrollStartDt }~${resultMap.enrollEndDt }</p>
				</li>
				<li class="clearfix">
					<em>모집인원</em>
					<p>정원 : ${resultMap.capacity }명 / 대기 : ${resultMap.waitEnrollCnt }명</p>
				</li>
				<li class="clearfix">
					<em>교육기간</em>
					<p>${resultMap.learnStartDt }~${resultMap.learnEndDt }</p>
				</li>
				<li class="clearfix">
					<em>전화번호</em>
					<p>${resultMap.tel }</p>
				</li>
				<li class="clearfix">
					<em>강의계획서</em>
					<p>${resultMap.subjPlan }</p>
				</li>
				<li class="clearfix nonfloat">
					<em>유의사항</em>
					<p>${resultMap.subjDesc }</p>
				</li>
			</ul>
		</div>
	</div>
	<div class="bbs_info clearfix">
        <div class="bbs_left">
			<h3>교육생 정보</h3>
		</div>
		<div class="bbs_right">
		</div>
	</div>
	<div class="education_formbox">
	<form id="detailForm" name="detailForm" method="post">
		<input type="hidden" id="seqCd" name="seqCd" value="${myPageVo.seqCd}" />
		<table class="bbs_default write basic_table">
			<caption>교육생 정보입력 - 신청자, 성별, 휴대전화, 거주지 입력</caption>
			<colgroup>
				<col /><!-- css로 제어함 -->
				<col /><!-- css로 제어함 -->
				<col /><!-- css로 제어함 -->
				<col /><!-- css로 제어함 -->
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">예약번호</th>
				<td>${myPageVo.seqCd}</td>
				<th scope="row">예약상태</th>
				<td>${myPageVo.enrollStatusNm}</td>
			</tr>
			<tr>
				<th scope="row">신청자 <span class="exactly y">필수</span></th>
				<td>${myPageVo.memName}</td>
				<th scope="row">성별 <span class="exactly y">필수</span></th>
				<td>
					<div class="radio_parent">
						<span class="temp_checkbox">
							<input name="sexdstn" id="sexdstn1" type="radio" value="M" required="required" ${myPageVo.sexdstn eq 'M' ? 'checked' : ''}/><label for="sexdstn1">남</label>
						</span>
						<span class="temp_checkbox">
							<input name="sexdstn" id="sexdstn2" type="radio" value="W" required="required" ${myPageVo.sexdstn eq 'W' ? 'checked' : ''}/><label for="sexdstn2">여</label>
						</span>
					</div>	
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="agrde">연령대</label> <span class="exactly y">필수</span></th>
				<td colspan="3">
					<select id="ageGroup" name="ageGroup" title="연령대 선택" class="select">
						<option value="" ${empty userInfo.ageGroup ? 'selected="selected"' : ''}>연령대 선택</option>
						<c:forEach var="age" items="${ageList}">
							<option value="${age.codeCode}" ${myPageVo.ageGroup eq age.codeCode ? 'selected="selected"' : ''}>${age.codeName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">학교명</th>
				<td><input type="text" name="schoolNm" id="schoolNm" style="width:100%;" value="${myPageVo.schoolNm }" class="temp_textbox"/></td>
				<th scope="row">학년</th>
				<td>
					<select id="grade" name="grade" title="학년 선택" class="select">
						<option value="" ${empty myPageVo.grade ? 'selected="selected"' : ''}>학년 선택</option>
						<c:forEach var="grade" items="${gradeList}">
							<option value="${grade.codeCode}" ${myPageVo.grade eq grade.codeCode ? 'selected="selected"' : ''}>${grade.codeName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="moblphon1">휴대전화</label> <span class="exactly y">필수</span></th>
				<td colspan="3">
					<input type="text" id="hpTel1" name="hpTel1" size="3" maxlength="3" value="${myPageVo.hpTel1 }" class="temp_textbox numberOnly" />
				    -
				    <input type="text" id="hpTel2" name="hpTel2" size="4" maxlength="4" value="${myPageVo.hpTel2 }" class="temp_textbox numberOnly" />
				    -
				    <input type="text" id="hpTel3" name="hpTel3" size="4" maxlength="4" value="${myPageVo.hpTel3 }" class="temp_textbox numberOnly" />
				    <div class="smsbox">
						<p class="point">※ 연락이 원활하도록 보호자의 연락처를 기재해주세요.</p>
						<span class="label">예약상황 문자 수신 여부&nbsp;&nbsp;</span>
						<span class="temp_checkbox">
							<input name="smsYn" id="smsYn" type="checkbox" value="Y" title="예약상황 문자 수신 받음" ${myPageVo.smsYn eq 'Y' ? 'checked' : ''}/>
							<label for="smsYn">받음</label>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="adres">주소</label> <span class="exactly y">필수</span></th>
				<td colspan="3">
					<div class="address">
						<input type="text" name="zipcode" id="zipcode" value="${myPageVo.zipcode }" title="우편번호" class="temp_textbox" readonly="readonly" placeholder="우편번호" /> 			
						<button type="button"  class="btn type2 small" onclick="openDaumZipAddress();">도로명주소검색</button> <br/>
						<input id="address" name="address" placeholder="상세주소" class="temp_textbox margin_t_10 full_size" type="text" value="${myPageVo.address }" size="50" maxlength="100"/>
						<input type="hidden" path="detailAdres" placeholder="상세주소" maxlength="250" size="50" class="temp_textbox margin_t_10 full_size" />      
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="resdncDetail">거주지</label> <span class="exactly y">필수</span></th>
				<td colspan="3">
					<select id="resdncDetail" name="resdncDetail" title="거주지 읍면동 선택" class="select" required="required">
						<option value="">거주지 선택</option>
						<c:forEach var="resdn" items="${resdncList}">
							<option value="${resdn.codeCode}" ${myPageVo.resdncDetail eq resdn.codeCode ? 'selected="selected"' : ''}>${resdn.codeName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">메모</th>
				<td colspan="3">
					<div class="memo clearfix">
						<div class="left">
							<textarea id="memo" name="memo" style="height:100px">${myPageVo.memo }</textarea>
						</div>
						<div class="memobox">
							<p class="point">※ 신청자에는 실 수강자 이름을 적어주세요.</p>
						</div>
					</div>
				</td>
			</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>

<div class="bbs_btn_wrap clearfix">
	<c:if test="${myPageVo.enrollStatusCd eq 'A' or myPageVo.enrollStatusCd eq 'B'}">
		<div class="bbs_left">
			<a href="#" onclick="fn_canclEduApplcnt('${myPageVo.seqCd}');" class="btn type4"><span>수강취소</span></a>
		</div>
	</c:if>
	<div class="bbs_right">
		<c:if test="${myPageVo.enrollStatusCd eq 'A' or myPageVo.enrollStatusCd eq 'B'}">	
			<a href="#" onclick="fn_updateReservation();" class="btn type2"><span>정보수정</span></a>
		</c:if>
		<a href="${contextRoot}/usr/mypage/myReservation.do?pageIndex=1" class="btn bg_color1">목록</a>
	</div>
</div>

<script>
//<![CDATA[
	function fn_canclEduApplcnt(seqCd) {
		if(confirm("확인을 클릭하시면 수강취소가 완료됩니다.\n취소하신 교육은 재수강신청이 불가능할 수 있습니다.\n수강취소하시겠습니까?") ) {
			
			$.ajax({
		        url: "${contextRoot}/usr/mypage/myReservationCancl.do",
		        type: "POST",
		        data: { seqCd: seqCd },
		        success: function(response) {
		            if (response.result === "success") {
		                alert("수강취소가 완료되었습니다.");
		                window.location.href = "${contextRoot}/usr/mypage/myReservation.do";
		            } else {
		                alert("수강취소 중 오류가 발생했습니다.");
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error(error);
		            alert("서버 통신 중 오류가 발생했습니다.");
		        }
		    });
		}
	}
	
	function fn_popWindow( url, name, style) {
		window.open(url, name, style);
	}
	
	function isNumber(msg) {
		if (isEmpty(msg)) return false;
		var	i	= 0;
		for (i=0; i <= msg.length-1; i++) {
		   ch = msg.substring(i,i+1);
		   if (ch < "0" || ch > "9") {
		      return false;
		   }
		}
		return true;
	}
	
	function isEmpty(str) {
		str	= trim(str);
		return str == '' ? true : false;
	}

	function trim(str) {
		str	+= '';
		return str.replace(/^\s*|\s*$/g, '');
	}
	
	function fn_updateReservation() {
		var form = document.getElementById("detailForm"); 
		
		var sexdstnCnt=0;
		for(var i=0; i<form.sexdstn.length;i++){             
			if (form.sexdstn[i].checked==true) {
				sexdstnCnt++;
			}
		}
		if (sexdstnCnt == 0) {
			alert("성별을 선택해주세요.");
			form.sexdstn1.focus();
			return false;
		}
	
		if( !form.ageGroup.value ) {
			alert("연령대를 선택해주세요.");
			form.ageGroup.focus();
			return false;
		}
		
		if (form.ageGroup.value != "ADT") {
			if( !form.schoolNm.value ) {
				alert("학교명을 입력해주세요.");
				form.schoolNm.focus();
				return false;
			}
			
			if( !form.grade.value ) {
				alert("학년을 선택해주세요.");
				form.grade.focus();
				return false;
			}
		}
		
		if (!form.hpTel2.value) {
			alert("휴대폰 중간자리를 입력하세요.");
			form.moblphon2.focus();
			return false;
		}

		if (!isNumber(form.hpTel2.value)) {
			alert('휴대폰 중간자리를 숫자로 입력하세요');
			form.hpTel2.focus();
			return false;
		}	

		if (!form.hpTel3.value) {
			alert("휴대폰 끝자리를 입력하세요.");
			form.hpTel3.focus();
			return false;
		}

		if (!isNumber(form.hpTel3.value)) {
			alert('휴대폰 끝자리를 숫자로 입력하세요');
			form.hpTel3.focus();
			return false;
		}

		if( !form.address.value ) {
			alert("주소를 입력해주세요.");
			form.address.focus();
			return false;
		}
		
		if( !form.resdncDetail.value ) {
			alert("거주지를 선택해주세요.");
			form.resdncDetail.focus();
			return false;
		}
		
		if(confirm("수정하시겠습니까?") ) {
			$.ajax({
		        url: "${contextRoot}/usr/mypage/myReservationUpdate.do",
		        type: "POST",
		        data: $("#detailForm").serialize(),
		        success: function(response) {
		            if (response.result === "success") {
		                alert("정보수정이 완료되었습니다.");
		                window.location.href = "${contextRoot}/usr/mypage/myReservation.do";
		            } else {
		                alert("정보수정 중 오류가 발생했습니다.");
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error(error);
		            alert("서버 통신 중 오류가 발생했습니다.");
		        }
		    });
		}
	}
//]]>
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script nonce="NEOCMSSCRIPT">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				$("#zipcode").val(data.zonecode);
				$("#address").val(data.address);
				$("#detailAdres").focus();
				$("#detailAdres").show();
				console.log(data);
			}
		}).open();
	}
</script>


                    </div>
                </article>
            </main>
        </div>
    </div>
	
<c:import url="/usr/layout/footer.do" />
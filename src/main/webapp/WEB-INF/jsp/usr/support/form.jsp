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
                            <h2>학습 상담</h2>
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
                    
                    
                    <div id="contents" class="cts4139">
						<script>
//<![CDATA[
	function popUpCommonSimple( path , winName , widthSize , heightSize ){
		var winHandle;
		var topPoint = (window.screen.height-heightSize)/2;
		var leftPoint = (window.screen.width-widthSize)/2;
		if(winHandle)winHandle.close();
		 winHandle = window.open( path , winName, "width="+ widthSize +", height=" + heightSize + ", status=0, location=0, menubar=0, toolbar=0, scrollbars=auto, help=0, hide=0, center=yes, left=" + leftPoint + ", top=" + topPoint );
		if(winHandle==null){
		   alert("사용자 설정에 의해 팝업이 차단되었습니다. \n\n자세한 내용을 보시려면 [도구]-[인터넷옵션]-[개인정보] 화면에서 팝업차단 체크를 해제하여 주십시오."); 
		}else{
		 winHandle.focus();
		}
		return winHandle;
	}
		 
	function findDoro(){
		var pop = window.open("/common/doro/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
		document.bbsNttForm.zip.value = zipNo;
		document.bbsNttForm.adres.value = roadAddrPart1 + " " + roadAddrPart2;
		document.bbsNttForm.detailAdres.value = addrDetail;
	}

	function checkMailDomain(str) {
		var reg = /^[0-9a-z-]+(\.[_0-9a-z-\/\~]+)+(:[0-9]{2,4})*$/;
		return reg.test(str);
	}

	function noScriptDisplay(id, size){

		if(size == 0){
			document.getElementById(id).style.display="inline-block";
		}else{
			for (i=1;i<=size;i++)
			{
				document.getElementById(id+i).style.display="inline-block";
			}
		}
	}

	function fnDomainCheck( ) {

		if(bbsNttForm.emaillist.value == '1'){
			bbsNttForm.email2.readOnly = false;
			bbsNttForm.email2.value = '';
			bbsNttForm.email2.focus();
		} else {
			bbsNttForm.email2.readOnly = true;
			bbsNttForm.email2.value = bbsNttForm.emaillist.value;
		}

	}
//]]>
</script>


<script>
//<![CDATA[



function fn_validatorBbsNtt( frm ) {

	
	
                if( fn_isEmpty( frm, 'nttSj') ) {
                    alert(fn_getMessage("INPUT", '제목'));
                    fn_setFocus(frm, 'nttSj');
                    return false;
                }
				
		
                if( fn_isEmpty( frm, 'nttCn') ) {
                    alert(fn_getMessage("INPUT", '내용'));
                    fn_setFocus(frm, 'nttCn');
                    return false;
                }

	return true;
	
}

//]]>
</script>


<form name="bbsNttForm" id="bbsNtt" method="post" action="./addBbsNtt.do" onsubmit="return fn_validatorBbsNtt(this)" enctype="multipart/form-data">
<fieldset>
<legend>게시물 작성</legend>
	<input type="hidden" name="key" id="key" value="4139"/>
	<input type="hidden" name="bbsNo" id="bbsNo" value="531"/>
	<input type="hidden" name="integrDeptCode" id="integrDeptCode" value=""/>	
	<input type="hidden" name="noticeAt" id="noticeAt" value="N" />

<!-- 양주시청 : 온라인원탁토론신청 동의서 폼 -->

<!-------------------------------------------->

<p class="write_guide">글 작성시 <span class="exactly y">필수</span> 표시된 항목은 꼭 기재해 주세요</p>
	<table class="bbs_default write">
		<caption>학습상담 글쓰기 - 제목, 작성자, 내용, 파일 입력 </caption>
        <tbody>

		<tr>
			<th scope="row"><label for="nttSj">제목</label> <span class="exactly y">필수</span></th>
			<td class="subject"><input type="text" name="nttSj" id="nttSj" style="width:540px;" value=""/></td>
		</tr>
	

		<tr>
			<th scope="row"><label for="writerNm">작성자</label> <span class="exactly y">필수</span></th>
			<td>
				
					
							
						김소현
					
									
			</td>
		</tr>

	

		<tr>
			<th scope="row"><label for="nttCn">내용</label> <span class="exactly y">필수</span></th>
			<td>
					<textarea name="nttCn" id="nttCn" rows="10" cols="5" style="width:540px; height:300px" class="bbs_content"></textarea>
			</td>
		</tr>
	

		<tr>
			<th scope="row">파일 <span class="exactly"></span>
				
			</th>
			<td>
				<ul class="attach">
					<li>
						<div class="attach_file">
							<label for="atchmnfl_0" class="file_label">첨부파일_0</label>
							<span class="file_input"><input type="file" name="atchmnfl" id="atchmnfl_0" class="file" /></span>
								<span class="content_in"><input type="checkbox" name="bdtInsrtAt" id="bdtInsrtAt_0" value="0" /> <label for="bdtInsrtAt_0"><span class="skip">0번 첨부파일</span>본문삽입</label></span>
						</div>
						<div class="attach_alt">
							<label for="replcText_0" class="alt_label">첨부파일_0에 대체텍스트</label>
							<span class="alt_input"><input type="text" name="replcText" id="replcText_0" placeholder="첨부 이미지 대체콘텐츠 입력"  /></span>
						</div>
					</li>
					<li>
						<div class="attach_file">
							<label for="atchmnfl_1" class="file_label">첨부파일_1</label>
							<span class="file_input"><input type="file" name="atchmnfl" id="atchmnfl_1" class="file" /></span>
								<span class="content_in"><input type="checkbox" name="bdtInsrtAt" id="bdtInsrtAt_1" value="1" /> <label for="bdtInsrtAt_1"><span class="skip">1번 첨부파일</span>본문삽입</label></span>
						</div>
						<div class="attach_alt">
							<label for="replcText_1" class="alt_label">첨부파일_1에 대체텍스트</label>
							<span class="alt_input"><input type="text" name="replcText" id="replcText_1" placeholder="첨부 이미지 대체콘텐츠 입력"  /></span>
						</div>
					</li>
				</ul>
			</td>
		</tr>

		
	

        </tbody>
    </table>

        <!-- 양주시청 >분야별정보>복지교육> 초등학생 입학축가금 신청 동의서 폼 -->  
	
	 <!-- -------------------------------------------------------------- -->

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_center">
			
				
				
				
				
				
					<input type="submit" value="글등록" class="bbs_btn write">
				
			
            
            <a href="/yjcareer/usr/support/list.do?menuId=2025MENU0000153" class="bbs_btn"><i class="icon"></i><span>목록</span></a>
        </div>
    </div>

</fieldset>
</form>

<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

<script nonce="NEOCMSSCRIPT">
	function openDaumZipAddressAdit(adresField) {
		new daum.Postcode({
			oncomplete:function(data) {
				$("#zip2").val(data.zonecode);
				$("#"+adresField).val('['+data.zonecode+']'+data.address);  
				$("#"+adresField).focus();
			}
		}).open();
	}
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				$("#zip").val(data.zonecode);
				$("#adres").val(data.address);
				$("#detailAdres").focus();
				$("#detailAdres").show();
				$("#addressShow").show();
				$("#addressShow").html("(" + data.zonecode + ") " + data.address + " " );
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

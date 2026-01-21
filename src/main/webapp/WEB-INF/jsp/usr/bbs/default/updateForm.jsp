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
                            <p class="first_title">알림마당</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>학습 후기</h2>
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

	  //삭제하기
	  function fn_egov_deleteFile(atchFileIdx,returnUrl){
	  	
	  	var menuId = $("#menuId").val();
	  	$("#atchFileIdx").val(atchFileIdx);
	  	$("#returnUrl").val(returnUrl);
	  	$("#fileForm").attr("action", "/yjcareer/board/deleteFile.do");
	  	$("#fileForm").submit();
	  	
	  }
</script>


<script>
//<![CDATA[



function fn_validatorBbsNtt( frm ) {

	
	
                if( fn_isEmpty( frm, 'baTitle') ) {
                    alert(fn_getMessage("INPUT", '제목'));
                    fn_setFocus(frm, 'baTitle');
                    return false;
                }
				
		
                if( fn_isEmpty( frm, 'baContentHtml') ) {
                    alert(fn_getMessage("INPUT", '내용'));
                    fn_setFocus(frm, 'baContentHtml');
                    return false;
                }

	return true;
	
}

function fn_isEmpty(form, fieldName) {
    const field = form[fieldName];
    if (!field) return true; // 필드가 존재하지 않으면 비어있는 것으로 간주

    const value = field.value;
    // 값이 없거나, 공백만 있는 경우 true 반환
    return (value === null || value === undefined || value.trim() === "");
}

function fn_getMessage(type, label) {
    var message = "";
    
    switch (type) {
        case "INPUT":
            message = label + "을(를) 입력해 주세요.";
            break;
        case "SELECT":
            message = label + "을(를) 선택해 주세요.";
            break;
        default:
            message = label;
    }
    
    return message;
}

function fn_setFocus(form, fieldName) {
    const field = form[fieldName];
    if (field) {
        field.focus();
    }
}
//]]>
</script>

          <form id="fileForm" name="fileForm" method="post" enctype="multipart/form-data">
		    <input type="hidden" name="atchFileIdx" id="atchFileIdx" />
		    <input type="hidden" name="returnUrl" id="returnUrl" />
		    <input type="hidden" name="menuId" id="menuId" value="${menuId }" />
		  </form>


<form name="bbsNttForm" id="bbsNtt" method="post" action="/yjcareer/usr/bbs/review/updateForm.do?menuId=${menuId }" onsubmit="return fn_validatorBbsNtt(this)" enctype="multipart/form-data">
<fieldset>
<legend>게시물 작성</legend>
	<input type="hidden" name="key" id="key" value="4139"/>
	<input type="hidden" name="bbsNo" id="bbsNo" value="531"/>
	<input type="hidden" name="integrDeptCode" id="integrDeptCode" value=""/>	
	<input type="hidden" name="noticeAt" id="noticeAt" value="N" />
	<input type="hidden" name="baId" id="baId" value="${qnaUpdateResult.baId }" />

<!-- 양주시청 : 온라인원탁토론신청 동의서 폼 -->

<!-------------------------------------------->

<p class="write_guide">글 작성시 <span class="exactly y">필수</span> 표시된 항목은 꼭 기재해 주세요</p>
	<table class="bbs_default write">
		<caption>교육후기 글쓰기 - 제목, 작성자, 내용, 파일 입력 </caption>
        <tbody>

		<tr>
			<th scope="row"><label for="baTitle">제목</label> <span class="exactly y">필수</span></th>
			<td class="subject"><input type="text" name="baTitle" id="baTitle" style="width:540px;" value="${qnaUpdateResult.baTitle }"/></td>
		</tr>
	

		<tr>
			<th scope="row"><label for="memName">작성자</label> <span class="exactly y">필수</span></th>
			<td>
				${qnaUpdateResult.memName }
			</td>
		</tr>

	

		<tr>
			<th scope="row"><label for="baContentHtml">내용</label> <span class="exactly y">필수</span></th>
			<td>
					<textarea name="baContentHtml" id="baContentHtml" rows="10" cols="5" style="width:540px; height:300px" class="bbs_content">${qnaUpdateResult.baContentHtml }</textarea>
			</td>
		</tr>
		
		<c:set var="attachCount" value="0" />
		<c:forEach var="f" items="${fileList}">
		  <c:if test="${f.thumbnailCrop eq 'N'}">
		    <c:set var="attachCount" value="${attachCount + 1}" />
		  </c:if>
		</c:forEach>
		<c:set var="remainCount" value="${2 - attachCount}" />
		
		<tr>
		  <th scope="row">파일 <span class="exactly"></span></th>
		  <td>
		    <ul class="attach">
		
		      <%-- ✅ 1) 기존 파일 목록 표시 (있을 때만) --%>
		      <c:if test="${attachCount gt 0}">
		        <c:forEach var="fileVO" items="${fileList}">
		          <c:if test="${fileVO.thumbnailCrop eq 'N'}">
		            <li>
		              <div class="attach_file">
		                <label class="file_label">첨부파일</label>
		                <span class="file_input">
		                  <a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');">
		                    <c:out value="${fileVO.orgFileName}" />
		                  </a>
		                </span>
		
		                <span class="content_in">
		                  <button type="button"
		                          class="bbs_btn"
		                          onclick="fn_egov_deleteFile('${fileVO.atchFileIdx}','/usr/bbs/review/updateForm.do?baId=${qnaUpdateResult.baId}');">
		                    삭제
		                  </button>
		                </span>
		              </div>
		
		              <div class="attach_alt">
		                <label class="alt_label">대체텍스트</label>
		                <span class="alt_input">
		                  <input type="text" name="replcText" placeholder="첨부 이미지 대체콘텐츠 입력" />
		                </span>
		              </div>
		            </li>
		          </c:if>
		        </c:forEach>
		      </c:if>
		
		      <%-- ✅ 2) 남은 슬롯만큼 업로드 input 노출 --%>
		
		      <%-- 남은 슬롯 >= 1 이면 0번 input 노출 --%>
		      <c:if test="${remainCount ge 1}">
		        <li>
		          <div class="attach_file">
		            <label for="file_atchFileId1" class="file_label">첨부파일_0</label>
		            <span class="file_input"><input type="file" name="file_atchFileId" id="file_atchFileId1" class="file" /></span>
		            <span class="content_in"><input type="checkbox" name="bdtInsrtAt" id="bdtInsrtAt_0" value="0" /> <label for="bdtInsrtAt_0"><span class="skip">0번 첨부파일</span>본문삽입</label></span>
		          </div>
		          <div class="attach_alt">
		            <label for="replcText_0" class="alt_label">첨부파일_0에 대체텍스트</label>
		            <span class="alt_input"><input type="text" name="replcText" id="replcText_0" placeholder="첨부 이미지 대체콘텐츠 입력" /></span>
		          </div>
		        </li>
		      </c:if>
		
		      <%-- 남은 슬롯 >= 2 이면 1번 input도 노출 --%>
		      <c:if test="${remainCount ge 2}">
		        <li>
		          <div class="attach_file">
		            <label for="file_atchFileId2" class="file_label">첨부파일_1</label>
		            <span class="file_input"><input type="file" name="file_atchFileId" id="file_atchFileId2" class="file" /></span>
		            <span class="content_in"><input type="checkbox" name="bdtInsrtAt" id="bdtInsrtAt_1" value="1" /> <label for="bdtInsrtAt_1"><span class="skip">1번 첨부파일</span>본문삽입</label></span>
		          </div>
		          <div class="attach_alt">
		            <label for="replcText_1" class="alt_label">첨부파일_1에 대체텍스트</label>
		            <span class="alt_input"><input type="text" name="replcText" id="replcText_1" placeholder="첨부 이미지 대체콘텐츠 입력" /></span>
		          </div>
		        </li>
		      </c:if>
		
		    </ul>
		  </td>
		</tr>
		
	

        </tbody>
    </table>

        <!-- 양주시청 >분야별정보>복지교육> 초등학생 입학축가금 신청 동의서 폼 -->  
	
	 <!-- -------------------------------------------------------------- -->

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_center">
			<input type="submit" value="수정" class="bbs_btn write">
            <a href="/yjcareer/usr/bbs/review/list.do?menuId=${menuId }" class="bbs_btn"><i class="icon"></i><span>목록</span></a>
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

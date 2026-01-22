<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />

  <c:import url="/usr/menu/header.do" />
  
     <script type="text/javascript">
     
     //파일 다운로드
     function fn_egov_downFile(atchFileIdx){

    		window.open("${contextRoot}/board/FileDown.do?atchFileIdx="+atchFileIdx);
    	}
     
     //이전 글
     function fn_prev( preNo , menuId ){
     	
    		 window.location.href='/yjcareer/usr/bbs/${bcId}/detail.do?baId='+preNo+'&menuId='+menuId;

    	 
     }
     
     
     //다음 글
     function fn_next( nextNo , menuId ){
    	 

    	 window.location.href='/yjcareer/usr/bbs/${bcId}/detail.do?baId='+nextNo+'&menuId='+menuId;
    	 
    	 
     }   
     
     
     function fn_update(baId,menuId) {
  	   var url = "/yjcareer/usr/bbs/${bcId}/updateForm.do?menuId="+menuId+"&baId=" + baId;
  	   location.href = url;
     }
     
     function fn_delete() {
  		  var url = "/yjcareer/usr/bbs/${bcId}/delete.do";

  		  $("#form").attr("action", url);
  		  $("#form").attr("method", "post");
  		  $("#form").submit();
  		}
     
     </script>
      
    <div id="container">
        <div class="wrap clearfix">
            <main class="colgroup">
                <article>
    
                    <header class="sub_head">
    
                        <div class="sub_title">
                            <!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
                            <p class="first_title">알림마당</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>교육 자료실</h2>
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
                    
                    
                    <div id="contents" class="cts4145">
						<script>
//20220804 열린시장실 포토게시판 우클릭방지


//<![CDATA[
	function fn_deleteBbsNtt( url ) {
		

		if( confirm("삭제하시겠습니까?") ) {
			window.location = url;
		}
	}

	function fn_recovryBbsNtt( url ) {
		if( confirm("복원하시겠습니까?") ) {
			window.location = url;
		}
	}

	function fn_mvmnBbsNtt( frm ) {
		if( frm.mvmnBbsNo.value == 530 ) {
			alert('같은 게시판내에서는 이동이 안됩니다.\n다른 게시판을 선택해주세요.');
			return false;
		}

		return true;
	}
//]]>
</script>

	

	<div class="bbs_info clearfix">
        <div class="bbs_left bbs_count">
        </div>
        <div class="bbs_right">
        </div>
    </div>
    
    <form id="form" name="form">
    <input type="hidden" id="baId" name="baId" value="${result.baId}">
	<input type="hidden" id="bcId" name="bcId" value="${result.bcId}">
	<input type="hidden" id="menuId" name="menuId" value="${menuId}">

	<table class="bbs_default view">
        <caption>공지사항 상세보기 - 제목, 작성자, 내용, 파일 제공</caption>
        <tbody>
            <tr class="subject">		
                <th scope="row">제목</th>
					<td>${result.baTitle}</td>
            </tr>

            <tr>		
                <th scope="row">작성자</th>
				<td>${result.memName}</td>
            </tr>

            <tr>		
                <th scope="row">내용</th>
				<td title="내용" class="bbs_content">
				${result.baContentHtml}
				<div class="photo_area clearfix">
					<c:forEach var="fileVO" items="${fileList}" varStatus="status">
						<c:if test="${fileVO.fileExtn eq 'mp4'}">
							<br>
							<video controls preload="auto" width="800">
							  <source src="/yjcareer/fileStore/${fileVO.saveFileName}" type="video/mp4" />
							  이 브라우저는 video 태그를 지원하지 않습니다.
							</video>
						</c:if>
						<c:if test="${fileVO.fileExtn ne 'mp4'}">
							<div class="photo_view">
								<span class="photo_wrap">
									<img src="/yjcareer/fileStore/${fileVO.saveFileName}" alt="test 이미지1">
								</span>
							</div>
						</c:if>
					</c:forEach>
				</div>
				</td>
            </tr>

            <tr>		
                <th scope="row">파일</th>
					<td>
						<ul class="view_attach">
						
						<c:forEach var="fileVO" items="${fileList}" varStatus="status">
							<c:if test="${fileVO.fileExtn ne 'mp4'}">
								<li>
									<div class="down_view">
											
										<span><img src="/yjcareer/assets/common/images/board/file/ico_jpg.gif" alt="jpg파일첨부" /><c:out value="${fileVO.orgFileName}" /></span>
									
										<a href="javascript:fn_egov_downFile('${fileVO.atchFileIdx}');" title="파일 다운로드" class="file_down">다운로드</a>
									
									</div>
								</li>
							</c:if>
						</c:forEach>
					
						</ul>
					</td>					
            </tr>

			
        </tbody>
    </table>
    
    </form>

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_left">
            <a href="./list.do?menuId=${menuId }" class="bbs_btn list"><i class="icon"></i><span>목록</span></a>
        </div>
    </div>


   

	<ul class="bbs_view_move">
		<c:if test="${not empty prevNext.preNo and prevNext.preNo ne 0 and not empty prevNext.preTitle}">
        <li class="prev"><strong>이전글</strong> <a href="javascript:fn_prev('${prevNext.preNo}', '${menuId}', '${result.baNotice}');">${prevNext.preTitle}</a></li>
        </c:if>
        <c:if test="${not empty prevNext.nextNo and prevNext.nextNo ne 0 and not empty prevNext.nextTitle}">
        <li class="next"><strong>다음글</strong> <a href="javascript:fn_next('${prevNext.nextNo}', '${menuId}', '${result.baNotice}');">${prevNext.nextTitle}</a></li>
        </c:if>
    </ul>
                    </div>
                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

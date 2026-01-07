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
function fn_recovryBbsNtt( url ) {
	if( confirm("복원하시겠습니까?") ) {
		window.location = url;
	}
}


//]]>
</script>

	
	
    <div class="bbs_search">
        <form name="bbsNttSearchForm" id="bbsNttSearch" action="./selectBbsNttList.do" method="get" class="boardSearchForm">
            <fieldset>
            <legend>게시물 검색</legend>
            <input type="hidden" name="key" value="4139"/>
            <input type="hidden" name="bbsNo" value="531"/>
            <input type="hidden" name="integrDeptCode" value=""/>
			
			<label for="searchCnd" class="skip">검색 영역 선택</label>
            <select name="searchCnd" id="searchCnd" title="검색 영역 선택">
				<option value="SJ" >제목</option>
				<option value="CN" >내용</option>
            </select>
            <label for="searchKrwd" class="skip">검색어 입력</label>
            <input name="searchKrwd" id="searchKrwd" type="text" class="input_text" title="검색어 입력" placeholder="검색어 입력" value="" />
			<input value="검색" type="submit" class="submit" />
            </fieldset>
        </form>
    </div>


    <div class="bbs_info clearfix">
        <div class="bbs_left bbs_count">
            <span>총 게시물  <strong>0</strong> 개</span>,
            <span class="division_line">페이지 <strong>1</strong> / 1</span>
        </div>
    </div>

	<table class="bbs_default list" data-rwdb="yes">
        <caption>학습상담 목록 - 번호, 제목, 작성자, 파일, 조회수, 작성일정보 제공</caption>
        <colgroup>
        
                <col style="width:50px" />
                <col  />
                <col style="width:120px" />
                <col style="width:60px" />
                <col style="width:70px" />
                <col style="width:80px" />
        </colgroup>
        <thead>
        <tr>
        
			<th scope="col" >번호</th>
			<th scope="col" >제목</th>
			<th scope="col" >작성자</th>
			<th scope="col" >파일</th>
			<th scope="col" >조회수</th>
			<th scope="col" class="last">작성일</th>
        </tr>
        </thead>
        <tbody>

		
		
		
			<tr>
			
				 
				
					<td colspan="6" class="empty">등록된 게시물이 없습니다.</td>
				
			
			</tr>
		
        </tbody>
    </table>

	<div class="pagination">
        <span class="page_btn prev_group">
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_end">처음 페이지로</a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev">이전 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="prev_one"><i></i>이전 페이지</a>
</span>
<span class="page">
<span class="page_wrap">
<strong title="현재 1페이지">1</strong>
</span>
</span>
<span class="page_btn next_group">
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next_one">다음 페이지<i></i></a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next">다음 10페이지 이동</a>
<a href="./selectBbsNttList.do?key=4139&amp;bbsNo=531&amp;searchCtgry=&amp;pageUnit=10&amp;searchCnd=all&amp;searchKrwd=&amp;integrDeptCode=&amp;pageIndex=1" class="next_end">끝 페이지로</a>
</span>


    </div>

	<div class="bbs_btn_wrap clearfix">
        <div class="bbs_left">
        	
            
        </div>
        <div class="bbs_right">
			
				
					
					
					
					
					
					
						<a href="/yjcareer/usr/support/form.do" class="bbs_btn write"><i class="icon"></i><span>글쓰기</span></a>
					
				
        	
        </div>
    </div>
                    </div>
					
					








                
                </article>
            </main>
        
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

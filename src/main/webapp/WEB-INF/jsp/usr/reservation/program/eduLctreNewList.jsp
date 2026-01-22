<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:import url="/usr/layout/top.do" />
	
<link rel="stylesheet" href="/yjcareer/assets/site/yjcareer/css/sub.css">
<script src="/yjcareer/assets/site/yjcareer/js/program.min.js"></script>
<script src="/yjcareer/assets/site/yjcareer/js/sub.js"></script>
<script src="/yjcareer/assets/common/js/board.js"></script>

<script>
	$(function () {
		  const $wrap  = $('.bbs-search-checkbox');
		  const $all   = $wrap.find('#checkbox-0'); // 전체
		  const $items = $wrap.find('input[type="checkbox"][name="searchEduTarget"]').not($all);

		  $all.on('change', function () {
			const checked = $(this).is(':checked');
			$items.prop('checked', checked).trigger('change.sync');
		  });

		  $items.on('change change.sync', function () {
			const total = $items.length;
			const onCnt = $items.filter(':checked').length;

			if (onCnt === total) {
			  $all.prop('checked', true);
			} else {
			  $all.prop('checked', false);
			}
		  });

		  $items.trigger('change.sync');
		  
		// 내가 신청한 프로그램 보기 체크박스 클릭
		  $('#checkbox-00').click(function() {
			  if ($('#checkbox-00').prop('checked')) {
				  $("#searchMyProgram").val("Y");
		      } else {
		    	  $("#searchMyProgram").val("");
		      }
			  fn_search(1);
		  });
	});
	
	function fn_search(pageIndex) {
		$("#pageIndex").val(pageIndex);
		var reqUrl = "${contextRoot}/usr/reservation/program/eduLctreNewList.do";
		$("#bbsNttSearch").attr("action", reqUrl);
		$("#bbsNttSearch").submit();
	}

	function fn_reset() {
		$("#pageIndex").val(1);
		
		// 라디오, 체크박스 해제
		$("input[name='searchEduPlace']").prop("checked", false); // 장소
		$("input[name='searchCateCd']").prop("checked", false); // 구분
	    $("input[name='searchStatus']").prop("checked", false); // 진행상태
	    $("input[name='searchEduTarget']").prop("checked", false); // 신청대상
	    // 검색어 삭제
	    $("#searchKeyword").val('');
		
		var reqUrl = "${contextRoot}/usr/reservation/program/eduLctreNewList.do";
		$("#bbsNttSearch").attr("action", reqUrl);
		$("#bbsNttSearch").submit();
	}
	
	function fnDetailView(seqCd) {
		$("#bbsNttSearch input[name=seqCd]").val(seqCd);
		let reqUrl = "${contextRoot}/usr/reservation/eduLctreWebView.do";
		$("#bbsNttSearch").attr("action", reqUrl);
		$("#bbsNttSearch").submit();
	}
</script>

 <c:import url="/usr/menu/header.do" />
 
 	 <div id="container">
        <div class="wrap clearfix">
            <main class="colgroup">
                <article>
    
                    <header class="sub_head">
    
                        <div class="sub_title">
                            <!-- 현재 메뉴명의 1차 메뉴명넣어주세요-->
                            <p class="first_title">꿈자람센터 프로그램</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>
                            	<c:choose>
                            		<c:when test="${searchVo.menuId eq '2025MENU0000148'}">동부권 AI디지털 프로그램</c:when>
                            		<c:when test="${searchVo.menuId eq '2025MENU0000331'}">서부권 AI디지털 프로그램</c:when>
                            		<c:when test="${searchVo.menuId eq '2025MENU0000332'}">동부권 돌봄프로그램</c:when>
                            		<c:when test="${searchVo.menuId eq '2025MENU0000333'}">서부권 돌붐프로그램</c:when>
                            		<c:otherwise>양주진로진학지원센터 프로그램</c:otherwise>
                            	</c:choose>
                            </h2>
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
                    
                    
                    <div id="contents" class="cts4130">
						<div class="education_list">
 





	<div class="bbs_search">
		<form name="bbsNttSearchForm" id="bbsNttSearch" action="${contextRoot}/usr/reservation/program/eduLctreNewList.do" method="get" class="boardSearchForm">
		<input type="hidden" name="seqCd" id="seqCd" value=""/>
		<input type="hidden" name="subjCd" id="subjCd" value=""/>
		<input type="hidden" name="sgrCd" id="sgrCd" value="B"/>	
		<input type="hidden" id="searchMyProgram" name="searchMyProgram" value="${searchVo.searchMyProgram}" />
		<input type="hidden" name="menuId" id="menuId" value="${searchVo.menuId}"/>	
		<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex}"/>	
		
			<fieldset>
				<legend>교육강좌 검색</legend>
                
				<div class="listbox con01">
					<ul class="clearfix bbs-search-flex">

						<li class="list02">
												
							<div class="bbs-search-radio">
						  		<span class="radio-label">장소</span>		
						  
							  <input type="radio" id="radio-0" name="searchEduPlace" value="" ${empty searchVo.searchEduPlace or searchVo.searchEduPlace eq '' ? 'checked' : ''}>
							  <label for="radio-0" class="radio-btn">
								<span class="icon"></span>
								<span class="text">전체</span>
							  </label>

							  <input type="radio" id="radio-1" name="searchEduPlace" value="east" ${searchVo.searchEduPlace eq 'east' ? 'checked' : ''}>
							  <label for="radio-1" class="radio-btn">
								<span class="icon"></span>
								<span class="text">동부권</span>
							  </label>
							  
							  <input type="radio" id="radio-2" name="searchEduPlace" value="west" ${searchVo.searchEduPlace eq 'west' ? 'checked' : ''}>
							  <label for="radio-2" class="radio-btn">
								<span class="icon"></span>
								<span class="text">서부권</span>
							  </label>
							</div>
						</li>
						<li class="list03">
							<div class="bbs-search-radio">
						  		<span class="radio-label">구분</span>		
						  
							  <input type="radio" id="radio-3" name="searchCateCd" value="" ${empty searchVo.searchCateCd or searchVo.searchCateCd eq '' ? 'checked' : ''}>
							  <label for="radio-3" class="radio-btn">
								<span class="icon"></span>
								<span class="text">전체</span>
							  </label>

							  <input type="radio" id="radio-4" name="searchCateCd" value="BA" ${searchVo.searchCateCd eq 'BA' ? 'checked' : ''}>
							  <label for="radio-4" class="radio-btn">
								<span class="icon"></span>
								<span class="text">진로진학</span>
							  </label>
							  
							  <input type="radio" id="radio-5" name="searchCateCd" value="BBC" ${searchVo.searchCateCd eq 'BBC' ? 'checked' : ''}>
							  <label for="radio-5" class="radio-btn">
								<span class="icon"></span>
								<span class="text">AI디지털</span>
							  </label>
							  
							  <input type="radio" id="radio-6" name="searchCateCd" value="BDE" ${searchVo.searchCateCd eq 'BDE' ? 'checked' : ''}>
							  <label for="radio-6" class="radio-btn">
								<span class="icon"></span>
								<span class="text">돌봄</span>
							  </label>
							</div>
						</li>
						<li class="list03">
							<div class="bbs-search-radio">
						  		<span class="radio-label">진행상태</span>		
						  
							  <input type="radio" id="radio-7" name="searchStatus" value="" ${empty searchVo.searchStatus or searchVo.searchStatus eq '' ? 'checked' : ''}>
							  <label for="radio-7" class="radio-btn">
								<span class="icon"></span>
								<span class="text">전체</span>
							  </label>

							  <input type="radio" id="radio-8" name="searchStatus" value="be" ${searchVo.searchStatus eq 'be' ? 'checked' : ''}>
							  <label for="radio-8" class="radio-btn">
								<span class="icon"></span>
								<span class="text">접수예정</span>
							  </label>
							  
							  <input type="radio" id="radio-9" name="searchStatus" value="ing" ${searchVo.searchStatus eq 'ing' ? 'checked' : ''}>
							  <label for="radio-9" class="radio-btn">
								<span class="icon"></span>
								<span class="text">접수진행중</span>
							  </label>
							  
							  <input type="radio" id="radio-10" name="searchStatus" value="end" ${searchVo.searchStatus eq 'end' ? 'checked' : ''}>
							  <label for="radio-10" class="radio-btn">
								<span class="icon"></span>
								<span class="text">접수마감</span>
							  </label>
							</div>
						</li>
						<li>
							<div class="bbs-search-checkbox">
						  		<span class="checkbox-label">신청대상</span>	

							  <input type="checkbox" id="checkbox-0" name="searchEduTarget">
							  <label for="checkbox-0" class="checkbox-btn">
								<span class="text">전체</span>
							  </label>
							  
							   <c:forEach var="code" items="${codeList}">
								  <input type="checkbox" id="checkbox-${code.codeCode}" name="searchEduTarget" value="${code.codeCode}" 
								  ${searchVo.searchEduTarget ne null and fn:contains(searchVo.searchEduTarget, code.codeCode) ? 'checked="checked"' : ''}>
								  <label for="checkbox-${code.codeCode}" class="checkbox-btn">
									<span class="text">${code.codeName }</span>
								  </label>
								</c:forEach>
							  
							</div>
						</li>
					</ul>
				</div>
				<div class="listbox con02">
					<ul class="clearfix">
						<li class="list02">
							<select name="searchCnd" id="searchCnd" class="select" title="검색범위선택">
								<option value="all">전체</option>
								<option value="eduLctreSj" >교육명</option>
							</select>
							<div class="submitbox">
								<input name="searchKeyword" id="searchKeyword" type="text" class="temp_textbox" title="검색" placeholder="검색어 입력" value="${searchVo.searchKeyword }" />
								<input type="submit" value="검색" />
								<span class="reset" onclick="fn_reset()">검색초기화</span>
							</div>
							
						</li>
					</ul>
				</div>
			</fieldset>
		</form>
	</div>

	<div class="bbs_info clearfix">
		<c:if test="${not empty sessionScope.SESSION_DI_KEY}">
		<div class="bbs_left">
			<input type="checkbox" id="checkbox-00" name="myProgram" ${searchVo.searchMyProgram eq 'Y' ? 'checked' : ''}>
		  	<label for="checkbox-00" class="checkbox-btn">
				<span class="text">내가 신청한 프로그램 보기</span>
		  	</label>
		</div>
		</c:if>
		<div class="bbs_right bbs_count">
			<span>총 <strong>${totalCount}</strong> 건</span>,
			<span class="division_line">[<strong>${paginationInfo.currentPageNo }</strong> / ${paginationInfo.lastPageNoOnPageList } 페이지]</span>
		</div>
		<!--<div class="bbs_right">TODAY : 2025-11-27</div>-->
	</div>
		
		<div>
		<table class="table tr_over type2 list_table responsive responsive-new">
			<caption>교육강좌 리스트이며, No., 강좌명, 모집방법, 접수기간 교육기간, 교육일시/시간, 정원/대기, 접수상태, 수강신청 항목에 대한 정보를 제공</caption>
			<colgroup>
				<col style="width:5%;" />
				<col style="width:20%;" />
				<col style="width:20%;" />
				<col style="width:17%;" />
				<col style="width:8%;" />
				<col style="width:8%;" />
				<col style="width:8%;" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">대표 이미지</th>
				<th scope="col">강좌명</th>
				<th scope="col"><em class="em_blue">접수기간</em><br />교육기간</th>
				<th scope="col">정원/대기</th>
				<th scope="col">신청대상</th>
				<th scope="col">수강신청</th>
			</tr>
			</thead>
			<tbody class="text_center">
				<c:forEach var="item" items="${resultList}" varStatus="status">
					<tr>
						<td class="td-no"><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
						<td class="td-img">
							<a href="#" onclick="fnDetailView('${item.seqCd}')" class="subject">
								<c:if test="${empty item.thumbpath}">
									<img src="/yjcareer/assets/DATA/popupZone/no-img.png" />
								</c:if>
								<c:if test="${not empty item.thumbpath}">
									<img src="${contextRoot}/thumbnail/${item.thumbpath}" />
								</c:if>
							</a>
						</td>
						<td class="td-subject">
							<a href="#" onclick="fnDetailView('${item.seqCd}')" class="subject">
								<span class="li-label ${item.status}">
									<c:if test="${item.status eq 'ing'}">접수진행중</c:if>
									<c:if test="${item.status eq 'be'}">접수예정</c:if>
									<c:if test="${item.status eq 'end'}">접수마감</c:if>
								</span>
								${item.subjNm}
							</a> 
						</td>
						<td class="td-date">
							<p><span class="td-span">접수기간</span>${item.enrollStartDt}~${item.enrollEndDt}</p>
							<p><span class="td-span">교육기간</span>${item.learnStartDt}~${item.learnEndDt}</p>
						</td>
						<td class="td-pson">
							<p><span class="td-span">정원</span>${item.enrollCnt}/${item.capacity}</p>
							<p><span class="td-span">대기</span>(${item.waitCnt}/${item.waitEnrollCnt})</p>
						</td>
						<td class="td-type">
							<c:forEach var="code" items="${codeList}">
								<c:if test="${fn:contains(item.eduTarget, code.codeCode)}">
									<span class="type-${code.codeCode}">${code.codeName }</span>
								</c:if>
							</c:forEach>
						</td>
						<td>
							<a href="#" onclick="fnDetailView('${item.seqCd}')" class="request btn type2 small">수강신청</a>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${totalCount eq 0}">
					<tr>
						<td colspan="7">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				
			</tbody>
		</table>
		</div>
		
	

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
	</div>
	
</div>

<script>
//<![CDATA[
	function fn_changeEduPlace( val ) {
		if (!val) {
			val = -1;
		}

		val = 'key=4130&eduInsttNo='+val;
		$.ajax({
			type: 'POST',  
			url: './selectEduPlaceJsonWebList.do',   
			data: val,
			success: changeEduPlace,
			error: function(xhr, txtStatus, errorThrown){
				 alert(xhr.status + " : "+ txtStatus +" : "+errorThrown);

			}
		});
	}

	function changeEduPlace(HTMLSource){
		$("#searchEduPlaceNo").html(HTMLSource);
	} 

//]]>
</script>

                    </div>
                </article>
            </main>
        
        </div>
    </div>
    
 	<c:import url="/usr/layout/footer.do" />
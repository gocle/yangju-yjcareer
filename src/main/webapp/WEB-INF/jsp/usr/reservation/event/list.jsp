<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />

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
})

function fn_search(pageIndex) {
	$("#pageIndex").val(pageIndex);
	var reqUrl = "${contextRoot}/usr/reservation/event/list.do";
	$("#bbsNttSearch").attr("action", reqUrl);
	$("#bbsNttSearch").submit();
}

function fn_reset() {
	$("#pageIndex").val(1);
	
	// 라디오, 체크박스 해제
	$("input[name='searchCateCd']").prop("checked", false); // 구분
	$("input[name='searchStatus']").prop("checked", false); // 진행상태
	$("input[name='searchEduTarget']").prop("checked", false); // 신청대상
	// 검색어 삭제
	$("#searchKeyword").val('');
		
	var reqUrl = "${contextRoot}/usr/reservation/event/list.do";
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
                            <p class="first_title">행사 및 강좌</p>
                            
                            <!-- 현재메뉴명 입력해주세요 -->
                            <h2>진로진학아카데미</h2>
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
                    
                    
                    <div id="contents" class="cts4157">
                    	<div class="education_list list_type">
                    
		                    <div class="bbs_search event-search">
								<form name="bbsNttSearchForm" id="bbsNttSearch" action="${contextRoot}/usr/reservation/event/list.do" method="get" class="boardSearchForm">
									<input type="hidden" name="seqCd" id="seqCd" value=""/>
									<input type="hidden" name="subjCd" id="subjCd" value=""/>
									<input type="hidden" name="sgrCd" id="sgrCd" value="C"/>	
									<input type="hidden" name="menuId" id="menuId" value="${searchVo.menuId}"/>	
									<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex}"/>	
									
									<fieldset>
										<legend>교육강좌 검색</legend>
						                
										<div class="listbox con01">
											<ul class="clearfix bbs-search-flex">
												<li class="list03">
													<div class="bbs-search-radio">
												  		<span class="radio-label">구분</span>		
												  
														<input type="radio" id="radio-3" name="searchCateCd" value="" ${empty searchVo.searchCateCd or searchVo.searchCateCd eq '' ? 'checked' : ''}>
														<label for="radio-3" class="radio-btn">
														<span class="icon"></span>
														<span class="text">전체</span>
														 </label>
														
														<input type="radio" id="radio-4" name="searchCateCd" value="CA" ${searchVo.searchCateCd eq 'CA' ? 'checked' : ''}>
														<label for="radio-4" class="radio-btn">
														<span class="icon"></span>
														<span class="text">진로진학아카데미</span>
														</label>
														 
														<input type="radio" id="radio-5" name="searchCateCd" value="CB" ${searchVo.searchCateCd eq 'CB' ? 'checked' : ''}>
														<label for="radio-5" class="radio-btn">
														<span class="icon"></span>
														<span class="text">입시 설명회</span>
														</label>
														 
														<input type="radio" id="radio-6" name="searchCateCd" value="CC" ${searchVo.searchCateCd eq 'CC' ? 'checked' : ''}>
														<label for="radio-6" class="radio-btn">
														<span class="icon"></span>
														<span class="text">전공 멘토링</span>
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
												<li class="list04">
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
								<div class="bbs_right bbs_count">
									<span>총 <strong>${totalCount}</strong> 건</span>,
									<span class="division_line">[<strong>${paginationInfo.currentPageNo }</strong> / ${paginationInfo.lastPageNoOnPageList } 페이지]</span>
								</div>
						</div>
						<form id="listForm" name="listForm">
							<input type="hidden" id="pageSize" name="pageSize" value="${pageSize }" />
							<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" /> 
							<input type="hidden" id="seqCd" name="seqCd" value="" />
							<input type="hidden" id="menuId" name="menuId" value="${menuId}" />

							<table class="table tr_over type2 list_table responsive responsive-new">
								<caption>행사 및 강좌명, 신청대상, 신청기간, 일자, 진행상태 테이블</caption>
								<colgroup>
									<col width="5%" />
									<col width="30%" />
									<col width="10%" />
									<col width="20%" />
									<col width="20%" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="col">행사 및 강좌명</th>
										<th scope="col">구분</th>
										<th scope="col">신청기간</th>
										<th scope="col">운영일자</th>
										<th scope="col">신청대상</th>
									</tr>
								</thead>
								<tbody class="text_center">
									<c:forEach var="item" items="${resultList}" varStatus="status">
									<tr>
										<td class="td-no"><c:out value="${totalCount - ((pageIndex-1) * pageSize + status.index)}"/></td>
										<td class="td-subject">
											<span class="li-label ${item.status}">
												<c:if test="${item.status eq 'ing'}">접수진행중</c:if>
												<c:if test="${item.status eq 'be'}">접수예정</c:if>
												<c:if test="${item.status eq 'end'}">접수마감</c:if>
											</span>
											<a href="#" onclick="fnDetailView('${item.seqCd}')" class="subject">
												${item.subjNm }
											</a> 
										</td>
										<td class="td-cate">${item.cateNm }</td>
										<td class="td-date">
											<p>${item.enrollStartDt } ~ ${item.enrollEndDt }</p>
										</td>
										<td class="td-date">
											<p>${item.learnStartDt } ~ ${item.learnEndDt }</p>
										</td>
										<td class="td-type">
											<c:forEach var="code" items="${codeList}">
												<c:if test="${fn:contains(item.eduTarget, code.codeCode)}">
													<span class="type-${code.codeCode}">${code.codeName }</span>
												</c:if>
											</c:forEach>
										</td>
									</tr>
									</c:forEach>
									<c:if test="${totalCount eq 0}">
										<tr>
											<td colspan="6">검색결과가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<div class="pagination">
								<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_search" />
							</div>
							</form>

                   	 	</div>
                    </div>
                </article>
            </main>
        </div>
    </div>
    
    <c:import url="/usr/layout/footer.do" />

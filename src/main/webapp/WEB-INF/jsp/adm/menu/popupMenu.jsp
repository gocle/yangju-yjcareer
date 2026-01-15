<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ 
taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %><%@ 
taglib prefix="spring" uri="http://www.springframework.org/tags" %><%@ 
taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%><%@ 
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ 
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ 
taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="${contextRoot}/css/jquery.treemenu.css" rel="stylesheet" type="text/css" />
<style>
.tree { background-color:#e7f4be; color:#0f1301;}
.tree li,
.tree li > a,
.tree li > span {
    padding: 4pt;
    border-radius: 4px;
}

.tree li a {
   color:#0f1301;
    text-decoration: none;
    line-height: 20pt;
    border-radius: 4px;
}

.tree li a:hover {
    background-color: #34BC9D;
    color: #fff;
}

.active {
    background-color: #34495E;
    color: white;
}

.active a {
    color: #fff;
}

.tree li a.active:hover {
    background-color: #34BC9D;
}
</style>

<script src="${contextRoot}/js/jquery.treemenu.js"></script> 
<script type="text/javascript">

	$(document).ready(function() {

		 
	});
	/* 리스트 조회 */
	function fn_save(id,name,depth){
		
		
		opener.$("#upMenuId").val(id);
		opener.$("#upMenuTitle").val(name);
		opener.$("#menuDepth").val(depth);
		window.close();
	}
 
	function fn_close(){
		opener.fn_search('1');
		window.close();
	}
	$(function(){
        $(".tree").treemenu({delay:300}).openActive();
        
        
        $(".treemenu").show();
    });
</script>
		<div id="pop-wrapper">
			<div id="pop-header">
				<a href="#" onClick="javascript:fn_close();" class="btn">닫기</a>
			</div><!-- E : pop-header -->



			<div id="pop-container">
			
				<h3>메뉴 정보</h3>
													
					 <ul class="tree" style="width:400px;">
						<li>
							 <span>양주 진로진학플랫폼 시스템</span>
									<c:set var="upperMenuNo" value="TOP"/>
									<c:set var="menuLevel" value="1"/>
									<c:set var="menuTypeNum" value="1"/>
									<c:set var="key1" value="${ upperMenuNo}_${menuLevel}"/>
									<c:if test="${not empty menuList1[key1]}">
									<ul>
										<c:forEach var="menu1" items="${menuList1[key1]}" varStatus="status">
			
										<li>
											<!-- S : depth-1 -->
											 
											<c:set var="menuTypeNum" value="${menuTypeNum+1}"/>
											 
												 <c:choose>
														<c:when test="${0 eq menu1.isLeafMenu}"><a id="a_${menu1.menuId }" href="#" >${menu1.menuTitle }</a></c:when>
														<c:otherwise><a id="a_${menu1.menuId }" href="#" onclick="javascript:fn_save( '${menu1.menuId }','${menu1.menuTitle }','${menu1.menuDepth+1 }' );"  >${menu1.menuTitle }</a></c:otherwise>
													</c:choose>
													<c:set var="key2" value="${ menu1.menuId}_${menu1.menuDepth+1}"/>
													<c:choose>
														<c:when test="${not empty menuList1[key2]}">
														<ul>
															<c:forEach var="menu2" items="${menuList1[key2]}" varStatus="status2">
																<li><!-- S : depth-2 -->
														 				<c:choose>
																			<c:when test="${0 eq menu2.isLeafMenu}"><a id="a_${menu2.menuId }" href="#" >${menu2.menuTitle }</a></c:when>
																			<c:otherwise><a id="a_${menu2.menuId }" href="#" onclick="javascript:fn_save( '${menu2.menuId }','${menu2.menuTitle }','${menu2.menuDepth +1}' );" >${menu2.menuTitle }</a></c:otherwise>
																		</c:choose> 
																		<c:set var="key3" value="${ menu2.menuId}_${menu2.menuDepth+1}"/>
																		<c:choose>
																			<c:when test="${not empty menuList1[key3]}">
																			<ul>
																			
																				<c:forEach var="menu3" items="${menuList1[key3]}" varStatus="status3">
																					<!-- S : depth-3 -->
																					<li>
																							<c:choose>
																								<c:when test="${0 eq menu3.isLeafMenu}"><a id="a_${menu3.menuId }" href="#" >${menu3.menuTitle }</a></c:when>
																								<c:otherwise><a id="a_${menu3.menuId }" href="#" onclick="javascript:fn_save( '${menu3.menuId }','${menu3.menuTitle }','${menu3.menuDepth+1 }' );" >${menu3.menuTitle }</a></c:otherwise>
																							</c:choose>
																							<c:set var="key4" value="${ menu3.menuId}_${menu3.menuDepth+1}"/>
																							<c:choose>
																								<c:when test="${not empty menuList1[key4]}">
																									<ul>
																										<c:forEach var="menu4" items="${menuList1[key4]}" varStatus="status3">
																											<li><a id="a_${menu4.menuId }" href="#" onclick="javascript:fn_save( '${menu4.menuId }','${menu4.menuTitle }','${menu4.menuDepth +1}' );">${menu4.menuTitle }</a></li>
																										</c:forEach>																							
																									</ul>
																								</c:when>
																								<c:otherwise></c:otherwise>
																							</c:choose>
																					 <!-- E : depth-3 -->
																					 </li>
																				</c:forEach>
																			
																			</ul>
																			</c:when>
																			<c:otherwise></c:otherwise>
																		</c:choose>
																</li><!-- E : depth-2 -->
															</c:forEach>
														</ul>
														</c:when>
														<c:otherwise></c:otherwise>
													</c:choose>
											 </li><!-- E : depth-1 -->
			
										</c:forEach>
										</ul>
										</c:if>
							</li>
					 	</ul>	
						<div class="btn-area">
							<a href="#"  onClick="javascript:fn_close();">닫기</a>
						</div>
			</div><!-- E : pop-container -->



		</div><!-- E : wrapper -->
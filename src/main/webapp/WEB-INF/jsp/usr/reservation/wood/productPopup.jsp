<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<script>
$(document).ready(function(){
    // 탭별 targetCode 맵
    var tabAgeMap = {
        ageTab1: ["AGE_05_07","AGE_05_11","AGE_08_11","AGE_08_13","AGE_09_13","AGE_10_ADULT","AGE_11_13","AGE_11_ADULT","AGE_15_ADULT","AGE_NO_LIMIT"],
        ageTab2: ["AGE_05_07","AGE_05_11"],
        ageTab3: ["AGE_08_11","AGE_08_13","AGE_09_13","AGE_10_ADULT","AGE_11_13"],
        ageTab4: ["AGE_10_ADULT","AGE_11_ADULT","AGE_15_ADULT","AGE_NO_LIMIT"]
    };

    $('#all_items .item-row').each(function(){
        var $row = $(this);
        var targetCode = $row.data('target-code');
        $.each(tabAgeMap, function(tabId, targets){
            if(targets.includes(targetCode)){
            	var appendId = 'tab' + tabId.split('ageTab')[1] + '_list';
            	$('#' + appendId).append($row.clone(true));
            }
        });
    });
    
    $('.ageTab_itemList').each(function(){
        if ($(this).children().length === 0) {
            $(this).append('<li class="no-item">등록된 품목이 없습니다.</li>');
        }
    });

    $('.ageTab_btn').click(function(){
        var tabId = $(this).data('tab');

        $('.ageTab_btn').removeClass('active');
        $(this).addClass('active');

        $('.ageTab_content').hide();
        $('#' + tabId).show();
    });

    $('.ageTab_content').hide();
    $('#ageTab1').show();

    $('.item-pop-close').click(function(){
        $('.item-pop-modal').hide();
    });

});
</script>

<div class="item-pop-modal">
    <div class="item-pop-content">
        <span class="item-pop-close">&times;</span>

        <div class="ageTab_buttons">
            <button type="button" class="ageTab_btn active" data-tab="ageTab1">전체</button>
            <button type="button" class="ageTab_btn" data-tab="ageTab2">유치원(5세~7세)</button>
            <button type="button" class="ageTab_btn"  data-tab="ageTab3">초등</button>
            <button type="button" class="ageTab_btn" data-tab="ageTab4">성인 포함</button>
        </div>

        <!-- 숨김: 전체 아이템 리스트 (jQuery용) -->
        <ul id="all_items" style="display:none;">
        <c:forEach var="item" items="${productList}">
            <li class="item-row" data-target-code="${item.targetCode}" onclick="fn_selProduct('${item.productId}','${item.productName}','${item.price}','${item.optionName}',
                            '${item.optionPrice}')">
                <div class="item-img">
                    <img src="${contextRoot}/thumbnail/${item.thumbpath}" alt="${item.productName}" onerror="this.style.visibility='hidden'" />
                </div>
                <div class="item-info">
                    <p class="item-title">
                        <c:if test="${item.newYn eq 'Y'}"><span>신제품</span></c:if>
                        ${item.productName}
                    </p>
                    <p class="item-grade">
                        <span>${item.target} · <fmt:formatNumber value="${item.price}" pattern="#,###"/>원 (${item.duration}분)</span>
                    </p>
                    <c:if test="${not empty item.productDesc}">
	                    <p class="item-note">
	                        ${item.productDesc}
	                        <c:if test="${not empty item.optionName}">
	                            (${item.optionName} + <fmt:formatNumber value="${item.optionPrice}" pattern="#,###"/>원)
	                        </c:if> 
	                    </p>
                    </c:if>
                </div>
            </li>
        </c:forEach>
        </ul>

        <div class="ageTab_content" id="ageTab1"><ul class="ageTab_itemList" id="tab1_list"></ul></div>
        <div class="ageTab_content" id="ageTab2"><ul class="ageTab_itemList" id="tab2_list"></ul></div>
        <div class="ageTab_content" id="ageTab3"><ul class="ageTab_itemList" id="tab3_list"></ul></div>
        <div class="ageTab_content" id="ageTab4"><ul class="ageTab_itemList" id="tab4_list"></ul></div>

    </div>
</div>
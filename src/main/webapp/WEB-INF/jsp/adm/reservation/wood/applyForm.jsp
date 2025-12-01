<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/adm/include/common.jsp" %>

<script type="text/javascript" src="${contextRoot}/js/com_validation.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    $("#btn_close").on("click", function(){
        parent.$("#reservationFormFrame").attr("src", "about:blank");
        parent.$("#reservationFormArea").hide();
    });
    
    $("#btn_add").click(function() {
        let row = $("#applyFormBody tr:first").clone(); 
        row.find("input").not("[name='resvId']").val("");
        row.find("select").prop("selectedIndex", 0);
        row.find("input[name='resvId']").val("자동생성");
        $("#applyFormBody").append(row);
    });
    
    $("select[name='productOption']").on("change", function() {
        var price = $(this).find("option:selected").data("price");
        $("#finalPrice").text(price + "원");
    });
});

function fn_save() {
	let isValid = true;

    $("#applyFormBody tr").each(function(index, tr) {
        const $tr = $(tr);

        const name = $tr.find("input[name^='reservationList'][name$='name']").val().trim();
        if (!name) {
            alert("예약자명을 입력해 주세요.");
            $tr.find("input[name^='reservationList'][name$='name']").focus();
            isValid = false;
            return false;
        }

        const age = $tr.find("input[name^='reservationList'][name$='age']").val().trim();
        if (!/^\d+$/.test(age) || parseInt(age, 10) <= 0) {
            alert("나이는 숫자만 입력해주세요.");
            $tr.find("input[name^='reservationList'][name$='age']").focus();
            isValid = false;
            return false;
        }

        const groupYn = $tr.find("select[name^='reservationList'][name$='groupYn']").val();
        if (!groupYn) {
            alert("개인/단체를 선택해 주세요.");
            $tr.find("select[name^='reservationList'][name$='groupYn']").focus();
            isValid = false;
            return false;
        }

        if (groupYn === "Y") {
            const peopleCnt = $tr.find("input[name^='reservationList'][name$='peopleCnt']").val().trim();
            if (!/^\d+$/.test(peopleCnt) || parseInt(peopleCnt, 10) < 1) {
                alert("단체 인원은 1명 이상이어야 합니다.");
                $tr.find("input[name^='reservationList'][name$='peopleCnt']").focus();
                isValid = false;
                return false;
            }
        }

        const phone = $tr.find("input[name^='reservationList'][name$='phone']").val().trim();
        if (!phone) {
            alert("연락처를 입력해 주세요.");
            $tr.find("input[name^='reservationList'][name$='phone']").focus();
            isValid = false;
            return false;
        }

        const productId = $tr.find("select[name^='reservationList'][name$='productId']").val();
        if (!productId) {
            alert("상품을 선택해 주세요.");
            $tr.find("select[name^='reservationList'][name$='productId']").focus();
            isValid = false;
            return false;
        }
    });

    if (!isValid) return;
    
	var pgType = "${programVO.pgType}"
	$.ajax({
		url: "${contextRoot}/adm/reservation/" + pgType + "/applyInsert.do",
		type: "POST",
		data: $("#applyForm").serialize(),
		success: function(response) {
			alert(response.message)
			parent.location.reload();

            parent.$("#reservationFormFrame").attr("src", "about:blank");
            parent.$("#reservationFormArea").hide();
		},
        error: function() {
            alert("저장 중 오류가 발생했습니다.");
        }
	})
}

let rowCount = 1;

function fn_addRow() {
	  const index = $("#applyFormBody tr").length;
	  const $row = $("#applyFormBody tr:first").clone(false);

	  $row.find("input").not("[name$='.resvId'], [type='hidden']").val("");
	  $row.find("select").prop("selectedIndex", 0);

	  $row.find("input, select").each(function () {
	      const name = $(this).attr("name");
	      if (name) {
	    	  let newName = name.replace(/reservationList\[\d*\]/, "reservationList[" + index + "]");
              $(this).attr("name", newName);
	      } 
	  });

	  $row.find("input[name$='.resvId']").val("자동생성");
	  $("#applyFormBody").append($row);
	  
	  const $newSelect = $row.find("select[name$='.groupYn']");
	  $newSelect.val("N");
	  $row.find(".gender-col").show();
	  $row.find(".group-col").hide();

      if (typeof toggleGroupFields === 'function') toggleGroupFields($groupSelect[0]);
	}

function fn_delRow() {
	  const $rows = $("#applyFormBody tr");
	  if ($rows.length <= 1) {
		  alert("삭제할 수 없습니다."); 
		  return; 
	  }
	  $rows.last().remove();
	  reindexRows();
}

function reindexRows() {
	  $("#applyFormBody tr").each(function (i) {
	    $(this).find("input, select").each(function () {
		    const name = $(this).attr("name");
		    if (name) {
	    	  let newName = name.replace(/reservationList\[\d*\]/, "reservationList[" + index + "]");
              $(this).attr("name", newName);
		    } 
	    });
	  });
}

function fn_toggleGroup(selectEl) {
    var $row = $(selectEl).closest("tr");
    if ($(selectEl).val() === "Y") {
        $row.find(".gender-col").hide();
        $row.find(".group-col").show();  
    } else {
        $row.find(".gender-col").show();
        $row.find(".group-col").hide();
        $row.find(".peopleCnt").val("1");
    }
}

$(document).on("input", ".maleCnt, .femaleCnt", function() {
    var $row = $(this).closest("tr");
    var male = parseInt($row.find(".maleCnt").val() || 0);
    var female = parseInt($row.find(".femaleCnt").val() || 0);
    var total = male + female;
    $row.find(".peopleCnt").val(total);
});
</script>

<section>
	<div class="sub-title-area">
		  <h3>참여자 등록</h3>
		  <div class="text-right btn-area" style="margin-bottom: 10px;">
		    <button type="button" class="point" onClick="fn_addRow()">추가</button>
		    <button type="button" onClick="fn_delRow()">삭제</button>
		  </div>
	</div>

	  <style>
	  	section {
	  		width: 98%;
		    margin: auto;
		    padding-top: 1rem;
		}
		
	  	td input {
	  		width : 100%;
	  	}
	  	
	  	td select {
		    min-width: 50px;
		    width : 100%;
		}
		
		.sub-title-area {
			display: flex;
		    align-items: center;
		    justify-content: space-between;
		}
		
		.list-1 {
			table-layout: fixed;
		}
	  </style>
	  
	<form id="applyForm" name="applyForm" method="post">
	
	<input type="hidden" name="reservationList[0].pgId" value="${programVO.pgId}" />
	<input type="hidden" name="reservationList[0].pgType" value="${programVO.pgType}" />
	
		<table class="list-1">
			<colgroup>
		      <col style="width: 8%;">     <!-- 예약자명 -->
		      <col style="width: 5%;">     <!-- 나이 -->
		      <col style="width: 6%;">     <!-- 단체여부 -->
		      <col style="width: 5%;">     <!-- 성별 -->
		      <col style="width: 12%;">    <!-- 연락처 -->
		      <col style="width: 10%;">    <!-- 단체명 -->
		      <col style="width: 8%;">     <!-- 예약상태 -->
		      <col style="width: 8%;">     <!-- 참여여부 -->
		      <col style="width: 10%;">    <!-- 비고 -->
		      <col style="width: 10%;">    <!-- 장소 -->
		    </colgroup>
			<thead>
				<tr>
					<th>예약자명</th>
					<th>나이</th>
					<th>단체여부</th>
					<th>성별</th>
					<th>연락처</th>
					<th>선택차시</th>
					<th>예약상태</th>
					<th>참여여부</th>
					<th>상품선택</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody id="applyFormBody">
			    <tr>
			        <td><input type="text" name="reservationList[0].name" class="form-control" /></td>
			        <td><input type="number" name="reservationList[0].age" class="form-control" /></td>
			        <td>
					    <select name="reservationList[0].groupYn" class="form-control groupYn"onchange="fn_toggleGroup(this)">
					        <option value="N">개인</option>
					        <option value="Y">단체</option>
					    </select>
					</td>
					
					<!-- 개인 -->
					<td class="gender-col">
					    <select name="reservationList[0].gender" class="form-control">
					        <option value="">선택</option>
					        <option value="M">남</option>
					        <option value="F">여</option>
					    </select>
					</td>
					
					<!-- 단체 -->
					<td class="group-col" style="display: none;">
					    남 <input type="number" name="reservationList[0].mCnt" class="form-control maleCnt" style="width: 60%; display: inline-block;" min="0" value="0"/><br>
					    여 <input type="number" name="reservationList[0].fCnt" class="form-control femaleCnt" style="width: 60%; display: inline-block;" min="0" value="0"/>
					    <input type="hidden" name="reservationList[0].peopleCnt" class="peopleCnt" value="0"/>
					</td>
			        <td><input type="text" name="reservationList[0].phone" class="form-control phone_num" placeholder="예) 010-1234-5678" maxlength="13" pattern="^010-\d{4}-\d{4}$"/></td>
			        <td>
			            <select name="reservationList[0].slotId" class="form-control">
			            	<option value="">선택</option>
			                <c:forEach var="timeList" items="${timeList}">
						        <option value="${timeList.slotId}">
						            ${timeList.slotNo}부 (${timeList.startTime}~${timeList.endTime})
						        </option>
						    </c:forEach>
			            </select>
			        </td>
			        <td>
			            <select name="reservationList[0].status" class="form-control">
			                <option value="CONFIRM">확정</option>
			                <option value="WAIT">대기</option>
			                <option value="CANCEL">취소</option>
			                <option value="REJECT">반려</option>
			            </select>
			        </td>
			        <!-- <td>
			            <select name="reservationList[0].groupYn" class="form-control groupYn" style="width: 80%">
			                <option value="N">개인</option>
			                <option value="Y">단체</option>
			            </select>
			        </td>
			        <td><input type="text" name="reservationList[0].groupName" class="form-control groupName" /></td>
			        <td><input type="number" name="reservationList[0].peopleCnt" class="form-control peopleCnt" /></td> -->
			        <td>
			            <select name="reservationList[0].attendYn" class="form-control">
			                <option value="Y">참여</option>
			                <option value="N">미참여</option>
			            </select>
			        </td>
			        <td>
				        <select name="reservationList[0].productId">
				        	<option value="">선택</option>
						    <c:forEach var="product" items="${productList}">
						        <option value="${product.productId}" data-price="${product.price}">
						            ${product.productName} - <fmt:formatNumber value="${product.price}" type="currency"/>
						        </option>
						
						        <c:if test="${not empty product.optionName}">
						            <option value="${product.productId}" data-price="${product.price + product.optionPrice}">
						                ${product.productName} (${product.optionName}) - 
						                <fmt:formatNumber value="${product.price + product.optionPrice}" type="currency"/>
						            </option>
						        </c:if>
						    </c:forEach>
						</select>
					</td>
			        <td><input type="text" name="reservationList[0].note" class="form-control" /></td>
			    </tr>
			</tbody>
		</table>
	
		<div class="text-right btn-area" style="margin-top: 30px;">
			<button type="button" class="point" onClick="fn_save()">저장</button>
			<button id="btn_close" type="button">닫기</button>
		</div>
	</form>
</section>
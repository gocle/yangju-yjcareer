$(function() {
	//휴대전화 vali
    $(".phone_num").on("input", function() {
        let value = $(this).val().replace(/[^0-9]/g, "");

        if (value.length > 3 && value.length <= 7) {
            value = value.replace(/(\d{3})(\d{1,4})/, "$1-$2");
        } else if (value.length > 7) {
            value = value.replace(/(\d{3})(\d{4})(\d{1,4})/, "$1-$2-$3");
        }
        $(this).val(value);
    });
    
    //개인 단체 여부
    function toggleGroupFields(selectEl) {
        var $sel = $(selectEl);
        var $row = $sel.closest("tr");
        var groupYn = ($sel.val() || "").toString().trim();

        var $groupName = $row.find(".groupName");
        var $groupCnt  = $row.find(".peopleCnt");

        if ($groupName.length === 0) $groupName = $row.find("input[name$='.groupName']");
        if ($groupCnt.length === 0)  $groupCnt  = $row.find("input[name$='.peopleCnt']");

        if (groupYn === "N" || groupYn === "") {
            $groupName.val("").prop("disabled", true);
            $groupCnt.val("").prop("disabled", true);
        } else {
            $groupName.prop("disabled", false);
            $groupCnt.prop("disabled", false);
        }
    }
	
    $("#applyFormBody").find(".groupYn").each(function() {
        toggleGroupFields(this);
    });

    $(document).on("change", ".groupYn", function() {
        toggleGroupFields(this);
    });
});
/*  게시판 */
function addCellHeader(table) {
    if (!table) {
        return false;
    }
    //console.log(table);
    var trs = table.getElementsByTagName('tr');
    var trsChild;
    var grid = {};
    var cells;

    for (var i = 0, cntI = trs.length; i < cntI; i++) {
        if (!grid[i]) {
            grid[i] = {};
        }
        trsChild = trs.item(i).childNodes;
        cells = 0;
        for (var j = 0, cntJ = trsChild.length; j < cntJ; j++) {
            if (trsChild[j].nodeType == 1) {
                grid[i][cells++] = trsChild[j];
            }
        }
    }

    var cellHeader = '';
    for (row in grid) {
        if (row == 0) {
            continue;
        }
        for (cell in grid[row]) {
            if (cell == 0) {
                continue;
            }
            //cellHeader = grid[0][cell].innerHTML + ' - ' + grid[row][0].innerHTML
            cellHeader = grid[0][cell].innerHTML + '：' ;
            grid[row][cell].setAttribute('data-cell-header', cellHeader);
        }
    }
}

$( document ).ready(function() {
    var bbsTableRwdb   = $("table[data-rwdb='yes']");
    if(bbsTableRwdb.length > 0){
        var thisTable = bbsTableRwdb.attr('class').replace(/ /g, '.');
            if(navigator.appVersion.indexOf("MSIE 7.")==-1 && navigator.appVersion.indexOf("MSIE 8.")==-1) {
                addCellHeader(document.querySelector('.'+ thisTable));
            }
    }
});
function ctn2313(){
    if(document.URL =="https://www.yangju.go.kr/www/addBbsNttView.do?key=105&bbsNo=1&integrDeptCode="){
        $(document).attr({"title":"칭찬합시다 | 글쓰기"})
    }
}
setTimeout(ctn2313,1000);
function ctn2314(){
    if(document.URL =="https://www.yangju.go.kr/www/addBbsNttView.do?key=106&bbsNo=2&integrDeptCode="){
        $(document).attr({"title":"자유게시판 | 글쓰기"})
    }
}
setTimeout(ctn2314,1000);


/* faq */
function faqList(list) {
    var faqList = $(list).find(".list > dt");
    var faqBtn_Qpen = faqList.find("button");

    faqBtn_Qpen.on("click", function () {

        var item = $(this).parent('dt');

        if (item.hasClass('active')) {
            item.removeClass("active");
            item.next("dd").slideUp('fast');
        }
        else {
            faqList.not(item).each(function () {
                $(this).removeClass("active");
                $(this).next("dd").slideUp('fast');
            });
            item.addClass("active");
            item.next("dd").slideDown('fast');
        }
    });
}

$(function () {
    var faq   = $("[data-list='faq']");

    if(faq.length > 0) {
        var list = faq.attr('class').replace(/ /g, '.');
        $(window).on({
            load: function () {
                faqList('.'+ list)
            }
        });
    }
});




$(function () {
    var gallerItem = $(".bbs_gallery .list  a");
    gallerItem.on('mouseenter',function () {
        $(this).find('.photo').addClass("hover");
    });
    gallerItem.on('mouseleave',function () {
        $(this).find('.photo').removeClass("hover");
    });
});


// 동영상 체크
function GetIEVersion() {
    var sAgent = window.navigator.userAgent;
    var Idx = sAgent.indexOf("MSIE");

    // If IE, return version number.
    if (Idx > 0)
        return parseInt(sAgent.substring(Idx+ 5, sAgent.indexOf(".", Idx)));

    // If IE 11 then look for Updated user agent string.
    else if (!!navigator.userAgent.match(/Trident\/7\./))
        return 11;

    else
        return 99; //It is not IE
}

function checkIE(ver,seletor) {
    var ver = ver,
        seletor = seletor;

    if (GetIEVersion() <= ver) { //IE브라우전 체크 버전보다 작으면
        $(seletor + " video").remove();
    } else{
        $(seletor + " object").remove();
    }
}

function checkAudio(ver,seletor) {
    var ver = ver,
        seletor = seletor;

    if (GetIEVersion() <= ver) { //IE브라우전 체크 버전보다 작으면
        $(seletor + " audio").remove();
    } else{
        $(seletor + " object").remove();
    }
}

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

var jusoSelector = {};

function fn_postCodeSearch(zipcodeId,addressId,detailAddressId)
{
	jusoSelector.zipcodeId = zipcodeId;
	jusoSelector.addressId = addressId;
	jusoSelector.detailAddressId = detailAddressId;
	var path = "/common/juso/jusoPopup.jsp";
	popUpCommonSimple( path , 'postcode', 460,450 );
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
	document.getElementById(jusoSelector.zipcodeId).value = zipNo;
	document.getElementById(jusoSelector.addressId).value = roadAddrPart1 + roadAddrPart2;
	document.getElementById(jusoSelector.detailAddressId).value = addrDetail;
}

function fn_deleteBbsNtt( url ) {
	if( confirm("삭제하시겠습니까?") ) {
		window.location = url;
	}
}

function fn_sendTwitter( url ) {
	window.open( url, "twitter", "" );
}

function fn_sendFacebook( url ) {
	window.open( url, "facebook", "" );
}

function fn_validateBbsNttComment( frm ) {
	if( !frm.commentCn.value ) {
		alert("댓글 내용을 입력해주세요.");
		return false;
	}
	return true;
}

function fn_deleteBbsNttComment( url ) {
	if( confirm("댓글을 삭제하시겠습니까?") ) {
		window.location = url;
	}
}

function fn_changeDept(select, id) {
	var option = select.options[select.selectedIndex],
		value = option.value;
		text = option.text.trim();
	if( !value ) {
		document.getElementById(id).value = "";
	} else {
		document.getElementById(id).value = text;
	}
}
/*title변경용*/
/*
$(function(){
    changeTitle();
});

function changeTitle(){
    var title=document.querySelector('.sub_visual .sub_title h2').textContent;
    document.title=title;
}

window.onload=function(){
    var title=document.querySelector('.sub_visual .sub_title h2').textContent;
    document.title=title;
}
*/
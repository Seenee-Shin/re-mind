
let backupIndex;
var line = $(".db-line");

// 게시글색 왔다리 갔다리
function colorSet(){
    const view = $(".board-view");

    for(let i = 0; i < view.length; i++){
        if(i % 2 == 0)  view.eq(i).css("background-color", "#FCF7F3");
        else            view.eq(i).css("background-color", "white");
    }
}
colorSet();

// line : <div class="db-line"></div>
// ele : 형제 요소(버튼들?) jquery로만 가능
function underLineDraw(line, ele){
    let underLine = line;
    let offset = ele.offset();
    let offsetWidth = ele.width();
    let offsetHeight = ele.height();

    underLine.css("left", offset.left + "px");
    underLine.css("width", offsetWidth + 10 + "px");
    underLine.css("top", offset.top + offsetHeight + 5 + "px");
}

$(document).on("click", ".div-btn", function(){

    const index = $(".div-btn").index($(this));
    backupIndex = index;

    underLineDraw(line, $(this));
    line.css("transition", "0.3s");
});
$(".div-btn").eq(0).click();

var backupWidth;
window.onresize = function(){
    var innerWidth = window.innerWidth;
    var innerHeight = window.innerHeight;

    if(innerWidth != backupWidth){
        // transition: 0.3s;
        underLineDraw(line, $(".div-btn").eq(backupIndex));
        line.css("transition", "0s");
    }
}

let backupMenuIndex = -1;
$(document).on("click", ".opImg > img", function(){

    const divAll = $(".opImg > div");
    const index = $(".opImg > img").index($(this));
    const div = $(".opImg").eq(index).children();

    divAll.css("visibility", "hidden");

    if(backupMenuIndex == index){

        divAll.css("visibility", "hidden");
        backupMenuIndex = -1;

    }else{
        div.css("visibility", "visible");
        backupMenuIndex = index;
    }
});


var currentPage = 1;
var limit = 10;
var pageSize = 10;
var listCount, maxPage, startPage, endPage, prevPage, nextPage, first, last;
last = currentPage * limit;
first = last - (limit - 1) <= 0 ? 1 : last - (limit - 1);
function calcPagination(){

    maxPage = Number.parseInt(Math.floor(listCount / limit));
    startPage = (currentPage-1) / pageSize * pageSize + 1;
    endPage = startPage + pageSize - 1;

    if(endPage > maxPage)   endPage = maxPage;

    if(currentPage <= 10)	prevPage = 1;
    else                    prevPage = startPage - 1;

    if(endPage == maxPage) nextPage = maxPage;
    else				   nextPage = endPage + 1;

    last = currentPage * limit;
    first = last - (limit - 1) <= 0 ? 1 : last - (limit - 1);
}


var btnNumber = 1;
$("#select_myBoardList").on("click", function (){

    btnNumber = 1;
    currentPage = 1;

    resultList.length = 0;
    calcPagination();
    getBoardList();
});
$("#select_myReplyList").on("click", function (){

    btnNumber = 2;
    currentPage = 1;

    resultList.length = 0;
    calcPagination();
    getReplyList();
});
$("#select_myScrapList").on("click", function (){

    btnNumber = 3;
    currentPage = 1;

    resultList.length = 0;
    calcPagination();
    getScrapList();

});

$("#select_myEmpathyList").on("click", function (){

    btnNumber = 4;
    currentPage = 1;

    resultList.length = 0;
    calcPagination();
    getEmpathyList();

});



var resultList = [];
function makeList(){
    calcPagination();

    $("tbody").empty();
    $(".pagination").empty();

    $.each(resultList, function (i, item){

        let tr = $('<tr class="board-view" style="background-color: rgb(252, 247, 243);">');

        let td1 = $("<td>-</td>");
        if(item.boardNo != undefined)
            td1 = $("<td>"+item.boardNo+"</td>");
        else if(item.postNo != 0)
            td1 = $("<td>"+item.postNo+"</td>");

        let td2 = $("<td>"+item.boardTitle+"</td>");

        let td3 = $("<td>-</td>");
        if(item.replyCreateDate != undefined)
            td3 = $("<td>"+item.replyCreateDate+"</td>");
        else if(item.createDate != undefined)
            td3 = $("<td>"+item.createDate+"</td>");
        else if(item.enrollDate != undefined)
            td3 = $("<td>"+item.enrollDate+"</td>");

        let td4 = $("<td>"+item.readCount+"</td>");

        tr.append(td1, td2, td3, td4);
        $("tbody").append(tr);
    });

    const pagination = $("#pagination");

    pagination.empty();
    const leftSpan = $('<span><</span>');
    const leftDoubleSpan = $('<span><<</span>');

    const rightSpan = $('<span>></span>');
    const rightDoubleSpan = $('<span>>></span>');

    pagination.append(leftDoubleSpan, leftSpan);
    for(let i = endPage - 9; i <= endPage; i++){
        if(i < 1) i = 1;

        if(currentPage == i)
            pagination.append($('<div style="background-color: #dddddd;">' + i + '</div>'));
        else
            pagination.append($('<div>' + i + '</div>'));
    }
    pagination.append(rightSpan, rightDoubleSpan);
    colorSet();
}

$(document).on("click", "#pagination div", function (){
    const index = $("#pagination div").index($(this));
    const clickable = $(this).text();

    currentPage = Number.parseInt(clickable);

    calcPagination();

    if(btnNumber == 1)      getBoardList();
    else if(btnNumber == 2) getReplyList();
    else if(btnNumber == 3) getScrapList();
    else if(btnNumber == 4) getEmpathyList();

    makeList();
});

$(document).on("click", "#pagination span", function (){
    const clickable = $(this).text();

    if(clickable == '>'){
        if(currentPage > maxPage - 11)  currentPage = maxPage;
        else                            currentPage = currentPage + 10;
    }else if(clickable == '<'){
        if(currentPage < 11)    currentPage = 1;
        else                    currentPage = currentPage - 10;
    }else if(clickable == '<<')  currentPage = 1;
    else if(clickable == '>>')   currentPage = maxPage;

    calcPagination();

    if(btnNumber == 1)      getBoardList();
    else if(btnNumber == 2) getReplyList();
    else if(btnNumber == 3) getScrapList();
    else if(btnNumber == 4) getEmpathyList();

    makeList();
});


function getReplyList(){
    $.ajax({
        url: "myReplyList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {
            $.each(result, function (i, item){
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
}

function getScrapList(){
    $.ajax({
        url: "myScrapList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {
            $.each(result, function (i, item){
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
}

function getBoardList(){
    $.ajax({
        url: "myBoardList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {
            $.each(result, function (i, item){
                // currentPage = 1;
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
}
$(function (){
    getBoardList();
});


function getEmpathyList(){
    $.ajax({
        url: "myEmpathyList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {

            $.each(result, function (i, item){
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
                console.log(item);
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
};

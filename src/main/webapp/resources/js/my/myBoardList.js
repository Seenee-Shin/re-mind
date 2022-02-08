
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


// console.log($(".side_menu li"));

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


// $(window).scroll(function(e){
//     // console.log($(this).scrollTop());
//
//     underLineDraw(line, $(".div-btn").eq(backupIndex));
// });


/*


let totalData; //총 데이터 수
let dataPerPage = 10; //한 페이지에 나타낼 글 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지

var qwe = [];

*/

// console.log(qwe);
//
// console.log(totalData);

/*
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {

    let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림..
    currentPage = Number(currentPage);
    dataPerPage = Number(dataPerPage);

    for (
        var i = (currentPage - 1) * dataPerPage;
        i < (currentPage - 1) * dataPerPage + dataPerPage;
        i++
    ) {
        let td = '<td>' + qwe[i].boardNo + '</td>' +
            '<td>' + qwe.boardTitle + '</td>' +
            '<td>' + qwe.replyCreateDate + '</td>' +
            '<td>' + qwe.readCount + '</td>';


        }
        const tr = $('<tr class=\"board-view\" style=\"background-color: rgb(252, 247, 243);\">');

        tr.append(td);
        $("tbody").append(tr);
}*/


var currentPage = 1;
var listCount;

var limit = 10;
var pageSize = 10;

var maxPage;
var startPage;
var endPage;

var prevPage;
var nextPage;
// private int currentPage;		// 현재 페이지 번호
// private int listCount;			// 전체 게시글 수
// private int limit = 10;			// 한 페이지 목록에 보여지는 게시글 수
// private int pageSize = 10;		// 보여질 페이지 번호 개수
// private int maxPage;			// 마지막 페이지 번호
// private int startPage;			// 보여지는 맨 앞 페이지 번호
// private int endPage;			// 보여지는 맨 뒤 페이지 번호
// private int prevPage;			// 이전 페이지의 페이지 번호 맨 끝
// private int nextPage;			// 다음 페이지의 페이지 번호 맨 앞

$("#select_myReplyList").on("click", function (){

    $.ajax({
        url: "myReplyList",
        type: "GET",
        data: {"memberNo": memberNo},
        dataType: "json",
        success: function (result) {

            listCount = result.length;

            console.log(listCount)
            maxPage = Number.parseInt(Math.floor(listCount / limit));
            startPage = (currentPage-1) / pageSize * pageSize + 1;
            endPage = startPage + pageSize - 1;

            if(endPage > maxPage)   endPage = maxPage;

            if(currentPage <= 10)	prevPage = 1;
            else                    prevPage = startPage - 1;

            if(endPage == maxPage) nextPage = maxPage;
            else				   nextPage = endPage + 1;

            $("tbody").empty();
            $(".pagination").empty();

            $.each(result, function (i, item){

                let last = currentPage * 10;
                var first = last - (10 - 1) <= 0 ? 1 : last - (10 - 1);

                if(i > last || i <= first)    return;

                let tr = $('<tr className="board-view" style="background-color: rgb(252, 247, 243);">');
                let td1 = $("<td>"+item.replyNo+"</td>");
                let td2 = $("<td>"+item.boardTitle+"</td>");
                let td3 = $("<td>"+item.replyCreateDate+"</td>");
                let td4 = $("<td>"+item.readCount+"</td>");

                tr.append(td1, td2, td3, td4);
                $("tbody").append(tr);

            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        colorSet();
    });
});


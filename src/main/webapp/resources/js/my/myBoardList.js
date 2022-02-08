
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
    // if(innerWidth > 950){

    // }else if(innerWidth > 768 && innerWidth <= 950){

    // }else{

    // }
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

    // function selectMyReplyList() {
$("#select_myReplyList").on("click", function (){

        $.ajax({
            url: "myReplyList",
            type: "GET",
            data: {"memberNo": memberNo},
            dataType: "json",
            success: function (selectMyReplyList) {
                // console.log(selectMyReplyList);
                // console.log(memberNo); 72
                // console.log(selectMyReplyList.length);

                // totalData = selectMyReplyList.length;


                $(".board-info").empty();
                $(".my-5").empty();
                $("tbody").empty();




                $.each(selectMyReplyList, function (i, item) {

                    // console.log(item)

                    // qwe[i] = item;

                    const tr = $('<tr class=\"board-view\" style=\"background-color: rgb(252, 247, 243);\">');
                    let td = '<td>' + item.boardNo + '</td>' +
                        '<td>' + item.boardTitle + '</td>' +
                        '<td>' + item.replyCreateDate + '</td>' +
                        '<td>' + item.readCount + '</td>';
                    tr.append(td);
                    $("tbody").append(tr);

                }) // each

            },
            error: function (error, status) {
                console.log("error : " + error + "\n" + "status : " + status);
            }
        });


    /*    totalData = $(this).length; //총 데이터 수
        dataPerPage = 10; //한 페이지에 나타낼 글 수
        pageCount = 10; //페이징에 나타낼 페이지 수
        globalCurrentPage = 1; //현재 페이지

    //글 목록 표시 호출 (테이블 생성)
    displayData(1, dataPerPage);

    //페이징 표시 호출
    paging(totalData, dataPerPage, pageCount, 1);*/

    });

/*

function paging(totalData, dataPerPage, pageCount, currentPage) {
    console.log("currentPage : " + currentPage);

    totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수

    if(totalPage<pageCount){
        pageCount=totalPage;
    }

    let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
    let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호

    if (last > totalPage) {
        last = totalPage;
    }

    let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
    let next = last + 1;
    let prev = first - 1;

    let pageHtml = "";

    if (prev > 0) {
        pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
    }

    //페이징 번호 표시
    for (var i = first; i <= last; i++) {
        if (currentPage == i) {
            pageHtml +=
                "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
        } else {
            pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
        }
    }

    if (last < totalPage) {
        pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
    }

    $(".pagination").html(pageHtml);
    let displayCount = "";
    displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
    $("#displayCount").text(displayCount);


    //페이징 번호 클릭 이벤트
    $(".pagination li a").on("click",function () {
        let $id = $(this).attr("id");
        let selectedPage = $(this).text();

        if ($id == "next") selectedPage = next;
        if ($id == "prev") selectedPage = prev;

        //전역변수에 선택한 페이지 번호를 담는다
        globalCurrentPage = selectedPage;
        //페이징 표시 재호출
        paging(totalData, dataPerPage, pageCount, selectedPage);
        //글 목록 표시 재호출
        displayData(selectedPage, dataPerPage);
    });
}
*/

//
// $("#dataPerPage").on("change",function () {
//     dataPerPage = $("#dataPerPage").val();
//     //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경
//     paging(totalData, dataPerPage, pageCount, globalCurrentPage);
//     displayData(globalCurrentPage, dataPerPage);
// });


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

/* 페이지 요청시  AJAX */

function selectMyReplyList(){


    $.ajax({
        url : "myReplyList",
        type : "GET",
        data : {"memberNo" : memberNo},
        dataType : "json",
        success : function (selectMyReplyList){
            console.log(selectMyReplyList);
            // console.log(memberNo); 72
                $(".board-info").empty();

            $.each(selectMyReplyList, function (i,item){
                // const tr = $("<tr class='board-view'>");
                // const td = $('<td>');

                console.log(item)

                $(".my-5").empty();

                const tr = $('<tr class=\"board-view\" style=\"background-color: rgb(252, 247, 243);\">');
                let td = '<td>'+item.boardNo+'</td>' +
                '<td>'+item.boardTitle+'</td>' +
                '<td>'+item.replyCreateDate+'</td>' +
                '<td>'+item.readCount+'</td>';
                tr.append(td);
                $("tbody").append(tr);



            }) // each

        },
        error : function (error, status){
            console.log("error : " + error + "\n" + "status : " + status );
        }


    });



};

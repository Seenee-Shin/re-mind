
let QUES = [];
let ctCode;
let nowQNo = 1;

let allAnswerLen;
let allQuestionLen;


let flag = false;
/*
카테고리 코드 ctCode
현재 문항 번호 nowQNo

총 답변 갯수 allAnswerLen
총 문항 갯수 allQuestionLen
*/

$(".selfTest_prev_btn, .selfTest_next_btn").css("display", "block");


function addACount(){
    for(let i = 0; i < allAnswerLen; i++){
        $(".selfTest_result").eq(i).text(QUES[i].answerContent);
    }
    $(".selfTest_result").css("backgroundColor", "white");
}

function addQCount(){
    $(".selfTest_content > div:first-of-type").html(QUES[nowQNo + allAnswerLen - 1].answerContent);
}

function next(){
    if(!flag) return false;
    nowQNo = nowQNo + 1;
    flag = false;

    // 문제 불러오기
    addQCount();

    // 답변 불러오기
    addACount();

    $(".selfTest_content > span:first-child").text(nowQNo);

}

function prev(){
    if(nowQNo < 2) return false;
    nowQNo = nowQNo - 1;

    // 문제 불러오기
    addQCount();

    // 답변 불러오기
    addACount();

    $(".selfTest_content > span:first-child").text(nowQNo);

}

$(".selfTest_op").on("click", function (){

    ctCode = $(this).attr("id");
    const index = $(this).index($(this));
    const nm = $(this).text();
    console.log(nm);

    $.ajax({
        url : "selftestQuestion",
        type : "POST",
        data : {"categoryNo":ctCode},
        dataType : "json",
        success : function (result){
            QUES = result;
            if(ctCode == 1) {
                allAnswerLen = 4; // 이것만 직접 바꿔주면 됨 / 전체 답변 수
                allQuestionLen = result.length - allAnswerLen;

                // 카테고리 표시
                $(".selfTest_title > h1").text(nm + " 자가진단 테스트");

                // 현재 문제 번호 표시
                $(".selfTest_content > span:first-child").text(nowQNo);

                // 총 문항 갯수 표시
                $(".selfTest_content > span:nth-child(3)").text("총 " + allQuestionLen + "문항");

                // 1번문항을 ajax요청 후 보여줌
                $(".selfTest_content > div:first-of-type").html(QUES[nowQNo + allAnswerLen - 1].answerContent);


                addACount();

            }else if(ctCode == 2){
                allAnswerLen = 4; // 이것만 직접 바꿔주면 됨 / 전체 답변 수
                allQuestionLen = result.length - allAnswerLen;

                // 카테고리 표시
                $(".selfTest_title > h1").text(nm + " 자가진단 테스트");

                // 현재 문제 번호 표시
                $(".selfTest_content > span:first-child").text(nowQNo);

                // 총 문항 갯수 표시
                $(".selfTest_content > span:nth-child(3)").text("총 " + allQuestionLen + "문항");

                // 1번문항을 ajax요청 후 보여줌
                $(".selfTest_content > div:first-of-type").html(QUES[nowQNo + allAnswerLen - 1].answerContent);


                addACount();

            }else if(ctCode == 3){

            }else if(ctCode == 3){

            }else if(ctCode == 3){

            }else if(ctCode == 3){

            }else if(ctCode == 3){

            }

        },
        error(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        } //error

    });

});


$(".selfTest_result").on("click", function (){
    flag = true;
    $(".selfTest_result").css("backgroundColor", "#fff").css("color", "#A59999");

    $(this).css("backgroundColor", "#A59999").css("color", "#fff");
});


// 결과창 모달 호출
$("#selfTest_result_btn").on("click",function (){

    layerPopup("selftestResult");

    return false;
});

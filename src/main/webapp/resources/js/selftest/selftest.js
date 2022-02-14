
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

$(function () {
    // 자가진단 선택
    if (type) {
        ctCode = type;
        $(".selfTest_op").eq(type-1).click();
    } else {
        $(".selfTest_op").eq(0).click();
    }
});

function testResult(){

    if(count == (qwe-1)){
        $("#selfTest_result_btn").css("display", "block");

    }else{

        $("#selfTest_result_btn").css("display", "none");
    }



}

function next(){
    let flag = false;
    for(let i=0; i<$(".selfTest_result").length; i++) {
        if( $(".selfTest_result").eq(i).hasClass("active") ) {
            flag = true;
        }
    }

    // 문항 번호
    count = count + 1;
    console.log(count);

    if (flag) {
        // 문항 가져오는것
        selftestQuestion();

        // 결과 가져오는거
        // testResult();
    } else {
        alert("답변을 선택해주세요.");
    }

    return false;



    // $(".selfTest_prev_btn").css("display","none");


    // if (count == '0'){
    //     $(".selfTest_prev_btn").css("display","none");
    // }else{
    //     $(".selfTest_prev_btn").css("display","block");
    // }


}

function prev(){
    count = count - 1;
    selftestQuestion();
    // 이전 다음 버튼
    hiddenBtn();

    $("#selfTest_result_btn").css("display", "none");
}


// 이전 다음 버튼 노출
function hiddenBtn() {
    // if (count == '0') {
    //     $(".selfTest_prev_btn").addClass("hidden");
    // } else  if (count == (qwe-1)) {
    //     $(".selfTest_next_btn").addClass("hidden");
    // } else {
    //     $(".selfTest_prev_btn").removeClass("hidden");
    //     $(".selfTest_next_btn").removeClass("hidden");
    // }


}

// 초기화
function reset() {
    nowQNo = 1;
    allAnswerLen = undefined;

}

// 문항 번호
let count = 0;
// 점수
let jumsuu = [];

// 증상 선택
$(".selfTest_op").on("click", function () {

    reset();
    count = 0;
    jumsuu = [];
    ctCode = $(this).attr("id");
    const index = $(this).index($(this));
    const nm = $(this).text();

    $(".selfTest_op").removeClass("active");
    $(this).addClass("active");

    selftestQuestion();
    testResult();

});

// 총 문항 길이
let qwe = 0;

// 문항 가져오기
function selftestQuestion(){
    $.ajax({
        url : "selftestQuestion",
        type : "POST",
        data : {"categoryNo":ctCode},// 증상번호
        dataType : "json",
        success : function (result){
            //console.log(result);
            qwe = result.Quest.length;
            // console.log(result.Result);
            // console.log(qwe);
            //console.log(result.Quest[count]);
            let html = '<div class="selfTest_title">'
                + '<h1>자존감 자가진단 테스트</h1>'
                + '<div>'
                +'    이 검사는 자신에 대해서 어떻게 느끼는 지를'
                +'    알아보기 위한 것입니다.<br>'
                +'    각 문자를 읽고, 자신에게 해당되는 정도를'
                +'    나타내는 항목에 체크하여 주십시오.'
                + '</div>'
                + '</div>'
                + '<div class="selfTest_content">'
                +  '  <span>'+(count+1)+'</span>'
                +  '  <span></span>'
                +   ' <span>총 '+ qwe +'문항</span>'
                +  '  <div>'+ result.Quest[count].questionContent +'</div>'
                +   ' <div id="selfTest_content_option">'

                +'    </div>'
                + '</div>'

                 let html2 = "";
            // console.log(result.Answer.length);   총 길이

                for(let i=0; i< result.Answer.length; i++){

                        html2 += '<div class="selfTest_result" onclick="saveScore('+ result.Answer[i].answerType +', '+i+')">' + result.Answer[i].answerContent + '</div>';

                    }

                 $(".selfTest").html(html);

                    $("#selfTest_content_option").append(html2);

                }, error(request,status,error){
                     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                } //error

         });
}

// 딥변
$(".selfTest_result").on("click", function (){
    flag = true;

    $(".selfTest_result").removeClass("active");
    $(this).addClass("active");
});



// 점수 누적
let score = 0;
function saveScore(score, btnIndex){
    // 초기화
    $(".selfTest_result").removeClass("active");

    // 선택
    $(".selfTest_result").eq(btnIndex).addClass("active");

    // 문항 점수
    jumsuu[count] = score;
}

// 합산 검사
function resultScore(){
    for(let i= 0; i<jumsuu.length; i++){
        if(jumsuu[i] == undefined){
            alert("선택하지 않은 번호가 있습니다.");
            count = i;
            selftestQuestion();
            return false;
        }else{
            if(jumsuu.length == qwe){

                score += jumsuu[i];

                console.log(score);
                layerPopup("selftestResult");
            }
        }
    }
    for(let i=jumsuu.length; i<qwe; i++){
        if(jumsuu[i] == undefined) {
            alert("선택하지 않은 번호가 있습니다.");
            count = i;
            selftestQuestion();
            return false;
        }
    }


    // 테스트 결과 보기
    $.ajax({
        url : "selftestResult",
        type : "GET",
        data : {"categoryNo":ctCode, "score":score}, // 증상번호, 합산 값
        dataType : "json",
        success : function (result2){
            // console.log(score);
            // console.log(ctCode);

            console.log("result2 : " + result2);
            let htmlHtml = '<div class="selftest_modal_title">'
                         +'   자존감 자가진단 결과'
                        + '</div>'
                    + '<div class="selftest_modal_content">'
                    + '<div>'
                    // + "result2.selftest"
                   +'     </div>'
                   +' </div>'
                   +' <button id="selfTest_btn">확인</button>'



        }

    })


}

// // 웹/모바일 확인
// if (/Mobile|Android/i.test(navigator.userAgent)) {
//     console.log(":mobile");
// }else{
//     console.log(":web");
// }

const contextPath = "${contextPath}";
const questionNo = "${selftest.questionNo}";

$(".selfTest_op").on("click", function (){

    $.ajax({
        url : "/selftestForm",
        data : {"questionNo":questionNo},
        dataType : "json",
        success : function (question){
        },
        error(){

        } //error

    });


});







// 결과창 모달 호출
$(".selfTest-next-btn").on("click",function (){

    layerPopup("selftestResult");

    return false;
});

//     window.onload = function() {
 
//     function onClick() {
//         document.querySelector('.modal_wrap').style.display ='block';
//         document.querySelector('.black_bg').style.display ='block';
//     }   
//     function offClick() {
//         document.querySelector('.modal_wrap').style.display ='none';
//         document.querySelector('.black_bg').style.display ='none';
//     }
 
//     document.getElementById('modal_btn').addEventListener('click', onClick);
//     document.querySelector('.modal_close').addEventListener('click', offClick);
 
// };




// 점수 합산용
var selfTest_score = 0;

$(".selfTest_result").on("click", function(){
    const index = $(".selfTest_result").index($(this));
    const count = $(".selfTest_result").length;

    $(".selfTest_result").css("background-color", "white").css("color", "#ccc");
    $(this).css("background-color", "#A59999").css("color", "white");
    $(this).attr("id");
    console.log($(this).attr("id"));

    // 합산용
    selfTest_score = Number(selfTest_score) + Number($(this).attr("id"));
    // console.log(selfTest_score);

});

$(".selfTestBtn").on("click", function(){
    $(this).css("background", "#fff").css("color", "#A59999");
    $(this).css("background-color", "#A59999").css("color", "#FFF");
    //$(this).css("background-color", "white").css("color", "#ccc");

});
// let selfObj = [
//     {score:0, gender:"gender"},
//     {score:100, gender:"남"},
//     {score:50, gender:"여"},
//     {score:77, gender:"유성민"}
// ]

// for in 일땐 인덱스 값 추출
// for of 일땐 객체 추출


// for ( item of selfObj) {
//     console.log(selfOb);
// }


    // $.each(selfObj, function(i, item){
    //     if(i == 0){
    //         console.log(item);
    
    //     }else if(i == 1){
    //         console.log(item);
    //     }
    // });





// document.querySelectorAll(".selfTest_result").forEach(function(e, i, arr){
    
//     e.addEventListener("click", function(){
//         for(let i = 0; i < arr.length; i++){
//             arr[i].style.background = "white";
            
//         }
//         selfTest_score = selfTest_score + arr[i].getAttribute("id")
//         console.log(selfTest_score);
//         arr[i].style.background = "#A59999";

//     })

// });

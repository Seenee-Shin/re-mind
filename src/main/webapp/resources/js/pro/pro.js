$(".cate_btn").on("click",function(){

    if($(this).hasClass('cate_btn_click')){
        $(this).removeClass('cate_btn_click'); 
    }else{ 
        if($(".cate_btn_click").length > 4){
            alert("최대 5개만 선택할 수 있어요!");
        }else{
            $(this).addClass('cate_btn_click');
        }
    }
});



// 상담사 상세페이지 네비게이션 ( 상담사 한마디, 후기)

$(".detail_btn").on("click",function(){

    $(".detail_btn").removeClass("detail_contents_click");
    $(this).addClass("detail_contents_click");

});


// 예상 수강료
let therapySelect;
let therapyCount;

$("#therapy_select").change(function(){
    therapySelect = $(this).val();
    calc();
});

$("#therapy_count").change(function(){ 
    therapyCount = $(this).val();
    calc();
});

// 상담가격 , 천단위 콤마
function calc(){
    if(therapySelect != undefined && therapySelect != 0){
        if(therapyCount != undefined && therapyCount != 0){
            var price = Number(therapySelect) * Number(therapyCount);
            var price2 = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $("#price").html(price2 + "<span>원</span>");
        }else{

        }
    }
}

$("#mobile_category_btn").on("click",function(){
    $("#mobile_pro_category").css("display","block");
    $("#header").css("display","none");
    $("#mobile_category_btn").css("display","none");
});

$("#category_cancel_btn").on("click",function(){

    $("#mobile_pro_category").css("display","none");
    $("#header").css("display","block");
    $("#mobile_category_btn").css("display","block");
});


$(".mobile_cate_btn").on("click",function(){

    if($(this).hasClass('mobile_cate_btn_click')){
        $(this).removeClass('mobile_cate_btn_click'); 
    }else{ 
        if($(".mobile_cate_btn_click").length > 4){
            alert("최대 5개만 선택할 수 있어요!");
        }else{
            $(this).addClass('mobile_cate_btn_click');
        }
    }
});



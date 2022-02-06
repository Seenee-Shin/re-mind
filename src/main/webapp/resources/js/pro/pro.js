// 상담사 목록페이지 카테고리 선택(pc)
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

// 상담사 목록페이지 카테고리 선택(모바일)
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

// 상담사 상세페이지 네비게이션 (상담사 한마디, 후기)
$(".detail_btn").on("click",function(){
    
    $(".detail_btn").removeClass("detail_contents_click");
    $(this).addClass("detail_contents_click");

});    

// 예상 수강료
let therapySelect;
let therapyCount;

$("#therapy_select").change(function(){
    therapySelect = $(this).val();
    therapySelectText = $("#therapy_select option:selected").text();
    calc();

    $("#therapy_chk").text(therapySelectText);
});    

$("#therapy_count").change(function(){ 
    therapyCount = $(this).val();
    therapyCountText = $("#therapy_count option:selected").text();
    calc();

    $("#therapy_count_chk").text(therapyCountText);
});    

let price;

// 상담가격 , 천단위 콤마
function calc(){
    if(therapySelect != undefined && therapySelect != 0){
        if(therapyCount != undefined && therapyCount != 0){
            price = Number(therapySelect) * Number(therapyCount);
            var price2 = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $("#price").html(price2 + "<span>원</span>");
        }else{

        }    
    }    
}    

// 시간 선택
$("#time_select").change(function(){
    timeSelect = $("#time_select option:selected").text();

    $("#time_chk").text(timeSelect);
});    

// 날짜 선택
let asff;
let splitYear;
let splitMonth;
let splitDate;


$(document).on("click", "#calendar td", function (){
    
    asff= $("#ym").text().split("년 ");
    splitYear = asff[0];
    splitMonth = asff[1].split("월");

    splitDate = $(this).attr("id");

    $("#date_chk").text(splitYear +"-"+splitMonth[0]+"-"+ splitDate);

});

// 상담사 목록페이지 카테고리 선택(모바일)
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


// 결제
function requestPay(){
   
    if($("#therapy_chk").text() == "선택"){
        alert("테라피를 선택해주세요");
        return;
    }else if($("#therapy_count_chk").text() == "선택"){
        alert("횟수를 선택해주세요");
        return;
    }else if($("#date_chk").text() == "선택"){
        alert("상담 날짜를 선택해주세요");
        return;
    }else if($("#time_chk").text() == "선택"){
        alert("상담 시간을 선택해주세요");
        return;
    }else{

        // const price = $("#price").text().split("원");
        // const finallyPrice = price[0];

        const count = $("#therapy_count_chk").text().split("회");
        const therapyCount = Number.parseInt(count[0]);
        
         // 1.주문정보 테이블에 인서트 에이젝스
         $.ajax({
            url : contextPath + "/pro/priceInsert",
            type : "POST",
            data : {"price":price, "therapyCount": therapyCount},

            success : function(payNo){

                //2 . ajax 성공 시 아이포트 수행
                IMP.init("imp11319218"); // 예: imp00000000
                IMP.request_pay({
                    pg : 'inicis', // version 1.1.0부터 지원.
                    pay_method : 'card',
                    merchant_uid : 'merchant_' + new Date().getTime(),
                    name : '마음연구소 re:mind',
                    amount : price, //판매 가격
                    buyer_email : 'iamport@siot.do',
                    buyer_name : '구매자이름',
                    buyer_tel : '010-1234-5678'
                    
                }, function(rsp) {

                    if ( rsp.success ) { // 결제에 성공했을경우

                        // 3. 주문번호를 이용하여 db에 select 됐던 총 금액 조회
                        $.ajax({
                            url : contextPath + "/pro/priceSelect",
                            type : "POST",
                            data : {"payNo":payNo},

                            success : function(price){

                                console.log(price);

                                // 4. DB 조회된 총금액과 rsp.paid_amount 가 같으면 결제 성공
                                if(price == rsp.paid_amount){

                                    var msg = '결제가 완료되었습니다.';
                                    msg += '고유ID : ' + rsp.imp_uid;
                                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                                    msg += '결제 금액 : ' + rsp.paid_amount;
                                    msg += '카드 승인번호 : ' + rsp.apply_num;

                                    // update와 insert 동시 진행

                                }else{
                                // 5.  DB 조회된 총금액과 rsp.paid_amount 가 같지 않으면 삭제 ajax
                                    alert("결제가 실패 하였습니다.");
                                }
                                
                            }, // 총 금액을 가지고 온 ajax

                        });
                       
                    } else { // 결제에 실패했을경우
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;

                        
                        $.ajax({

                        });
                    }
                }); 
            },
        });

    } //else end
    
}



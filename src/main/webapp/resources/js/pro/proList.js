var clickable = [];

$(document).on("click", ".cate_btn_click", function (){
    ul.empty();
    currentPage = 1;
    calcPagination();
});

var gender;
$(".gender").on("click", function (){
    const thisId = $(this).attr("id");
    if(thisId == "pro_male")
        gender = 1;
    else if(thisId == "pro_famale")
        gender = 2;

    ul.empty();
    makePro();
});

var therapy = null;
$(".therapy").on("click", function (){
    const thisId = $(this).attr("id");

    if(thisId == "text_counseling")
        therapy = 1;
    else if(thisId == "voice_counseling")
        therapy = 2;
    else if(thisId == "face_counseling")
        therapy = 3;

    console.log("therapy : " + therapy)

    ul.empty();
    makePro();
});

$(".cate_btn").on("click", function (){
    let val = $(this).val();

    if(val.length == 1)	val = 100 + val;
    else				val = 10 + val;
    console.log("val : " + val)

    if( $(this).attr("id") == undefined ){
        if(clickable.length > 4)	return;

        ul.empty();
        currentPage = 1;
        calcPagination();

        $(this).attr("id", val).css("backgroundColor", "rgb(166 166 168)").css("color", "white");
    }else if( $(this).attr("id") != undefined ){
        $(this).removeAttr("id").css("backgroundColor", "white").css("color", "black");
    }

    let count = 0;
    for(let i = 0; i < $(".cate_btn").length; i++){
        if($(".cate_btn").eq(i).attr("id") != undefined){
            clickable[count] = $(".cate_btn").eq(i).attr("id");
            $(".cate_btn").eq(i).attr("class", "cate_btn_click cate_btn");
            count = count + 1;
        }else{
            clickable.splice(count, 1);
        }
    }
    // 정렬
    clickable.sort(function (a, b){return a-b;});

    makePro();
});

function makeComma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

const ul = $("#pro_list");
const replyCheckCode = $("#comment, #mComment")
const checkbox = $("input[type='checkbox']")
replyCheckCode.val(1)
let nameValue;
$(document).on("input", "#pro_searchInput", function (){
    nameValue = $("#pro_searchInput").val();
});

$("#nameSearch").on("click", function (){
    ul.empty();
    makePro();
});

calcPagination();
function makePro(){

    $.ajax({
        url:"proCategory",
        data:{
            "worryCtCd": clickable,
            "last":last,
            "first":first,
            "proName":nameValue,
            "gender":gender,
            "therapy":therapy
        },
        dataType:"JSON",
        success:function (result){

            $.each(result, function (i, item){
				
				console.log(item);
				
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }

                let category = item.counselCategoryCode.split(",");
                let price = item.counselPrice.split(",");

                if(category[0] != 1 && category[0] == 2){
                    category.splice(0, 0, "undefined");
                    price.splice(0, 0, "undefined");
                }
                else if(category[0] != 1 && category[0] == 3){
                    category.splice(0, 0, "undefined", "undefined");
                    price.splice(0, 0, "undefined", "undefined");
                }
                if(category[1] != 2 && category[1] == 3){
                    category.splice(1, 0, "undefined");
                    price.splice(1, 0, "undefined");
                }

                const li = $('<li class="pro">');
                const aHref = $('<a href= '+contextPath+'/pro/proView/'+item.professionNo+' onclick="reviewList();">');

                const pro_profile = $('<div class="pro_profile">');
                const pro_profile_img1 = $('<img src="/mind/resources/images/pro/best.png" class="pro_best">');
                let pro_profile_img2;
                if(item.imagePath == undefined)//기본프로필이 없으면
                    pro_profile_img2 = $('<img src="'+contextPath+'/resources/images/basicProfile.png" class="profile">');
                else // 있으면 경로로 이미지이름 추가로 가져와야됨
                    pro_profile_img2 = $('<img src="'+contextPath+item.imagePath+'/'+item.imageName+'" class="profile">');

                pro_profile.append(pro_profile_img1, pro_profile_img2);

                const pro_intro_wrap = $('<div class="pro_intro_wrap">');
                const pro_intro_wrap_div = $("<div>");
                const pro_name = $('<div class="pro_name float-left">');
                const pro_name_h1 = $('<h1>'+item.professionName+'</h1>');
                pro_name.append(pro_name_h1)
                const review = $("<div style='float:left; margin-top:20px'>");
                const pro_reiew_count_span = $('<span style="margin-left:5px">('+item.reviewCount+')</span>');
				
				const starpoint_box2 = $('<div class="starpoint_box2">');
				//const starpoint_bg = $('<span class="starpoint_bg" style = "width : 100% ">');
				const testdiv = $('<div  style="width:'+Number.parseInt(item.starAvg)*10+'%" class="testdiv">');
				const no_star_img = $('<img src="/mind/resources/images/pro/no_star.png" class="no_star">');
				const star_img = $('<img src="/mind/resources/images/pro/all_star.png" class="star">');
				testdiv.append(star_img);
				//starpoint_bg.append(star_img);
				starpoint_box2.append(no_star_img,testdiv);
                review.append(pro_reiew_count_span,starpoint_box2);
                

                pro_intro_wrap_div.append(pro_name, review);
                const pro_intro = $('<div class="pro_intro">');
                const pro_intro_p1 = $('<p>' + item.professionIntro + '</p>');
                const pro_intro_p2 = $('<p>#가족 #대인관계 #자존감상실 #연인</p>');
                pro_intro.append(pro_intro_p1, pro_intro_p2);
                pro_intro_wrap.append(pro_intro_wrap_div, pro_intro);


                const pro_price_wrap = $('<div class="pro_price_wrap">');
                const text_price = $('<div class="text_price">');
                const text_price_img = $('<img src="/mind/resources/images/pro/text_therapy.png" class="float-left">');
                let text_price_p;
                if(category[0] == 1){
                    text_price_p = $('<p class="float-right">'+makeComma(price[0])+'<span>원</span></p>');
                }else{
                    text_price_p = $('<p class="float-right">-</p>');
                }
                text_price.append(text_price_img, text_price_p);

                const voice_price = $('<div class="voice_price clear-both">');
                const voice_price_img = $('<img src="/mind/resources/images/pro/voice_therapy.png" class="float-left">');
                let voice_price_p;
                if(category[1] == 2){
                    voice_price_p = $('<p class="float-right">'+makeComma(price[1])+'<span>원</span></p>');
                }else{
                    voice_price_p = $('<p class="float-right">-</p>');
                }
                voice_price.append(voice_price_img, voice_price_p);

                const face_price = $('<div class="face_price clear-both">');
                const face_price_img = $('<img src="/mind/resources/images/pro/face_therapy.png" class="float-left">');
                let face_price_p;
                if(category[2] == 3){
                    face_price_p = $('<p class="float-right">'+makeComma(price[2])+'<span>원</span></p>');
                }else{
                    face_price_p = $('<p class="float-right">-</p>');
                }
                face_price.append(face_price_img, face_price_p);
                pro_price_wrap.append(text_price, voice_price, face_price);

                aHref.append(pro_profile, pro_intro_wrap, pro_price_wrap);
                li.append(aHref);
                ul.append(li);
            });
        }
    }).done(function (){
        YesScroll();
    });
}
makePro();



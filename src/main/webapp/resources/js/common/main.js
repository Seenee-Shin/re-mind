//* 스와이퍼 JS */
var swiper1 = new Swiper(".mySwiper1", {
    effect: "cards",
    grabCursor: true
});

var swiper2 = new Swiper(".mySwiper2", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
        delay: 50000,
        disableOnInteraction: false
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    }
});

// 자가진단 이동
$(".main_content1_cir").on("click", function () {
    const type = $(this).data("type");
    window.location.href = contextPath+"/selftest/selftestForm?type="+type;
})

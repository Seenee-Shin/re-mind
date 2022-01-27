// 모바일 헤더 메뉴
const togle = document.querySelector('.headermenu_togle')
const menu = document.querySelector('.dep1')
const sub_menu = document.querySelectorAll('.dep2')

togle.addEventListener('click', ()=>{
    menu.classList.toggle('active')
})

menu.addEventListener('click',()=>{

})


const closePopup = document.querySelectorAll(".close_popup_btn");
const modal = document.querySelector(".modal");
const layerPopupContent = document.querySelector(".layer_popup_content");
// modal close + popup close
for(let i =0; i< closePopup.length; i++) {
    closePopup[i].addEventListener("click", () => {
        console.log("TEST");
        // 모달 close
        modal.style.display = "none";
        // 팝업 내용 지우기
        layerPopupContent.innerHTML = "";

    });
}



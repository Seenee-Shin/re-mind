
/* 카테고리 여닫기 */
const categoryBtn = document.querySelector("#worryCategoryBtn")
const category = document.querySelector(".worry_category_wrap")
const togleModal = ()=>{
    category.classList.toggle("hidden")
}


const openModal = ()=>{
    modal.classList.remove("hidden")
}
const closeModal = ()=>{
    modal.classList.add("hidden")
}
categoryBtn.addEventListener("click",togleModal)


/* 모달창 열기 */

const openBtn = document.querySelector("#openModal")
const modal =  document.querySelector(".modal")
const closeBtn = document.querySelector("#closeModal")

openBtn.addEventListener("click", openModal)
closeBtn.addEventListener("click", closeModal)




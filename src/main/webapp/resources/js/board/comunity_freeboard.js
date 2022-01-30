
/* 모바일 글작성 모달 */
const write = document.querySelector("#free_borad_wrap")
const writing = document.querySelector("#post_textarea")
const mPosting = document.querySelector(".posting_modal_warp")
const closeBtn = document.querySelector("#closeModal")

const openModal = ()=>{
    mPosting.classList.remove("hidden")
    console.log("openmodal")
}
const closeModal = ()=>{
    mPosting.classList.add("hidden")
}

window.onresize = function(){
    var innerWidth = window.innerWidth;
    var innerHeight = window.innerHeight;
    
    if(innerWidth <= 768){
        writing.readOnly=true
        writing.value = ""
        writing.onclick = openModal
        closeBtn.onclick = closeModal

    }else{
        writing.readOnly=false
        mPosting.classList.add("hidden")
        
    }

}

/*옵셩 허용 비허용 */
const comment = document.querySelector("#comment")
const scrap = document.querySelector("#scrap")
const like = document.querySelector("#like")

const commentLable = document.querySelector("label[for='comment']")
const scrapLable = document.querySelector("label[for='scrap']")
const likeLable = document.querySelector("label[for='like']")



function optionValidate(){
	
let postOption =[comment, scrap, like]
let optionLable= [commentLable,scrapLable,likeLable]
	
	 postOption.forEach((option, i) => {
		if(option[i].checked){
			optionLable[i].classList.remove("light_brown_bg")
			optionLable[i].classList.add("dark_brown_bg")
			console.log("checked")
		}else{
			option[i].unchecked
			optionLable[i].classList.remove("dark_brown_bg")
			optionLable[i].classList.add("light_brown_bg")
			console.log("unchecked")
		}
	})
	

	if(comment.checked){
		commentLable.innerText = "댓글 비허용"
		
	}else{	
		commentLable.innerText = "댓글 비허용"
	
	}
}


/* 모바일 대댓글 토글 */
const child = document.querySelectorAll(".comment_view child")




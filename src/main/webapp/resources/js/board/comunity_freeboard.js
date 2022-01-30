
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

function setMobile(){
   writing.readOnly=true
   writing.value = ""
   writing.onclick = openModal
   closeBtn.onclick = closeModal
}

if(innerWidth <= 768){
   setMobile();
}
window.onresize = function(){
    var innerWidth = window.innerWidth;
    var innerHeight = window.innerHeight;
    
   if(innerWidth <= 768){
      setMobile();

    }else{
        writing.readOnly=false
        mPosting.classList.add("hidden")
        
    }

}

/*옵션 허용 비허용 */
const comment = document.querySelector("#comment")
const scrap = document.querySelector("#scrap")
const like = document.querySelector("#like")
const mComment = document.querySelector("#mComment")
const mScrap = document.querySelector("#mScrap")
const mLike = document.querySelector("#mLike")

const commentLable = document.querySelector("label[for='comment']")
const scrapLable = document.querySelector("label[for='scrap']")
const likeLable = document.querySelector("label[for='like']")
const mCommentLable = document.querySelector("label[for='mComment']")
const mScrapLable = document.querySelector("label[for='mScrap']")
const mLikeLable = document.querySelector("label[for='mLike']")



function optionValidate(){
	
let postOption =[comment, scrap, like,mComment, mScrap,mLike]
let optionLable= [commentLable,scrapLable,likeLable,mCommentLable, mScrapLable,mLikeLable]
	
	 postOption.forEach((option, i) => {
		if(option.checked){
			optionLable[i].classList.remove("light_brown_bg")
			optionLable[i].classList.add("dark_brown_bg")
			
			if(i == 0 || i == 3)   optionLable[i].innerText = "댓글 비허용";
	        if(i == 1 || i == 4)   optionLable[i].innerText = "스크랩 비허용";
	        if(i == 2 || i == 5)   optionLable[i].innerText = "공감 비허용";

		}else{
			option.unchecked
			optionLable[i].classList.remove("dark_brown_bg")
			optionLable[i].classList.add("light_brown_bg")
			
	        if(i == 0 || i == 3)   optionLable[i].innerText = "댓글 허용";
         	if(i == 1 || i == 4)   optionLable[i].innerText = "스크랩 허용";
         	if(i == 2 || i == 5)   optionLable[i].innerText = "공감 허용";
		}
	})
	
}


/* 모바일 대댓글 토글 */
const child = document.querySelectorAll(".comment_view child")




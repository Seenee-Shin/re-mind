/*옵션 허용 비허용 */
const comment = document.querySelector("#comment")
const scrap = document.querySelector("#scrap")
const like = document.querySelector("#like")
const ano = document.querySelector("#ano")
const mComment = document.querySelector("#mComment")
const mScrap = document.querySelector("#mScrap")
const mLike = document.querySelector("#mLike")
const mAno = document.querySelector("#mAno")

const commentLable = document.querySelector("label[for='comment']")
const scrapLable = document.querySelector("label[for='scrap']")
const likeLable = document.querySelector("label[for='like']")
const anoLable = document.querySelector("label[for='ano']")
const mCommentLable = document.querySelector("label[for='mComment']")
const mScrapLable = document.querySelector("label[for='mScrap']")
const mLikeLable = document.querySelector("label[for='mLike']")
const mAnoLable = document.querySelector("label[for='mAno']")



function optionValidate(){
	
let postOption =[comment, scrap, like,ano,mComment, mScrap,mLike,mAno]
let optionLable= [commentLable,scrapLable,likeLable,anoLable,mCommentLable, mScrapLable,mLikeLable,mAnoLable]
	
	 postOption.forEach((option, i) => {
		if(option.checked){
			optionLable[i].classList.remove("light_brown_bg")
			optionLable[i].classList.add("dark_brown_bg")
			
			if(i == 0 || i == 4)   optionLable[i].innerText = "댓글 비허용";
	        if(i == 1 || i == 5)   optionLable[i].innerText = "스크랩 비허용";
	        if(i == 2 || i == 6)   optionLable[i].innerText = "공감 비허용";
	        if(i == 3 || i == 7)   optionLable[i].innerText = "익명 OFF";

		}else{
			option.unchecked
			optionLable[i].classList.remove("dark_brown_bg")
			optionLable[i].classList.add("light_brown_bg")
			
	        if(i == 0 || i == 4)   optionLable[i].innerText = "댓글 허용";
         	if(i == 1 || i == 5)   optionLable[i].innerText = "스크랩 허용";
         	if(i == 2 || i == 6)   optionLable[i].innerText = "공감 허용";
	        if(i == 3 || i == 7)   optionLable[i].innerText = "익명 ON";
		}
	})
	
}

/* 프로필 누를시 유저메뉴 보기 */
const elements = document.getElementsByClassName("writer_pic");
const userMenu = document.getElementsByClassName("userMenu")

for (let i = 0; i < elements.length; i++) {
	
    elements[i].addEventListener('click',  () =>{
    userMenu[i].classList.toggle("hidden");
	
});
}
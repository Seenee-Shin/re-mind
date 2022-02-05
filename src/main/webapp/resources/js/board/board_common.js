/*옵션 허용 비허용 */
const comment = document.querySelector("#comment")
const scrap = document.querySelector("#scrap")
const like = document.querySelector("#like")
const anon = document.querySelector("#anon")
const mComment = document.querySelector("#mComment")
const mScrap = document.querySelector("#mScrap")
const mLike = document.querySelector("#mLike")
const mAnon = document.querySelector("#mAnon")

const commentLable = document.querySelector("label[for='comment']")
const scrapLable = document.querySelector("label[for='scrap']")
const likeLable = document.querySelector("label[for='like']")
const anonLable = document.querySelector("label[for='anon']")
const mCommentLable = document.querySelector("label[for='mComment']")
const mScrapLable = document.querySelector("label[for='mScrap']")
const mLikeLable = document.querySelector("label[for='mLike']")
const mAnonLable = document.querySelector("label[for='mAnon']")



function optionValidate(){
	
let postOption =[comment, scrap, like,anon,mComment, mScrap,mLike,mAnon]
let optionLable= [commentLable,scrapLable,likeLable,anonLable,mCommentLable, mScrapLable,mLikeLable,mAnonLable]
	console.log(optionLable)
	
	 postOption.forEach((option, i) => {

		if(!option) return;
		
		if(option.checked){
			optionLable[i].classList.remove("light_brown_bg")
			optionLable[i].classList.add("dark_brown_bg")
			
			if(i == 0 || i == 4)   optionLable[i].innerText = "댓글 비허용";
	        else if(i == 1 || i == 5)   optionLable[i].innerText = "스크랩 비허용";
			else if(i == 2 || i == 6)   optionLable[i].innerText = "공감 비허용";
			else if(i == 3 || i == 7)   optionLable[i].innerText = "익명 OFF";

		}else{
			option.unchecked
			optionLable[i].classList.remove("dark_brown_bg")
			optionLable[i].classList.add("light_brown_bg")
			
	        if(i == 0 || i == 4)   optionLable[i].innerText = "댓글 허용";
			else if(i == 1 || i == 5)   optionLable[i].innerText = "스크랩 허용";
			else if(i == 2 || i == 6)   optionLable[i].innerText = "공감 허용";
			else if(i == 3 || i == 7)   optionLable[i].innerText = "익명 ON";
		}
	});
	
}

/* 프로필 누를시 유저메뉴 보기 */
const elements = document.getElementsByClassName("writer_pic");
const userMenu = document.getElementsByClassName("userMenu")

	for (let i = 0; i < elements.length; i++) {
		
	    elements[i].addEventListener('click',  () =>{
	    userMenu[i].classList.toggle("hidden");
		
	});
}


/*사진 프리뷰 */

function loadImg(){
	
	const addBtn = document.querySelector("#addFileBtn")
	
}

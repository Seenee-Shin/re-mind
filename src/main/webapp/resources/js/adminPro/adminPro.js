// 각 입력 값이 유효성 검사를 진행했는지 기록할 객체
const registCheckObj = {
    "id" : false,
    "pwd1" : false,
    "pwd2" : false,
    "phone" : false,
}

function validate(){
	for(key in registCheckObj){
		
		if(!registCheckObj[key]){
			let msg
			
			switch(key){
            	case "id" : message = "이메일이 유효하지 않습니다."; break;
           		case "pwd1" : message = "비밀번호가 유효하지 않습니다."; break;
            	case "pwd2" : message = "비밀번호가 일치하지 않습니다."; break;
            	case "phone" : message = "전화번호가 유효하지 않습니다."; break;
			}
			alert(msg);
			document.getElementById(key).focus(); 
            return false;			
			
		}
			

	
	}
}


/*이메일 유효성 & 중복검사*/

if (document.getElementById("professionId") != null) {
	document.getElementById("professionId").addEventListener("input",(e)=>{

		const inputEmail = e.target.value
		const regEmail = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
		const checkEmail = document.getElementById("checkEmail")

		if(inputEmail.length ==0){
			checkEmail.innerText=""
			registCheckObj.id = false

		}else if(regEmail.test(inputEmail)){
			$.ajax({
				url :"emailDupCheck",
				type : "get",
				data : {"inputEmail":inputEmail},

				success : function(result){

					if(result == 0){
						checkEmail.innerText = "사용가능한 이메일입니다."
						checkEmail.style.color = "green"
						registCheckObj.id =true
					}else{
						checkEmail.innerText = "이미 사용중인 이메일입니다."
						checkEmail.style.color = "red"
						registCheckObj.id = false

					}
				},

				error : function(request, status, error){
					if( request.status == 404 ){
						console.log("ajax 요청 주소가 올바르지 않습니다.");

					} else if( request.status == 500){
						console.log("서버 내부 에러 발생");
						console.log(request.responseText);
					}
				}
			})
		}else{
			checkEmail.innerText = "유효하지 않은 이메일 입니다.";
			checkEmail.style.color = "red";
			registCheckObj.id = false;
		}

	})
}



//비밀번호 유효성검사
if (document.getElementById("proPw") != null) {
	document.getElementById("proPw").addEventListener("input",(e)=>{
		const regPw =  /^[a-zA-Z\d\!\@\#\-\_\*]{6,20}$/;
		const pw = document.getElementById("proPw").value
		const checkPw = document.getElementById("checkPw")

		if(pw.length == 0){
			checkPw.innerText = ""
			registCheckObj.pwd1 = false
		}else if (regPw.test(pw)){
			checkPw.innerText = "유효한 형식의 비밀번호 입니다"
			checkPw.style.color = "green";
			registCheckObj.pwd1 = true

		}else{
			checkPw.innerText = "유효하지 않은 비밀번호 입니다"
			checkPw.style.color = "red";
			registCheckObj.pwd1 = false

		}
	})
}




//비밀번호 확인
$("#proPw, #proPwCheck").on("input", function(){
	const pw = document.getElementById("proPw").value
	const pw2 = document.getElementById("proPwCheck").value
	const checkPw2 = document.getElementById("checkPw2")
	
	if(pw2.trim().length == 0){
		checkPw2.innerText =""
		registCheckObj.pwd2 = false
	}else if(pw == pw2){
		checkPw2.innerText ="비밀번호 일치"
		checkPw2.style.color = "green"
		registCheckObj.pwd2 = true
		
	}else{
		checkPw2.innerText ="비밀번호 불일치"
		checkPw2.style.color = "red"
		registCheckObj.pwd2 = true
		
		
	}

	
	
})









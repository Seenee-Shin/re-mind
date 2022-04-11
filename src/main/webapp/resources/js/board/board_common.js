
/* 프로필 누를시 유저메뉴 보기 */
/*const elements = document.getElementsByClassName("writer_pic");
const userMenu = document.getElementsByClassName("userMenu")

	for (let i = 0; i < elements.length; i++) {

	    elements[i].addEventListener('click',  () =>{
	    userMenu[i].classList.toggle("hidden");

	});
}*/

// 프로필 누를 시 유저 메뉴
$(document).on("click", ".writer_pic", function() {
	$(this).next().toggle();
});
let muteMember;
// 회원 차단
$(document).on("click", ".block", function(){

	muteMember = $(this).parent().next().val();
	var answer = confirm("차단하시겠습니까?");

	console.log(muteMember);
	if(answer){
		$.ajax({
			url : "block",
			data : {"muteMember" : muteMember},
			success : function(result){
				console.log(result)
				if(result > 0){
					swal({"title" : "차단되었습니다." ,
						"icon" : "success"}).then(function(){
						location.reload();
					});

				} else{
					swal({"title" : "회원 차단 실패" ,
						"icon" : "error"});
				}
			}
		});
	}

});


/*//파일 업로드 스크립트
$(document).ready(function()
		// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#addFileBtn").on("change", fileCheck);
		});


// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 5;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

var delete_files = new Array();

function fileCheck(e) {
    var files = e.target.files;

    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);

    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }

    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {

        content_files.push(f);

        $('#imgWrap').append(
       		'<div id="img'+fileNum+'"class="boardImg"> <img src="'+ e.target.result+'">'
       		+'<div class="deleteImg" onclick="fileDelete(\'file' + fileNum + '\')"><i class="fas fa-times"></i></div>'
       		+'</div>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //초기화 한다.
    $("#input_file").val("");
  }

// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;

	$('#img' + no).remove();

	fileCount --;
    console.log(content_files);
}



function postingValidate(){
	//사진 배열에 담기
	const form = $("form")[0];
 	const formData = new FormData(form);

	for (let i = 0; i < content_files.length; i++) {
		// 삭제 안한것만 담아 준다.
		if(!content_files[i].is_delete){
			formData.append('images', content_files[i]);
		}else{
			delete_files.push(content_files[i]);
			formData.append('deletImages',delete_files[i]);
		}
	}

	//삽입
	$.ajax({
		type: "POST",
		enctype: "multipart/form-data",
		url: "insert",
		data : formData,
		processData: false,
		contentType: false,
		success: function (result) {
			if(result > 0){
                swal({"title" : "글이 작성되었습니다." ,
                      "icon" : "success"});
   	    		$("#input_file").val("");
   	    		const imgWrap = document.querySelector("#imgWrap");

				while (imgWrap.hasChildNodes()) {	// 부모노드가 자식이 있는지 여부를 알아낸다
					imgWrap.removeChild(
						imgWrap.firstChild
					);
				}

				// 내용삭제
				$("#post_textarea").val("");
				$("replyCheckCode").val("1");
				$("scrapCheckCode").val("1");
				$("empathyCheckCode").val("1");

				// 새로 고침


				;
			} else
			    swal({"title" : "글작성 실패" ,
                      "icon" : "error"});
			},
		error: function (xhr, status, error) {
			    swal({"title" : "서버 연결 오류" ,
                      "icon" : "error"});
		}
    });

	return false;
}*/




/*시간 몇분전 표시 */
function displayedAt(createdAt) {
	const milliSeconds = new Date() - createdAt
	const seconds = milliSeconds / 1000
	if (seconds < 60) return `방금 전`
	const minutes = seconds / 60
	if (minutes < 60) return `${Math.floor(minutes)}분 전`
	const hours = minutes / 60
	if (hours < 24) return `${Math.floor(hours)}시간 전`
	const days = hours / 24
	if (days < 7) return `${Math.floor(days)}일 전`
	const weeks = days / 7
	if (weeks < 5) return `${Math.floor(weeks)}주 전`
	const months = days / 30
	if (months < 12) return `${Math.floor(months)}개월 전`
	const years = days / 365
	return `${Math.floor(years)}년 전`
}


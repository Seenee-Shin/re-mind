$(function () {
	// list 가져오기
	getWorryList();
})

function selectFreeBoardList(){
	$.ajax({
	    url : contextPath+"/free/list",
	    type : "get",
	    dataType : "json",  //응답 데이터 형식 : 제이슨 / 자동으로 JS객체로 변환
		
		success : function(freeBoardList){
			
			let i = 0;
			let html = "";
			let empathyArr;
			let empathyCntArr;
			
			let iconCnt = {};

			$.each(result.worryList, function (i, item) {
				$("#replyListArea").empty() 

				$("#replyListArea").empty() 
				
				// empathy 초기화
				empathyArr = [];
				empathyCntArr = [];
				iconCnt = {
					"1001" : 0,
					"1002" : 0,
					"1003" : 0,
					"1004" : 0,
					"1005" : 0
				};
				
				if (item.worryEmpathyArray != null) {
					empathyArr = (item.worryEmpathyArray).split(",");
					empathyCntArr = (item.worryCntArray).split(",");
				}	
				
			})
			console.log(freeBoardList)
			
			 let html =           

			

			$.each(freeBoardList,function(i,board){
				
				
				if(loginMemberNo != board.memberNo){
					
				}
				
				
				
				
				
				
			})
		},
	
	error : function(req,status,error){
      console.log("게시판 조회 실패")
      console.log(req.responseText)
	}
	})
}
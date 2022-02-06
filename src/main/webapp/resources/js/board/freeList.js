function selectFreeBoardList(){
	$.ajax({
	    url : contextPath+"/free/list",
	    type : "get",
	    dataType : "json",  //응답 데이터 형식 : 제이슨 / 자동으로 JS객체로 변환
		
		success : function(freeBoardList){
			consol.log(freeBoardList)
		},
	
	error : function(req,status,error){
      console.log("게시판 조회 실패")
      console.log(req.responseText)
	}
	})
}
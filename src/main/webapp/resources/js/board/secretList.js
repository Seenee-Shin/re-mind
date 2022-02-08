function selectsecretList(){
	$.ajax({
	    url : contextPath+"/secret/list",
	    type : "get",
	    dataType : "json",  //응답 데이터 형식 : 제이슨 / 자동으로 JS객체로 변환
		
		success : function(secretBoardList){
			$("#replyListArea").empty() 
			
			 let html =           
			 `<div class="board_list_content">
                    <!-- 프로필 시작 -->
                    <div class="board_flex_wrap">
                        <div class="writer_pic_wrap">
                            <div class="writer_pic light_brown_bg" style="background-image: url();">
                            </div>
                            <ul class="userMenu hidden">
	                            <li> <a href=""> 차단</a> </li>
	                            <li> <a href=""> 검색</a> </li>
                            </ul>                            
                        </div>


                        <a href="/freeView/${board.boardNo}">
	                        <div class="posting_info">
	                            <div class="writer_id">
	                                <p>${board.memberFn}</p> 
	                                
	                                <p> 5분전</p>
	                            </div>
	                            <div class="posting">
	                                <p>${board.boardContent}</p>
	                            </div>
	                        </div>
                        </a>
                    </div>
                    <div class="board_icon_wrap">
                        <!-- 댓글 아이콘 -->
						
                        <div class="commnet_wrap">
                            <i class="far fa-comment dark-brown"></i>
                            <p>3</p>
                        </div>

                 		<!-- 공감수 표시 -->
		
                        <div class="like_warp">
                            <img src="${contextPath}/resources/images/icon/smile.png" alt="">
                            <p></p>
                            <img src="${contextPath}/resources/images/icon/hug.png" alt="">
                            <p>2</p>
                            <img src="${contextPath}/resources/images/icon/amazed.png" alt="">
                            <p>2</p>
                            <img src="${contextPath}/resources/images/icon/angry.png" alt="">
                            <p>2</p>
                            <img src="${contextPath}/resources/images/icon/crying.png" alt="">
                            <p>2</p>
                        </div>
                    </div>
                </div>`;
			

			$.each(secretBoardList,function(i,board){
				
				
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
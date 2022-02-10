	// 검색
	const searchSelect = $("#search_category");
	searchSelect.on("click", function () {
		
		const data = {
			"searchCategory" : $("#search_category option:selected").val(),
			"searchText" : $("[name='freeboard_search']").val()
		}

		getFreeList(data);
	});
	
// list 가져오기
function getFreeList(searchData) {
	let data = {};

	if (searchData != null) {
		data = searchData;
	}

	$.ajax({
		url : "${contextPath}/free/list",
		type : "POST",
		data : data,
		success : function (result) {

			var html = [];
			var freeBoardList = $('#freeBoardList')
			let empathyArr;
			let empathyCntArr;
			let iconCnt = {};
			
			$.each(result.freeBoardList, function (i, item) {

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

				for(i=0; i<empathyArr.length; i++) {
					iconCnt[empathyArr[i]] = empathyCntArr[i];
				}
				
				html.push('<div class="board_list_content">'
                    +'		<div class="board_flex_wrap"> '
                        +'			<div class="writer_pic_wrap">'
                            + '				<div class="writer_pic light_brown_bg" style="background-image: url('+ +')">'
                            +'				</div>')
                  
                 if(loginMemberNo != item.memberNo){
					html.push('				<ul class="userMenu hidden">'
								+'					<li>'
								+'						<a href="'+ +'"> 차단</a>'
								+'					</li>'
		                        +'					<li>'
		                        +'						<a href="'+ +'"> 검색</a></li>'
		                        +'				</ul>'
		                        +'			</div>')
				}else{
					html.push('		</div>')	
				}
				
				html.push('			<a href="/view/'+item.boardNo+'">'
					+'				<div class="posting_info">'
					+'					<div class="writer_id"> '
		            +'						<p>'+item.memberFn+'</p>'
		            +'						<p>'+item.createDate+'</p>'
		            +'					</div>'
		            + '					<div class="posting">'
		            +'						<p>'+item.boardContent+'</p>'
		            +'					</div>'
		            +'				</div>'
		            +'			</a>'
		            +'		</div>'
		            +'		<div class="board_icon_wrap">')
		            
		          	if(item.replyCheckCode == 1){
						html.push('			<div class="commnet_wrap"> '
						+'				<i class="far fa-comment dark-brown"></i>')
						+'				<p>'+item.replyCount+'</p>'
						+'			</div>'
					}else{
						html.push('<div class="commnet_wrap"></div>')
					}
					
					if(item.empathyCheckCode == 1){
						html.push('<div class="like_warp">'
						+'				<img src="${contextPath}/resources/images/icon/smile.png" alt="">'
						+'				<p>'+iconCnt[1001]+'</p>'
						+'				<img src="${contextPath}/resources/images/icon/hug.png" alt="">'
						+'				<p>'+iconCnt[1002]+'</p>'
						+'				<img src="${contextPath}/resources/images/icon/amazed.png" alt="">'
						+'				<p>'+iconCnt[1003]+'</p>'
						+'				<img src="${contextPath}/resources/images/icon/angry.png" alt="">'
						+'				<p>'+iconCnt[1004]+'</p>'
						+'				<img src="${contextPath}/resources/images/icon/crying.png" alt="">'
						+'				<p>'+iconCnt[1005]+'</p>');
					}else{
						html.push('			<div class="like_warp"></div>')
					}
					
					html.push('			</div>'
								+'		</div>'
								+'	</div>')
					freeBoardList.html(html.join(''))
			});

		},
		error : function(request, status, error){
			console.log("ajax 통신 중 오류 발생");
			console.log(request.responseText);
		}


	});
}

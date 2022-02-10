	// 검색
	const searchSelect = $("#freeboard_search");
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

				let html = "";
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

					;
					});
				 if
				
				


			},
			error : function(request, status, error){
				console.log("ajax 통신 중 오류 발생");
				console.log(request.responseText);
			}


		});
	}

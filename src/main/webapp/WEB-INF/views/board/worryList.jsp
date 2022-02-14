<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

	        <section class="main_content">    
	            <!-- 메인 -->
	            <div  class="comunity_title">
	                <h3>고민을 나눠보면 어떨까요?</h3>
	                <p> 회원분들과 전문가분들이 여러분을 도와주실거에요.</p>
	                <button id="openModal" class="submit_btn"> 고민 작성하기 </button>
	            </div>

				<div class="worry_search_area">
	                <div class="worry_top_wrap">
	                    <div class="worry_category" >
	                        <button type="button" class="submit_btn dark_brown_bg" id="worryCategoryBtn" >카테고리</button>
	                    </div>
	
	                    <div class="search_area">
	                        <div class="search_wrap">
	                            <select name="search_category" id="search_category">
	                                <option value="id">닉네임</option>
	                                <option value="content">내용</option>
	                            </select>
	                            <input type="text" name="freeboard_search">
	                            <button type="button" class="submit_btn light_brown_bg" id="freeboard_search"> 검색 </button>
	                        </div>
	                    </div>
	                </div>
	                <!-- 카테고리 숨김 -->
	                <div class="worry_category_wrap hidden">
	                    <div class="worry_category">
		                    <div class="check_box_wrap">
			                    <label for="category_all" class="dark_brown_border active">전체</label>
			                    <input type="radio" id="category_all" name="worryCategory" value="0" checked>
		                    </div>
		                    <c:forEach items="${categoryList}" var="category" varStatus="status">
			                    <div class="check_box_wrap">
				                    <label for="category_${status.index}" class="dark_brown_border">${category.worryName}</label>
				                    <input type="radio" id="category_${status.index}" name="worryCategory" value="${category.worryCategoryCode}">
			                    </div>
		                    </c:forEach>
	                    </div>
	                </div>
				</div>

				<form action="insert" method="post" enctype="multipart/form-data" role="form" onsubmit="return postingValidate();">
	                <!-- 글작성 모달창 -->
	                <div class="postModal hidden">
	                    <div class="postModal_overlay"></div>
	                    <div class="board_write_warp">
	                        <div id="free_board_write">
	                            <i id="closeModal" class="fas fa-times"></i>
	                            <h4>고민 작성하기</h4>
	
	                            <button type="button" class="submit_btn dark_brown_bg" id="openCategoryBtn" >카테고리</button>
	                            <div class="worry_category_wrap hidden">
									<div class="worry_category">
										<c:forEach items="${categoryList}" var="category" varStatus="status">
											<div class="check_box_wrap">
												<label for="normal_${status.index}" class="dark_brown_border ${status.index == 0 ? "active" : ""}">${category.worryName}</label>
												<input type="radio" id="normal_${status.index}" name="worryCategoryCode" value="${category.worryCategoryCode}" ${status.index == 0 ? "checked" : ""}>
											</div>
										</c:forEach>
	                                </div>
	                            </div>
								<div class="post_title">
									<input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요">
								</div>
	                            <div class="writing">
	                                <textarea class="grey_bg" name="boardContent" id="boardContent" rows="15" placeholder="무슨 고민이 있나요?"></textarea>
	                            </div>
	                        </div>

							<div id="imgWrap"></div>

	                        <div class="write_option_area">
	                            <div class="check_box_wrap">
	                                <label for="replyCheckCode" class="light_brown_bg dark_brown_bg active">댓글 허용</label>
	                                <input type="checkbox"  name="replyCheckCode" value="1" id="replyCheckCode" checked>
	                            </div>

	                            <div class="check_box_wrap">
	                                <label for="scrapCheckCode" class="light_brown_bg dark_brown_bg active">스크랩 허용</label>
									<input type="checkbox"  name="scrapCheckCode" value="1" id="scrapCheckCode" checked>
	                            </div>
	                            <div class="check_box_wrap">
	                                <label for="empathyCheckCode" class="light_brown_bg dark_brown_bg active">공감 허용</label>
	                                <input type="checkbox"  name="empathyCheckCode" value="1" id="empathyCheckCode" checked>
	                            </div>

	                        </div>
	                        
	                        <hr>
	                        <div class="btn_area">
								<label for="addFileBtn">
									<i class="fas fa-image dark-brown" ></i>
								</label>
								<!-- name="images" -->
								<input type="file"  id='addFileBtn' accept="audio/*, video/*, image/*" multiple style="display: none">
								<button class="submit_btn light_brown_bg">작성</button>
	                        </div>
	                    </div>
	                </div>
	            </form>

	            <article id="free_borad_wrap">
	
	                <!-- 게시판 리스트 -->
	                <div class="free_board_list_wrap">
	                </div>
	
	            </article>
	        
	        </section>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/board_common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_worry_board.js"></script>

<script>
	$(function () {
		// list 가져오기
		getWorryList();

		// 파일 변경
		$("#addFileBtn").on("change", fileCheck);
	})

	// 카테고리 선택
	const inputRadio = $(".worry_search_area input[name='worryCategory']");
	inputRadio.on("click", function () {
		// 검색 초기화
		$(".worry_search_area [name='freeboard_search']").val('');
		$(".worry_search_area [name='search_category']").val('id');
		$(".worry_search_area .dark_brown_border").removeClass("active");

		const _this = $(this);
		_this.prev().addClass("active");

		const data = {
			"worryCategoryCode" : _this.val()
		}

		if (_this.val() != '0') {
			getWorryList(data);
		} else {
			getWorryList();
		}
	});

	// 검색
	const searchSelect = $("#freeboard_search");
	searchSelect.on("click", function () {
		// 카테고리 초기화
		$(".worry_search_area .dark_brown_border").removeClass("active");
		$(".worry_search_area .dark_brown_border").eq(0).addClass("active");
		$(".worry_search_area input[name='worryCategory']").eq(0).prop("checked", true);

		const searchText = $("[name='freeboard_search']").val().trim();
		if (searchText != "") {
			const data = {
				"searchCategory" : $("#search_category option:selected").val(),
				"searchText" : searchText
			}
			getWorryList(data);
		} else {
			getWorryList();
		}
	});

	// list 가져오기
	function getWorryList(searchData) {
		let data = {};

		if (searchData != null) {
			data = searchData;
		}

		data.last = last;
		data.first = first;

		$.ajax({
			url : "${contextPath}/worry/worryList",
			type : "POST",
			data : data,
			success : function (result) {

				YesScroll();

				let html = "";
				$.each(result.worryList, function (i, item) {

					// empathy 초기화
					let empathyArr = [];
					let empathyCntArr = [];
					let iconCnt = {
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

					// 프로필 이미지
					let writerImg = "${contextPath}/resources/images/basicProfile.png";
					if (item.imagePath != null) {
						writerImg = "${contextPath}/" + item.imagePath + item.imageName;
					}

					html += `
					<div class="board_list_content">
						<div class="board_flex_wrap">
							<div class="writer_pic_wrap">
								<div class="writer_pic light_brown_bg" style="background-image: url(` + writerImg + `); background-size:cover;"></div>
								<ul class="userMenu hidden">
									<li> <a class="block">차단</a> </li>
									<input class="hidden" value= ` + item.memberNo + `>
									<li> <a>검색</a> </li>
								</ul>
							</div>
							<a href="${contextPath}/worry/view/` + item.boardNo + `">
								<div class="posting_info">
									<div class="writer_id">
										<p class="userInfo">` + item.memberFn + `</p>
										<p> ` + item.createDate + `</p>
									</div>
									<div class="posting">
										<p class="listTitle">` + item.boardTitle + `</p> </br>
										<p>` + item.boardContent + `</p>
									</div>
								</div>
							</a>
						</div>
						<div class="board_icon_wrap">
							<div class="comment_wrap">
                                <i class="far fa-comment dark-brown"></i>
                                <p>` + item.replyCount + `</p>
                            </div>
							<div class="like_warp">
                                <img src="${contextPath}/resources/images/icon/smile.png" alt="" data-icon="1001">
                                <p>`+ iconCnt[1001] +`</p>
                                <img src="${contextPath}/resources/images/icon/hug.png" alt="" data-icon="1002">
                                <p>`+ iconCnt[1002] +`</p>
                                <img src="${contextPath}/resources/images/icon/amazed.png" alt="" data-icon="1003">
                                <p>`+ iconCnt[1003] +`</p>
                                <img src="${contextPath}/resources/images/icon/angry.png" alt="" data-icon="1004">
                                <p>`+ iconCnt[1004] +`</p>
                                <img src="${contextPath}/resources/images/icon/crying.png" alt="" data-icon="1005">
                                <p>`+ iconCnt[1005] +`</p>
                            </div>
                        </div>
					</div>
				`;
				});

				if (data.worryCategoryCode != undefined) {
					$(".free_board_list_wrap").html(html);
				} else {
					$(".free_board_list_wrap").append(html);

				}
			},
			error : function(request, status, error){
				console.log("ajax 통신 중 오류 발생");
				console.log(request.responseText);
			}
		});
	}

	// 고민작성하기 카테고리 선택
	const selectRadio = $(".postModal input[name='worryCategoryCode']");
	selectRadio.on("click", function () {
		$(".postModal [name='freeboard_search']").val('');
		$(".postModal [name='search_category']").val('id');
		$(".postModal .dark_brown_border").removeClass("active");

		const _this = $(this);
		_this.prev().addClass("active");
	});

	// 고민작성하기 댓글
	$("#replyCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active").text("댓글 허용");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("댓글 비허용");
			$(this).val(0);
		}
	});

	// 고민작성하기 스크랩
	$("#scrapCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active").text("스크랩 허용");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("스크랩 비허용");
			$(this).val(2);
		}
	});

	// 고민작성하기 공감
	$("#empathyCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active").text("공감 허용");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("공감 비허용");
			$(this).val(2);
		}
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

	// 파일 추가
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

		//초기화 한다.
		$("#input_file").val("");
	}

	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
		var no = fileNum.replace(/[^0-9]/g, "");
		content_files[no].is_delete = true;

		$('#img' + no).remove();

		fileCount --;
	}

	// 게시글 등록
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

					// 리스트 첫페이지 호출
					$(".free_board_list_wrap").empty();
					getWorryList();

					// 모달 창 닫기
					closeModal();

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
	}

	//페이지네이션(무한스크롤 변수 선언)
	var currentPage = 1;
	var infinityLimit = 5; // 한번에 보여질 result 수
	var pageSize = 10;
	var listCount, maxPage, startPage, endPage, prevPage, nextPage, first, last;
	// 선 계산(ajax로 넘겨야됨)
	last = currentPage * infinityLimit;
	first = last - (infinityLimit - 1) <= 0 ? 1 : last - (infinityLimit - 1);
	function calcPagination(){

		maxPage = Number.parseInt(Math.floor(listCount / infinityLimit));
		startPage = (currentPage-1) / pageSize * pageSize + 1;
		endPage = startPage + pageSize - 1;

		if(endPage > maxPage)   endPage = maxPage;

		if(currentPage <= infinityLimit)   prevPage = 1;
		else                    prevPage = startPage - 1;

		if(endPage == maxPage) nextPage = maxPage;
		else               nextPage = endPage + 1;

		last = currentPage * infinityLimit;
		first = last - (infinityLimit - 1) <= 0 ? 1 : last - (infinityLimit - 1);
	}

	// 무한스크롤
	function YesScroll () {
		console.log("scroll start");
		if(last >= listCount)   return;

		const pagination = document.querySelector('.paginaiton');
		const fullContent = document.querySelector('.main_content');
		const screenHeight = screen.height;

		let oneTime = false;
		document.addEventListener('scroll',OnScroll,{passive:true});
		function OnScroll () {

			const fullHeight = fullContent.clientHeight;
			const scrollPosition = pageYOffset;

			//이상함
			console.log(fullHeight-screenHeight/2 - 100);

			if (fullHeight-screenHeight/2 - 350<= scrollPosition && !oneTime) {
				oneTime = true;
				currentPage = currentPage + 1;
				calcPagination();
				getWorryList();
			}
		}
	}

</script>


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
	                                <option value="id">아이디</option>
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

				<form action="insert" method="post" enctype="multipart/form-data" role="form" onsubmit="return postingValidate()">
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
	                                <label for="replyCheckCode" class="light_brown_bg dark_brown_bg active"> 댓글허용 </label>
	                                <input type="checkbox"  name="replyCheckCode" value="1" id="replyCheckCode" checked>
	                            </div>

	                            <div class="check_box_wrap">
	                                <label for="scrapCheckCode" class="light_brown_bg dark_brown_bg active">스크랩허용</label>
									<input type="checkbox"  name="scrapCheckCode" value="1" id="scrapCheckCode" checked>
	                            </div>
	                            <div class="check_box_wrap">
	                                <label for="empathyCheckCode" class="light_brown_bg dark_brown_bg active"> 공감 허용</label>
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

		const data = {
			"searchCategory" : $("#search_category option:selected").val(),
			"searchText" : $("[name='freeboard_search']").val()
		}

		getWorryList(data);
	});

	// list 가져오기
	function getWorryList(searchData) {
		let data = {};

		if (searchData != null) {
			data = searchData;
		}

		$.ajax({
			url : "${contextPath}/worry/worryList",
			type : "POST",
			data : data,
			success : function (result) {

				let html = "";
				let empathyArr;
				let empathyCntArr;
				let iconCnt = {};

				$.each(result.worryList, function (i, item) {

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

					html += `
					<div class="board_list_content">
						<div class="board_flex_wrap">
							<div class="writer_pic_wrap">
								<div class="writer_pic light_brown_bg" style="background-image: url();"></div>
								<ul class="userMenu hidden">
									<li> <a class="block">차단</a> </li>
									<input class="hidden" value= ` + item.memberNo + `>
									<li> <a>검색</a> </li>
								</ul>
							</div>
							<a href="">
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
                                <p>` + 5 + `</p>
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

				$(".free_board_list_wrap").html(html);

				// if (!$.isEmptyObject(data)) { // 카테고리 선택
				//
				// } else {
				// 	$(".free_board_list_wrap").append(html);
				// }


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
			$(this).prev().addClass("dark_brown_bg").addClass("active");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active");
			$(this).val(0);
		}
	});

	// 고민작성하기 스크랩
	$("#scrapCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active");
			$(this).val(2);
		}
	});

	// 고민작성하기 공감
	$("#empathyCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active");
			$(this).val(2);
		}
	});




</script>


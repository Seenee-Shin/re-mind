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
	            
	
	            <form action="/list" method="post" onsubmit="return Validate()">
	                <div class="worry_top_wrap">
	                    <div class="worry_category" >
	                        <button type="button" class="submit_btn dark_brown_bg" id="worryCategoryBtn" >카테고리</button>
	                    </div>
	
	                    <div class="search_area">
	                    
	                        <div class="search_wrap">
	                            <select name="search_category" id="search_category">
	                                <option value="">아이디</option>
	                                <option value="">내용</option>
	                            </select>
	                            <input type="text" name="freeboard_search">
	                            <button class="submit_btn light_brown_bg"> 검색 </button>
	                        </div>
	                    </div>
	                </div>
	                <!-- 카테고리 숨김 -->
	                <div class="worry_category_wrap hidden">
	                    <div class="worry_category">
		                    <c:forEach items="${categoryList}" var="category" varStatus="status">
			                    <div class="check_box_wrap">
				                    <label for="normal${status.index}" class="dark_brown_border">${category.worryName}</label>
				                    <input type="radio" id="normal${status.index}" name="worryCategory" value="normal">
			                    </div>
		                    </c:forEach>
	                    </div>
	                </div>
	
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
				                        <div class="check_box_wrap">
			                            <label for="normal" class="dark-brown dark_brown_border">일반고민</label>
		                                <input type="radio" id="normal" name="worryCategory" value="normal">
			                        </div>
			                        
			                        <div class="check_box_wrap">
			                            <label for="normal" class="dark-brown dark_brown_border">일반고민</label>
			                            <input type="radio" id="normal" name="worryCategory" value="normal">
			                        </div>

	                                </div>
	                            </div>
								<div class="post_title">
									<input type="text" id="postTitle" name="postTitle" placeholder="제목을 입력해주세요">
								</div>
	                            <div class="writing">
	                                <textarea class="grey_bg" name="" id="post_textarea" rows="15" placeholder="무슨 고민이 있나요?"></textarea>
	                            </div>
	                        </div>
	                        
	                        <div class="write_option_area">
	                            <div class="check_box_wrap">
	                                <label for="comment" class="light_brown_bg"> 댓글허용 </label>
	                                <input type="checkbox"  name="writeOption" value="comment" id="comment" onclick="optionValidate();">
	                            </div>
	
	                            <div class="check_box_wrap">
	                                <label for="scrap" class="light_brown_bg">스크랩허용</label>
									<input type="checkbox"  name="writeOption" value="scrap" id="scrap" onclick="optionValidate();">
	                                    
	                            </div>
	                            
	                            <div class="check_box_wrap">
	                                <label for="like" class="light_brown_bg"> 공감 허용</label>
	                                <input type="checkbox"  name="writeOption" value="like" id="like" onclick="optionValidate();">
	
	                            </div>
	                            
	                        </div>
	                        
	                        <hr>
	                        <div class="btn_area">
	                            <a>
	                                <i class="fas fa-image dark-brown"></i>
	                            </a>
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
	$.ajax({
		url : "${contextPath}/secret/secretList",
		type : "POST",
		data : {},
		success : function (result) {

			let i = 0;
			let html = "";
			let empathyArr;
			let empathyCntArr;

			let iconCnt = {};

			$.each(result.secretList, function (i, item) {
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
									<li> <a href=""> 차단</a> </li>
									<li> <a href=""> 검색</a> </li>
								</ul>
							</div>
							<a href="">
								<div class="posting_info">
									<div class="writer_id">
										<p class="userInfo">` + item.memberId + `</p>
										<p> ` + item.createDate + `</p>
									</div>
									<div class="posting">
										<p>` + item.boardTitle + `</p>
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

			$(".free_board_list_wrap").append(html);
		},
		error : function(request, status, error){
			console.log("ajax 통신 중 오류 발생");
			console.log(request.responseText);
		}


	})
})





</script>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

            <section class="main_content">    
                <!-- 메인 -->

                <form action="update" method="post" 
			 	 enctype="multipart/form-data" role="form" onsubmit="return boardValidate();">		
	                <div class="back_btn">
	                    <a href="javascript:history.back();">
	                        <i class="fas fa-arrow-left"></i> 
	                    </a>
	                </div>
                <article class="board_update_wrap">
                    <div class="profile_wrap">
						<c:choose>
							<c:when test="${empty board.imageName}">
								<div class="writer_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"></div>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${anonCheckCode == 1}">
										<div class="writer_pic" style="background-image: url(${contextPath}${board.imagePath}${board.imageName});"></div>
									</c:when>
									<c:otherwise>
										<div class="writer_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"></div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>

						<div class="writer_id">
							<p>${loginMember.memberFName}</p>
						</div>
					</div>
	                    
                    <div id= "posting">
	                        <textarea name="boardContent"  onkeydown="resize(this)" onkeyup="resize(this)">${board.boardContent}</textarea>
	                        <div class="imgWrap">
		                        <c:choose>
		                        	<c:when test="${!empty board.imgList}">
			                        	 <c:forEach items="${board.imgList}" var="img" varStatus="status">
			             		       		<div id="img${status.index}" class="boardImg"> 
			             		       		<img src="${contextPath}${img.imagePath}${img.imageName}">
							       			</div>
				                        </c:forEach>
		                        	</c:when>
		                        </c:choose>
	                        </div>
	                    </div> 
                    
                      <div class="btn_area">
							<input type="hidden" name="delete_files" id="delete_files">
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
	                            <div class="check_box_wrap">
	                                <label for="anonCheckCode" class="light_brown_bg dark_brown_bg active">닉네임 공개</label>
	                                <input type="checkbox"  name="anonCheckCode" value="1" id="anonCheckCode" checked>
	                            </div>

	                        </div>
	                    </div>
	                </article>
                        
	                <div class="edit_btn_wrap">
	                    <button type="submit" class="dark-brown edit_btn"> 수정 </button>
	                    <button type="button" class="dark-brown edit_btn" onclick="location.href='${contextPath}/secret/insert'"> 목록으로  </button>
	                </div>
	             
	              <!-- update 진행 시 사용할 게시글 번호 -->
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<input type="hidden" name="deleteImages" value="${memberNo}">
	
				</form>   

            </section>
        </div>

    </main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>
<script>
// 고민작성하기 댓글
$("#replyCheckCode").on("click", function () {
	if ($(this).is(":checked")) {
		$(this).prev().addClass("dark_brown_bg").addClass("active").text("댓글 허용");
		$(this).val(1);
	} else {
		$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("댓글 비허용");
		$(this).val(2);
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

//고민작성하기 익명
$("#anonCheckCode").on("click", function () {
	if ($(this).is(":checked")) {
		$(this).prev().addClass("dark_brown_bg").addClass("active").text("닉네임 공개");
		$(this).val(1);
	} else {
		$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("닉네임 비공개");
		$(this).val(2);
	}
});


</script>






</body>
</html>
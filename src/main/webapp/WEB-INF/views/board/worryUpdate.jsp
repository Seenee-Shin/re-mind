<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

	         <section class="main_content">    
	            <!-- 메인 -->
	
	            <div class="back_btn">
	                <a href="javascript:history.back();">
	                    <i class="fas fa-arrow-left"></i> 
	                </a>
	            </div>
	            
	
	
	            <button type="button" class="submit_btn dark_brown_bg" id="worryCategoryBtn">카테고리</button>
	
	
	            <form action="update" method="post" 
			 	 enctype="multipart/form-data" role="form" onsubmit="return boardValidate();">
			 	 
	                <div class="worry_category_wrap hidden">
	                    <div class="worry_category">
							<c:forEach items="${categoryList}" var="category" varStatus="status">
								<div class="check_box_wrap">
									<label for="normal_${status.index}" class="dark_brown_border ${board.worryCategoryCode == category.worryCategoryCode ?  'active' : ''}">${category.worryName}</label>
									<input type="radio" id="normal_${status.index}" name="worryCategoryCode" value="${category.worryCategoryCode}" ${board.worryCategoryCode == category.worryCategoryCode ? "checked" : ""}>
								</div>
							</c:forEach>
	                    </div>
	                </div>
	
	                <article class="board_update_wrap">
	<!--                         <div class="profile_wrap">
	                            <div class="writer_pic light_brown_bg" style="background-image: url();">
	                            </div>
	
	                            <div class="writer_id">
	                                <p>아이디</p>
	                            </div>
	                        </div> -->
	                    
	
	
                    	<input name ="boardTitle" id="boardTitle" value="${board.boardTitle}"> 
	                    <div id="posting"  style="margin-top: 0px;">
	                        <textarea name="boardContent"  onkeydown="resize(this)" onkeyup="resize(this)" >${board.boardContent}</textarea>
	                        <div class="post_img">
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
	                        <div class="write_option_area">
		                        <div class="check_box_wrap">
	                                <label for="comment" class="option_btn light_brown_bg">댓글허용
	                                    <input type="checkbox" name="replyCheckCode" value="" id="replyCheckCode">
	                                </label>
	                            </div>
	
	                            <div class="check_box_wrap">
	                                <label for="scrap" class="option_btn light_brown_bg">스크랩허용
	                                    <input type="checkbox"  name="scrapCheckCode" value="" id="scrapCheckCode">
	                                    
	                                </label>
	                            </div>
	                            
	                            <div class="check_box_wrap">
	                                <label for="like" class="option_btn light_brown_bg"> 공감 허용
	                                    <input type="checkbox"  name="empathyCheckCode" value="" id="empathyCheckCode">
	
	                                </label>
	                        	</div>	
	                        </div>
	                        
	                    </div>
	                </article>
	
	                <div class="edit_btn_wrap">
	                    <button type="submit" class="dark-brown edit_btn" > 수정 </button>
	                    <button type="button" class="dark-brown edit_btn" onclick="location.href='${contextPath}/worry/worryList'"> 목록으로  </button>
	                </div>
	                	             <!-- update 진행 시 사용할 게시글 번호 -->
					<input type="hidden" name="boardNo" value="${board.boardNo}">
	            </form>
	
	        </section>
	    </div>
	
	</main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_worry_board.js"></script>

<script>
// 카테고리 선택
	const selectRadio = $("input[name='worryCategoryCode']");
	selectRadio.on("click", function () {
		$(".postModal [name='freeboard_search']").val('');
		$(".postModal [name='search_category']").val('id');
		$(".dark_brown_border").removeClass("active");

		const _this = $(this);
		_this.prev().addClass("active");
	});


</script>

</body>
</html>
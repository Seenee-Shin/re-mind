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
	                    <a href="">
	                        <i class="fas fa-arrow-left"></i> 
	                    </a>
	                </div>
	                <article class="board_update_wrap">
	                    <div class="profile_wrap">
	                        <div class="writer_pic light_brown_bg" style="background-image: url();">
	                        </div>
	
	                        <div class="writer_id">
	                            <p>아이디</p>
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
                           <label for="addFileBtn">
                               <i class="fas fa-image dark-brown" ></i>
                           </label>
                           	<!-- name="images" -->
							<input type="file"  id='addFileBtn'  accept="audio/*, video/*, image/*" multiple onclick="loadImg()" style="display: none">
							<input type="hidden" name="delete_files" id="delete_files">
	                        <div class="write_option_area">
	                            <div class="check_box_wrap">
                                    <select id="replyCheckCode" name="replyCheckCode">
									    <option value="1">댓글 허용</option>
									    <option value="2">댓글 비허용</option>
								    </select>  		                            
	                            </div>
	
	                            <div class="check_box_wrap">
                                     <select id="scrapCheckCode" name="scrapCheckCode">
									    <option value="1">스크랩 허용</option>
									    <option value="2">스크랩 비허용</option>
								    </select>  		                            
	                            </div>
	                            
	                            <div class="check_box_wrap">
                                     <select id="empathyCheckCode" name="empathyCheckCode">
									    <option value="1">공감 허용</option>
									    <option value="2">공감 비허용</option>
								    </select>  		                            
	                            </div>
	                        </div>
	                    </div>
	                </article>
	
	                <div class="edit_btn_wrap">
	                    <button type="submit" class="dark-brown edit_btn"> 수정 </button>
	                    <button type="button" class="dark-brown edit_btn" onclick=""> 목록으로  </button>
	                </div>
	                
	             <!-- update 진행 시 사용할 게시글 번호 -->
				<input type="hidden" name="cp" value="${param.cp}">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<input type="hidden" name="deleteImages" value="">
	
				</form>
            </section>
        </div>
    </main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>


</body>
</html>
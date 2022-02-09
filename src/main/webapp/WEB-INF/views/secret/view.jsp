<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>


            <section class="main_content">    
                <!-- 메인 -->

                <div class="back_btn">
                    <a href="">
                        <i class="fas fa-arrow-left"></i> 
                    </a>
                </div>
                <article class="board_view_wrap">
                    <div class="posting_time">
                       <c:choose>
                    	<c:when test="${empty board.modifyDate}">
	                        <p>${board.createDate}</p>
                    	</c:when>
                    
                    	<c:otherwise>
	                        <p>${board.modifyDate}</p>
                       	</c:otherwise>
                    </c:choose>
                    </div>
                    <div class="profile_wrap">
                        <div class="writer_pic light_brown_bg" style="background-image: url();">
                        </div>

                        <div class="writer_id">
                        <c:choose>
                        <c:when test="${board.anonCheckCode == 1}">
                            <p>${board.memberFn}</p>
                       	</c:when>
                       	
                        <c:otherwise>
                            <p>익명</p>
                        </c:otherwise>
                        
                        </c:choose>
                        </div>
                    </div>
                    
                   
        
              	 	 
              	 	 
                    <!-- 자신의 글일때 수정, 삭제버튼 생성 -->
     				 <c:if test="${loginMember.memberNo == board.memberNo }">

	                    <div class="edit_btn_wrap">
	                        <button type="button" class="dark-brown edit_btn" onclick="updateForm()"> 수정 </button>
	                        <button type="button" class="dark-brown edit_btn" onclick="deleteBoard();"> 삭제 </button>
	                    </div>
					</c:if>

					
					 <c:if test="${board.boardCategoryCode != 104 }">
              	 	 <p class="otherCategory">다른 게시판 글입니다.</p>
              	 	 </c:if>
              	 	
              	 	 <c:if test="${board.boardCategoryCode == 104 }">
                    <div class=" posting">
                        <p>${board.boardContent}</p>
                        
                        <c:if test="${board.imgList != null}">
                        <div class="post_img">
	                        <c:forEach items="${board.imgList}" var="img" varStatus="status">
             		       		<div id="img${status.index}" class="viewBoardImg"> <img src="${contextPath}${img.imagePath}${img.imageName}">
				       			</div>
	                        </c:forEach>
                        </div>
                        </c:if>
                       
                    </div>     
                    </c:if>                 

					
					<c:if test="${board.empathyCheckCode == 1}">
                    <div class="like_warp">
                        <div id="like_smile" onclick="">
                            <img src="${contextPath}/resources/images/icon/smile.png" alt="">
                            <p>좋아요</p>
                            <p class="like_count">34</p>
                        </div>

                        <div id="like_hug" onclick="">
                            <img src="${contextPath}/resources/images/icon/hug.png" alt="">
                            <p>응원해요</p>
                            <p  class="like_count">34</p>
                        </div>

                        <div id="like_amazed" onclick="">
                            <img src="${contextPath}/resources/images/icon/amazed.png" alt="">
                            <p>놀랐어요</p>
                            <p  class="like_count">34</p>
                        </div>
                        
                        <div id="like_angry" onclick="">
                            <img src="${contextPath}/resources/images/icon/angry.png" alt="">
                            <p>화나요</p>
                            <p  class="like_count">34</p>
                        </div>

                        <div id="like_crying" onclick="">
                            <img src="${contextPath}/resources/images/icon/crying.png" alt="">
                            <p>슬퍼요</p>
                            <p  class="like_count">34</p>
                        </div>
                    </div>
					</c:if>
					
					
                    <div class="report_scrap_wrap">
                        <!-- 스크랩 허용 했을 경우만 -->
                       
					<c:if test="${board.scrapCheckCode == 1}">
                        <a href="">
                            <i class="fas fa-archive"></i>  
                            <p>스크랩</p>
                        </a>
    				</c:if>
    				
                        <a href="">
                            <i class="fas fa-exclamation-triangle"></i>
                            <p>신고</p>
                        </a>
                    </div> 


                </article>
                
                
				<c:if test="${board.replyCheckCode == 1}">
                <article class="comment_view_wrap">
                    <div class="comment_top dark-brown">
                        <div>
                            <i class="far fa-comment"></i>
                            <span>댓글</span> 
                            <span>(55)</span>
                        </div>

                        <div class="m_comment_wirte" onclick="openComment()">
                            <i class="far fa-comment"></i>
                            <span>댓글</span> 
                            <span>(55)</span>
                        </div>
                    </div>

                    <form action="">
                        <div class="write_comment">
                            
                            <div class="user_info">
                                <div class="user_pic light_brown_bg" style="background-image: url();">
                                </div>

                                <div>
                                    <p>아이디</p>
                                </div>
                            </div>

                            <textarea name="" id="" rows="3"></textarea>
                            <button class="option_btn dark_brown_bg"> 등록 </button>
                        </div>
                    </form>

                    <div class="comment_list">
                        
                        <c:forEach items="${rList}" var="reply">
                        
                       
                        <div class="comment_view  <c:if test="${reply.parentReplyNo != 0 }"> child </c:if>">
                            <div class="user_info">
                                <div class="user_pic light_brown_bg" style="background-image: url();">
                                </div>

                                <div>
                                    <p>${reply.memberFn}</p>
                                </div>
                            </div>

                            <div class="comment">
                                <p>${reply.replyContent}</p>
                            </div>

                            <div class="comment_btn">
                                <button type="button" class="dark-brown edit_btn re-comment" onclick=""> 답글 </button>
                                <!--  자신이 쓴 댓글에 보이기 -->
                                <!-- <button class="dark-brown"> 수정 </button>
                                <button class="dark-brown"> 삭제 </button> -->
                            </div>
                        </div>
                        
                       </c:forEach> 
                    </div>
                </article>
             	</c:if>
             	 	
             
            
            	
            </section>
        </div>


    
    </main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/board/secretBoard.js"></script>

</body>
</html>
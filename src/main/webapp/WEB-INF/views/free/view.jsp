<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"/>


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
                            <p>${board.memberFn}</p>
                        </div>
                    </div>
                    
                    <!-- 자신의 글일때 수정, 삭제버튼 생성 -->
                    <c:if test="${loginMember.memberNo == board.memberNo }">
	                    <div class="edit_btn_wrap">
	                        <button type="button" class="dark-brown edit_btn" onclick="updateForm()"> 수정 </button>
	                        <button type="button" class="dark-brown edit_btn" onclick="deleteBoard();"> 삭제 </button>
	                    </div>
					</c:if>
					
                    <div class=" posting">
                        <p>${board.boardContent}</p>
                        <div class="post_img">
	                        <c:forEach items="${board.imgList}" var="img" varStatus="status">
             		       		<div id="img${status.index}" class="viewBoardImg"> <img src="${contextPath}${img.imagePath}${img.imageName}">
				       			</div>
	                        </c:forEach>
                        </div>
                    </div>                   


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
                        <c:if test="${board.scrapCheckCode == 1} ">
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
					
				       <div class="write_comment">
				           
				           <div class="user_info">
				               <div class="user_pic light_brown_bg" style="background-image: url();">
				               </div>
				
				               <div>
				                   <p>아이디</p>
				               </div>
				           </div>
				           
				           <textarea name="replyContent" id="replyContent" rows="3"></textarea>
				           <button class="option_btn dark_brown_bg" id="addReply" onclick="addComment();"> 등록 </button>
				       	</div>
					    <hr style="border-color:grey; ">       
					       
					       
					     <div class="comment_list" id="comment_list">
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
				                         <c:choose>
				                         
				                         	<c:when test="${loginMember.memberNo == board.memberNo }">
				                            	<button class="dark-brown" onclick="showUpdateReply(${reply.replyNo}, this)"> 수정 </button>
				                            	<button class="dark-brown" onclick="deleteReply(${reply.replyNo})"> 삭제 </button>
				                         	</c:when>
				                         	<c:otherwise>
				                            	<button type="button" class="dark-brown edit_btn re-comment" onclick="showInsertReply(${reply.replyNo}, this)"> 답글 </button>
				                            </c:otherwise>
				                         </c:choose>
		                         	</div>
		                     	</div>
	                 		</c:forEach> 
                		</div>
					</article>
                </c:if>
                
            
            </section>
        </div>

		<form action="#" method="POST" name="requestForm">
			<input type="hidden" name="cp" value="${param.cp }">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
		</form>
    
    </main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>
<script type="text/javascript">

	//수정버튼 클릭 시 동작
	function updateForm(){
		document.requestForm.action = "../updateForm";
		document.requestForm.method = "POST";
		document.requestForm.submit();
	}
	
	//닫기 버튼시 동작
	function deleteBoard(){
		if(confirm("정말 삭제하시겠습니까?")){
		document.requestForm.action = "../delete";
		document.requestForm.method = "POST";
		document.requestForm.submit();
		}
	}
	
	
	// 로그인한 회원의 회원 번호, 비로그인 시 "" (빈문자열)
	const loginMemberNo = "${loginMember.memberNo}";
	// 현재 게시글 번호
	const boardNo = ${board.boardNo};
	// 수정 전 댓글 요소를 저장할 변수 (댓글 수정 시 사용)
	let beforeReplyRow;
</script>

<script src="${contextPath}/resources/js/board/reply.js"></script>

</body>
</html>
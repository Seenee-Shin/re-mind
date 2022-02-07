<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
            <div class="free_board_list_wrap" id="BoardListArea">

                <!-- 게시판 하나 시작  -->
                <div class="board_list_content">
                    <!-- 프로필 시작 -->
                    <div class="board_flex_wrap">
                        <div class="writer_pic_wrap">
                            <div class="writer_pic light_brown_bg" style="background-image: url();">
                            </div>
                            <ul class="userMenu hidden">
	                            <li> <a href=""> 차단</a> </li>
	                            <li> <a href=""> 검색</a> </li>
                            </ul>                            
                        </div>


                        <a href="/view/${board.boardNo}">
	                        <div class="posting_info">
	                            <div class="writer_id">
	                                <p>${board.memberFn}</p> 
	                                
	                                <p>${board.createDate}</p>
	                            </div>
	                            <div class="posting">
	                                <p>${board.boardContent}</p>
	                            </div>
	                        </div>
                        </a>
                    </div>
                    <div class="board_icon_wrap">
                        <!-- 댓글 아이콘 -->
						<c:choose>
							<c:when test="${board.replyCheckCode == 1}">
		                        <div class="commnet_wrap">
		                            <i class="far fa-comment dark-brown"></i>
		                            <p>${board.replyCount}</p>
		                        </div>
	                        </c:when>
	                        <c:otherwise>
	                        	<div class="commnet_wrap">
	                        	</div>
	                        </c:otherwise>
                        </c:choose>

                 		<!-- 공감수 표시 -->
						<c:choose >
							<c:when test="${board.empathyCheckCode == 1}">
		                        <div class="like_warp">
		                            <img src="${contextPath}/resources/images/icon/smile.png" alt="">
		                            <p>${board.likeCount}</p>
		                            <img src="${contextPath}/resources/images/icon/hug.png" alt="">
		                            <p>${board.cheerCount}</p>
		                            <img src="${contextPath}/resources/images/icon/amazed.png" alt="">
		                            <p>${board.surpriseCount}</p>
		                            <img src="${contextPath}/resources/images/icon/angry.png" alt="">
		                            <p>${board.angryCount}</p>
		                            <img src="${contextPath}/resources/images/icon/crying.png" alt="">
		                            <p>${board.sadCount}</p>
		                        </div>
							</c:when>
							
							<c:otherwise>
		                        <div class="like_warp">
		                        </div>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>  
            </div>    
<script>
	//전역변수 생성 
	const loginMemberNo = "${loginMember.memberNo}"
	const boardNo = "${board.boardNo}";
</script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/board/freeList.js"></script>
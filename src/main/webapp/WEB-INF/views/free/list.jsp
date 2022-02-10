<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->

                <!-- 게시판 하나 시작  -->
	                <div class="board_list_content"> <!-- 1 -->
	                    <!-- 프로필 시작 -->
	                    <div class="board_flex_wrap"> <!-- 2 -->
	                        <div class="writer_pic_wrap"> <!-- 3 -->
	                            <div class="writer_pic light_brown_bg" style="background-image: url();"> <!-- 4 -->
	                            </div>
	                            
	                            <c:if test="${!loginMember.memberNo == board.memberNo }">
	                            <ul class="userMenu hidden"> <!-- 4 -->
		                            <li> <!-- 5 -->
		                            	<a href=""> 차단</a> <!-- 6 -->
		                            </li>
		                            <li> 
		                            	<a href=""> 검색</a> 
                            		</li>
	                            </ul>
	                            </c:if> 
	                                                      
	                        </div>
	
	
	                        <a href="/view/${board.boardNo}"> <!-- 3 -->
		                        <div class="posting_info"> <!-- 4 -->
		                            <div class="writer_id"> <!-- 5 -->
		                                <p>${board.memberFn}</p> <!-- 6 -->
		                                
		                                <p>${board.createDate}</p><!-- 6 -->
		                            </div>
		                            <div class="posting"> <!-- 5 -->
		                                <p>${board.boardContent}</p><!-- 6 -->
		                            </div>
		                        </div>
	                        </a>
	                    </div>
	                    <div class="board_icon_wrap"> <!-- 2 -->
							<c:choose>
							<c:when test="${board.replyCheckCode == 1}">
	                        <div class="commnet_wrap">  <!-- 3 -->
	                            <i class="far fa-comment dark-brown"></i> <!-- 4 -->
	                            <p>${board.replyCount}</p><!-- 4 -->
	                        </div>
	                        </c:when>
	                        <c:otherwise>
                        	<div class="commnet_wrap"> <!-- 3 -->
                        	</div>
	                        </c:otherwise>
	                        </c:choose>
	
	                 		<!-- 공감수 표시 -->
							<c:choose >
							<c:when test="${board.empathyCheckCode == 1}">
	                        <div class="like_warp"> <!-- 3  -->
	                            <img src="${contextPath}/resources/images/icon/smile.png" alt=""> <!-- 4  -->
	                            <p>${board.likeCount}</p> <!-- 4  -->
	                            <img src="${contextPath}/resources/images/icon/hug.png" alt=""> <!-- 4  -->
	                            <p>${board.cheerCount}</p> <!-- 4  -->
	                            <img src="${contextPath}/resources/images/icon/amazed.png" alt=""> <!-- 4  -->
	                            <p>${board.surpriseCount}</p> <!-- 4  -->
	                            <img src="${contextPath}/resources/images/icon/angry.png" alt=""> <!-- 4  -->
	                            <p>${board.angryCount}</p> <!-- 4  -->
	                            <img src="${contextPath}/resources/images/icon/crying.png" alt=""> <!-- 4  -->
	                            <p>${board.sadCount}</p><!-- 4  -->
	                        </div>
							</c:when>
								
							<c:otherwise>
	                        <div class="like_warp"> <!-- 3 -->
	                        </div>
							</c:otherwise>
							</c:choose>
	                    </div> 
	                </div>  
<script>
	//전역변수 생성 
	const loginMemberNo = "${loginMember.memberNo}"
	const boardNo = "${board.boardNo}";
</script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

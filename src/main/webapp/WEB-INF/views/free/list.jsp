<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
            <div class="free_board_list_wrap">

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

                        <!-- 포스트 시작 -->
                        <a href="/freeView">
	                        <div class="posting_info">
	                            <div class="writer_id">
	                                <p>아이디</p> 
	                                
	                                <p> 5분전</p>
	                            </div>
	                            <div class="posting">
	                                <p>저는 오늘 마라탕을 시켰는데요 마라마라마라탕~~~ </p>
	                            </div>
	                        </div>
                        </a>
                    </div>
                    <div class="board_icon_wrap">
                        <!-- 댓글 아이콘 -->
                        <div class="commnet_wrap">
                            <i class="far fa-comment dark-brown"></i>
                            <p>3</p>
                        </div>

                 		<!-- 공감수 표시 -->
                        <div class="like_warp">
                            <img src="${contextPath}/resources/images/icon/smile.png" alt="">
                            <p>2</p>
                            <img src="${contextPath}/resources/images/icon/hug.png" alt="">
                            <p>2</p>
                            <img src="${contextPath}/resources/images/icon/amazed.png" alt="">
                            <p>2</p>
                            <img src="${contextPath}/resources/images/icon/angry.png" alt="">
                            <p>2</p>
                            <img src="${contextPath}/resources/images/icon/crying.png" alt="">
                            <p>2</p>
                        </div>
                    </div>
                </div>
            </div>    
<script>
	//전역변수 생성 
	const loginMemberNo = "${loginMember.memberNo}"
	const boardNo = "${board.boardNo}";
</script>
<script src="${contextPath}/resources/js/board/freeList.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

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

           <textarea name="" id="" rows="3"></textarea>
           <button class="option_btn dark_brown_bg"> 등록 </button>
       </div>

<!-- 	                    <div class="comment_list" id="comment_list">
	                        <div class="comment_view">
	                            <div class="user_info">
	                                <div class="user_pic light_brown_bg" style="background-image: url();">
	                                </div>
	
	                                <div class = "rWriterFnWrap" >
	                                    <p class = "rWriterFn">아이디</p>
	                                    <p class="rDate"></p>
	                                </div>
	                            </div>
	
	                            <div class="comment">
	                                <p>dhdhdhdhspr ljdn vg;wori</p>
	                            </div>
	
	                            <div class="comment_btn">
	                                <button type="button" class="dark-brown edit_btn re-comment" onclick=""> 답글 </button>
	                                 자신이 쓴 댓글에 보이기
	                                <button class="dark-brown"> 수정 </button>
	                                <button class="dark-brown"> 삭제 </button>
	                            </div>
	                        </div>
	                        대댓글일 경우 클래스 child 붙이기 
	                        <div class="comment_view child">
	                            <div class="user_info">
	                                <div class="user_pic light_brown_bg" style="background-image: url();">
	                                </div>
	
	                                <div>
	                                    <p>아이디</p>
	                                </div>
	                            </div>
	
	                            <div class="comment">
	                                <p>dhdhdhdhspr ljdn vg;wori</p>
	                            </div>
	
	                            <div class="comment_btn">
	                                <button type="button" class="dark-brown edit_btn re-comment" onclick=""> 답글 </button>
	                                 자신이 쓴 댓글에 보이기
	                                <button type="button" class="dark-brown edit_btn" onclick="updateForm()"> 수정 </button>
	                                <button type="button" class="dark-brown edit_btn" onclick="updateForm()"> 삭제 </button>
	                            </div>
	                        </div>
	
	                    </div> -->
</article>
<script>
	// 전역 변수로 댓글 관련 기능에 사용될 변수를 미리 선언
	// -> 이 때 JSP에서만 사용 가능한 EL 값을 전역 변수로 선언하면
	//    아래 쪽에 추가된 js파일에서 사용 가능
	const contextPath = "${contextPath}";
	// 로그인한 회원의 회원 번호, 비로그인 시 "" (빈문자열)
	const loginMemberNo = "${loginMember.memberNo}";
	// 현재 게시글 번호
	const boardNo = ${board.boardNo};
	// 수정 전 댓글 요소를 저장할 변수 (댓글 수정 시 사용)
	let beforeReplyRow;
</script>


<script src="${contextPath}/resources/js/reply.js"></script>

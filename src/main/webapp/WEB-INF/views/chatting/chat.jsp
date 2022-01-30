<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/chatting.css">

<article class="main_content">
	<div class="chatting_area">
		<div id="exit_area">
			<button class="btn btn_outline_danger" id="exit_btn">상담 종료</button>
		</div>
		<!-- 채팅 내용 -->
		<ul>
			<li class="friend_chat">
				<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
				<div class="chat_col friend_chat_col">
					<span class="profile_name">상담사 누구누구씨</span>
					<span class="chat">안녕하세요! 회원님</span>
				</div>
				<span class="chatDate">오전 7:30</span>
			</li>
			<li class="my_chat">
				<div class="chat_col me_chat_col">
					<span class="chat">네 안녕하세요 누구상담사님</span>
				</div>
				<span class="chatDate">오전 7:32</span>
			</li>
			<li class="my_chat">
				<div class="chat_col me_chat_col">
					<span class="chat">상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!</span>
				</div>
				<span class="chatDate">오전 7:33</span>
			</li>
			<li class="friend_chat">
				<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
				<div class="chat_col friend_chat_col">
					<span class="profile_name">상담사 누구누구씨</span>
					<span class="chat">안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님</span>
				</div>
				<span class="chatDate">오전 7:30</span>
			</li>
			<li class="friend_chat">
				<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
				<div class="chat_col friend_chat_col">
					<span class="profile_name">상담사 누구누구씨</span>
					<span class="chat">안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님</span>
				</div>
				<span class="chatDate">오전 7:30</span>
			</li>
			<li class="friend_chat">
				<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
				<div class="chat_col friend_chat_col">
					<span class="profile_name">상담사 누구누구씨</span>
					<span class="chat">안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님</span>
				</div>
				<span class="chatDate">오전 7:30</span>
			</li>
			<li class="friend_chat">
				<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
				<div class="chat_col friend_chat_col">
					<span class="profile_name">상담사 누구누구씨</span>
					<span class="chat">안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님안녕하세요! 회원님</span>
				</div>
				<span class="chatDate">오전 7:30</span>
			</li>
			<li class="my_chat">
				<div class="chat_col me_chat_col">
					<span class="chat">상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!</span>
				</div>
				<span class="chatDate">오전 7:33</span>
			</li>
			<li class="friend_chat">
				<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
				<div class="chat_col friend_chat_col">
					<span class="profile_name">상담사 누구누구씨</span>
					<span class="chat">안녕하세요! 회원님</span>
				</div>
				<span class="chatDate">오전 7:30</span>
			</li>
			<li class="my_chat">
				<div class="chat_col me_chat_col">
					<span class="chat">상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!상담이 필요합니다.!</span>
				</div>
				<span class="chatDate">오전 7:33</span>
			</li>
		</ul>

		<div class="input_area">
			<textarea id="inputChatting" rows="3"></textarea>
			<button id="send">보내기</button>
		</div>
	</div>

</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
<!-- sockjs : 웹소켓과 유사한 객체를 제공하는 JS 라이브러리 -->

<!-- https://github.com/sockjs/sockjs-client -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	// 로그인이 되어 있을 경우에만
	// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
	let chattingSock = new SockJS("<c:url value='/chat' />");

	// 세션에 있는 값들을 JS에서 사용할 수 있도록 전역 변수로 선언
	<%--const memberNo = "${loginMember.memberNo}";--%>
	<%--const memberId = "${loginMember.memberId}";--%>
	<%--const memberName = "${loginMember.memberName}";--%>
	<%--const chatRoomNo = "${chatRoomNo}";--%>
	<%--const contextPath = "${contextPath}";--%>

	const memberNo = 1;
</script>

<script src="${contextPath}/resources/js/my/chat.js"></script>

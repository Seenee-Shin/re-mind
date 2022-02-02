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
			<c:forEach items="${list}" var="msg">
				<c:if test="${msg.memberNo == 1 }">
					<li class="my_chat">
						<div class="chat_col me_chat_col">
							<span class="chat">${msg.message}</span>
						</div>
						<span class="chatDate">${msg.createDate}</span>
					</li>
				</c:if>

				<c:if test="${msg.professionNo == chat.professionNo }">
					<li class="friend_chat">
						<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
						<div class="chat_col friend_chat_col">
							<span class="profile_name">상담사 누구누구씨</span>
							<span class="chat">${msg.message}</span>
						</div>
						<span class="chatDate">${msg.createDate}</span>
					</li>
				</c:if>
			</c:forEach>
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
	$(".chatting_area ul").scrollTop($(".chatting_area ul")[0].scrollHeight);

	// 로그인이 되어 있을 경우에만
	// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
	let chattingSock = new SockJS("<c:url value='/chat' />");

	// 세션에 있는 값들을 JS에서 사용할 수 있도록 전역 변수로 선언
	<%--const memberNo = "${loginMember.memberNo}";--%>
	<%--const memberId = "${loginMember.memberId}";--%>
	<%--const memberName = "${loginMember.memberName}";--%>
	<%--const chatRoomNo = "${chatRoomNo}";--%>
	<%--const contextPath = "${contextPath}";--%>


	const chattingNo = "${chat.chattingNo}";

	const memberNo = 1;
	const professionNo = 1;


</script>

<script src="${contextPath}/resources/js/my/chat.js"></script>

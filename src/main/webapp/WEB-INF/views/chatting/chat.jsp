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

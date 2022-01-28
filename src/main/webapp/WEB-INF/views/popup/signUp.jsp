<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


<div id="signup_area">
	<div class="top_title_wrap">
		<h2 class="title">회원가입</h2>
	</div>
	<form action="">
		<div class="signup_box">
			<div class="input_wrap">
				<div class="input_area left_area">
					<div class="input_div">
						<div>아이디</div>
						<input type="text" placeholder="이메일" class="login_input">
					</div>
					<div class="input_div">
						<div>비밀번호</div>
						<input type="text" class="login_input">
					</div>
					<div class="input_div">
						<div>비밀번호 확인</div>
						<input type="text" class="login_input">
					</div>
					<div class="input_div">
						<div>이름</div>
						<input type="text" class="login_input">
					</div>
				</div>
				<div class="input_area right_area">
					<div class="input_div">
						<div>주소</div>
						<input type="text" class="login_input">
					</div>
					<div class="input_div">
						<div>닉네임</div>
						<input type="text" class="login_input">
					</div>
					<div class="input_div">
						<div>핸드폰 번호</div>
						<input type="text" class="login_input">
					</div>
					<div class="input_div">
						<div>성별</div>
						<div class="radio_area">
							<label for="male">
								<input type="radio" id="male" name="gender" checked> 남성
							</label>
							<label for="female">
								<input type="radio" id="female" name="gender"> 여성
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="submit_area" style="clear:both;">
				<button type="button" class="signup_btn">가입하기</button>
			</div>
		</div>
	</form>
</div>


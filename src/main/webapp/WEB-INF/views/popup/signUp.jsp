<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


<div id="signup_area">
	<div class="top_title_wrap">
		<h2 class="title">회원가입</h2>
	</div>
	<form method="POST" action="signUp"  name="signUpForm" onsubmit="return validate();">
		<div class="signup_box">
			<div class="input_wrap">
				<div class="input_area left_area">
					<div class="input_div">
						 <div class="check_div"><label for="id">아이디</label> <div class="check" id="checkId"></div></div>
						<input type="text" name="memberId" id="id" placeholder="이메일" class="login_input" required>
					</div>
					<div class="input_div">
						<div><label for="idKey">아이디 확인</label></div>
						<input type="text" name="memberIdKey" id="idKey" placeholder="인증번호" class="login_input short" required>
						<button class="shortBtn" type="button">인증번호 전송</button>
					</div>
					<div class="input_div">
						<div><label for="pw">비밀번호</label>  <div class="check" id="checkPw1"></div></div>
						<input type="password" name="memberPw" id="pwd1" class="login_input" required>
					</div>
					<div class="input_div">
						<div><label for="pw2">비밀번호 확인</label>  <div class="check" id="checkPw2"></div></div>
						<input type="password" id="pwd2" class="login_input" required>
					</div>
					<div class="input_div">
						<div><label for="name">이름</label><div class="check" id="checkName"></div></div>
						<input type="text"  name="memberNm" id="name" class="login_input" required>
					</div>
					<div class="input_div">
						<div><label for="nickname">닉네임</label> <div class="check" id="checkNickNm"></div></div>
						<input type="text" name="memberNickNm" id="nickname" class="login_input" required>
					</div>
				</div>
					<div class="input_area right_area">
					<div class="input_div">
						<div>주소 우편번호</div>
						<input type="text" name="address"  class="login_input short" required>
						<button class="shortBtn" type="button" >검색</button>
					</div>
					<div class="input_div">
						<div><label for="address1">도로명 주소</label></div>
						<input type="text" name="address" id="address1" class="login_input" required>
					</div>
					<div class="input_div">
						<div><label for="address2">상세 주소</label></div>
						<input type="text" name="address" id="address2" class="login_input" required>
					</div>
					<div class="input_div">
						<div><label for="phone2">핸드폰 번호</label></div>
							<select class="custom-select" id="phone1" name="phone" required>
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>019</option>
							</select>
						<input type="text" name="phone" id="phone2" class="login_input phone" required>
						<input type="text" name="phone" id="phone3" class="login_input phone" required>
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
				<button type="submit" class="signup_btn">가입하기</button>
			</div>
		</div>
	</form>
</div>

<script src="${contextPath}/resources/js/member/signUp.js"></script>


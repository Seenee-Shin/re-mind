<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<div id="login_area">
	<div class="top_title_wrap">
		<h2 class="title">로그인</h2>
	</div>
	<div class="login_box">
		<div class="login_method">
			<a href="#self">카카오 로그인</a>
			<a href="#self">네이버 로그인</a>
			<a href="#self">구글 로그인</a>
			<a href="#self">이메일 로그인</a>
		</div>
		<div class="sign_up_wrap">
			<span>아직 계정이 없으신가요?</span>
			<a href="#self">회원가입</a>
		</div>
	</div>
</div>

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
			<a href="javascript:kakaoLogin();">카카오 로그인</a>
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

<script>
	Kakao.init('f9cc932f2cb179a77079e2c667dab98a');
	// console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			scope: 'profile_nickname, profile_image, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
			success: function(response) {
				console.log(response) // 로그인 성공하면 받아오는 데이터
				window.Kakao.API.request({ // 사용자 정보 가져오기
					url: '/v2/user/me',
					success: (res) => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
					}
				});
				// window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
			},
			fail: function(error) {
				console.log(error);
			}
		});
	}

	function kakaoLogout() {
		if (!Kakao.Auth.getAccessToken()) {
			console.log('Not logged in.');
			return;
		}
		Kakao.Auth.logout(function(response) {
			alert(response +' logout');
			window.location.href='/'
		});
	};
</script>

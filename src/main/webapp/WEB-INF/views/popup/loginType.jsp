<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- 구글 로그인 API  -->
<%--<meta name="google-signin-scope" content="profile email openid ">--%>
<meta name ="google-signin-client_id" content="251812285867-iarbblabr07shf2kvjjmuaoa3tuv6n8r.apps.googleusercontent.com">
<%-- 구글 api 사용을 위한 라이브러리 --%>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<%-- naver --%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>


<script>


// function attachSignin(element) {
// 	auth2.attachHandler(element, {},
//
// 			,function (error){
// 				console.log(JSON.stringify(error, undefined, 2));
// 			})
// }

function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	var id_token = googleUser.getAuthResponse().id_token;
	console.log('ID: ' + profile.getId());
	// console.log('Name: ' + profile.getName());
	// console.log('Image URL: ' + profile.getImageUrl());
	// console.log('Email: ' + profile.getEmail());
	// console.log(id_token);

	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'login/google/tokensignin');
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onload = function (){
		console.log('Sign in : ' + xhr.responseText);
	};
	xhr.send('idtoken= ' + id_token);
	// console.log(xhr);

}


	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function () {
			console.log('User signed out.');
		});
	}

</script>


<div id="login_area">
	<div class="top_title_wrap">
		<h2 class="title">로그인</h2>
	</div>
	<div class="login_box">
		<div class="login_method">
			<a href="javascript:kakaoLogin();">카카오 로그인</a>
<%--			<a href="https://kauth.kakao.com/oauth/authorize?client_id=b862240d0cf0e40922fb9312954ca3a2&redirect_uri=http://localhost:9000/mind/oauth_kakao/callback&response_type=code">카카오 로그인</a>--%>
			<a href="javascript:unlinkApp();">카카오 탈퇴하기</a>
<%--			<a href="javascript:kakaoLogout();">카카오 로그아웃</a>--%>
			<a href="javascript:kakaoLogoutt();">카카오 로그아웃</a>
<%--			<a href="#self">네이버 로그인</a>--%>
<<<<<<< HEAD
<%--			<div id="naverIdLogin"></div>--%>
			<div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="${pageContext.request.contextPath}/resources/img/naver_Bn_Green.PNG"/></a></div>
=======
	<button onclick="showLoginPopup();"><img width="200" height="50" src="images/btnG_완성형.png"></button>
<%--	<a id="custom-login-btn" href="javascript:void(0);" onclick="window.open('${googleUrl}','googleLogin','width=430,height=500,location=no,status=no,scrollbars=yes');""> <img src="/images/btn_google_signin_dark_normal_web.png" width="300"/> </a>--%>
>>>>>>> 0933ccaf15e1a9c8cbb0617ea0967fcaf63c40a6

			<button class="btn btn-primary" id="googleLoginBtn">구글 로그인</button>
<%--			<a class="g-signin2"  onClick="onSignIn()">Google Login</a>--%>

			<a href="#" onclick="signOut();">구글 로그아웃</a>
			<a href="#self">이메일 로그인</a>
		</div>
		<div class="sign_up_wrap">
			<span>아직 계정이 없으신가요?</span>
			<a href="javascript:layerPopup('signUp');">회원가입</a>
		</div>
	</div>
</div>

<script type="text/javascript">
	function showLoginPopup(){
		let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
				'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
				'&client_id=bCW4VaBNrrKJO0dNnbwX' +     // 발급받은 client_id 를 입력
				'&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
				'&redirect_uri=http://localhost:9000/mind/oauth_kakao/naverLogin';   // 어플케이션에서 등록했던 CallBack URL를 입력

		// 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
		// window.open(uri, "Naver Login Test PopupScreen", "width=450, height=600");
		window.location.href = uri;
	}

</script>

<script>


	document.getElementById("googleLoginBtn").addEventListener("click", function (){
		//구글서버로 인증코드 발급 요청
		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?"+
				"client_id=251812285867-iarbblabr07shf2kvjjmuaoa3tuv6n8r.apps.googleusercontent.com&"+
				"redirect_uri=http://localhost:9000/mind/oauth_kakao/googleLogin&"+
				"response_type=code&"+
				"scope=email%20profile%20openid&"+
				"access_type=offline");
	});
	const onClickGoogleLogin = function(e) {
		//구글서버로 인증코드 발급 요청
		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?"+
		"client_id=251812285867-iarbblabr07shf2kvjjmuaoa3tuv6n8r.apps.googleusercontent.com&"+
		"redirect_uri=http://localhost:9000/mind/oauth_kakao/googleLogin&"+
		"response_type=code&"+
		"scope=email%20profile%20openid&"+
		"access_type=offline");
	}


	// function init() {
	// 	gapi.load('auth2', function() {
	// 		gapi.auth2.init();
	// 		options = new gapi.auth2.SigninOptionsBuilder();
	// 		options.setPrompt('select_account');
	// 		// 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
	// 		options.setScope('email profile openid');
	// 		// 인스턴스의 함수 호출 - element에 로그인 기능 추가
	// 		// GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
	// 		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	// 	})
	// }


	Kakao.init('f9cc932f2cb179a77079e2c667dab98a');
	Kakao.isInitialized();
	// console.log(Kakao.isInitialized()); // sdk초기화여부판단

	function unlinkApp() {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(res) {
				alert('success: ' + JSON.stringify(res))
			},
			fail: function(err) {
				alert('fail: ' + JSON.stringify(err))
			},
		})
	}


	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			// scope: 'profile_nickname, profile_image, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
			success: function(response) {
				console.log(response)
				Kakao.Auth.setAccessToken(response.access_token);

				// console.log(Kakao.Auth.getAccessToken());
				const urll = 'https://kauth.kakao.com/oauth/authorize?client_id=b862240d0cf0e40922fb9312954ca3a2' +
				'&redirect_uri=http://localhost:9000/mind/oauth_kakao/callback&response_type=code';
				window.location.href=urll; //리다이렉트 되는 코드

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
			Kakao.Auth.setAccessToken(undefined); // 로그아웃
			alert(response +' logout');
			window.location.href='/mind'
		});
	};

</script>

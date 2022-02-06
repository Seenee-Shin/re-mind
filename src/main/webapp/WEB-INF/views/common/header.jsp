<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마음연구소 RE:mind</title>
    <%-- 카카오로그인 API JS 라이브러리 --%>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <%-- 네이버로그인 API JS 라이브러리 --%>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/popup.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">

    <!--
    css 파일 추가 하지 말고
    controller에서
    model.addAttribute("css", "css파일명"); 추가해주세요

    ex)model.addAttribute("css", "my");
    -->

<%--    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/selftest_result.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/selftestForm.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mb_selftest.css">--%>



    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- 애니메이션 효과 라이브러리 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- 스와이퍼 CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- 아이콘 -->
    <script src="https://kit.fontawesome.com/5e0a99db98.js" crossorigin="anonymous"></script>

</head>
<body>
<!--
1. 태그는 되도록이면 section -> article -> div 순으로 작성해 주세요!
2. html,css, js 모두 tab(띄어쓰기)은 4칸입니다.
3. common.css에 기본 적인 폰트, 버튼, 컬러 클래스가 작성되어있습니다.
4. 만약 와이어프레임이 정확하지 않거나 헷갈리는 부분은 피그마에서 확인 후 단톡에 질문해 주세요
5.  width는 %로 정해줍니다.
-->

<!-- modal (close : layer_popup)-->
<div class="modal close_popup_btn"></div>
<div class="popup_wrap" style="display:none;">
    <!-- 작성 부분 -->
    <div class="layer_popup">
        <!-- <div class="layer-popup popup_500"> -->
        <!-- 닫기 버튼 -->
        <div class="close_popup">
            <a class="close_popup_btn"><img src="${contextPath}/resources/images/icon/close_btn.png"></a>
        </div>
        <div class="layer_popup_content"></div>
    </div>
    <!-- //작성 부분 -->
</div>
<!-- //modal (close : layer_popup)-->

<header>
    <!-- 헤더 -->
    <section class="header_wrap">
        <article class="header_logo_wrap">
        	<a href="${contextPath}">
            	<img src="${contextPath}/resources/images/remind_logo.png" alt="">
            </a>
        </article>


        <!-- 헤더 메뉴 -->
        <article class="header_menu_wrap">
            <ul class="dep1">

                <li>
                    <a href="#">상담예약</a> <p class="menu_toggle">+</p>
                    <ul class="dep2">
                        <li><a href="#">상담사 찾기</a></li>
                        <li><a href="#">상담센터 찾기</a></li>
                        <li><a href="#">자가진단</a></li>
                    </ul>

                </li>
                <li>
                    <a href="#">커뮤니티</a> <p class="menu_toggle">+</p>
                    <ul class="dep2">
                        <li><a href="${contextPath}/free/insert">자유게시판</a></li>
                        <li><a href="/worryList">고민상담 게시판</a></li>
                        <li><a href="/m">마인드 포스팃</a></li>
                        <li><a href="/secretList">털어놓기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">공지사항</a> <p class="menu_toggle">+</p>
                </li>
                <li><!-- 로그인 안했으면 로그인 버튼 -->
                    <!-- <a href="">로그인</a> -->
                    <a href="#">마이페이지</a> <p class="menu_toggle">+</p>
                    <ul class="dep2">
                        <li><a href="${contextPath}/my/emotionRecord">감정기록</a></li>
                        <li><a href="#">마이 상담</a></li>
                        <li><a href="#">마이 활동</a></li>
                        <li><a href="#">마이 정보</a></li>
                    </ul>
                </li>
                <li ><!-- 로그인 했으면 로그아웃 버튼 보이기
                            로그인 안했으면 회원가입 -->
                    <!-- <a href=""> 회원가입 </a>  -->

                    <c:choose>
                        <c:when test="${empty sessionScope.loginMember}">
                            <a href="#" class="login_btn">로그인</a>
                        </c:when>
                        <c:otherwise>
                            ${sessionScope.loginMember.memberName}
                            <a href="${contextPath}/emailLogin/logout" class="logout_btn">로그아웃</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
            <a href="#" class="headermenu_togle">
                <i class="fas fa-bars"></i>
            </a>
            <a href="#" class="headermenu_bell">
                <i class="far fa-bell"></i>
            </a>
        </article>
    </section>
</header>

<main>
    <section class="main_wrap">
        <!-- 사이드 메뉴가 없는 부분은 지우고 사용 -->
        <c:if test="${!requestScope.header.equals('main')}">
        
	        <c:choose>
	        	<c:when test="${requestScope.header.equals('community')}">
		            <section class="dark-brown side_menu">
		                <h3>커뮤니티</h3>
		                <hr>
		                <ul class="side_menu_dep1">
		                    <li class="w_side_menu"><a href="${contextPath}/free/insert">자유게시판</a></li>
		                    <li class="m_side_menu"><a href="${contextPath}/free/insert">자유</a></li>
		                    <li class="w_side_menu"><a href="#">고민상담 게시판</a> </li>
		                    <li class="m_side_menu"><a href="#">고민상담</a></li>
		                    <li class="w_side_menu"><a href="#">마인드포스팃</a></li>
		                    <li class="m_side_menu"><a href="#">포스팃</a></li>
		                    <li class="w_side_menu"><a href="#">털어놓기</a></li>
		                    <li class="m_side_menu"><a href="#">털어놓기</a></li>
		                </ul>
		            </section>
	        	</c:when>
	        	
	        	
	        	<c:otherwise>
			        <article class="dark-brown side_menu">
			            <h3>마이페이지</h3>
			            <ul>
			                <li><a href="${contextPath}/my/emotionRecord">증상기록</a></li>
			                <hr>
			                <li><a href="#">마이상담</a>
			                    <ul>
			                        <li><a href="#">상담 예약 조회</a></li>
			                        <li><a href="#">지난 상담 내역</a></li>
			                        <li><a href="#">상담후기</a></li>
			                        <li><a href="#">찜한 상담사</a></li>
			                    </ul>
			                </li>
			                <hr>
			                <li><a href="#">마이활동</a>
			                    <ul>
			                        <li><a href="#">게시글 내역</a></li>
			                        <li><a href="#">쪽지</a></li>
			                        <li><a href="#">문의사항</a></li>
			                        <li><a href="#">차단한 회원</a></li>
			                    </ul>
			                </li>
			                <hr>
			                <li><a href="#">마이정보</a>
			                    <ul>
			                        <li><a href="">회원정보 수정</a></li>
			                        <li><a href="">회원탈퇴</a></li>
			                    </ul>
			                </li>
			            </ul>
			        </article>
	        	</c:otherwise>
	        </c:choose>
        </c:if>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/updateMyInfo.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="update-mypage">회원정보 수정</div>
    <div class="update-img">
        <img src="data:image/jpeg;base64,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">
    </div>
    <table class="table">
        <tr>
            <td>이름</td>
            <td>${loginMember.memberName}</td>
        </tr>
        <tr>
            <td>아이디</td>
            <td>${loginMember.memberId}</td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td>
                <input class="pass" type="password" placeholder="비밀번호를 입력해주세요.">
                <div>비밀번호 유효성검사</div>
            </td>
        </tr>
        <tr>
            <td>비밀번호 확인</td>
            <td>
                <input class="pass" type="password" placeholder="비밀번호를 재입력해주세요.">
                <div>일치 불일치</div>
            </td>
        </tr>
        <tr>
            <td>닉네임</td>
            <td><input class="nickname" type="text" value="더키"></td>
        </tr>
        <tr>
            <c:set var="ph" value="${fn:split(loginMember.memberPhone, '-') }"/>
            <td>휴대전화</td>
            <td>
                <input class="ph" type="text" value="${ph[0]}">
                - <input class="ph" type="text" value="${ph[1]}">
                - <input class="ph" type="text" value="${ph[2]}">
            </td>
        </tr>
    </table>

    <form action="updateMyInfo" method="POST">
        <div class="update-info">
            <div class="update-img">
                <img src="data:image/jpeg;base64,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">
            </div>
            <div>프로필 사진 변경</div>

            <div class="updateName">이름</div>
            <div>이덕희</div>
            <hr>
            <div class="updateNN">닉네임</div>
            <div>더키</div>
            <hr>
            <div class="updateId">아이디</div>
            <div>user01</div>
            <hr>
            <div class="updateEmail">이메일</div>
            <div>user01@naver.com</div>
            <hr>
            <div class="updatePhone">전화번호</div>
            <div>
                <input class="ph" type="text" value="010"> -
                <input class="ph" type="text" value="1234"> -
                <input class="ph" type="text" value="1234">
            </div>
            <hr>
            <div class="updatePW">비밀번호</div>
            <div class="pwResult">
                입력 : <input type="password" id="pass1"> <span class="pwSpan">유효성</span><br>
                확인 : <input type="password" id="pass2"><span class="pwSpan">일치 불일치</span>
                <button>비밀번호 변경</button>
            </div>
        </div>





        <div class="csdiv">
            <button id="update">수정</button>
            <button id="cancel" type="reset">취소</button>
        </div>
    </form>
</article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<%--<script src="${contextPath}/resources/js/my/updateMyInfo.js"></script>--%>
<script>
    $("#pass1").change(function (){
        alert("값 변경")
    });
</script>
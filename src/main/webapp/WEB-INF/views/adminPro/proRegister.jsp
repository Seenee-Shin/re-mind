<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
    <h1>상담사 등록 신청 </h1>

    <form action="proRegister" method="post" onsubmit="">
        <div class="proWrap">
            <div class="label">
            아이디 
            </div>
            <input type="email" name="professionId" id="professionId" required> <button onclick="">인증하기</button> <br> 

            <div class="label">
            비밀번호 
            </div>
            <input type="text" name="professionPw" id="proPw" required> <br>

            <div class="label">
            비밀번호 확인 
            </div>
            <input type="text" name="proPwCheck" id="proPwCheck" required> <br>
            
            <div class="label"> 이름</div>
            <input type="text" name="professionName" id="proName" required> <br>

            <div class="label">생년월일</div>
            <input type="text" name="professionBirth" id="proBirth" required> <br>
            
            <div class="label">성별</div>
            <input type="radio" name="professionGender" id="proBirthF" value="f"><label for="proBirthF">여성</label>
            <input type="radio" name="professionGender" id="proBirthM" value="m"> <label for="proBirthM">남성</label><br>

            <div class="label">핸드폰 번호</div>
            <input type="text" name="professionPhone" id="proPhone" required> <br>

            <br>
            <input type="checkbox" name="accept" id="accept" required>(필수) 서비스 이용 약관 및 개인정보 처리 이용방침에 동의 합니다. <br>
            <br>
            <br>
            <br>
        <button >로그인</button>
        </div>
    </form>

</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>






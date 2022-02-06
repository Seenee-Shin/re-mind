<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
	<h1>상담사 로그인</h1>

    <form action="proLogin" method="post">

        <label for="professionId"></label>아이디
        <input type="text" name="professionId" id="professionId">

        <label for="professionPw"></label>비밀번호
        <input type="password" name="professionPw" id="professionPw">

        <button>로그인</button>
    </form>

</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>





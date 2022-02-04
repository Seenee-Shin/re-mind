<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
    <h1> 이메일 인증 완료 </h1>

    <form action="emailConfirm" method="get">
        <div class="proWrap">
            아래 링크로 이동하여 상담사 등록을 마무리해주세요
        	<a href="proRegisterDetail">상담사 정보 등록하기</a>
        </div>
    </form>

</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>






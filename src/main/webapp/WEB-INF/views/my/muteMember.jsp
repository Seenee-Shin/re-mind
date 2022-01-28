<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/muteMember.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="mute-page">차단한 회원</div>
    <hr>

    <div class="mute-info">
        <table>
            <tr class="mute-tr">
                <td class="mute-td">아이디</td>
                <td><button class="mute-delete">해제</button></td>
            </tr>
            <tr class="mute-tr">
                <td class="mute-td">user01</td>
                <td><button class="mute-delete">해제</button></td>
            </tr>
            <tr class="mute-tr">
                <td class="mute-td">user02</td>
                <td><button class="mute-delete">해제</button></td>
            </tr>
        </table>

    </div>

</article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
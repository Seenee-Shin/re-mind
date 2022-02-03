<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

    <footer>
    <!-- 푸터 -->
    <section class="footer_wrap">
        <article>
            <p>Copyright © KH Information Educational Institute A-Class</p>
        </article>
    </section>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
        // 전역 변수
        const contextPath = "${contextPath}";
    </script>
	<script src="${contextPath}/resources/js/adminPro/adminPro.js"></script>

</body>
</html>

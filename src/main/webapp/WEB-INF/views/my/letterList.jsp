<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/letterList.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="message-page">쪽지</div>
    <hr>
    <table>
        <thead>
        <tr>
            <th class="thead-th">보낸사람</th>
            <th class="thead-th">내용</th>
            <th class="thead-th">날짜</th>
        </tr>
        </thead>
        <tbody>
        <tr class="message-view">
            <td>이덕희</td>
            <td>안녕하세요</td>
            <td>2022.01.01</td>
        </tr>
        <tr class="message-view">
            <td>관리자</td>
            <td>안녕하세요. 가입을 축하드립니다.</td>
            <td>2021.11.21</td>
        </tr>
        <tr class="message-view">
            <td>user01</td>
            <td>안녕하세요 반가워요 반가워요 반가워요 반가워요</td>
            <td>2021.05.17</td>
        </tr>
        </tbody>
    </table>

    <div class="message-info">
        <div class="message-list">
            <div class="message-btn">
                <div style="width: 90%;">이덕희 상담사님</div>
                <button style="float: right;">삭제</button>
            </div>
            <div>2022.01.22</div>
            <div>안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>

        <div class="message-list">
            <div class="message-btn">
                <div style="width: 90%;">이덕희 상담사님</div>
                <button style="float: right;">삭제</button>
            </div>
            <div>2022.01.22</div>
            <div>안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>

        <div class="message-list">
            <div class="message-btn">
                <div style="width: 90%;">이덕희 상담사님</div>
                <button style="float: right;">삭제</button>
            </div>
            <div>2022.01.22</div>
            <div>안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>
    </div>

</article>

<div id="modal" class="modal-overlay" style="display: none;">
    <div class="modal-window">
        <div class="title">
            <div class="postscript-page" style="color: white;">쪽지</div>
        </div>
        <div class="close-area">X</div>
    </div>
    <div class="content">
        <div class="postscript-img">

            <div class="postscript-cut">
                TO. 이덕희 상담사
            </div>
        </div>
        <textarea class="content-textarea"></textarea>
        <div id="con">

            <button class="content-update">답장</button>
            <button class="content-delete">취소</button>
        </div>

    </div>
</div>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="${contextPath}/resources/js/my/letterList.js"></script>
<script>
    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modal.style.display = "none"
    });
    modal.addEventListener("click", e => {
        const evTarget = e.target
        if (evTarget.classList.contains("modal-overlay")) {
            modal.style.display = "none"
        }
    });
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

 <link rel="stylesheet" href="${contextPath}/resources/css/selftestResult.css">

        <div class="selftest_modal">
            <div class="selftest_modal_title">
                자존감 자가진단 결과
            </div>
            <div class="selftest_modal_content">
                <div>
                    다른사람과 비교해서 당신의 자존감은
                    <div>다소 낮은 편입니다.</div>
                </div>
                <div>
                    당신을 격려하고 칭찬해주십시오.
                    조그만 성취 경향이라도 좋습니다.
                    당신이 자신에게 얼마나 소중하고 아름다운 존재인지를
                    스스로에게 일깨워주는 것이 필요합니다.
                </div>
            </div>
            <button id="selfTest_btn">확인</button>
        </div>

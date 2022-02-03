<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


 <div class="study_modal">
 	<div class="study_modal_title">
 		<h2>오늘 점심은 무엇을 드시나요? <br>점심 메뉴 추천하기</h2>
 	</div>
 	
	<form action="/list" method="post" onsubmit="return Validate()">
 	<div class="bg_select">
 		<div class="beaker">
 			<img src="${contextPath}/resources/images/board/mindPost/beaker1.png">
 		</div>
 		<div class="beaker">
 			<img src="${contextPath}/resources/images/board/mindPost/beaker2.png">
 		</div>
 		<div class="beaker">
 			<img src="${contextPath}/resources/images/board/mindPost/beaker3.png">
 		</div>
 		<div class="beaker">
 			<img src="${contextPath}/resources/images/board/mindPost/beaker4.png">
 		</div>
 	</div>
 	<div class="beaker_radio">
 			<input type="radio" name="beaker" value="1">
			<input type="radio" name="beaker" value="2">
			<input type="radio" name="beaker" value="3">
			<input type="radio" name="beaker" value="4">
 	</div>
 	
 	<div class="study_write">
	     <textarea class="study_textarea" name="" rows="5" ></textarea>
	<button class="study_submit_btn">작성</button>
	</div>
	
 	
 	</form>
 	
 
 
 
 
 
 </div>


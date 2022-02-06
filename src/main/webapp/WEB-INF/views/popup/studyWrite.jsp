<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


 <div class="study_modal">
 	<div class="study_modal_title">
 		<h2>오늘 점심은 무엇을 드시나요? <br>점심 메뉴 추천하기</h2>
 	</div>
 	
	<form action="insert" method="POST">
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
 			<input type="radio" name="itemImgNo" value="1" checked="checked">
			<input type="radio" name="itemImgNo" value="2">
			<input type="radio" name="itemImgNo" value="3">
			<input type="radio" name="itemImgNo" value="4">
 	</div>
 	
 	<div class="study_write">
	     <textarea class="study_textarea" name="postContent" id="postContent" rows="5" required></textarea>
	<button type="submit" class="study_submit_btn">작성</button>
	</div>
	
 	
 	</form>
 	
 
 
 </div>


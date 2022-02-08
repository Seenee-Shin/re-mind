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
 			<input type="radio" class="radioFirst" name="itemImgNo" value="1" checked="checked">
			<input type="radio" name="itemImgNo" value="2">
			<input type="radio" name="itemImgNo" value="3">
			<input type="radio" name="itemImgNo" value="4">
 	</div>
 	
 	<div class="study_write">
	     <textarea class="study_textarea" name="postContent" id="postContent" rows="3" required></textarea>
	      <div id="content_counter">
          <p><span id = "content_count">0</span>/15</p>
          </div>
	<button type="submit" class="study_submit_btn">작성</button>
	</div>
	
 	
 	</form>
 	
 
 
 </div>
 
 <script>
 $(".study_textarea").on("input" , function(){

	    let count = $(this).val().length;

	    if(count >= 15){
	        $("#content_count").css("color", "red");
	        
	        $(this).val( $(this).val().substr(0,15) );
	        
	        count = 15;

	    }else if( count < 15){
	        $("#content_count").css("color", "black");

	    }
	    $("#content_count").text(count);

	});
 
 
 </script>


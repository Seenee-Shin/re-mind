<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


 <div class="study_modal">
 	<div class="study_modal_title">
 		<h2>오늘 점심은 무엇을 드시나요? <br>점심 메뉴 추천하기</h2>
 	</div>
 	
	<div class="id_date">
		<div class="study_id">
			<h3>아이디</h3>
		</div>
		<div class="study_date">
			<h3>2022.01.14</h3>
		</div>
		 <div class="declare" >
	      <a href="">
	           <i class="fas fa-exclamation-triangle"></i>
	           <p>신고</p>
	      </a>
	     </div>  
	</div>
	<div class="study_contentBox">
		<div class="study_contentView">
			<p>김치찌개입니다 김치찌개입니다 김치찌개입니다</p>
		</div>
	</div>
	<div class="study_bottom">
		 <div class="like_warp">
	      	<div id="like_smile" onclick="">
	         <img src="${contextPath}/resources/images/icon/smile.png" alt="">
	            <p>좋아요</p>
	           <p class="like_count">34</p>
	        </div>
	
	        <div id="like_hug" onclick="">
	          <img src="${contextPath}/resources/images/icon/hug.png" alt="">
	            <p>응원해요</p>
	            <p  class="like_count">34</p>
	        </div>
	
	        <div id="like_amazed" onclick="">
	          <img src="${contextPath}/resources/images/icon/amazed.png" alt="">
	            <p>놀랐어요</p>
	            <p  class="like_count">34</p>
	         </div>
	                    
	         <div id="like_angry" onclick="">
	           <img src="${contextPath}/resources/images/icon/angry.png" alt="">
	             <p>화나요</p>
	             <p  class="like_count">34</p>
	           </div>
	
	          <div id="like_crying" onclick="">
	            <img src="${contextPath}/resources/images/icon/crying.png" alt="">
	             <p>슬퍼요</p>
	             <p  class="like_count">34</p>
	           </div>
	     </div>   
	         
	</div>
 	
 
 
 
 
 
 </div>


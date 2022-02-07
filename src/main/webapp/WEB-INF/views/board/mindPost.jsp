<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

          <article class="main_content">
              <div class="study">
                <p>이 달의 연구</p>
                <p>주제를 선택해 생각을 공유해보세요</p>
              </div>
              <div class="study_title">
                  <p>오늘 점심은 무엇을 드시나요? <br> 
                      점심 메뉴 추천하기</p>
                 <button class="study_submit">작성하기</button>
                 
              </div>
              <div class="study_content">
                  <div class="image_wrap">
                  	<div class="naturally">원래대로</div>
                  
                  	<c:choose>
                  		<c:when test="${empty postList}">
                  		</c:when>
                  		<c:otherwise>
                  			<c:forEach items="${postList}" var="post">
	                  			<c:choose>
	                  			<c:when test="${post.itemImgNo == 1}">
		                  			<div class="item beaker1" >
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p class="postContent">${post.postContent}</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  			</div>
	                  			</c:when>
	                  			<c:when test="${post.itemImgNo == 2}">
		                  			<div class="item beaker2">
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p>${post.postContent}</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  			</div>
	                  			</c:when>
	                  			<c:when test="${post.itemImgNo == 3}">
		                  			<div class="item beaker3">
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p>${post.postContent}</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  			</div>
	                  			</c:when>
	                  			<c:when test="${post.itemImgNo == 4}">
		                  			<div class="item beaker4">
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p>일이삼사오육칠팔구십일이삼사오</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  			</div>
	                  			</c:when>
	                  			
	                  			
	                  			</c:choose>
                  		
                  		
                  			</c:forEach>
                  		</c:otherwise>
                  	</c:choose>
                  	
                  
                  </div>
             </div>
              

             <ul class="pagination">
                <li class="select_pg"> <a>1</a></li>
                <li> <a>2</a></li>
                <li> <a>3</a></li>
                <li> <a>4</a></li>
                <li> <a>5</a></li>
                <li> <a>6</a></li>
                <li> <a>7</a></li>
                <li> <a>8</a></li>
                <li> <a>9</a></li>
                <li> <a>10</a></li>
               </ul>

            </article>  

</main>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/mindPost.js"></script>

</body>
</html>
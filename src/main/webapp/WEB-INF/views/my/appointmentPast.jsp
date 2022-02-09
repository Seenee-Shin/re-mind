<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
	<div class="appointmentPast">
		<div class="title">지난 상담 내역</div>
		<div class="appointmentPast_list">
			<ul>
				<li>
					<div>날짜</div>
					<div>시간</div>
					<div>상담사</div>
					<div>유형</div>
					<div>내용</div>
					<div>후기</div>
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2022-01-22</div>
					<div class="time_div">15:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div"><a href="#">받기</a></div><!-- 상담 대기 일때 취소 가능-->
					<div class="review_div">
						<button type="button" class="btn">상세</button>
					</div>
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2022-01-12</div>
					<div class="time_div">09:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div"><a href="#">받기</a></div><!-- 상담 대기 일때 취소 가능-->
					<div class="review_div">
						<button type="button" class="btn" onclick="proPostscript();">후기작성</button>
					</div>
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2022-01-05</div>
					<div class="time_div">13:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div"><a href="#">받기</a></div><!-- 상담 대기 일때 취소 가능-->
					<div class="review_div">
						<button type="button" class="btn">상세내역</button>
					</div>
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2021-12-27</div>
					<div class="time_div">11:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div"><a href="#">받기</a></div><!-- 상담 대기 일때 취소 가능-->
					<div class="review_div">
						<button type="button" class="btn">후기작성</button>
					</div>
				</li>
			</ul>
		</div>
	</div>


</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript">
	
    function proPostscript(){
    	layerPopup("proPostscript");
    }
    
</script>

</body>
</html>


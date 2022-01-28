<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
	<div class="appointment">
		<div class="title">상담 예약 조회</div>
		<div class="select-area">
			<select>
				<option>전체</option>
				<option>상담 대기</option>
				<option>상담 완료</option>
				<option>상담 취소</option>
			</select>
		</div>
		<div class="appointment_list">
			<ul>
				<li>
					<div>예약 날짜</div>
					<div>예약 시간</div>
					<div>상담사</div>
					<div>상담 유형</div>
					<div>상태</div>
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2022-01-22</div>
					<div class="time_div">15:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div">상담 예약</div><!-- 상담 대기 일때 취소 가능-->
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2022-01-12</div>
					<div class="time_div">09:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div">상담 대기</div><!-- 상담 대기 일때 취소 가능-->
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2022-01-05</div>
					<div class="time_div">13:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div">상담 취소</div><!-- 상담 대기 일때 취소 가능-->
				</li>
				<li>
					<div class="img_div"><img src="../../images/sample1.jpg"></div>
					<div class="date_div">2021-12-27</div>
					<div class="time_div">11:00</div>
					<div class="profession_div">이덕희</div>
					<div class="category_div">채팅</div>
					<div class="status_div">상담 완료</div><!-- 상담 대기 일때 취소 가능-->
				</li>


			</ul>
		</div>


	</div>


</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
	$(".profession_div").on("click", function () {
		layerPopup("signUp");
	})



</script>



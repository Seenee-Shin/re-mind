<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery-ui.css">

<article class="main_content">
	<form action="">
		<div class="emotion_record">
			<div class="title">감정 기록</div>
			<div class="regist_area">
				<div class="sub_title"><strong>오늘의 기분을 기록해 보세요.</strong></div>
				<a href="#" ><div class="emotion_regist">감정 기록 하러가기</div></a>
			</div>

			<div class="calendar_area">
				<!-- 날짜 -->
				<div class="datepicker"></div>
			</div>

			<%--<div class="progress_area">
				<div class="sub_title"><strong>2022-01-02의 감정일기</strong></div>

				<div class="progress_statistic">
					<div class="progress_bar">
						<div class="name">
							행복 <span>25%</span>
						</div>
						<progress class="type01" max="100" value="25">
							<span>25%</span>
						</progress>
					</div>
					<div class="progress_bar">
						<div class="name">
							불안 <span>75%</span>
						</div>
						<progress class="type02" max="100" value="80"></progress>
					</div>
					<div class="progress_bar">
						<div class="name">
							우울 <span>100%</span>
						</div>
						<progress class="type03" max="100" value="100"></progress>
					</div>
					<div class="progress_bar">
						<div class="name">
							?? <span>25%</span>
						</div>
						<progress class="type04" max="100" value="25"></progress>
					</div>
				</div>
			</div>--%>

			<%--<div class="option_area">
				<div class="sub_title"><strong>스트레스 증상이 있었나요?</strong></div>

				<div class="option_statistic">
					<ul>

					</ul>
				</div>
			</div>--%>

<%--			<div class="diary_area">
				<div class="sub_title"><strong>오늘의 감정 일기</strong></div>
				<textarea name="emotionContent" class="emotionContent" readonly ></textarea>
			</div>--%>
		</div>
	</form>

</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script>
	function dateFormat(date) {
		let month = date.getMonth() + 1;
		let day = date.getDate();
		let hour = date.getHours();
		let minute = date.getMinutes();
		let second = date.getSeconds();

		month = month >= 10 ? month : '0' + month;
		day = day >= 10 ? day : '0' + day;

		return date.getFullYear() + '-' + month + '-' + day;
	}

	$(function(){
		const dateList = [
			'2022-02-01',
			'2022-02-03',
			'2022-01-11',
			'2022-01-22',
			'2022-01-29'
		];

		$( ".datepicker" ).datepicker({
			dateFormat: "yy-mm-dd",
			language: "ko",
			beforeShowDay: function(date) {
				if ($.inArray(dateFormat(date), dateList) >= 0) {
					return [true, "highlight"];
				}
				return [true, ""];
			},
			onSelect: function (dateText, inst) {
				selectData(dateText);
			}
		});
	});

	function selectData(selectDate) {
		console.log(selectDate);
		$.ajax({
			url : "${contextPath}/my/emotionRecordData",
			data : {"selectDate" : selectDate},
			type : "POST",
			success : function (emotionDiary) {
				// 감정 progress






				// stress checked
				let stressList = "";
				let chk;
				<c:forEach items="${emotionCategoryList}" var="emotionCategory">
				chk = "";
				if ($.inArray("${emotionCategory.emotionCategoryCode}",  (emotionDiary.stressArray).split(",")) >= 0) {
					chk = "checked";
				}

				stressList += `
					<li>
						<input type="checkbox" name="stress" id="option${emotionCategory.emotionCategoryCode}" value="${emotionCategory.emotionCategoryCode}" disabled `+ chk + `>
						<label for="option${emotionCategory.emotionCategoryCode}">${emotionCategory.emotionCategoryName}</label>
					</li>
				`;
				</c:forEach>

				let optionArea = `
					<div class="option_area">
						<div class="sub_title"><strong>스트레스 증상이 있었나요?</strong></div>
						<div class="option_statistic">
							<ul>
								` + stressList + `
							</ul>
						</div>
					</div>
				`;


				$('.emotion_record').append(optionArea);

				// content
				$('.emotionContent').val(emotionDiary.emotionContent);


			},
			error : function(request, status, error){
				console.log("ajax 통신 중 오류 발생");
				console.log(request.responseText);
			}
		});
	}

</script>

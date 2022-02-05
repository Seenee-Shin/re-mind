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

			<div class="emotion_data">

			</div>
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
			'2022-02-04',
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
				const emotionData = $('.emotion_data');

				// 감정 progress
				const progressAreaDiv = $("<div class='progress_area'>");
				const progressSubTitleDiv = $("<div class='sub_title'>");
				const subTitle = $("<strong>");
				subTitle.text(selectDate + "의 감정일기");
				const progressStatisticDiv = $("<div class='progress_statistic'>");

				progressSubTitleDiv.html(subTitle);
				progressAreaDiv.html(progressSubTitleDiv);
				progressAreaDiv.append(progressStatisticDiv);

				const emotionArray = JSON.parse(emotionDiary.emotionArray);
				let progressBarDiv, nameDiv, nameSpan, progressBar, name, type;
				$.each(emotionArray, function (key, value, index) {
					switch (key) {
						case 'happy' : name = "행복 "; type="type01"; break;
						case 'misery' : name = "불안 "; type="type02"; break;
						case 'depression' : name = "우울 "; type="type03"; break;
						case 'stress' : name = "스트레스 "; type="type04"; break;
						default : name = "";
					}

					progressBarDiv = $("<div class='progress_bar'>");
					nameDiv = $("<div class='name'>");

					nameSpan = $(" <span>");
					nameSpan.text(value);

					progressBar = $("<progress max='100'>");
					progressBar.addClass(type).addClass(key);
					progressBar.val(value);

					nameDiv.html(nameSpan);
					nameDiv.prepend(name);
					progressBarDiv.append(nameDiv).append(progressBar);

					progressStatisticDiv.append(progressBarDiv);
				});

				emotionData.html(progressAreaDiv);

				// stress checked
				const optionAreaDiv = $("<div class='option_area'>");
				const optionSubTitleDiv = $("<div class='sub_title'><strong>스트레스 증상이 있었나요?</strong></div>");
				const optionStatisticDiv = $("<div class='option_statistic'>");
				const optionUl = $("<ul>");

				optionStatisticDiv.html(optionUl);
				optionAreaDiv.html(optionSubTitleDiv);
				optionAreaDiv.append(optionStatisticDiv);

				let stressList, chk;
				<c:forEach items="${emotionCategoryList}" var="emotionCategory">
					chk = "";
					if ($.inArray("${emotionCategory.emotionCategoryCode}",  (emotionDiary.stressArray).split(",")) >= 0) {
						chk = "checked";
					}

					stressList = `
						<li>
							<input type="checkbox" name="stress" id="option${emotionCategory.emotionCategoryCode}" value="${emotionCategory.emotionCategoryCode}" disabled `+ chk + `>
							<label for="option${emotionCategory.emotionCategoryCode}">${emotionCategory.emotionCategoryName}</label>
						</li>
					`;
					optionUl.append(stressList);
				</c:forEach>

				emotionData.append(optionAreaDiv);

				// content
				const diaryAreaDiv = $("<div class='diary_area'>");
				const diarySubTitleDiv = $("<div class='sub_title'><strong>감정 일기</strong></div>");
				const diaryContent = $("<textarea name='emotionContent' class='emotionContent' readonly ></textarea>");
				diaryContent.val(emotionDiary.emotionContent);
				diaryAreaDiv.html(diarySubTitleDiv);
				diaryAreaDiv.append(diaryContent);

				emotionData.append(diaryAreaDiv);

			},
			error : function(request, status, error){
				console.log("ajax 통신 중 오류 발생");
				console.log(request.responseText);
			}
		});
	}

</script>

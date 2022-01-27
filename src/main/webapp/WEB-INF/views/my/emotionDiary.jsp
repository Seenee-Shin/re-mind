<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<!-- header include -->
	<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
	<form action="">
		<div class="emotion_diary">
			<div class="title">감정 기록</div>
			<div class="progress_area">
				<div class="sub_title"><strong>오늘의 기분을 기록해 보세요.</strong></div>

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
							불안 <span>70%</span>
						</div>
						<progress class="type02" max="100" value="70"></progress>
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
			</div>

			<div class="option_area">
				<div class="sub_title"><strong>스트레스 증상이 있었나요?</strong></div>

				<div class="option_statistic">
					<ul>
						<li>
							<label for="option01"><input type="checkbox" name="stress" id="option01">옵션01</label>
						</li>
						<li>
							<label for="option02"><input type="checkbox" name="stress" id="option02">옵션02</label>
						</li>
						<li>
							<label for="option03"><input type="checkbox" name="stress" id="option03">옵션03</label>
						</li>
						<li>
							<label for="option04"><input type="checkbox" name="stress" id="option04">옵션04</label>
						</li>
						<li>
							<label for="option05"><input type="checkbox" name="stress" id="option05">옵션05</label>
						</li>
						<li>
							<label for="option06"><input type="checkbox" name="stress" id="option06">옵션06</label>
						</li>
						<li>
							<label for="option07"><input type="checkbox" name="stress" id="option07">옵션07</label>
						</li>
						<li>
							<label for="option08"><input type="checkbox" name="stress" id="option08">옵션08</label>
						</li>
						<li>
							<label for="option09"><input type="checkbox" name="stress" id="option09">옵션09</label>
						</li>
						<li>
							<label for="option10"><input type="checkbox" name="stress" id="option10">옵션10</label>
						</li>
						<li>
							<label for="option11"><input type="checkbox" name="stress" id="option11">옵션11</label>
						</li>
						<li>
							<label for="option12"><input type="checkbox" name="stress" id="option12">옵션12</label>
						</li>
						<li>
							<label for="option13"><input type="checkbox" name="stress" id="option13">옵션13</label>
						</li>
						<li>
							<label for="option14"><input type="checkbox" name="stress" id="option14">옵션14</label>
						</li>
						<li>
							<label for="option15"><input type="checkbox" name="stress" id="option15">옵션15</label>
						</li>
					</ul>
				</div>

				<div class="agree_area">
					<label for="agreement">
						<input type="checkbox" name="agreement" id="agreement"> 상담사에게 공개
					</label>
				</div>
			</div>

			<div class="diary_area">
				<div class="sub_title"><strong>오늘의 감정 일기</strong></div>
				<textarea placeholder="오늘 있었던 일을 맘 껏 풀어놓으세요."></textarea>
				<div class="agree_area">
					<label for="agreement">
						<input type="checkbox" name="agreement" id="agreement"> 상담사에게 공개
					</label>
				</div>
			</div>
			<div class="submit_area">
				<button>등록하기</button>
				<button type="button">안쓸래요</button>
			</div>
		</div>
	</form>


</article>

	<!-- header include -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>

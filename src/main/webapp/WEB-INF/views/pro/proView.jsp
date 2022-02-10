<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content22">
	<div class="pro_detail_wrap">
	    <div class="pro_profile_wrap">
	        <div class="pro_profile">
	                <img src="${contextPath}/resources/images/pro/best.png" class="pro_best">
				<c:choose>
					<c:when test="${empty profession.imagePath}">
	                	<img src="${contextPath}/resources/images/basicProfile.png" class="profile" style="border-radius:50px;">
					</c:when>
					<c:otherwise>
						<img src="${contextPath}${profession.imagePath}/${profession.imageName}" style="border-radius:100px;" class="profile">
					</c:otherwise>
				</c:choose>
	        </div>
	        <div class="pro_intro_wrap">
	            <div class="pro_star_score">
	                <div class="pro_name float-left">
	                    <h1>${profession.professionName}</h1>
	                </div>
	                <div class="pro_score_wrap float-left">
	                    <span>추천 전문가</span>

						<div class="starpoint_box2">
							<label for="starpoint_1" class="label_star2" title="1"><span class="blind">1점</span></label>
							<label for="starpoint_2" class="label_star2" title="2"><span class="blind">2점</span></label>
							<label for="starpoint_3" class="label_star2" title="3"><span class="blind">3점</span></label>
							<label for="starpoint_4" class="label_star2" title="4"><span class="blind">4점</span></label>
							<label for="starpoint_5" class="label_star2" title="5"><span class="blind">5점</span></label>
							<label for="starpoint_6" class="label_star2" title="6"><span class="blind">6점</span></label>
							<label for="starpoint_7" class="label_star2" title="7"><span class="blind">7점</span></label>
							<label for="starpoint_8" class="label_star2" title="8"><span class="blind">8점</span></label>
							<label for="starpoint_9" class="label_star2" title="9"><span class="blind">9점</span></label>
							<label for="starpoint_10" class="label_star2" title="10"><span class="blind">10점</span></label>
							<input type="radio" name="starpoint" id="starpoint_11" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_12" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_13" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_14" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_15" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_16" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_17" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_18" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_19" class="star_radio2">
							<input type="radio" name="starpoint" id="starpoint_20" class="star_radio2">
							<span class="starpoint_bg2"></span>
						</div>
	                </div>
	            </div>

	            <div class="pro_intro">
	                <p>누구보다 아름다운 삶을 응원하겠습니다.</p>
	                <p>#가족 #대인관계 #자존감상실 #연인</p>
	            </div>
	        </div>
			<div class="wishHeart">
				<img src="${contextPath}/resources/images/pro/blackHeart.png">
			</div>

			<c:set var="splitPrice" value="${fn:split(profession.counselPrice,',')}"/>
			<c:set var="splitCategory" value="${fn:split(profession.counselCategoryCode,',')}"/>
	        <div class="pro_price_wrap float-left">
	            <div class="text_price">
	                <div>
	                    <img src="${contextPath}/resources/images/pro/text_therapy_mini.png" class="float-left">
						<c:choose>
							<c:when test="${splitCategory[0] == 1}">
								<p class="float-left">${splitPrice[0]}<span>원</span></p>
							</c:when>
							<c:otherwise>
								<p class="float-left">-</p>
							</c:otherwise>
						</c:choose>
	                </div>

	            </div>
	            <div class="face_price clear-both">
	                <img src="${contextPath}/resources/images/pro/face_therapy_mini.png" class="float-left">
					<c:choose>
						<c:when test="${splitCategory[0] == 2}">
							<p class="float-left">${splitPrice[0]}<span>원</span></p>
						</c:when>
						<c:when test="${splitCategory[1] == 2}">
							<p class="float-left">${splitPrice[1]}<span>원</span></p>
						</c:when>
						<c:otherwise>
							<p class="float-left">-</p>
						</c:otherwise>
					</c:choose>
	            </div>
	            <div class="voice_price clear-both">
	                <img src="${contextPath}/resources/images/pro/voice_therapy_mini.png" class="float-left">
					<c:choose>
						<c:when test="${splitCategory[0] == 3}">
							<p class="float-left">${splitPrice[0]}<span>원</span></p>
						</c:when>
						<c:when test="${splitCategory[1] == 3}">
							<p class="float-left">${splitPrice[1]}<span>원</span></p>
						</c:when>
						<c:when test="${splitCategory[2] == 3}">
							<p class="float-left">${splitPrice[2]}<span>원</span></p>
						</c:when>
						<c:otherwise>
							<p class="float-left">-</p>
						</c:otherwise>
					</c:choose>
	            </div>
	        </div>
	    </div>
	    <div id="pro_content_warp">
	        <ul id="detail-contents">
	            <li class="detail_btn"><a href="#pro_talk">당신에게 한마디</a></li>
	            <li class="detail_btn"><a href="#pro_revice">후기</a></li>
	        </ul>
	        <ul class="pro_content" id="pro_talk">
	            <li>
	                <h2>당신에게 하고 싶은 말</h2>
	                <p>
	                    <span>당신에게 건네는 손을 잡아주세요</span>
	                    바쁘게 하루하루 살다 보면 문득 나라는사람이 누구지, 지금 뭐하고있는거지라는 생각이 들 때가 있습니다.<br>
	                    잠깐이라도 상담을 통해 나의 허전한 마음을 어루만져주시는 건 어떨까요? 그리고 저도 당신의 시간에 함께하고싶습니다.
	                </p>
	                    ${profession.professionIntro}
	                </p> 
	            </li>
	            <li>
	                <h2>상담사 이야기</h2>
	                <p>
	                    <span>심리상담을 망설이는 분에게</span>
	                    여러분이 처해있는 상황과 환경에 상관없이 여러분 그 자체로 정말로 귀한 사람이며<br>
	                    여러분의 가치는 세상 그 무엇과도 바꿀 수 없습니다.<br> <br>

	                    지쳐있나요? <br>
	                    혼자서는 헤쳐 나가지 못할 것 같은 막막함이 느껴지시나요? <br>
	                    여러분은 절대 혼자가 아니에요. 그 길에 여러분과 함께 동행하겠습니다.
	                </p>
	                <p>
	                    <span>상담사님과의 심리상담 효과</span>
	                    첫째, 여러분 자신을 더 이해하고 사랑할 수 있게 됩니다. <br>
	                    내가 조금 부족한 것 같아도, 실패한 것 같고 남들과 비교했을 때 열등한 것 같은 <br>
	                    내 자신을 인정하고 사랑할 수 있게 됩니다.<br>
	                    남들과 비교할 수 없는 여러분의 소중함을 깨닫게 됩니다.<br><br>

	                    둘째, 여러분들이 어려운 문제를 해결해 가는 길에 혼자라고 느끼지 않도록 동행하며 성장할 수 있게 됩니다.<br>
	                    셋째, 여러분의 생각과 감정을 좀 더 자연스럽게 표현할 수 있게 됩니다.
	                </p>
	                <p>
	                    <span>상담사님의 심리상담 방식</span>
	                    인간중심상담의 바탕 아래 여러분의 가치를 인정하며 존중합니다.<br>
	                    상담사 입장에서 문제를 바라보기 보다 여러분의 입장에서 문제를 바라보고 함께 합니다.<br>
	                    또한 인지, 정서, 행동치료의 관점에서 개개인의 상황에 맞는 문제해결에 집중하면서도<br>
	                    여러분이 가지고 있는 어려움 자체를 수용하며 이 또한 나의 일부분이며 품을 수 있도록 돕습니다.
	                    ${profession.professionStory}
	                </p>
	            </li>
	            <li>
	                <h2>경력</h2>
	                <p>
	                     ${profession.proCarrer}
	                </p>
	            </li>
	            <li id="pro_revice">
	                <h2>후기</h2>
	                <ul class="pro_review_wrap">
						<c:choose>
							<c:when test="${empty reviewList}">
							<li>
								<p id="reveiw_no">아직 후기가 없어요!</p>
							</li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${reviewList}" var="review">
									<li class="pro_review_li">
										<!--  <div class="pro_best_reiew">
											 <img src="${contextPath}/resources/images/pro/best_review.png">
										 </div> -->
										 <div class="review_top_box">
											 <div class="float-left">
												 <p>${review.counselCategoryNm} 이용고객님</p>
												 <p>${review.reviewDate}</p>
											 </div>
											 <div class="float-right">
												<div class="starpoint_box">
													<label for="starpoint_1" class="label_star" title="1"><span class="blind">1점</span></label>
													<label for="starpoint_2" class="label_star" title="2"><span class="blind">2점</span></label>
													<label for="starpoint_3" class="label_star" title="3"><span class="blind">3점</span></label>
													<label for="starpoint_4" class="label_star" title="4"><span class="blind">4점</span></label>
													<label for="starpoint_5" class="label_star" title="5"><span class="blind">5점</span></label>
													<label for="starpoint_6" class="label_star" title="6"><span class="blind">6점</span></label>
													<label for="starpoint_7" class="label_star" title="7"><span class="blind">7점</span></label>
													<label for="starpoint_8" class="label_star" title="8"><span class="blind">8점</span></label>
													<label for="starpoint_9" class="label_star" title="9"><span class="blind">9점</span></label>
													<label for="starpoint_10" class="label_star" title="10"><span class="blind">10점</span></label>
													<input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
													<input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
													<span class="starpoint_bg"></span>
												</div>
											 </div>
										 </div>
										 <div class="review_bottom_box clear-both">
											 <p>
												${review.reviewContent}
											 </p>
										 </div>
									 </li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
	                </ul>
	            </li>
	        </ul>


	    </div>
	</div>
	<div class="pro_reservation_wrap">
	    <div class="pro_reservation">
	        <h2>알려드립니다!</h2>
	        <p><img src="${contextPath}/resources/images/pro/check.png">상담 1회당 50분 기준입니다.</p>
	        <p><img src="${contextPath}/resources/images/pro/check.png">결제 후 바로 상담이 불가능 할 수 있습니다.</p>
	        <p><img src="${contextPath}/resources/images/pro/check.png">제휴기관은 반드시 로그인 후 이용하여 주세요.</p>
	    </div>
	    <div class="pro_btn_wrap">
	        <button type="button" class="consultation_inquiry_btn" onclick="test()">
	            <img src="${contextPath}/resources/images/pro/pro_consultation_inquiry.png">
	        </button>
	        <button type="button" class="pro_reservation_btn" onclick="proReservation();">예약하기</button>
	    </div>
	</div>
</article>

<div class="mobile_pro_reservation_wrap">
    <div class="float-left">
        <div class="mobile_pro_name">
			${profession.professionName}상담사
        </div>
        <div class="mobile_price">
            <ul>
                <li>
					<img src="${contextPath}/resources/images/pro/mobile_text_therapy.png">
					<c:choose>
						<c:when test="${splitCategory[0] == 1}">
							<p>${splitPrice[0]}원</p>
						</c:when>
						<c:otherwise>
							<p class="float-left">-</p>
						</c:otherwise>
					</c:choose>

                </li>
                <li>
					<img src="${contextPath}/resources/images/pro/mobile_face_therapy.png">
					<c:choose>
						<c:when test="${splitCategory[0] == 2}">
							<p>${splitPrice[0]}원</p>
						</c:when>
						<c:when test="${splitCategory[1] == 2}">
							<p>${splitPrice[1]}원</p>
						</c:when>
						<c:otherwise>
							<p>-</p>
						</c:otherwise>
					</c:choose>
                </li>
                <li>
                    <img src="${contextPath}/resources/images/pro/mobile_voice_therapy.png">
					<c:choose>
						<c:when test="${splitCategory[0] == 3}">
							<p>${splitPrice[0]}원</p>
						</c:when>
						<c:when test="${splitCategory[1] == 3}">
							<p>${splitPrice[1]}원</p>
						</c:when>
						<c:when test="${splitCategory[2] == 3}">
							<p>${splitPrice[2]}원</p>
						</c:when>
						<c:otherwise>
							<p>-</p>
						</c:otherwise>
					</c:choose>
                </li>
            </ul>
        </div>
    </div>

    <div class="mobile_pro_btn_wrap float-right">
        <button type="button" class="mo_consultation_inquiry_btn" onclick="test()">상담문의</button>
        <button type="button" class="mo_pro_reservation_btn float-right" onclick="proReservation();">예약하기</button>
    </div>
</div>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>


<script>
	const profession = "${profession.counselCategoryCode}";
	console.log(profession)
	const professionNo = "${profession.professionNo}";
	const memberNo = "${loginMember.memberNo}";

	function proReservation(){
		location.href = contextPath + "/pro/proReservation/" + professionNo;
	}

	// 각각 후기 평점
	$.ajax({
		url:contextPath+'/pro/starPointSelect',
		type:"POST",
		data : {"professionNo":professionNo},
		dataType:"JSON",
		success : function(starPoint){

			$.each(starPoint, function(i,point) {

				for(let j = 0; j<=10; j++){
					if(point.reviewStarPoint == j){
						$(".starpoint_box .starpoint_bg").eq(i).css("width", (j*10) + "%");
					}
				}
			});

		},
	
	});

	// 상담사 총 후기 평점
	$.ajax({
		url:contextPath+'/pro/starPointAverage',
		type:"POST",
		data : {"professionNo":professionNo},
		dataType:"JSON",
		success : function(starPointAverage){

			for(let j = 0; j<=10; j++){
				if(starPointAverage == j){
					$(".starpoint_box2 .starpoint_bg2").css("width", (j*10) + "%");
				}
			}

		},
	
	});

	var wishCheck;
	$.ajax({
		url:"checkWish",
		data:{
			"professionNo": professionNo,
			"memberNo": memberNo},
		success:function (result){
			console.log(result)
			if(result > 0) {
				$(".wishHeart img").attr("src", contextPath + "/resources/images/pro/redHeart.png");
				wishCheck = 1;
			}else{
				$(".wishHeart img").attr("src", contextPath + "/resources/images/pro/blackHeart.png");
				wishCheck = 0;
			}
		}
	});

	$(".wishHeart img").on("click", function (){

		if($(this).attr("src") == contextPath + "/resources/images/pro/redHeart.png"){
			$(this).attr("src", contextPath + "/resources/images/pro/blackHeart.png");
			wishCheck = 0;
		}else{
			$(this).attr("src", contextPath + "/resources/images/pro/redHeart.png");
			wishCheck = 1;
		}

		$.ajax({
			url:"updateWish",
			data:{
				"professionNo": professionNo,
				"memberNo": memberNo,
				"wishCheck": wishCheck},
			success:function (result){

			}
		});
	});

</script>
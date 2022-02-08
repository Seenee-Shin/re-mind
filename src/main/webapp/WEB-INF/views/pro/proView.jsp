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
	                	<img src="${contextPath}/resources/images/basicProfile.png" class="profile">
					</c:when>
					<c:otherwise>
						<img src="${contextPath}${profession.imagePath}/${profession.imageName}" class="profile">
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
	                    <ul class="pro_score">
	                        <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                        <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                        <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                        <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                        <li><img src="${contextPath}/resources/images/pro/star-half.png"></li>
	                    </ul>
	                </div>
	            </div>
	
	            <div class="pro_intro">
	                <p>누구보다 아름다운 삶을 응원하겠습니다.</p>
	                <p>#가족 #대인관계 #자존감상실 #연인</p>
	            </div>
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
	                    ${profession.professionIntro}
	                </p> 
	            </li>
	            <li>
	                <h2>상담사 이야기</h2>
	                <p>
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
	                    <li class="pro_review_li">
	                        <div class="pro_best_reiew">
	                            <img src="${contextPath}/resources/images/pro/best_review.png">
	                        </div>
	                        <div class="review_top_box">
	                            <div class="float-left">
	                                <p>1회기권구매고객/보이스테라피</p>
	                                <p>2021.01.21</p>
	                            </div>
	                            <div class="float-right">
	                                <ul class="pro_score">
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star-half.png"></li>
	                                </ul> 
	                            </div>
	                        </div>
	                        <div class="review_bottom_box clear-both">
	                            <p>
	                                다른 상담소들보다 훨씬좋고 자기자신 편이 되도록 많이 도와주시고 생각과감정을 수용하게 도움이 많이 됩니다 <br>
	                                자기가 자기자신편이 되는게 가장 중요한것같은데 자기자신에대한불신이 내려않고 신뢰랑 안정감이 느껴집니다.  
	                            </p>
	                        </div>
	                    </li>
	                    <li class="pro_review_li">
	                        <div class="pro_best_reiew">
	                            <img src="${contextPath}/resources/images/pro/best_review.png">
	                        </div>
	                        <div class="review_top_box">
	                            <div class="float-left">
	                                <p>1회기권구매고객/보이스테라피</p>
	                                <p>2021.01.21</p>
	                            </div>
	                            <div class="float-right">
	                                <ul class="pro_score">
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star.png"></li>
	                                    <li><img src="${contextPath}/resources/images/pro/star-half.png"></li>
	                                </ul> 
	                            </div>
	                        </div>
	                        <div class="review_bottom_box clear-both">
	                            <p>
	                                다른 상담소들보다 훨씬좋고 자기자신 편이 되도록 많이 도와주시고 생각과감정을 수용하게 도움이 많이 됩니다 <br>
	                                자기가 자기자신편이 되는게 가장 중요한것같은데 자기자신에대한불신이 내려않고 신뢰랑 안정감이 느껴집니다.  
	                            </p>
	                        </div>
	                    </li>
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
            김효린 상담사
        </div>
        <div class="mobile_price">
            <ul>
                <li>
                    <img src="${contextPath}/resources/images/pro/mobile_text_therapy.png">
                    <p>25,000원</p>
                </li>
                <li>
                    <img src="${contextPath}/resources/images/pro/mobile_face_therapy.png">
                    <p>50,000원</p>
                </li>
                <li>
                    <img src="${contextPath}/resources/images/pro/mobile_voice_therapy.png">
                    <p>35,000원</p>
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
</body>
</html>

<script>
	const profession = "${profession.counselCategoryCode}";
	console.log(profession)
</script>
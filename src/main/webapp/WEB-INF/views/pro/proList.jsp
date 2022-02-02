<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content2">
	<div id="pro_search_wrap">
		    <div id="pro_search_div">
		        <input type="text" name="proSearchInput" id="pro_searchInput" placeholder="상담사 이름 검색">
		        <button><img src="${contextPath}/resources/images/pro/loupe.png" style="width:23px;"></button>
		    </div>
	    </div>
	    <div id="mobile_pro_category_warp">
	        <button id="mobile_category_btn">
	            <img src="${contextPath}/resources/pro/pro_category_mobile.png" class="float-left mobile_category_img">
	            <p class="float-left">전체필터보기</p>
	        </button>
	        <div id="mobile_pro_category">
	            <div id="mobile_pro_category_title">
	                <h2 class="float-left">전체필터보기</h2>
	                <img src="${contextPath}/resources/pro/cancel.png" id="category_cancel_btn" class="float-right">
	            </div>
	            <div id="mobile_pro_category_keyword">
	                <h2 class="pro_category_title">나의 고민 키워드</h2>
	                <p>*상담받고 싶은 고민과 나를 설명하는키워드를 선택해주세요.<br>(최대 5개 선택가능) </p>
	                <div style="margin-top: 20px;">
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="1">우울</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="2">불안</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="3">분노</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="4">강박</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="5">무기력</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="6">자살</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="7">자존감상실</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="8">자해</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="9">스트레스</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="10">트라우마</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="11">공황</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="12">상실</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="13">대인관계</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="14">친구</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="15">부부</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="16">연인</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="17">가족</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="18">직장</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="19">진로</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="20">취업</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style"  value="21">육아</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="22">해외생활</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="23">중독</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="24">섭식장애</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="25">성소수자</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="26">성생활</button>
	                    <button type="button" class="mobile_cate_btn cate_btn_style" value="27">감정조절</button>
	                </div>
	            </div>
	            <div>
	                <h2 class="pro_category_title">상담유형</h2>
	                <div>
	                    <ul class="moblie_pro_radio">
	                        <li>
	                            <label class="test22" for="unrelated">
	                                <input type="radio" id="unrelated" name="consultation_type" checked>
	                                <span>무관</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="text_counseling">
	                                <input type="radio" id="text_counseling" name="consultation_type">
	                                <span>텍스트테라피</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="voice_counseling">
	                                <input type="radio" id="voice_counseling" name="consultation_type">
	                                <span>보이스테라피</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="face_counseling">
	                                <input type="radio" id="face_counseling" name="consultation_type">
	                                <span>페이스테라피</span>
	                            </label>
	                        </li>
	                    </ul> 
	                </div>
	            </div>
	
	            <div class="clear-both">
	                <h2 class="pro_category_title">상담사 성별</h2>
	                <ul class="moblie_pro_radio">
	                    <li>
	                        <label class="test22" for="unrelated2">
	                            <input type="radio" id="unrelated2" name="pro_gender" checked>
	                            <span>무관</span>
	                        </label>
	                    </li>
	                    <li>
	                        <label class="test22" for="pro_male">
	                            <input type="radio" id="pro_male" name="pro_gender">
	                            <span>남자</span>
	                        </label>
	                    </li>
	                    <li>
	                        <label class="test22" for="pro_famale">
	                            <input type="radio" id="pro_famale" name="pro_gender">
	                            <span>여자</span>
	                        </label>
	                    </li>
	                </ul>
	            </div>
	
	            <div class="clear-both">
	                <h2 class="pro_category_title">상담사 자격증</h2>
	                <div>
	                    <ul class="moblie_pro_radio">
	                        <li>
	                            <label class="test22" for="unrelated3">
	                                <input type="radio" id="unrelated3" name="pro_license" checked>
	                                <span>무관</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="pro_license_two">
	                                <input type="radio" id="pro_license_two" name="pro_license">
	                                <span>2급</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="pro_license_one">
	                                <input type="radio" id="pro_license_one" name="pro_license">
	                                <span>1급</span>
	                            </label>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div id="pro_category_warp">
	        <table id="pro_search">
	            <tr class="pro_tr">
	                <th><p>나의 고민 키워드</p></th>
	                <td colspan="3">
	                    <span>*상담받고 싶은 고민과 나를 설명하는키워드를 선택해주세요.(최대 5개 선택가능) </span><br>
	                    <button type="button" class="cate_btn" value="1">우울</button>
	                    <button type="button" class="cate_btn" value="2">불안</button>
	                    <button type="button" class="cate_btn" value="3">분노</button>
	                    <button type="button" class="cate_btn" value="4">강박</button>
	                    <button type="button" class="cate_btn" value="5">무기력</button>
	                    <button type="button" class="cate_btn" value="6">자살</button>
	                    <button type="button" class="cate_btn" value="7">자존감상실</button>
	                    <button type="button" class="cate_btn" value="8">자해</button>
	                    <button type="button" class="cate_btn" value="9">스트레스</button>
	                    <button type="button" class="cate_btn" value="10">트라우마</button>
	                    <button type="button" class="cate_btn" value="11">공황</button>
	                    <button type="button" class="cate_btn" value="12">상실</button>
	                    <button type="button" class="cate_btn" value="13">대인관계</button>
	                    <button type="button" class="cate_btn" value="14">친구</button>
	                    <button type="button" class="cate_btn" value="15">부부</button>
	                    <button type="button" class="cate_btn" value="16">연인</button>
	                    <button type="button" class="cate_btn" value="17">가족</button>
	                    <button type="button" class="cate_btn" value="18">직장</button>
	                    <button type="button" class="cate_btn" value="19">진로</button>
	                    <button type="button" class="cate_btn" value="20">취업</button>
	                    <button type="button" class="cate_btn" value="21">육아</button>
	                    <button type="button" class="cate_btn" value="22">해외생활</button>
	                    <button type="button" class="cate_btn" value="23">중독</button>
	                    <button type="button" class="cate_btn" value="24">섭식장애</button>
	                    <button type="button" class="cate_btn" value="25">성소수자</button>
	                    <button type="button" class="cate_btn" value="26">성생활</button>
	                    <button type="button" class="cate_btn" value="27">감정조절</button>
	                </td>
	            </tr>
	            <tr class="pro_tr">
	                <th><p>상담유형</p></th>
	                <td colspan="3">
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated" name="consultation_type" checked>
	                            <label for="unrelated">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="text_counseling" name="consultation_type">
	                            <label for="text_counseling">텍스트테라피</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="voice_counseling" name="consultation_type">
	                            <label for="voice_counseling">보이스테라피</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="face_counseling" name="consultation_type">
	                            <label for="face_counseling">페이스테라피</label>
	                        </li>
	                    </ul>
	                </td>
	            </tr>
	            <tr class="pro_tr">
	                <th><p>상담사 성별</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated2" name="pro_gender" checked>
	                            <label for="unrelated2">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="pro_male" name="pro_gender">
	                            <label for="pro_male">남자</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="pro_famale" name="pro_gender">
	                            <label for="pro_famale">여자</label>
	                        </li>
	                    </ul>
	                </td>
	                <th><p>상담사 자격증</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated3" name="pro_license" checked>
	                            <label for="unrelated3">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="pro_license_two" name="pro_license">
	                            <label for="pro_license_two">2급</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="pro_license_one" name="pro_license">
	                            <label for="pro_license_one">1급</label>
	                        </li>
	                    </ul>
	                </td>
	            </tr>
	            <tr class="pro_tr">
	                <th><p>상담 가능 요일</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated4" name="consultation_week" checked>
	                            <label for="unrelated4">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="weekday" name="consultation_week">
	                            <label for="weekday">평일</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="weekend" name="consultation_week">
	                            <label for="weekend">주말</label>
	                        </li>
	                    </ul>
	
	                </td>
	                <th><p>우수 후기 선정</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated5" name="best_review" checked>
	                            <label for="unrelated5">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="best_review_one" name="best_review">
	                            <label for="best_review_one">1회 이상</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="best_review_five" name="best_review">
	                            <label for="best_review_five">5회 이상</label>
	                        </li>
	                    </ul>
	                </td>
	            </tr>
	        </table>
	    </div>
	    <div id="pro_list_wrap">
	        <ul id="pro_list">
	            <li class="pro">
	                <a href="#">
	                    <div class="pro_profile">
	                        <img src="${contextPath}/resources/images/pro/best.png" class="pro_best">
	                        <img src="${contextPath}/resources/images/pro/pro_img/pro_img1.png" class="profile">
	                    </div>
	                    <div class="pro_intro_wrap">
	                        <div>
	                            <div class="pro_name float-left">
	                                <h1>김효린</h1>
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
	                    <div class="pro_price_wrap">
	                        <div class="text_price">
	                            <img src="${contextPath}/resources/images/pro/text_therapy.png" class="float-left">
	                            <p class="float-right">25,000<span>원</span></p>
	                        </div>
	                        <div class="voice_price clear-both">
	                            <img src="${contextPath}/resources/images/pro/voice_therapy.png" class="float-left">
	                            <p class="float-right">-</p>
	                        </div>
	                        <div class="face_price clear-both">
	                            <img src="${contextPath}/resources/images/pro/face_therapy.png" class="float-left">
	                            <p class="float-right">50,000<span>원</span></p>
	                        </div>
	                    </div>
	                </a>
	            </li>
	        </ul>
	    </div>

</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 메인 배너 -->
<article class="main_banner">
    <div>
        <p class="main_banner_p1">마음 속 이야기를 들어주는</p>
        <p class="main_banner_p2 animate__backInDown">RE:MIND</p>
        <button class="main_banner_btn" type="button" onclick="location.href='${contextPath}/pro/proList';">
            상담 예약
        </button>
    </div>
</article>

<!-- 메인 컨텐트1 -->
<article class="main_content1">
    <p>나의 상태가 궁금하다면 ?</p>
    <div>
        <p>무료 자가진단</p>
    </div>
    <div>
        <div>
            <div class="main_content1_cir" data-type="1">
            	<img alt="" src="${contextPath}/resources/images/main/depression.png">
            </div>
            <p>우울증</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="2">
            	<img alt="" src="${contextPath}/resources/images/main/Anxiety.png">
            </div>
            <p>불안장애</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="5">
            	<img alt="" src="${contextPath}/resources/images/main/stress.png">
            </div>
            <p>스트레스</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="6">
            	<img alt="" src="${contextPath}/resources/images/main/panic.png">
            </div>
            <p>자존감</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="4">
            	<img alt="" src="${contextPath}/resources/images/main/bulimia.png">
            </div>
            <p>폭식증</p>
        </div>
        <div>
            <div class="main_content1_cir">
            	<img alt="" src="${contextPath}/resources/images/main/Alcoholism.png">
            </div>
            <p>알콜중독</p>
        </div>
    </div>
</article>

<!-- 메인 컨텐트2 -->
<article class="main_content2">
    <div class="main_content2_bc"></div>
    <div class="main_content2_content">
        <div>
            <p>자신의 이야기를 들려주세요.</p>
            <div>
                <p>커뮤니티</p>
            </div>
        </div>
        <div>
            <div class="main_content2_content_board">
                <button>#우울증</button>
                <button>전문가답변</button>
                <p>불면증/수면장애 고치고 싶어요ㅠㅠ</p>
                <p>작년에 너무 힘들었고 그 동안은 스트레스를
                    받아도 잠은 자려고 했는데 언젠가부터 밤 새려고
                    하거나 새벽 늦게 자는 게 완전 습관이 돼
                    버렸어요 누워있다가 해뜰 때 자는 경우가
                    대부분이고 당연히 밤낮 바뀌고요. 그래서인지
                    탈모도 약간 생긴 것 같고..일찍 자야겠다 마음
                    먹고 누워서 휴대폰을 안 봐도 잠을 못 자는데
                    정신과에서 약 처방받는 게 맞겠죠..?
                </p>
            </div>
            <div class="main_content2_content_board">
                <button>#우울증</button>
                <button>전문가답변</button>
                <p>불면증/수면장애 고치고 싶어요ㅠㅠ</p>
                <p>작년에 너무 힘들었고 그 동안은 스트레스를
                    받아도 잠은 자려고 했는데 언젠가부터 밤 새려고
                    하거나 새벽 늦게 자는 게 완전 습관이 돼
                    버렸어요 누워있다가 해뜰 때 자는 경우가
                    대부분이고 당연히 밤낮 바뀌고요. 그래서인지
                    탈모도 약간 생긴 것 같고..일찍 자야겠다 마음
                    먹고 누워서 휴대폰을 안 봐도 잠을 못 자는데
                    정신과에서 약 처방받는 게 맞겠죠..?
                </p>
            </div>
            <div class="main_content2_content_board">
                <button>#우울증</button>
                <button>전문가답변</button>
                <p>불면증/수면장애 고치고 싶어요ㅠㅠ</p>
                <p>작년에 너무 힘들었고 그 동안은 스트레스를
                    받아도 잠은 자려고 했는데 언젠가부터 밤 새려고
                    하거나 새벽 늦게 자는 게 완전 습관이 돼
                    버렸어요 누워있다가 해뜰 때 자는 경우가
                    대부분이고 당연히 밤낮 바뀌고요. 그래서인지
                    탈모도 약간 생긴 것 같고..일찍 자야겠다 마음
                    먹고 누워서 휴대폰을 안 봐도 잠을 못 자는데
                    정신과에서 약 처방받는 게 맞겠죠..?
                </p>
            </div>
        </div>
    </div>
</article>

<!-- 모바일 메인 컨텐트2 -->
<article class="mb_main_content2">
    <div class="main_content2_bc"></div>
    <div class="mb_main_content2_content">
        <div>
            <p>자신의 이야기를 들려주세요.</p>
            <div>
                <p>커뮤니티</p>
            </div>
        </div>
        <!-- Swiper -->
        <div class="swiper1 mySwiper1">
            <div class="swiper-wrapper" style="justify-content: space-between;">
                <div class="swiper-slide commu">
                    <div class="mb_main_content2_content_board">
                        <button>#우울증</button>
                        <button>전문가답변</button>
                        <p>불면증/수면장애 고치고 싶어요ㅠㅠ</p>
                        <p>작년에 너무 힘들었고 그 동안은 스트레스를
                            받아도 잠은 자려고 했는데 언젠가부터 밤 새려고
                            하거나 새벽 늦게 자는 게 완전 습관이 돼
                            버렸어요 누워있다가 해뜰 때 자는 경우가
                            대부분이고 당연히 밤낮 바뀌고요. 그래서인지
                            탈모도 약간 생긴 것 같고..일찍 자야겠다 마음
                            먹고 누워서 휴대폰을 안 봐도 잠을 못 자는데
                            정신과에서 약 처방받는 게 맞겠죠..?
                        </p>
                    </div>
                </div>
                <div class="swiper-slide commu">
                    <div class="mb_main_content2_content_board">
                        <button>#우울증</button>
                        <button>전문가답변</button>
                        <p>불면증/수면장애 고치고 싶어요ㅠㅠ</p>
                        <p>작년에 너무 힘들었고 그 동안은 스트레스를
                            받아도 잠은 자려고 했는데 언젠가부터 밤 새려고
                            하거나 새벽 늦게 자는 게 완전 습관이 돼
                            버렸어요 누워있다가 해뜰 때 자는 경우가
                            대부분이고 당연히 밤낮 바뀌고요. 그래서인지
                            탈모도 약간 생긴 것 같고..일찍 자야겠다 마음
                            먹고 누워서 휴대폰을 안 봐도 잠을 못 자는데
                            정신과에서 약 처방받는 게 맞겠죠..?
                        </p>
                    </div>
                </div>
                <div class="swiper-slide commu">
                    <div class="mb_main_content2_content_board">
                        <button>#우울증</button>
                        <button>전문가답변</button>
                        <p>불면증/수면장애 고치고 싶어요ㅠㅠ</p>
                        <p>작년에 너무 힘들었고 그 동안은 스트레스를
                            받아도 잠은 자려고 했는데 언젠가부터 밤 새려고
                            하거나 새벽 늦게 자는 게 완전 습관이 돼
                            버렸어요 누워있다가 해뜰 때 자는 경우가
                            대부분이고 당연히 밤낮 바뀌고요. 그래서인지
                            탈모도 약간 생긴 것 같고..일찍 자야겠다 마음
                            먹고 누워서 휴대폰을 안 봐도 잠을 못 자는데
                            정신과에서 약 처방받는 게 맞겠죠..?
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>

<!-- 메인 컨텐트 3 -->
<article class="main_content3">
    <p>나에게 딱 맞는 전문가</p>
    <p>무료 상담으로 자신에게 맞는 전문가를 찾아보세요</p>

    <div>
        <div>
            <span>서승준</span>
            <p>당신의 삶은 누가 통제합니까?</p>
            <p>누구든지 자신의 삶의 빛을 스스로 찾을 수 있습니다.</p>
            <span>#우울증</span> <span>#스트레스</span> <span>#가족/인간관계</span>
            <div>
                <button><i class="fas fa-phone-alt"></i> 전화상담</button>
                <button><i class="fas fa-comments"></i> 실시간 채팅</button>
            </div>
        </div>

        <!-- 이미지 영역 -->
        <div>
            <div></div>
            <!-- <img src="http://dailymedi.com//wys2/file_attach/2020/02/02/1580643966-18.jpg"/>
                백그라운드 이미지로 대체 ( 누끼를 딴 규격에 맞는 프로필 사진을 참조)
            -->
        </div>
    </div>
</article>

<!-- 모바일 메인 컨텐트 3 -->
<article class="mb_main_content3">
    <p>무료 상담으로 자신에게 맞는 전문가를 찾아보세요</p>
    <p>나에게 딱 맞는 전문가</p>

    <!-- Swiper -->
    <div class="swiper2 mySwiper2" style="overflow: hidden;">
        <div class="swiper-wrapper">
            <div class="swiper-slide profile">
                <div class="mb_main_profile">
                    <!-- 이미지 영역 -->
                    <div class="mb_main_profile_img">
                        <div></div>
                    </div>
                    <div class="mb_main_profile_content">
                        <span>서승준</span>
                        <p>당신의 삶은 누가 통제합니까?</p>
                        <p>누구든지 자신의 삶의 빛을 스스로 찾을 수 있습니다.</p>
                        <span>#우울증</span> <span>#스트레스</span> <span>#가족/인간관계</span>
                        <div>
                            <button><i class="fas fa-phone-alt"></i> 전화상담</button>
                            <button><i class="fas fa-comments"></i> 실시간 채팅</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-slide profile">
                <div class="mb_main_profile">
                    <!-- 이미지 영역 -->
                    <div class="mb_main_profile_img">
                        <div></div>
                    </div>
                    <div class="mb_main_profile_content">
                        <span>서승준</span>
                        <p>당신의 삶은 누가 통제합니까?</p>
                        <p>누구든지 자신의 삶의 빛을 스스로 찾을 수 있습니다.</p>
                        <span>#우울증</span> <span>#스트레스</span> <span>#가족/인간관계</span>
                        <div>
                            <button><i class="fas fa-phone-alt"></i> 전화상담</button>
                            <button><i class="fas fa-comments"></i> 실시간 채팅</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-slide profile">
                <div class="mb_main_profile">
                    <!-- 이미지 영역 -->
                    <div class="mb_main_profile_img">
                        <div></div>
                    </div>
                    <div class="mb_main_profile_content">
                        <span>서승준</span>
                        <p>당신의 삶은 누가 통제합니까?</p>
                        <p>누구든지 자신의 삶의 빛을 스스로 찾을 수 있습니다.</p>
                        <span>#우울증</span> <span>#스트레스</span> <span>#가족/인간관계</span>
                        <div>
                            <button><i class="fas fa-phone-alt"></i> 전화상담</button>
                            <button><i class="fas fa-comments"></i> 실시간 채팅</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-button-next" style="top:1750px; color: #E5D4C5; width: 30px;"></div>
        <div class="swiper-button-prev" style="top: 1750px; color: #E5D4C5; width: 30px;"></div>
        <!-- <div class="swiper-pagination" style="top: 3080px;"></div> -->
        <!-- 슬라이드 페이지네이션 -->
    </div>


</article>

<article class="main_content4">
    <div class="main_content4_bc"></div>
    <div class="main_content4_content">
        <div class="main_content4_content_left">
            <div>새소식</div>
            <div>
                <div class="main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>

                <div class="main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>

                <div class="main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>
            </div>
        </div>
         <div class="main_content4_content_left">
            <div>새소식</div>
            <div>
                <div class="main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>

                <div class="main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>

                <div class="main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>
            </div>
        </div>
        
        <div>
            <div class="main_content4_content_postit">
                <div>마인드 포스트잇</div>
                <div>잊고 있었던 가치나 자신에 대한 생각을 해볼 수 있도록
                    스스로를 돌아보는 질문에 답변을 해보세요.
                </div>
            </div>
        </div>
    </div>
</article>

<!-- 모바일 화면 메인 컨텐트4 -->
<article class="mb_main_content4">
    <div class="mb_main_content4_content">
        <div class="mb_main_content4_content_left">
            <div>새소식</div>
            <div>
                <div class="mb_main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>

                <div class="mb_main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>

                <div class="mb_main_content4_content_left_item">
                    <div>
                        <span>23</span>
                        <span>2022.01</span>
                    </div>
                    <div>
                        <p>
                            지역사회서비스 제공 기관 / 바우처 서비스
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="mb_main_content4_content_postit2">
                <div>마인드 포스트잇</div>
                <div>잊고 있었던 가치나 자신에 대한 생각을 해볼 수 있도록
                    스스로를 돌아보는 질문에 답변을 해보세요.
                </div>
            </div>
        </div>
    </div>
</article>


<!-- footer include -->
<jsp:include page="footer.jsp"></jsp:include>

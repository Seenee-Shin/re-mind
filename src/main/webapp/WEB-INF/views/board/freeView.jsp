<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>


            <section class="main_content">    
                <!-- 메인 -->

                <div class="back_btn">
                    <a href="">
                        <i class="fas fa-arrow-left"></i> 
                    </a>
                </div>
                <article class="board_view_wrap">
                    <div class="posting_time">
                        <p> 15분전</p>
                    </div>
                    <div class="profile_wrap">
                        <div class="writer_pic light_brown_bg" style="background-image: url();">
                        </div>

                        <div class="writer_id">
                            <p>아이디</p>
                        </div>
                    </div>
                    
                    <!-- 자신의 글일때 수정, 삭제버튼 생성 -->
                    <div class="edit_btn_wrap">
                        <button type="button" class="dark-brown edit_btn" onclick=""> 수정 </button>
                        <button type="button" class="dark-brown edit_btn" onclick="" > 삭제 </button>
                    </div>

                    <div class=" posting">
                        <p>dlknfa'wiendl/gnper</p>
                        <div class="post_img"></div>
                    </div>                   



                    <div class="like_warp">
                        <div id="like_smile" onclick="">
                        	<input type="radio" name="empathy" value="">
                        	<label for=""></label>
                            <img src="${contextPath}/resources/images/icon/smile.png" alt="">
                            <p>좋아요</p>
                            <p class="like_count">34</p>
                        </div>

                        <div id="like_hug" onclick="">
                            <img src="${contextPath}/resources/images/icon/hug.png" alt="">
                            <p>응원해요</p>
                            <p  class="like_count">34</p>
                        </div>

                        <div id="like_amazed" onclick="">
                            <img src="${contextPath}/resources/images/icon/amazed.png" alt="">
                            <p>놀랐어요</p>
                            <p  class="like_count">34</p>
                        </div>
                        
                        <div id="like_angry" onclick="">
                            <img src="${contextPath}/resources/images/icon/angry.png" alt="">
                            <p>화나요</p>
                            <p  class="like_count">34</p>
                        </div>

                        <div id="like_crying" onclick="">
                            <img src="${contextPath}/resources/images/icon/crying.png" alt="">
                            <p>슬퍼요</p>
                            <p  class="like_count">34</p>
                        </div>
                    </div>

                    <div class="report_scrap_wrap">
                        <!-- 스크랩 허용 했을 경우만 -->
                        <a href="">
                            <i class="fas fa-archive"></i>  
                            <p>스크랩</p>
                        </a>
    
                        <a href="">
                            <i class="fas fa-exclamation-triangle"></i>
                            <p>신고</p>
                        </a>
                    </div> 


                </article>

                <article class="comment_view_wrap">
                    <div class="comment_top dark-brown">
                        <div>
                            <i class="far fa-comment"></i>
                            <span>댓글</span> 
                            <span>(55)</span>
                        </div>

                        <div class="m_comment_wirte" onclick="openComment()">
                            <i class="far fa-comment"></i>
                            <span>댓글</span> 
                            <span>(55)</span>
                        </div>
                    </div>

                    <form action="">
                        <div class="write_comment">
                            
                            <div class="user_info">
                                <div class="user_pic light_brown_bg" style="background-image: url();">
                                </div>

                                <div>
                                    <p>아이디</p>
                                </div>
                            </div>

                            <textarea name="" id="" rows="3"></textarea>
                            <button class="option_btn dark_brown_bg"> 등록 </button>
                        </div>
                    </form>

                    <div class="comment_list">
                        <div class="comment_view">
                            <div class="user_info">
                                <div class="user_pic light_brown_bg" style="background-image: url();">
                                </div>

                                <div>
                                    <p>아이디</p>
                                </div>
                            </div>

                            <div class="comment">
                                <p>dhdhdhdhspr ljdn vg;wori</p>
                            </div>

                            <div class="comment_btn">
                                <button type="button" class="dark-brown edit_btn re-comment" onclick=""> 답글 </button>
                                <!--  자신이 쓴 댓글에 보이기 -->
                                <!-- <button class="dark-brown"> 수정 </button>
                                <button class="dark-brown"> 삭제 </button> -->
                            </div>
                        </div>
                        <!-- 대댓글일 경우 클래스 child 붙이기  -->
                        <div class="comment_view child">
                            <div class="user_info">
                                <div class="user_pic light_brown_bg" style="background-image: url();">
                                </div>

                                <div>
                                    <p>아이디</p>
                                </div>
                            </div>

                            <div class="comment">
                                <p>dhdhdhdhspr ljdn vg;wori</p>
                            </div>

                            <div class="comment_btn">
                                <button type="button" class="dark-brown edit_btn re-comment" onclick=""> 답글 </button>
                                <!--  자신이 쓴 댓글에 보이기 -->
                                <button type="button" class="dark-brown edit_btn" onclick=""> 수정 </button>
                                <button type="button" class="dark-brown edit_btn" onclick=""> 삭제 </button>
                            </div>
                        </div>

                    </div>



                </article>
            
            </section>
        </div>


    
    </main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>

</body>
</html>
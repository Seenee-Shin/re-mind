<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

	        <article class="main_content">    
	            <!-- 메인 -->
	
	            <div class="back_btn">
	                <a href="">
	                    <i class="fas fa-arrow-left"></i> 
	                </a>
	            </div>
	            <article class="board_view_wrap">
	                <div class="posting_time">
	                    <div class="edit_btn_wrap">
	                        <button type="button" class="dark-brown edit_btn" onclick=""> 수정 </button>
	                        <button type="button" class="dark-brown edit_btn" onclick="" > 삭제 </button>
	                    </div>
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
	                
	                <div class="post_title">
	                    <h2>심각한 알콜 중독자도 술을 끊을 수 있을까요? ㅠㅠ</h2>
	                </div>
	
	                <div class=" posting">
	                    <p>
	                        아빠가 30년정도 알콜중독자인데요
	                        2년전에 술먹고 행패 부려서 강제 입원 2번정도 시켜봤는데
	                        그땐 한달 입원하고 꺼내달라고 온갖 욕 다 해서 꺼내줬어요
	                        그리고 이번에 술 몇일 안먹었더니 금단현상으로 섬망증상이 보여서 이대론 냅둘수 없어서 입원시켰는데
	                        이제 안끊으면 안될거 같아요. . 전엔 술 안먹어도 섬망증상 같은건 없었는데 더 이상 술이 몸에 받질 않는거 같아서
	                        제발 끊고 인간답게 살아줬으면 좋겄어요
	                        근데 저희 아빠 처럼 심각한 알콜중독자들은 병원에 오래 있으려고 하지도 않고 끊기 힘들다는데.. 어쩌죠?
	                        저도 가족인연 끊고 살고 싶은데 걷잡을 수 없을때가 오면 너무 후회 할 것 같고 두 다리 쭉 펴고 못 잘거 같아요 ..
	                        그 병원이 보건복지부에서 운영 하는 곳이고 알콜치료전문이래서 이번엔 어떻게 해서든 아빠가 꺼내달라고 해도 제가 울고불고 애원하면서 몇개월만 치료 받자고 해볼건데..
	                        만약 아빠가 치료받길 원하고 몇개월 치료 받고 나오면 끊을 수 있을까요?
	                    </p>
	                    <div class="post_img"></div>
	                </div>                   
	
	
	                <div class="like_warp">
	                    <input type="radio" name="empathy" value="1001" id="like_smile" onclick="">
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
	                    <div class="comment_top dark-brown">
	                        <div>
	                            <i class="far fa-comment"></i>
	                            <span>댓글</span> 
	                            <span>(55)</span>
	                        </div>
	                    </div>
	                    
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
	
	                <!-- /////////////////////////////////////////////////////////////////////// -->
	                
	                <div class="insertReply">
	                    <textarea></textarea>
	                    <button>확인</button>
	                </div>
	
	                <div class="replyInsertOpen">답변 달기</div>
	
	                <article class="replyAll">
	                    <div class="replyInfo">
	                        <div class="reply1Line">
	                            <div class="npImg"></div>
	                            <div>
	                                <img src="data:image/jpeg;base64,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">
	                            </div>
	                            <div>류관현</div>
	                            <div>상담사</div>
	                            <div>
	                                <img src="images/warning.png">
	                            </div>
	                            <div>20시간전</div>
	                        </div>
	                        <div class="reply-content">
	                            <p>
	                                아버지의 질병으로 인해 걱정이 많으시겠네요.<br><br>
	
	                                많은 환자들은 자신의 질환에 대해 상대적으로 심각하지 않게 받아들이고<br>
	                                그로 인해 치료 시기와 기간 모두 지연되는 경우가 많습니다.<br><br>
	
	                                병이 오래 될 수록 그런 경향이 많습니다.<br>
	                                대부분의 병은 조기에 발견하면 상대적으로 치료가 쉽고<br>
	                                만성으로 갈 수록 치료가 어렵게 됩니다.<br><br>
	
	                                아버지께서 문제음주 발생 후 오래 되지 않았더라고 해도<br>
	                                30년 정도의 음주 경력이면 알코올 의존이라는 질환에서도<br>
	                                상당히 만성으로 진행된 상태라고 생각이 됩니다.<br><br>
	
	                                그렇다고 좌절해서 아무것도 안할 수 는 없겠지요.<br><br>
	
	                                환자분이 치료의지가 강하고 병원, 가족, 환자, 지인들 모두 합심하여<br>
	                                열심히 노력 한다면 치료의 가능성은 여전히 있다고 생각합니다.<br><br>
	
	                                치료의 개념을 앞으로 절대 술을 먹지 않는 것이라고 한다면<br>
	                                반복된 음주로 인해 기운이 빠지시겠지만<br>
	                                조금 더 넓혀 생각해서 최대한 단주의 기간을 늘리고<br><br>
	
	                                혹시 다시 음주를 하더라도 스스로 빠른 대처를 할 수 있게 되는 것 만으로도<br>
	                                충분히 치료 시도의 의미가 있을 것이라 생각 됩니다.<br><br>
	
	                                정답을 가지고 시작하는 일은 많지 않을 것이라 생각 됩니다.<br><br>
	
	                                알코올 의존은 질환이기 때문에 병원에서 치료 받지 않으면 매우 힘든 병입니다.<br><br>
	
	                                개개인마다 치료의 결과가 크게 다르기도 합니다.<br>
	                                전문가의 진료를 받고 도움을 받으시길 바랍니다.<br>
	                            </p>
	                        </div>
	                    </div>
	                    <div class="replyInfo">
	                        <div class="reply1Line">
	                            <div class="npImg" style="background-color: black;"></div>
	                            <div>
	                                <img src="data:image/jpeg;base64,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">
	                            </div>
	                            <div>유저일</div>
	                            <div></div>
	                            <div>
	                                <img src="images/warning.png">
	                            </div>
	                            <div>2021-01-14-12:36</div>
	                        </div>
	                        <div class="reply-content">
	                            <p>
	                                상심이 크겠어요ㅜㅜ 화이팅하세요!!!!!!!!!! ^__^
	                            </p>
	                        </div>
	                    </div>
	                </article>
	
	
	
	            </article>
	        
	        </article>
	    </div>
	
	
	
	</main>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_worry_board.js"></script>

</body>
</html>

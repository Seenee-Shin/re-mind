<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
<jsp:include page="../common/header.jsp"/>

        <section class="main_content">    
            <!-- 메인 -->
            <h3 class="comunity_title">자유롭게 글을 남겨주세요</h3>
            
              <div class="search_area">
              <select name="search_category" id="">
                  <option value="">아이디</option>
                  <option value="">내용</option>
              </select>
              <input type="text" name="freeboard_search">
              <button class="submit_btn light_brown_bg"> 검색 </button>
              </div>
              
			<form action="insert" method="post" enctype="multipart/form-data" role="form" onsubmit="return postingValidate()">
                <article id="free_borad_wrap">
                    <!-- 글작성 -->
                    <c:choose>
						<c:when test="${!empty loginMember}">
	                   	 	<div class="board_write_warp grey_bg " >
		                        <div id="free_board_write">
		                            <div class="writer_pic_wrap">
		                                <div class="my_pic light_brown_bg" style="background-image: url(${contextPath}/resources/images/member/${loginMember.memberImage});"> </div>
		                            </div>
		                            <div class="writing">
		                                <textarea class="grey_bg" name="boardContent" id="post_textarea" rows="5" placeholder="무슨일이 있었나요?"></textarea>
		                            </div>
		                        </div>
		                        
		                        <div class="imgWrap">
									<div class="boardImg">
										<img>
										 <i class="fas fa-times deleteImg" ></i>
									</div>

								</div>
		                        
		                        <div class="write_option_area">
		                            <div class="check_box_wrap">
		                                <label for="comment" class="light_brown_bg"> 댓글 허용 </label>
		                                <input type="checkbox" name="replyCheckCode" value="comment" id="comment" onclick="optionValidate();">
		                            </div>
		
		                            <div class="check_box_wrap">
		                                <label for="scrap" class="light_brown_bg">스크랩 허용</label>
										<input type="checkbox" name="scrapCheckCode" value="scrap" id="scrap" onclick="optionValidate();">
		                                    
		                            </div>
		                            
		                            <div class="check_box_wrap">
		                                <label for="like" class="light_brown_bg">공감 허용</label>
		                                <input type="checkbox" name="empathyCheckCode" value="like" id="like" onclick="optionValidate();">
		                            </div>
		                        </div>
		                        
		                        <hr>
		                        <div class="btn_area">
		                            <label for="file">
		                                <i class="fas fa-image dark-brown"></i>
		                            </label>
										<input type="file" name="images" id='addFileBtn' accept="audio/*, video/*, image/*" multiple onchange="loadImg();" style="display: none"> 
		                            <button class="submit_btn light_brown_bg">작성</button>
		                        </div>
		                    </div>
                        <!-- 모바일 글쓰기 모달창 -->
			                <div class="posting_modal_warp hidden">
			                    <div class="modal">
			                        <article id="m_free_borad_wrap">
			                            <!-- 글작성 -->
			                            <div class="m_board_write_warp ">
			                                <div id="m_free_board_write">
			                                    <i class="fas fa-times" id="closeModal"></i>
			                                    <div class="writer_wrap">
			                                        <div class="my_pic light_brown_bg" style="background-image: url();">
			                                        </div>
			                                        <div class="m_writing">
			                                            <textarea name="boardContent" id="m_post_text" rows="5" placeholder="무슨일이 있었나요?"></textarea>
			                                        </div>
			                                    </div>
			                                </div>
			                                
			                               <div class="m_write_option_area">
			
			                                    <div class="write_option_area">
			                                        <div class="check_box_wrap">
			                                            <label for="mComment" class="light_brown_bg">댓글 허용</label>
			                                            <input type="checkbox" name="replyCheckCode" value="comment" id="mComment"  onclick="optionValidate();">
			                                        </div>
			
			                                        <div class="check_box_wrap">
			                                            <label for="mScrap" class="light_brown_bg">스크랩 허용</label>
			                                            <input type="checkbox"  name="scrapCheckCode" value="scrap" id="mScrap"  onclick="optionValidate();">
			                                        </div>
			                                        
			                                        <div class="check_box_wrap">
			                                            <label for="mLike" class="light_brown_bg">공감 허용</label>
			                                            <input type="checkbox"  name="empathyCheckCode" value="like" id="mLike"  onclick="optionValidate();">
			                                        </div>
			                              		</div>
			                                
				                                <hr>
				
				                                <div class="m_submit_btn_wrap">
						                          	<label for="mfile">
						                               <i class="fas fa-image dark-brown"></i>
						                           	</label>
													<input type="file" name="images" id='mfile' accept="audio/*, video/*, image/*" multiple onchange="loadImg();" style="display: none"> 
				
				                                    <div class="m_btn_area">
				                                        <button class="submit_btn light_brown_bg">작성</button>
				                                        <button class="submit_btn dark_brown_bg" button type="button" onclick="">취소</button>
				                                    </div>
				                                </div>
			                           		</div>
			                        	</div>
	                        		</article>
	                        	 </div>
		                     </div>
               	     	</c:when>
               	     	<c:otherwise>
               	     		<div class="board_write_warp grey_bg " >
               	     			<div id="free_board_write">
		                            <div class="writing" style="min-height: 100px;">
		                            	<div style="text-align: center; color: grey; font-size: 20px;">글은 작성하시려면 로그인 해주세요</div>
		                            </div>
	                            </div>
                           	</div>
               	     	</c:otherwise>
                    </c:choose>
                </article>
                
            </form>


            <!-- 게시판 리스트 -->
            <jsp:include page="list.jsp"/> 
            
        </section>
    </div>
</main>


<!-- header include -->
<jsp:include page="../common/footer.jsp"/>
<script src="${contextPath}/resources/js/board/board_common.js"></script>



<script src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>

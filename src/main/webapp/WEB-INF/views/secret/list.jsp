<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

	        <section class="main_content">    
	          
	
	            <article id="free_borad_wrap">
	            
	            	<h1>털어 놓기</h1>
	
	                <!-- 게시판 리스트 -->
	                <div class="free_board_list_wrap">
	                  <!-- 게시판 하나 시작  -->
               		 <div class="board_list_content">
                    <!-- 프로필 시작 -->
                    <div class="board_flex_wrap">
                        <div class="writer_pic_wrap">
                            <div class="writer_pic light_brown_bg" style="background-image: url();">
                            </div>
                            <ul class="userMenu hidden">
	                            <li> <a href=""> 차단</a> </li>
	                            <li> <a href=""> 검색</a> </li>
                            </ul>                            
                        </div>
	                </div>
	
	            </article>
	        
	        </section>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/board_common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_worry_board.js"></script>

<script>
$(function () {
	$.ajax({
		url : "${contextPath}/secret/secretList",
		type : "POST",
		data : {},
		success : function (result) {

			let i = 0;
			let html = "";
			let empathyArr;
			let empathyCntArr;

			let iconCnt = {};

			$.each(result.secretList, function (i, item) {
				// empathy 초기화
				empathyArr = [];
				empathyCntArr = [];
				iconCnt = {
					"1001" : 0,
					"1002" : 0,
					"1003" : 0,
					"1004" : 0,
					"1005" : 0
				};

				if (item.worryEmpathyArray != null) {
					empathyArr = (item.worryEmpathyArray).split(",");
					empathyCntArr = (item.worryCntArray).split(",");
				}

				for(i=0; i<empathyArr.length; i++) {
					iconCnt[empathyArr[i]] = empathyCntArr[i];
				}

				html += `
					<div class="board_list_content" onclick="location.href='${contextPath}/post/list';">
						<div class="board_flex_wrap">
							<div class="writer_pic_wrap">
								<div class="writer_pic light_brown_bg" style="background-image: url();"></div>
								<ul class="userMenu hidden">
									<li> <a href=""> 차단</a> </li>
									<li> <a href=""> 검색</a> </li>
								</ul>
							</div>
							<a href="">
								<div class="posting_info">
									<div class="writer_id">
										<p class="userInfo">` + item.memberId + `</p>
										<p> ` + item.createDate + `</p>
									</div>
									<div class="posting">
										<p>` + item.boardTitle + `</p>
									</div>
								</div>
							</a>
						</div>
						<div class="board_icon_wrap">
							<div class="comment_wrap">
                                <i class="far fa-comment dark-brown"></i>
                                <p>` + 5 + `</p>
                            </div>
							<div class="like_warp">
                                <img src="${contextPath}/resources/images/icon/smile.png" alt="" data-icon="1001">
                                <p>`+ iconCnt[1001] +`</p>
                                <img src="${contextPath}/resources/images/icon/hug.png" alt="" data-icon="1002">
                                <p>`+ iconCnt[1002] +`</p>
                                <img src="${contextPath}/resources/images/icon/amazed.png" alt="" data-icon="1003">
                                <p>`+ iconCnt[1003] +`</p>
                                <img src="${contextPath}/resources/images/icon/angry.png" alt="" data-icon="1004">
                                <p>`+ iconCnt[1004] +`</p>
                                <img src="${contextPath}/resources/images/icon/crying.png" alt="" data-icon="1005">
                                <p>`+ iconCnt[1005] +`</p>
                            </div>
                        </div>
					</div>
				`;
			});

			$(".free_board_list_wrap").append(html);
		},
		error : function(request, status, error){
			console.log("ajax 통신 중 오류 발생");
			console.log(request.responseText);
		}


	})
})





</script>


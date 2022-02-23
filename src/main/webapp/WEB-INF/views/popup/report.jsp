<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


 <div class="report_modal" id="letter_area_wrap">
 
    <div class="top_title_wrap">
        <h2 class="title">신고하기</h2>
    </div>
 	
	<form action="report" method="POST">
	 	<div class="letter_box">
	 		<div id="content_counter" style="text-align: right;">
	        	<p><span id = "content_count">0</span>/200</p>
	        </div>
	        
	 		<textarea class="report_textarea" name="reportContent" id="reportContent" rows="3" required></textarea>
		     
			<button type="submit" class="study_submit_btn" id="proReview">신고</button>
		</div>
 	</form>
 	
 
 
 </div>
 
 <script>
 $(".report_textarea").on("input" , function(){

	    let count = $(this).val().length;

	    if(count >= 200){
	        $("#content_count").css("color", "red");
	        
	        $(this).val( $(this).val().substr(0,200) );
	        
	        count = 200;

	    }else if( count < 200){
	        $("#content_count").css("color", "black");

	    }
	    $("#content_count").text(count);

	});
 

	// 클릭시
	function proLetter(){
		
		reportContent = $("#reportContent").val();
		
		console.log(reportContent);
		
		const formData = new FormData();
		formData.append("boardNo",boardNo);
		formData.append("memberNo",memberNo);
		
		console.log(formData)
		
		$.ajax({
			url :  "${contextPath}/free/report",
			type : "POST",
			// 쪽지내용, 회원번호, 전문가번호
			data : formData,
			success:function(result){
				if (result > 0){
					
					alert("문의 등록이 완료되었습니다.");
					
					// 모달창 닫기
					$("#letter_area_wrap").css("display","none");
					$(".close_popup_btn").css("display","none");
					
				}
			},
		
		});

	}

 
 
 
 </script>


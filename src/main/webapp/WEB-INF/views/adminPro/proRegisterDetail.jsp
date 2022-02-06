<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
    <h1>상담사 등록 신청 </h1>
    <br>
    <form action="proRegisterDetail" method="post" enctype="multipart/form-data" role="form" name="proRegisterDetail"> 

        <div class="proWrap">
            <div class="label">
            병원명
            </div>
            <input type="text" name="hospitalName" id="hospitalName" required> <br>

            <div class="label">
            병원주소 
            </div>
            <input type="text" name="address" id="hospitalAddress" readonly="readonly"> <button type="button" id="address_kakao">주소 찾기</button> <br>
               <div class="label">
            </div>
            <input type="text" name="address" id="address_detail"> 
            <br>
			<br>
            <div class="label">
            병원 전화번호
            </div>
            <input type="text" name="hospitalPhone" id="hospitalPhone" required> <br>
            
            <div class="label">병원 개업번호</div>
            <input type="text" name="businessNo" id="businessNo" required> <br>
            
            <br>
            
            <div class="label">학력사항</div> <br>
            <div class="label child">학교명</div><input type="text" name="professionUniversity" id="schoolName" required> <br>
            <div class="label child ">학과명</div> <input type="text" name="professionDepartment" id="schoolPart" required> <br>
            <div class="label child">전공</div>  <input type="text" name="professionMajor" id="schoolMajor" required> <br>
            <input type="file" name="certification" id="certification" accept="image/*, .pdf" required> <label for="certification">증명서 첨부</label>
            <br>
            <br>
            <br>
            <input type="checkbox" name="accept" id="accept1" required>(필수)  입력한 정보는 모두 사실이며, 추후 사실이 아님이 확인되는 경우, 즉각 
            상담 활동이 중지됨을 확인하였습니다. <br><br>
            <input type="checkbox" name="accept" id="accept2" required>(필수)  상담윤리에 대한 교육을 이수하였으며, 상담학회의 윤리규정을 중용 할 것임을 서약합니다. <br>
            <br>
            <br>
            <button style="display: inline-block; text-align: center;">등록하기</button>
        </div>
    </form>
</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("hospitalAddress").value = data.zonecode+ " " +data.address; // 주소 넣기
	                document.querySelector("input[id=address_detail]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	



</script>




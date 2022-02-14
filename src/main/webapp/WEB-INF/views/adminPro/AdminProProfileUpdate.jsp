<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
   <h2>상담사 프로필 : ${loginPro.professionNo}</h2>
   <form action="../update/${loginPro.professionNo}" method="post" enctype="multipart/form-data" role="form" onsubmit="return getCheckBoxVal()">

       <section class="proflieWrap">
           <article class="proInfoWrap">
               <div class="profile">
                   <h3>등록일자</h3>
                   <p> 2021-03-21</p>
               </div>
               <div class="profile" >
                   <h3>상담사 이름</h3>
                   <p>홍길동</p>
               </div>
               <div class="profile">
                   <h3>상담사 전화번호</h3>
                   <p>010-2353-2342</p>
               </div>
               <div class="profile">
                   <h3>상담사 이메일</h3>
                   <p>010-2353-2342</p>
               </div>
               <div class="profile">
                   <h3>병원명</h3>
                   <p>꿈을그리다 심리상담센터</p>
               </div>
               <div class="profile">
                   <h3>병원 주소</h3>
                   <p>광주시 경인로 325길 35</p>
               </div>
           </article>
           <article class="profailPic">
               <h3 style="text-align: center;">프로필 이미지</h3>
               <input type="file" accept=".png" name="proProfile" id="" onchange="loadImg(this)" style="display: none">
               <div class="imgBox" >
               	<img alt="" src="">
               	<i class="fas fa-times deleteImg"></i>
               	<span class ="imgDec"> 클릭하여 프로필 사진 추가</span>
               </div>
               <p>500x500 이상의 뒷배경이 투명인 png파일을 올려주세요</p>
               <a href="https://www.remove.bg/ko" target="_blank">투명배경 만들기</a>
           </article>
       </section>
       
       <section class="proDescrpiton">
           <article class="proInfo">
               <h3>태그추가하기</h3>
               <div class="checkBoxWrap">
               
               		<c:forEach items="${category}"  var="c">
               			<div class="checkBox" >
                   			<input type="checkbox" name="worryCategoryOne" value="${c.worryCategoryCode}" id="${c.worryName}">
                  			<label for="${c.worryName}">${c.worryName}</label>
                   		</div>
                   </c:forEach>
             		<input type="text" name="worryCategoryCode" id="worryCategory" value=""/>
               </div>
           </article>

           <article class="proInfo">
               <h3>하고싶은 말</h3>
               <textarea name="professionIntro" id="professionIntro" rows="8">${proInfo.professionIntro}</textarea>
           </article>

           <article class="proInfo">
               <h3>상담사 소개</h3>
               <textarea name="professionStory" id="professionStory"  rows="8">${proInfo.professionStory}</textarea>
           </article>
           
           <article class="proInfo">
               <h3>경력</h3>
               <textarea name="professionCarrer" id="professionCarrer"  rows="8">${proInfo.professionCarrer}</textarea>
           </article>
       </section>


       <section class="priceWrap">
           <h3>가격 정보</h3>
	           <c:forEach items="${price}" var="p">
	           
		           <article class="proPrice">
	                   <label for = "${p.counselCategoryCode}">
	                   		<c:choose>
	                   			<c:when test="${p.counselCategoryCode == 1}">채팅상담</c:when>
	                   			<c:when test="${p.counselCategoryCode == 2}">화상상담</c:when>
	                   			<c:otherwise> 전화상담</c:otherwise>
	                   		</c:choose>
	                   </label>
	                   <input type="number" name="counselPrice" value="${p.counselPrice}" id="${p.counselCategoryCode}">원 
		           </article>
	           </c:forEach>
       </section>
       
       <button>수정하기</button>
   </form>
</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function() {
		$(".imgBox").on("click", function() {
	
			$(".imgDec").text("");
			$("[type=file]").click();
			
			// 타입이 file인 요소 중 몇번째 인덱스 요소를 선택하여 클릭
		});
	
	});
	
	$(".deleteImg").on("click",function(e){
		  //event 발생 객체 : 이벤트에 관련된 모든 객체

		  //이벤트 버븥링(감싸고 있는 요소의 이벤트가 전파됨) 을 방지 
		  e.stopPropagation();
		  $(this).prev().removeAttr("src") //미리보기 이미지 삭제 
		  $("input[name=proProfile]").val("")
		  $(".imgDec").text("클릭하여 프로필 사진 추가")
		  
		  
		})
		
		
	function loadImg(input) {
		if (input.files && input.files[0]) {

			var reader = new FileReader();
		
			reader.readAsDataURL(input.files[0]);
			
			reader.onload = function(e) {

				$(".imgBox").children("img").attr("src", e.target.result);
				$(".imgDec").text("")
			}
		}
	}
	
	//submit시 고민카테고리 코드 문자열 만들기
    function getCheckBoxVal(){
        var worryCategoy = "" // 문자열 선언
 
        $('input:checkbox[name=worryCategoryOne]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        	worryCategoy += this.value + ",";
        });
        
        
        $('#worryCategory').val(worryCategoy.slice(0,-1));
        return true;
        
    }

</script>





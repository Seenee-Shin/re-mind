<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
   <h2>상담사 프로필</h2>
   <form action="AdminProProfile" method="post" enctype="multipart/form-data" role="form">

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
               <input type="file" accept=".png" name="" id="">
               <div class="imgBox"></div>
               <p>500x500 이상의 뒷배경이 투명인 png파일을 올려주세요</p>
           </article>
       </section>
       
       <section class="proDescrpiton">
           <article class="proInfo">
               <h3>태그추가하기</h3>
               <div class="checkBoxWrap">
                   <label for="tag">우울</label>
                   <input type="checkbox" name="" value="" id="tag">
               </div>
           </article>

           <article class="proInfo">
               <h3>하고싶은 말</h3>
               <textarea name="" id="" rows="8"></textarea>
           </article>

           <article class="proInfo">
               <h3>상담사 소개</h3>
               <textarea name="" id=""  rows="8"></textarea>
           </article>
           
           <article class="proInfo">
               <h3>경력</h3>
               <textarea name="" id=""  rows="8"></textarea>
           </article>
       </section>


       <section class="priceWrap">
           <h3>가격 정보</h3>
           <article class="proPrice">
                   <label for = "tel">전화상담</label>
                   <input type="number" name="price" id="tel"> 원 
           </article>
           <article class="proPrice">
                   <label for = "tel">전화상담</label>
                   <input type="number" name="price" id="tel"> 원 
           </article>
           <article class="proPrice">
                   <label for = "tel">전화상담</label>
                   <input type="number" name="price" id="tel"> 원 
           </article>
           
       </section>
       
       <button>수정하기</button>
   </form>
</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>





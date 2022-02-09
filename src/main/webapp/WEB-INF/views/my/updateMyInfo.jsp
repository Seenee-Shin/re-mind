<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/updateMyInfo.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="update-mypage">회원정보 수정</div>
    <form action="updateMyInfo" method="POST" enctype="multipart/form-data">
        <div class="update-img">

    <%--        if(item.imagePath == undefined)//기본프로필이 없으면--%>
    <%--        pro_profile_img2 = $('<img src="'+contextPath+'/resources/images/basicProfile.png" class="profile">');--%>
    <%--        else // 있으면 경로로 이미지이름 추가로 가져와야됨--%>
    <%--        pro_profile_img2 = $('<img src="'+contextPath+item.imagePath+'/'+item.imageName+'" class="profile">');--%>
            <c:choose>
                <c:when test="${empty memberImage.imagePath}">
                    <label for="chooseFile">
                        <img src="${contextPath}/resources/images/basicProfile.png">
                    </label>
                </c:when>
                <c:otherwise>
                    <label for="chooseFile">
                        <img src="${contextPath}${memberImage.imagePath}/${memberImage.imageName}">
                    </label>
                </c:otherwise>
            </c:choose>
        <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)" style="display: none">
        </div>
        <table class="table">
            <tr>
                <td>이름</td>
                <td>${loginMember.memberName}</td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>${loginMember.memberId}</td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input class="pass" type="password" placeholder="비밀번호를 입력해주세요.">
                    <div>123</div>
                </td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input class="nickname" type="text" value="더키"></td>
            </tr>
            <tr>
                <c:set var="ph" value="${fn:split(loginMember.memberPhone, '-') }"/>
                <td>휴대전화</td>
                <td>
                    <input class="ph" type="text" value="${ph[0]}" readonly>
                    - <input class="ph" type="text" value="${ph[1]}" readonly>
                    - <input class="ph" type="text" value="${ph[2]}" readonly>
                </td>
            </tr>
        </table>

        <div class="update-info">
            <div class="update-img">
                <c:choose>
                    <c:when test="${empty memberImage.imagePath}">
                        <img src="${contextPath}/resources/images/basicProfile.png">
                    </c:when>
                    <c:otherwise>
                        <img src="${contextPath}${memberImage.imagePath}/${memberImage.imageName}">
                    </c:otherwise>
                </c:choose>
            </div>
            <div>프로필 사진 변경</div>

            <div class="updateName">이름</div>
            <div>${loginMember.memberName}</div>
            <hr>
            <div class="updateNN">닉네임</div>
            <div>${loginMember.memberFName}</div>
            <hr>
            <div class="updateEmail">이메일</div>
            <div>${loginMember.memberId}</div>
            <hr>
            <div class="updatePhone">전화번호</div>
            <div>
                <input class="ph" type="text" value="${ph[0]}" readonly> -
                <input class="ph" type="text" value="${ph[1]}" readonly> -
                <input class="ph" type="text" value="${ph[2]}" readonly>
            </div>
            <hr>
            <div class="updatePW">비밀번호</div>
            <div class="pwResult">
                입력 : <input type="password" class="pass"> <span class="pwSpan">유효성</span><br>
                <button>비밀번호 변경</button>
            </div>
        </div>

        <div class="csdiv">
            <button id="update">수정</button>
            <button id="cancel" type="reset">취소</button>
        </div>
    </form>
</article>
<div id="fileName"></div>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<%--<script src="${contextPath}/resources/js/my/updateMyInfo.js"></script>--%>
<script>
    // 정규식검사
    $(".pass").on("input", function (){
        const index = $(".pass1").index($(this));
        const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

        let pw = $(this).val();

        if(pw.trim().length == 0){
            $(".pass").eq(0).next().text("");
            return;
        }

        if(reg.test(pw)){
            if(index == 0) {//컴
                $(".pass").eq(0).next().text("사용 가능한 비밀번호입니다.").css("color", "springgreen");
            }else{
                $(".pass").eq(1).next().text("사용 가능한 비밀번호입니다.").css("color", "springgreen");
            }
        }else{
            if(index == 0){//컴
                $(".pass").eq(0).next().text("사용할 수 없는 비밀번호입니다.").css("color", "red");
            }else{//모
                $(".pass").eq(1).next().text("사용할 수 없는 비밀번호입니다.").css("color", "red");
            }
        }
    });

    function loadFile(input) {
        var file = input.files[0];	//선택된 파일 가져오기

        //미리 만들어 놓은 div에 text(파일 이름) 추가
        var name = document.getElementById('fileName');

        name.textContent = file.name;


        //새로운 이미지 div 추가
        var newImage = document.createElement("img");
        newImage.setAttribute("class", 'img');

        //이미지 source 가져오기
        newImage.src = URL.createObjectURL(file);

        newImage.style.width = "70%";
        newImage.style.height = "70%";
        newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
        newImage.style.objectFit = "contain";

        //이미지를 image-show div에 추가
        var container = document.getElementById('image-show');
        container.appendChild(newImage);
    };


</script>
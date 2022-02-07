<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content22">
    <div id="reservation_confirm_wrap" class="float-left">
        <div id="reservation_confirm">
            <div style="height: 125px;">
                <img src="${contextPath}/resources/images/pro/pro_img/pro_img1_1.png" class="float-left"
                     style="width:125px; height: 125px;">
                <div class="reservation_confirm_proname float-left">
                    <p style="font-size: 13px; font-weight: 500; color:#a59999">추천상담사</p>
                    <h1>김효린상담사</h1>
                </div>
            </div>

            <div id="tuition" class="clear-both box_style">
                <div class="pro_reservation">
                    <table class="pro_reservation_select">
                        <tr>
                            <th>테라피 선택</th>
                            <td>
                                <select class="select_box" id="therapy_select" >
                                    <option value="0">선택</option>
                                    <option value="100">텍스트테라피</option>
                                    <option value="100">페이스테라피</option>
                                    <option value="100">보이스테라피</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>횟수</th>
                            <td>
                                <select class="select_box" id="therapy_count">
                                    <option value="0">선택</option>
                                    <option value="1">1회</option>
                                    <option value="1">3회</option>
                                    <option value="1">5회</option>
                                    <option value="1">20회</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="tuition_date" class="box_style">
                <p class="tuition_font">첫번째 상담 날짜 선택 <span class="tuition_sub">*두번째 상담부터는 마이페이지에서 지정해 주세요.</span></p>
                <div style="text-align: center; font-width: bold; margin: 50px 0;">
                    <div id="calendar_left" onclick="beforeCalendar();">
                    <img src="${contextPath}/resources/images/pro/left.png">
                    </div>
                    <div style="display: inline-block; font-size: 20px;" class="YM" id="ym">2022년 1월</div>
                    <div id="calendar_right" onclick="nextCalendar();">
                    <img src="${contextPath}/resources/images/pro/right.png">
                    </div>
                </div>
                <div class="calendar">
                    <table id="calendar">
                    </table>
                </div>
            </div>

            <div id="tuition_time_wrap" class="box_style">
                <p class="tuition_font">시간 선택</p>
                <div id="tuition_time">
                    <select id="time_select">
                        <option>선택</option>
                        <option>08:00</option>
                        <option>10:00</option>
                        <option>12:00</option>
                        <option>14:00</option>
                        <option>16:00</option>
                        <option>18:00</option>
                    </select>

                </div>
            </div>
        </div>
    </div>
    <div id="reservation_pay_wrap" class="float-right">
        <div id="reservation_pay">
            <div class="pro_price">
                <p class="float-left pro_price_title">테라피 선택</p>
                <p id="therapy_chk" class="float-right">선택</p>
            </div>

            <div class="pro_price clear-both">
                <p class="float-left pro_price_title">횟수 합계</p>
                <p id="therapy_count_chk" class="float-right">선택</p>
            </div>

            <div class="pro_price clear-both">
                <p class="float-left pro_price_title">첫번째 수강 날짜</p>
                <p id="date_chk" class="float-right">선택</p>
            </div>

            <div class="pro_price clear-both">
                <p class="float-left pro_price_title">시간</p>
                <p id="time_chk" class="float-right">선택</p>
            </div>
        </div>

        <div class="pro_price clear-both">
            <p class="float-left pro_price_title">수강료 합계</p>
            <p id="price" class="float-right">0<span>원</span></p>
        </div>

        <div class="final_pay clear-both">
            <button onclick="requestPay();">
                결제하기
            </button>
        </div>
    </div>
</article>


<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- js -->
<script>
    const loginMemberNo = '${loginMember.memberNo}';
    const loginMemberNm = '${loginMember.memberName}';
    const loginMemberId = '${loginMember.memberId}';
    const loginMemberPhone = '${loginMember.memberPhone}';
</script>
<script type="text/javascript" src="${contextPath}/resources/js/pro/pro.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
    const redColor = "#be153d";
    const blueColor = "#193ea0";

    var today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth();
    let backupMonthFirstDay;

    // 달력에 블록표시해주는 함수입니다.
    function setBlock(){
        let seeYear = $(".YM").text().split("년 ")[0];
        let seeMonth = $(".YM").text().split("년 ")[1].split("월")[0];
        let date = today.getDate();

        let monthFirstDay = new Date(year, month, 1).getDay();

        // 현재날짜보다 보고 있는 달력의 년도가 낮을 시 블록처리합니다.
        if(seeYear < today.getFullYear()){
            for(let i = 0; i < $("#calendar td").length; i++){
                if(i < 7) continue;
                $("#calendar td").eq(i + monthFirstDay).css("color", "#c5cacd");
            }
        }else{// 현재년도와 보고있는 년도가 같거나 더 높을 시
            // 현재날짜보다 보고있는 달력의 월이 낮을 시 블록처리합니다.
            if(seeMonth <= today.getMonth() + 1){
                if(seeMonth == today.getMonth() + 1){
                    for(let i = 0; i < $("#calendar td").length; i++) {
                        if ($("#calendar td").eq(i).attr("id") <= date)
                            $("#calendar td").eq(i).css("color", "#c5cacd");
                    }
                }else{ // 현재 월보다 보고있는 월이 낮을 시
                    for(let i = monthFirstDay; i < $("#calendar td").length; i++){
                        $("#calendar td").eq(i + monthFirstDay).css("color", "#c5cacd");
                    }
                }
            }
        }
    }

    // 달력을 만들어주는 함수입니다.
    const calendar = document.getElementById("calendar");
    function makeCalendar(el, yearNo, monthNo) {

        year = Number.parseInt(yearNo);
        month = Number.parseInt(monthNo);

        let YM = year + "년 " + (month + 1) + "월";
        $(".YM").text(YM);

        $(".calendar").attr("id", year + "-" + month);

        let endDay = new Date(year, month + 1, 0);
        let nextDate = endDay.getDate();

        // 오늘은 무슨요일
        const WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
        let monthFirstDay = new Date(year, month, 1).getDay();
        backupMonthFirstDay = monthFirstDay;
        let row = el.insertRow();
        let cell;

        // 일 ~ 토 요일을 표시해주고 색을 칠해줍니다.
        for(let i = 0; i < 7; i++){
            cell = row.insertCell();
            cell.innerHTML = WEEKDAY[i]
            if(i == 0)      cell.style.color = redColor;
            else if(i == 6) cell.style.color = blueColor;
        }
        row = el.insertRow();

        for(let i = 0; i < monthFirstDay; i++){
            cell = row.insertCell();
        }

        for(let i = 1; i <= nextDate; i++){
            if(monthFirstDay != 7){
                cell = row.insertCell();
                cell.setAttribute("id", i);
                cell.innerHTML = i;

                if(monthFirstDay == 0 && i == 1)    cell.style.color = redColor;
                else if(monthFirstDay == 6)         cell.style.color = blueColor;
                monthFirstDay += 1;
            }else{
                row = el.insertRow();
                cell = row.insertCell();
                cell.setAttribute("id", i);

                cell.innerHTML = i;
                cell.style.color = redColor;
                monthFirstDay = monthFirstDay - 6;
            }
        }
        setHgight();
        setBlock();
    }

    function beforeCalendar() {
        $("#calendar").empty();

        let id = $(".calendar").attr("id");
        let splitId = id.split("-");

        let yearNo = splitId[0];
        let monthNo = splitId[1];

        // 현재 1월이면
        if(splitId[1] == 0){
            yearNo = Number.parseInt(yearNo) - 1;
            monthNo = Number.parseInt(monthNo) + 12;
        }
        monthNo = Number.parseInt(monthNo) - 1;

        makeCalendar(calendar, yearNo, monthNo);
    }

    function nextCalendar() {
        $("#calendar").empty();

        let id = $(".calendar").attr("id");
        let splitId = id.split("-");

        let yearNo = splitId[0];
        let monthNo = splitId[1];

        // 현재 12월이면
        if(splitId[1] == 11){
            yearNo = Number.parseInt(yearNo) + 1;
            monthNo = Number.parseInt(monthNo) - 12;
        }
        monthNo = Number.parseInt(monthNo) + 1;

        makeCalendar(calendar, yearNo, monthNo);
    }

    makeCalendar(calendar, year, month);

    $(document).on("click", "#calendar td", function (){
        const index = $("#calendar td").index($(this));

        if($(this).css("color") == "rgb(197, 202, 205)") return;
        if(index < 7 + backupMonthFirstDay) return;
        
        $("#calendar td").removeClass("YMcss");
      	$(this).addClass("YMcss");
    });


    function setHgight(){
       if($("#calendar tr").length > 6){
            $("#tuition_date").css("height","630px");
            $("#reservation_confirm_wrap").css("height","1197px");
        }else{
            $("#tuition_date").css("height","560px");
            $("#reservation_confirm_wrap").css("height","1120px");
        } 
    }


</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
    <link rel="stylesheet" href="css/common.css">
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $("#foo-table").DataTable();
        });
    </script>
    <style>
        .admin{
            width: 100%;
            height: 60px;
            padding: 20px;
            background-color: #f8f8f8;
            font-weight: bold;
        }
        .admin a{color: black;}
        .admin li{
            display: inline-block;
            width: 19%;
            text-align: center;
        }
        table{text-align: center;}
        .changeMember{border: 1px solid #ccc; width: 80%; margin: 0 5px;}
    </style>
    <title></title>
</head>

<body>
<main>

    <h3 style="text-align: center; margin-top: 30px; font-size: 24px; font-weight: bold;" class="dark-brown">관리자 페이지</h3>
    <article class="dark-brown admin" style="margin: 30px 20px 0 0; float: left;">
        <ul>
            <li><a href="#">회원 정보</a></li>
            <li><a href="#">이것</a></li>
            <li><a href="#">저것</a></li>
            <li><a href="#">있을</a></li>
            <li><a href="#">겁니다</a></li>
        </ul>
    </article>

    <div style="margin-top: 30px; float: right; width: 100%">
        <table id="foo-table" class="table table-bordered">
            <thead>
            <tr>
                <th style="width: 10%;">Email</th>
                <th style="width: 10%;">Name</th>
                <th style="width: 10%;">FName</th>
                <th style="width: 35%;">Address</th>
                <th style="width: 10%;">Phone</th>
                <th style="width: 10%;">Register Date</th>
                <th style="width: 15%;">여부</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
</main>

<script>

    // $("#foo-table").DataTable({
    //     // 표시 건수기능 숨기기
    //     lengthChange: false,
    //     // 검색 기능 숨기기
    //     searching: false,
    //     // 정렬 기능 숨기기
    //     ordering: false,
    //     // 정보 표시 숨기기
    //     info: false,
    //     // 페이징 기능 숨기기
    //     paging: false
    // });

    $(function (){
        $.ajax({
            url: "getGmMember",
            type: "GET",
            dataType: "JSON",
            success: function (data) {
                $('#foo-table').DataTable({
                    data: data,
                    "bDestroy": true,
                    order: [[5, "desc"]],
                    columns: [
                        { data: "memberId", "defaultContent": "-" },
                        { data: "memberName", "defaultContent": "-" },
                        { data: "memberFName", "defaultContent": "-" },
                        { data: "memberAddress", "defaultContent": "-"},
                        { data: "memberPhone", "defaultContent": "-" },
                        { data: "memberDate", "defaultContent": "-" },
                        { data: "m", "defaultContent": "-"}
                    ],
                    columnDefs: [
                        {
                            "targets": 6,
                            "data": null,
                            "render": function (data, type, row) {
                                let temp;
                                if(row.statusCode == 2){
                                    temp = '<button class="changeMember" value="2" id="' + row.memberNo + '">회원정지 상태</button>';
                                }else{
                                    temp = '<button class="changeMember" value="0" id="' + row.memberNo + '">일반회원 상태</button>';
                                }
                                return temp;
                            },
                            "orderable": false
                        },
                        {
                            "targets": 1,
                            "data": null,
                            "render": function (data, type, row) {
                                return '<a href="#">' + data + '</a>';
                            },
                            "orderable": false
                        }
                    ]
                });
            }
        });
    });

    $(document).on("click", ".changeMember", function (){
        const statusCode = $(this).val();
        const thisMemberNo = $(this).attr("id");

        if(statusCode == 0){
            if(confirm("이 회원을 정지회원으로 변경하시겠습니까?"))
                isPrime(thisMemberNo, statusCode);
            else
                alert("취소하셨습니다.")
        }else if(statusCode == 2){
            if(confirm("이 회원을 일반회원으로 변경하시겠습니까?"))
                isPrime(thisMemberNo, statusCode);
            else
                alert("취소하셨습니다.")
        }
    });

    function isPrime(thisMemberNo, statusCode){
        $.ajax({
            url:"isPrime",
            type:"POST",
            data:{
                "memberNo": thisMemberNo,
                "statusCode": statusCode},
            success:function (result){
                if(result > 0){
                    alert("변경되었습니다.");
                    location.reload();
                }
            }
        });
    }


</script>
</body>


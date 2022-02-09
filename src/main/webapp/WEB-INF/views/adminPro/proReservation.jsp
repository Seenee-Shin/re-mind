<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.js"></script>


<main>
	<h1>상담사 예약 목록</h1>

	<table id="table_id" class="display">
           <thead>
               <tr>
                   <th>번호</th>
                   <th>클래스명</th>
                   <th>강사명</th>
                   <th>신청상태</th>
                   <th>신청일자</th>
                   <th></th>
               </tr>
           </thead>
           <tbody>
           </tbody>
       </table>
</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready( function () {
    $('#myTable').DataTable();
} );

$(function () {
	   createTable();
	})

	function createTable() {
	   $.ajax({
	      url: "classList",
	      type: "GET",
	      dataType: "JSON",
	      success: function (data) {
	         $('#table_id').DataTable({
	            language: lang_kor,
	            data: data,
	            order: [[4, "asc"]],
	            columns: [
	               { data: "classNo" },
	               {
	                  data: null,
	                  render: function (data, type, row) {
	                     return '<a href="class/'+ data.classNo +'">' + data.className + '</a>';
	                  }
	               },
	               { data: "memberName" },
	               {
	                  data: null,
	                  render: function (data, type, row) {
	                     if(data.classStatus == 0){
	                        return "신청완료";
	                     }else{
	                        return "검토중";
	                     }
	                  }
	               },
	               { data: "classRequestDate" },
	               {
	                  data: null,
	                  render: function (data, type, row) {
	                     return '<button onclick="agree(' + data.classNo + ', ' + data.memberNo + ', \'' + data.className + '\')">승인</button>'
	                        + '<button onclick="deny(' + data.classNo + ', ' + data.memberNo + ', \'' + data.className + '\')">거절</button>';
	                  },
	                  orderable: false
	               }
	            ]
	         })
	      }
	   })
	}

</script>





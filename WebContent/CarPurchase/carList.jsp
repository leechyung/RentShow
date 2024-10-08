<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의하기</title>
<link href="../css/carinputdesign.css" rel="stylesheet" type="text/css">

</head>

<body>

<div id="wrap">
  <div id="top">
   <div class="topimg">
   <img src="../img/topimg.png" width="208" height="83" style="cursor:pointer" onClick="location.href='../login/loginByAdmin.jsp'">
   </div>
  </div>
  <div class="topnav">
 <div id="topmenu">
   <a>관리자모드입니다.</a>
 </div>
  </div>
  <div id="centerimg"></div>
  <div id="t1" align="center" ><a id="a2"> 차량 추가</a></div>
  <div id="center">
  
                    <table id="resultList" width="1100" border="1" cellspacing="0" cellpadding="0" >
                      <tr>
                        <th scope="col">아이디</th>
                        <th scope="col">이름</th>
                        <th scope="col">가격</th>
                        <th scope="col">메인 이미지</th>
                        <th scope="col">목록 이미지</th>
                        <th scope="col">세부 이미지</th>
                        <th scope="col">출산지</th>
                        <th scope="col">연료</th>
                        <th scope="col">사이즈</th>
                        <th scope="col">인원수</th>                      
                        <th scope="col">수정</th>
                        <th scope="col">삭제</th>
                        
                      </tr>
<%
   request.setCharacterEncoding("utf-8");
   String target = request.getParameter("keyField");
   String keyword = request.getParameter("keyword");
   
   Connection conn = ConnectionProvider.getConnection();
   List<Car> list = null;
   
   try {
      CarDao dao = new CarDao();
      list = dao.selectLike(conn, target, keyword);
   }catch(SQLException e) {}
   finally{
       JdbcUtil.close(conn);
    }
   if(list != null) {
%>

<c:forEach var="c" items="<%= list %>">
                      <tr>
                        <td> ${c.carId} </td>
                        <td> ${c.name} </td>
                        <td> ${c.price} </td>
                        <td> <a href="detail.jsp?cid=${c.carId}"><img src="/termproject/carimages/${c.mainimage}" width="50" height="70"> </a></td>
                        <td> <img src="/termproject/carimages/${c.catalogimage}" width="50" height="70"> </td>
                        <td> <img src="/termproject/carimages/${c.detailimage}" width="50" height="70"> </td>
                        <td> ${c.origin} </td>
                        <td> ${c.oil} </td>
                        <td> ${c.size} </td>
                        <td> ${c.person} </td>
                        <td><input type="button" id="managebtn1" value="수정" onclick="location.href='updateForm.jsp?cId=${c.carId}'"></td>
                        <td><input type="button" id="managebtn1" value="삭제" onclick="location.href='delete.jsp?cId=${c.carId}'"></td>
                      </tr>
</c:forEach>
         
         <tr>
          
            <td colspan="12">
            <a href="../CarJoin/carInput.html" id="black">[상품추가]</a>
      <form method="post">
         <select name="keyField">
            <option value="name">차이름</option>
         </select>
         <input type="text" name="keyword" >
         <input type="button" id="managebtn" value="검색" onclick="searchCheck(form)">
      </form>
            </td>
         </tr>
<%
   } 
%>
                    </table>
                    <br>             
                       
    </div>
<script type="text/javascript">

   function searchCheck(frm) {
      if (frm.keyword.value == "") {
         alert("검색어를 입력해주세요.");
         frm.keyword.focus();
         return;
      } else {
         frm.submit();
      }
   }

</script>
</div>
</body>
</html>
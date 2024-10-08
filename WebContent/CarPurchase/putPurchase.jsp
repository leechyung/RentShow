<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/registercomplete.css" rel="stylesheet" type="text/css">
</head>
<body>
 <%  request.setCharacterEncoding("utf-8");  %>
           
        <jsp:useBean id="cuser" class="my.model.Cuser"/>
        <jsp:setProperty property="*" name="cuser"/>
        
<%
   int cid = Integer.parseInt(request.getParameter("cid"));
   String name = request.getParameter("name");
   int phonenum = Integer.parseInt(request.getParameter("phonenum"));
   String address1 = request.getParameter("address1");
   String address2 = request.getParameter("address2");
   String address = address1+" "+address2;
   String startTime = request.getParameter("sdate");
   String endTime = request.getParameter("edate");
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
   
   Date sdate =formatter.parse(startTime);
   Date edate =formatter.parse(endTime);  
   
   long sec = (edate.getTime() - sdate.getTime()) / 1000;
   long days = sec / (24 * 60 * 60);
   cuser.setCuserId((String)session.getAttribute("LOGINID"));
   
   
   Connection conn = ConnectionProvider.getConnection();
   Car car = null;
   try {
      CarDao dao = new CarDao();
      PurchaseDao purdao = new PurchaseDao();
      car = dao.selectById(conn, cid);
      Purchase purchase = new Purchase((String)session.getAttribute("LOGINID"), name, phonenum, address, cid, (int)days * car.getPrice(), sdate, edate);
      purdao.insert(conn, purchase);
   }catch(SQLException e) {
      
   }finally {
      JdbcUtil.close(conn);
   }
%>
 <br>

<div class="wrap">
<div class="toplogo">
  <p><img src="../img/biglogo.png" width="568" height="186"style="cursor:pointer" onClick="location.href='main.jsp'"></p>
</div>
<div class="top"></div>
<div class="complete">
  <div class="welcome">
  <h1>제품을 구매 완료하였습니다.</h1>
  <p>&nbsp;</p>
   <h3>렌쇼를 이용해주셔서 감사합니다.</h3>
   <p>&nbsp;</p>
  </div>
  <div class="tomain" ><input type="button" id="tomainbtn" value="메인 화면으로" onClick="location.href='../login/loginmain.jsp'" style="cursor:pointer"></div>
</div>

<div class="footer"><img src="../img/footer.png" width="861" height="107"></div>

</div>

</body>
</html>
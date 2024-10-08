<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입</title>
<link href="../css/registercomplete.css" rel="stylesheet" type="text/css">

</head>

<body>
<div class="wrap">
<div class="toplogo">
  <p><img src="../img/biglogo.png" width="568" height="186"style="cursor:pointer" onClick="location.href='main.jsp'"></p>
</div>
<div class="top"></div>
<div class="complete">
  <div class="welcome">
  <h1>회원가입을 환영합니다!</h1>
  <p>&nbsp;</p>
   <h3>렌쇼와 함께 안전한 운행되세요!</h3>
   <p>&nbsp;</p>
  </div>
  <div class="tomain" ><input type="button" id="tomainbtn" value="메인 화면으로" onClick="location.href='main.jsp'" style="cursor:pointer" ></div>
</div>
<%   request.setCharacterEncoding("utf-8");  %>
<jsp:useBean id="user" class="my.model.Cuser"/>
<jsp:setProperty property="*" name="user"/>
<%
   Connection conn = ConnectionProvider.getConnection();
   try {
      CuserDao dao = new CuserDao();
      user.setLoginTime(new java.util.Date());
      dao.insert(conn, user);
   }catch(SQLException e){}
   finally{
       JdbcUtil.close(conn);
    }
%>
<div class="footer"><img src="../img/footer.png" width="861" height="107"></div>

</div>
</body>
</html>
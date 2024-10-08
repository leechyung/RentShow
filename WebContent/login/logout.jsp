<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의하기</title>
<link href="../qnadesign.css" rel="stylesheet" type="text/css">

</head>

<body>

     
<div class="rightcon">
     <img src="images/title2.jpg" width="464" height="58" alt="고객등록">
     <div class="tablestyle">
                
<%
	session.removeAttribute("LOGINNAME");
	session.removeAttribute("LOGINID");
	response.sendRedirect("/termproject/login/main.jsp");
%>
					
       </div>
</div>


</body>
</html>

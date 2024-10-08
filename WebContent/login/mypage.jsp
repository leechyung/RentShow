<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>무제 문서</title>
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
  <div id="top">
   <div class="topimg">
   <img src="../img/topimg.png" width="208" height="83">
   </div>
  </div>
  <div class="topnav">
 <div id="topmenu">
	<ul>
      <li><a href="../CarIntro/introduce.html">렌쇼 소개</a>
         <ul>
            <li><a href="../CarIntro/introduce.html">렌쇼란?</a></li>
				<li><a href="../CarIntro/accident.html">사고 처리</a></li>
				<li><a href="../CarIntro/qf.html">대여 자격 및 요금 안내</a></li>
         </ul>
      </li>
      <li><a href="../CarPurchase/catalog.jsp">차량검색</a>
         
      </li>
      <li><a href="#">고객센터</a>
         <ul>
            <li><a href="../cscenter/notice.jsp">공지사항</a></li>
            <li><a href="../cscenter/qna.jsp">QnA</a></li>
            <li><a href="../cscenter/faq.jsp">자주하는 질문</a></li>
         </ul>
      </li>
   </ul>
 </div>
  </div>
  <div id="center">
    <div id="centerimg"><img src="../img/centerimg.png" width="1920" height="213"></div>
    <div id="mycenter">
    <%  request.setCharacterEncoding("utf-8");  %>
        	
        <jsp:useBean id="cuser" class="my.model.Cuser"/>
        <jsp:setProperty property="*" name="cuser"/>
        	
        <% 	
        	String cuserId = request.getParameter("cuserId");
        	cuser.setCuserId((String)session.getAttribute("LOGINID"));
        	Connection conn = ConnectionProvider.getConnection();
        	Cuser user = null;
        	try {
        		CuserDao dao = new CuserDao();
        		user = dao.selectById(conn, cuserId);
        	}catch(SQLException e) {}
        	 finally{
        	        JdbcUtil.close(conn);
        	     }
        	if(user != null) {
        %>
      <div id="myinfo" >
      <c:set var="c" value="<%= user %>"/>
        <div id="infotitle">마이페이지</div>
        <table width="600" height="358" border="1" cellpadding="0" cellspacing="0" id="myinfotable">
  <tr>
    <th width="223" height="63" scope="row">이름</th>
    <td width="572">
      ${c.name}</td>
  </tr>
  <tr>
    <th scope="row">아이디</th>
    <td>${c.cuserId}</td>
  </tr>
  <tr>
    <th scope="row">패스워드</th>
    <td>${c.password}</td>
  </tr>
  <tr>
    <th scope="row">생년월일</th>
    <td>${c.year} - ${c.month} - ${c.day}</td>
  </tr>
  <tr>
    <th scope="row">휴대폰 번호</th>
    <td>0${c.phonenum}</td>
  </tr>
  <tr>
    <th scope="row">성별</th>
    <td>${c.sex}</td>
  </tr>
</table>
<%	} %>
<input type="button" id ="okbtn" value="홈으로 돌아가기" onclick="location.href='loginmain.jsp'">

    </div>
    </div>
  </div>

</div>
</body>
</html>

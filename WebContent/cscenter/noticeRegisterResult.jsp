<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>공지사항</title>
<link href="../css/csdesign.css" rel="stylesheet" type="text/css">
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
  <div id="center">
  <div id="side">
  <div id="sidebar">고객센터</div>
  <div id="sidemenu"><ul>
            	<li><a href="notice.jsp">공지사항</a></li>
                <li><a href="qna.jsp">QnA</a></li>
                <li><a href="faq.jsp">자주하는 질문</a></li>
  </ul>
  </div>
  </div>
  <div id="notice">
    <div id="noticetop">공지사항</div>
  <div id="noticemain">
  <div class="noticetext">
       <% 
   request.setCharacterEncoding("utf-8"); %>
 <jsp:useBean id="nboard" class="my.model.Nboard" />
 <jsp:setProperty property="*" name="nboard"/>
<%
	Connection conn = ConnectionProvider.getConnection();
	nboard.setNdate(new java.util.Date());
	nboard.setNuserId((String)session.getAttribute("LOGINNAME"));
	try{
		NboardDao dao = new NboardDao();
		dao.insert(conn, nboard);
	}catch(SQLException e){}
	finally{
		JdbcUtil.close(conn);
	}
%>
               		<h3>게시글 작성이 완료되었습니다.</h3><br><br>
               		<a href = "notice.jsp" id = "test">[공지사항 리스트]</a>

              
    </div></div>
    </div>

  
</div>
<div id="footerinresult"><img src="../img/footer.png" width="861" height="107"></div>

</div>
</body>
</html>

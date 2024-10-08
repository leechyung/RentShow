<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QnA</title>
<link href="../css/csdesign.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
  <div id="top">
   <div class="topimg">
   <img src="../img/topimg.png" width="208" height="83" style="cursor:pointer" onClick="location.href='../login/loginmain.jsp'">
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
				<li><a href="notice.jsp">공지사항</a></li>
                <li><a href="qna.jsp">QnA</a></li>
                <li><a href="faq.jsp">자주하는 질문</a></li>
			</ul>
		</li>
	</ul>
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
  <%
        Connection conn = ConnectionProvider.getConnection();
    	int bid = Integer.parseInt(request.getParameter("bid"));
    	Qboard qboard = null;
      	try{
      		QboardDao dao = new QboardDao();
      		qboard = dao.selectById(conn, bid);
      	}catch(SQLException e){}
      	finally{
      		JdbcUtil.close(conn);
      	}
      	if (qboard != null){
    %>
     <c:set var="b" value="<%= qboard %>"/>
  <div id="notice">
    <div id="noticetop">QnA</div>
  <div id="noticemain">
  <div class="noticeform">
   <form action="qnaModify.jsp" method="post" >
       <table width="680" border="0" cellpadding="0" cellspacing="0" id="noticeform">
       	<input type="hidden" name = "qboardId" value = "${b.qboardId }">
                      <tr>
                        <th width="54" height ="50px"><label for="titlefield">제 목</label></th>
                        <td width="626">
							${b.qtitle }</td>
                      </tr>
                      <tr>
                        <th height ="50px">
                        <label for="namefield">작성자</label></th>
                        <td>
                        ${b.quserId }</td>
                      </tr>
                      <tr>
                        <th><label for="memo">게시글</label></th>
                        <td height = "300px" valign = "top">
                        ${b.qcontent }</td>
                      </tr>
                      <tr>
                       
                      
	</table>
	<div align="center">
	  <input type="button" name="send" onclick="location.href='qnaModify.jsp?bid=${b.qboardId }'" id ="okbtn" value="게시글 수정" >
      <input type="button" value="리스트 보기" id ="okbtn" onclick="location.href='qna.jsp'">
      <input type="button" id="todeletebtn" value="삭제" onclick="location.href='qdelete.jsp?bid=${b.qboardId}'">
	</div>
	
</form>

              
    </div></div>
    </div>

  
</div>
<div id="footer"><img src="../img/footer.png" width="861" height="107"></div>
<%} %>
</div>
</body>
</html>

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
<% request.setCharacterEncoding("utf-8"); %>
 <jsp:useBean id="qboard" class="my.model.Qboard" />
 <jsp:setProperty property="*" name="qboard"/>
  <%
	String loginId = (String)session.getAttribute("LOGINID");
	if(!qboard.getQuserId().equals(loginId)){
%>
	<script type="text/javascript">
		alert("게시글 작성자만 수정할수있습니다.");
		history.go(-1);
	</script>	
	
	<%
	}else {
	Connection conn = ConnectionProvider.getConnection();
	qboard.setQdate(new java.util.Date());
	qboard.setQuserId((String)session.getAttribute("LOGINID"));
	try{
		QboardDao dao = new QboardDao();
		dao.update(conn, qboard);
	}catch(SQLException e){}
	finally{
		JdbcUtil.close(conn);
	}
	}
%>
  <div id="notice">
    <div id="noticetop">QnA</div>
  <div id="noticemain">
  <div class="noticetext">
  <h3>게시글 수정이 완료되었습니다.</h3><br><br>
               		<a href = "qna.jsp" id = "test">[게시글 리스트]</a>
         
    </div></div>
    </div>

  
</div>
<div id="footer"><img src="../img/footer.png" width="861" height="107"></div>

</div>
</body>
</html>

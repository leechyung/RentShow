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
                
  </ul></div>
  </div>
  <div id="notice"><div id="noticetop">공지사항</div>
  <div id="noticemain">
  <div class="rightcon">
      <table width="900" >
  <tr>
    <th width="68" height="43" scope="col">No</th>
    <th width="453" scope="col">제목</th>
    <th width="78" scope="col">작성자</th>
    <th width="81" scope="col">작성일</th>
  </tr>
  <%
  	Connection conn = ConnectionProvider.getConnection();
  	List<Nboard> list = null;
  	try{
  		NboardDao dao = new NboardDao();
  		list = dao.selectList(conn);
  		
  	}catch(SQLException e){}
  	finally{
  		JdbcUtil.close(conn);
  	}
  	if(list != null){
 %>
  	<c:forEach var = "n" items="<%= list %>">
  <tr>
    <td height="65">${n.nboardId }</td>
    <td><a href = "noticeConfig.jsp?nid=${n.nboardId }" id = "qnatitle"> ${n.ntitle}</a></td>
    <td>${n.nuserId }</td>
    <td>${n.ndate }</td>
  </tr>
   </c:forEach>
<%} %>	
</table>
<div align="center">
<input type="button" id="todeletebtn" value="관리" onclick="location.href='noticeManage.jsp'">

</div>


              
    </div></div>
    </div>

  
</div>
<div id="footer"><img src="../img/footer.png" width="861" height="107"></div>

</div>
</body>
</html>

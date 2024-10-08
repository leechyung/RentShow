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
  <%
        Connection conn = ConnectionProvider.getConnection();
    	int nid = Integer.parseInt(request.getParameter("nid"));
    	Nboard nboard = null;
      	try{
      		NboardDao dao = new NboardDao();
      		nboard = dao.selectById(conn, nid);
      	}catch(SQLException e){}
      	finally{
      		JdbcUtil.close(conn);
      	}
      	if (nboard != null){
    %>
     <c:set var="n" value="<%= nboard %>"/>
  <div id="notice">
    <div id="noticetop">QnA</div>
  <div id="noticemain">
  <div class="noticeform">
   <form action="qnaModify.jsp" method="post" >
       <table width="680" border="0" cellpadding="0" cellspacing="0" id="noticeform">
       	<input type="hidden" name = "nboardId" value = "${n.nboardId }">
                      <tr>
                        <th width="54" height = "50px"><label for="titlefield">제 목</label></th>
                        <td width="626">
                        ${n.ntitle }</td>
                      </tr>
                      <tr>
                        <th height="50px"><label for="namefield">작성자</label></th>
                        <td>
                        ${n.nuserId }</td>
                      </tr>
                      <tr>
                        <th><label for="content">내용</label></th>
                        <td height = "300px" valign = "top">
                        ${n.ncontent }</td>
                      </tr>
                      <tr>
                       
                      </tr>
                      <tr>
                       <td height="30" colspan="2" align="center" class="btnstyle">
                        <input type="button" name="send" id="okbtn" value="공지사항 수정" onclick="location.href='noticeModify.jsp?nid=${n.nboardId }'">
                        <input type="button" value="리스트 보기" onclick="location.href='notice.jsp'"  id="okbtn">
                        </td>
                      </tr>
	</table>
</form>

              
    </div></div>
    </div>

  
</div>
<div id="footer"><img src="../img/footer.png" width="861" height="107"></div>
<%} %>
</div>
</body>
</html>

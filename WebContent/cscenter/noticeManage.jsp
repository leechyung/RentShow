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
     <th width="81" scope="col">삭제</th>
  </tr>
<%
	
  	String loginId = (String)session.getAttribute("LOGINID");

	if (loginId == null) {  	
		loginId = "";
	}
	
  	Connection conn = ConnectionProvider.getConnection();
  	List<Nboard> list = null;
  	try{
  		NboardDao dao = new NboardDao();
  		list = dao.selectList(conn);
  	}catch(SQLException e){}
  	finally{
  		JdbcUtil.close(conn);
  	}
  	if(loginId.equals("")){ 
%>
  		<script type ="text/javascript">
		alert("관리자만 접근가능합니다.")
		history.go(-1);
		</script>
<%
  	} else if (!loginId.equals("admin")){
%>
  	<script type ="text/javascript">
	alert("관리자만 접근가능합니다.")
	history.go(-1);
	</script>
<%
  	}
  	if(list != null){
%>
  	<c:forEach var = "n" items="<%= list %>">
  <tr>
    <td align="center" height="65">${n.nboardId }</td>
    <td align="center"><a href = "noticeMConfig.jsp?nid=${n.nboardId }" id = "qnatitle"> ${n.ntitle}</a></td>
    <td align="center">${n.nuserId }</td>
    <td>${n.ndate }</td>
    <td><input type="button" value="삭제" id="deletebtn" onclick = "location.href ='ndelete.jsp?n	id=${n.nboardId}'"></td>
  </tr>
   </c:forEach>
<%} %>	
</table>
<div align="center">
<input type="button" id="okbtn" value="공지사항 작성" onclick="location.href='noticeRegister.html'">
</div>

              
    </div></div>
    </div>

  
</div>
<div id="footer"><img src="../img/footer.png" width="861" height="107"></div>

</div>
</body>
</html>

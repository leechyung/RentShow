<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>RentShow</title>
<link href="../css/logindesign.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
  <div id="top">
    <div class="topimg">
    <img src="../img/topimg.png" width="208" height="83" style="cursor:pointer" onClick="location.href='loginmain.jsp'">
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
  <div id="mid">
    <div class="section">
   <input type="radio" name="slide" id="slide01" checked="">
   <input type="radio" name="slide" id="slide02">
   <input type="radio" name="slide" id="slide03">
   <div class="slidewrap">
      
      <ul class="slidelist">     
         <li class="slideitem">
           <a>
              <img src="../img/mainbanner1.png" >
           </a>
         </li>
        <li class="slideitem">
          <a>
             <img src="../img/mainbanner2.png">
          </a>
        </li>
        <li class="slideitem">
          <a>
              <img src="../img/mainbanner3.png">
          </a>
        </li>

        
         <div class="slide-control">
            <div>
               <label for="slide03" class="left"></label>
               <label for="slide02" class="right" style="cursor:none"></label>
            </div>
            <div>
               <label for="slide01" class="left"></label>
               <label for="slide03" class="right" style="cursor:none"></label>
            </div>
            <div>
               <label for="slide02" class="left"></label>
               <label for="slide01" class="right" style="cursor:none"></label>
            </div>
         </div>

      </ul>
     
      <ul class="slide-pagelist">
         <li><label for="slide01"></label></li>
         <li><label for="slide02"></label></li>
         <li><label for="slide03"></label></li>
      </ul>
   </div>
  </div>
  <div class="mid2">
     <div class="submid1"> 
    공지사항
          <div class="submid4"> 
           <table width="525px" height="180px">
  <tr >
    <th width="10%" height="10px" scope="col">No</th>
    <th width="70%" height="10px" scope="col">제목</th>
     <th width="20%" scope="col">작성자</th>
  </tr>
  <%
     Connection conn = ConnectionProvider.getConnection();
     List<Nboard> list = null;
     try{
        NboardDao dao = new NboardDao();
        list = dao.selectListLimit(conn);
        
     }catch(SQLException e){}
     finally{
        JdbcUtil.close(conn);
     }
     if(list != null){
 %>
     <c:forEach var = "n" items="<%= list %>">
  <tr>
    <td height="20">${n.nboardId }</td>
    <td><a href = "../cscenter/noticeConfig.jsp?nid=${n.nboardId }" id = "qnatitle"> ${n.ntitle}</a></td>
    <td>${n.nuserId }</td>
  </tr>
   </c:forEach>
<%} %>   
</table>
<div align="right" id="more"><a href="../cscenter/notice.jsp" id="qnatitle" >더보기..</a></div>
         </div>
    </div>
    <div class="submid2">
        로그인
        <div class="submid5">
        <form method="post" action="login.jsp" >
          <p>아이디
            <input type="text" name="cuserId" id="idfield">
          </p>
            <p>
              <input type="submit" name="loginbutton" id="loginbutton" value="로그인" style="cursor:pointer">
            </p>
          <p> 비밀번호
            <input type="password" name="password" id="pwfield">
          </p>
          <p>&nbsp;</p>
          <div class="registerlink"  id="lll" style="cursor:pointer" onClick="location.href='register.html'">회원가입</div>
        </form>
        </div>
    </div>
    <div class="submid3">
    	고객센터
        <div class="submid4"> 
        <div class="callcenter">
			 <img src="../img/callcenter.png">
		</div>
        </div>
          
    </div>
  
  </div>
  <div class="bottom">
    <div class="bimg"><img src="../img/footer.png" width="861" height="107"></div>
  
  </div>
  
  </div>
  
  
</div>


</body>
</html>

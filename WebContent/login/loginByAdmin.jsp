<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>RentShow</title>
<link href="../css/loginmain.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
  <div id="top">
    <div class="topimg"><img src="../img/topimg.png" width="208" height="83" style="cursor:pointer" onClick="location.href='loginByAdmin.jsp'"></div>
  </div>
  <div class="topnav">
  <div id="topmenu">
   <a>관리자모드입니다.</a>
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
               <label for="slide02" class="right"></label>
            </div>
            <div>
               <label for="slide01" class="left"></label>
               <label for="slide03" class="right"></label>
            </div>
            <div>
               <label for="slide02" class="left"></label>
               <label for="slide01" class="right"></label>
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
    공지사항 추가/수정
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
<div align="right"><a href="../cscenter/notice.jsp" id="qnatitle" >더보기..</a></div>
         </div>
    </div>
    <div class="submid2">마이페이지
      <div class="submid5">
      
         <div class="loginid"><%= (String)session.getAttribute("LOGINID") %>님이 로그인 했습니다.</div>
        
        <div class="carinputbtn" style="cursor:pointer" onClick="location.href='../CarPurchase/carList.jsp'">차량 리스트</div>
          <div class="logoutadmin" style="cursor:pointer" onClick="location.href='main.jsp'">로그아웃</div>         
        <p>&nbsp;</p>
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

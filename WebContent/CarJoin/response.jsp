<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의하기</title>
<link href="../css/qnadesign.css" rel="stylesheet" type="text/css">

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

  
  </div>
<%
	String location = "C:\\Dong\\ws\\termproject\\WebContent\\carimages";
	int maxSize = 1024 * 1024 * 5;
   MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", 
                                    new DefaultFileRenamePolicy());
   String namefield = multi.getParameter("namefield"); 
   int price = Integer.parseInt(multi.getParameter("pricefield"));
   String origin = multi.getParameter("origin");
   String oil = multi.getParameter("oil");
   String size = multi.getParameter("size");
   String mfilefield = multi.getFilesystemName("mfilefield");
   String cfilefield = multi.getFilesystemName("cfilefield");
   String dfilefield = multi.getFilesystemName("dfilefield");
   int person = Integer.parseInt(multi.getParameter("person"));
   
   Connection conn = ConnectionProvider.getConnection();
   
   Car car = new Car(namefield, price, mfilefield, cfilefield, dfilefield, origin, oil, size, person);
   
   
   try {
      CarDao dao = new CarDao(); 
      dao.insert(conn, car);
   }catch(SQLException e){}
   finally{
       JdbcUtil.close(conn);
    }
%>
       <div id="carinputbanner">
    <div id="noticetop">차량추가</div>
  <div id="noticemain">
  <div class="noticement">
  <h3>차량추가가 완료되었습니다.</h3><br><br>
                     <a href = "../CarPurchase/carList.jsp" id = "test">[차량리스트 보기]</a> <br><br>
 					<a href = "../CarJoin/carInput.html" id = "test">[차량리스트 추가]</a>
             
    </div></div>
    </div>

  
</div>

</div>


</body>
</html>
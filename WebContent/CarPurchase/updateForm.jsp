<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의하기</title>
<link href="../css/carinputdesign.css" rel="stylesheet" type="text/css">

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
  <div id="t1" align="center" ><a id="a2"> 차량 추가</a></div>
    
                <div id="center">
                <div class="tablestyle">
        <%
        	int cid = Integer.parseInt(request.getParameter("cId"));
        	Connection conn = ConnectionProvider.getConnection();
        	Car car = null;
        	try {
        		CarDao dao = new CarDao();
        		car = dao.selectById(conn, cid);
        	}catch(SQLException e){}
        	finally { 
        		JdbcUtil.close(conn); 
        		}
        	if (car != null) {
        %>
        <c:set var="c" value="<%= car %>"/>
                  <form action="update.jsp" method="post" enctype="multipart/form-data" name="form1">
                  <input type="hidden" name="cid" value="${c.carId}">
                    <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                      <tr>
                        <th><label for="namefield"> 이 름</label></th>
                        <td>
                        <input name="namefield" type="text" value="${c.name}" size="70"></td>
                      </tr>
                      <tr>
                        <th><label for="pricefield"> 가 격</label></th>
                        <td>
                        <input name="pricefield" type="text" value="${c.price}"></td>
                      </tr>
                      <tr>
                        <th><label for="origin"> 출산지</label></th>
                        <td>
                        <input name="origin" type="text" value="${c.origin}"></td>
                      </tr>
                      <tr>
                        <th><label for="oil"> 연 료</label></th>
                        <td>
                           <label>
                          <input type="radio" name="oil" value="LPG" id="name_0" />
                          LPG</label>
                        
                        <label>
                          <input type="radio" name="oil" value="가솔린" id="name_1" />
                          가솔린</label>
                        
                        <label>
                          <input type="radio" name="oil" value="전기" id="name_2" />
                          전기</label>
                          
                         <label>
                          <input type="radio" name="oil" value="디젤" id="name_3" />
                          디젤</label>
                          </td>
                      </tr>
                      <tr>
                          <th height="275" scope="row"> 사 이 즈</th>
                      <td><p>
                        <label>
                          <input type="radio" name="size" value="경차" id="name_0" />
                          경차</label>
                        
                        <label>
                          <input type="radio" name="size" value="소형" id="name_1" />
                          소형</label>
                        
                        <label>
                          <input type="radio" name="size" value="준중형" id="name_2" />
                          준중형</label>
                        <br />
                        <label>
                          <input type="radio" name="size" value="중형" id="name_3" />
                          중형</label>
                        
                        <label>
                          <input type="radio" name="size" value="대형" id="name_4" />
                          대형</label>
                        
                        <label>
                          <input type="radio" name="size" value="RV/SUV" id="name_5" />
                          RV/SUV</label>
                        
                      </p></td>
                    </tr>
                      <tr>
                        <th><label for="person"> 인 원 수</label></th>
                        <td><select name="person" id="person">                  
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                  </select></td>
                      </tr>
                      <tr>
                        <th><label for="filefield"> 메 인 사 진</label></th>
                        <td>
                        <input type="file" name="mfilefield" value="${c.mainimage}"></td>
                      </tr>
                      <tr>
                        <th><label for="filefield"> 목 록 사 진</label></th>
                        <td>
                        <input type="file" name="cfilefield" value="${c.catalogimage}"></td>
                      </tr>
                      <tr>
                        <th><label for="filefield"> 세 부 사 진</label></th>
                        <td>
                        <input type="file" name="dfilefield" value="${c.detailimage}"></td>
                      </tr>
                      <tr>
                        <td height="30" colspan="2" align="center" class="btnstyle">
                        <input type="submit" name="ok" id="managebtn1" value="확인"> 
                        <input type="submit" name="cancle" id="managebtn1" value="취소"></td>
                      </tr>
                    </table>
                  </form>
                   </div>
         <%
        	}
         %>
                </div>
         </div>
    


</body>
</html>

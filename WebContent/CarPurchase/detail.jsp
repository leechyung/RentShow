<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>detail</title>
<link href="../css/detail.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="wrap">
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
     
     	<%  request.setCharacterEncoding("utf-8");  %>
        	
        <jsp:useBean id="cuser" class="my.model.Cuser"/>
        <jsp:setProperty property="*" name="cuser"/>
        	
        <% 	
        	
        	int cid = Integer.parseInt(request.getParameter("cid"));
        	cuser.setCuserId((String)session.getAttribute("LOGINID"));
        	Connection conn = ConnectionProvider.getConnection();
        	Car car = null;
        	try {
        		CarDao dao = new CarDao();
        		car = dao.selectById(conn, cid);
        	}catch(SQLException e) {}
        	 finally{
        	        JdbcUtil.close(conn);
        	     }
        	if(car != null) {
        %>
        
        
    <c:set var="c" value="<%= car %>"/>

  	<div id="centerimg">
    </div>
    <div class="detailcenter">
      <div class="centertop">
         상세정보
      </div>
      <div class="carinfo">
        <div class="carimg">
        	<div id="dimg">
           		<img src="/termproject/carimages/${c.detailimage}" width="578" height="669">
           </div>
        </div>
        <div class="caroption">
            <div class="carname">
                ${c.name}
             </div>
             <div class="carcompany">
               회사
              <div class="carcompany1">
                   ${c.origin}
                </div>
            </div>
             <div class="carsize">
               차종
                  <div class="carsize1">
                     ${c.size}
              </div>
            </div>
             <div class="caroil">
               연료
              <div class="caroil1">
                     ${c.oil}
              </div>
            </div>
             <div class="carpeople">
               인원
                  <div class="carpeople1">
                     ${c.person}인승
                  </div>
            </div>
           
        </div>
        <div class="carprice">
           <p> 1일 ${c.price}원 </p>
        </div>
	<%} %> 
			  

			        <div class="purchase">
			           <input name="purchaseButton" type="button" value="대여하기" onClick="location.href='rentpage.jsp?cid=${c.carId}'">
		
			        </div>

	        <div class="rentcondition">
	          <div class="renttop">대여 조건</div>
	          <div class="rentimg">
	          </div>
	         </div> 
        
        <div class="detailimg">
        
          <div class="detailimgtop">
        		차량 이미지  
             
          </div>
          <div class="detailcarimg">
          <div id = "mimg">
          	<img src="/termproject/carimages/${c.mainimage}" width="980" height="654" style="margin-left: 110" >
          </div>
          </div>
         </div>       
      </div>
   
     
    </div>
    <div class="footer">
    </div>

    </div>
    
<script type="text/javascript">
	function putPurchase(frm){
		var name = frm.name.value.trim();
		var phonenum = frm.phonenum.value.trim();
		var address = frm.address.value.trim();
		var cid = frm.cid.value.trim();
		var sdate = frm.sdate.value.trim();
		var edate = frm.edate.value.trim();
		//location.href='purchase.jsp?bookId='+id+'&amount='+amount;
		window.open("/termproject/CarPurchase/putPurchase.jsp?cid="+cid+"&name="+name+"&phonenum="+phonenum+"&address="+address+"&sdate="+sdate+"&edate="+edate,"","width=500, height=300");	
	}
	
</script>


</body>
</html>
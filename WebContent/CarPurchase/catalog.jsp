<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>차량 검색</title>
<link href="../css/searchcar.css" rel="stylesheet" type="text/css">
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
            <li><a href="../cscenter/notice.jsp">공지사항</a></li>
                <li><a href="../cscenter/qna.jsp">QnA</a></li>
                <li><a href="../cscenter/faq.jsp">자주하는 질문</a></li>
         </ul>
      </li>
   </ul>
 </div>
  </div>
  <div id="centerimg"></div>
  <div id="center">
  <div id="notice">
    <div id="noticetop">
      <div class="searchcartop">
         <span style="color:#2080FF">RentShow</span> 렌터카 검색
      </div>
    </div>
    <div class="information">
      <div class="searchbar">
      <form method="post">
      	 <input type="text" name="keyword" id="titlefield">
         <input type="hidden" name="keyField" value="name" >
         <input type="button" value="검색" onclick="searchCheck(form)" class="searchbtn" style="cursor:pointer" >
       </form>
         
         
         </div>
          
         <div class="carlist">
<%

			request.setCharacterEncoding("utf-8");
			String target = request.getParameter("keyField");
			String keyword = request.getParameter("keyword");
			
			String pageNumberStr = request.getParameter("page");
			int pageNumber = 1;
			if (pageNumberStr != null) {
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			Connection conn = ConnectionProvider.getConnection();
			List <Car> list = null;
			CarListView clv = null;
			 //List<Picture> list = null;	
			try {
				CarDao dao = new CarDao();
				//PictureDao dao = new PictureDao();
				list = dao.selectList(conn);				
				clv = dao.getCarList(conn, pageNumber);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			 
			if(list != null  && clv != null && target == null) {
%>			
			<c:set var = "clv" value ="<%= clv %>"/>                 
			<c:forEach var = "c" items = "${clv.carList}">
			
			
		    <div class="box">
		        <div class="img">
		        	
		            <img src="../carimages/${c.catalogimage}" alt="Hover Effect">
		           	
		          <div class="carname">${c.name}</div>
		             <div class="options">
		                <div class="option">${c.size}&nbsp;${c.origin}&nbsp;${c.oil}</div>
		             </div>
		        </div>
		        <div class="info"  onClick="location.href='detail.jsp?cid=${c.carId}'">
		          <h3>${c.name}</h3>
		            <div class="caroptions">
		            ${c.price}원/일
		            </div>
		            
		            <p>${c.person}인승</p>
		        </div>
		    </div>
</c:forEach>
					
<%			} else if(keyword != null) {	
			try {
				CarDao dao = new CarDao();
				//PictureDao dao = new PictureDao();
				list = dao.selectLike(conn, target, keyword);			
				clv = dao.getCarList(conn, pageNumber);
			}catch(SQLException e) {
				e.printStackTrace();
			}     finally{
		        JdbcUtil.close(conn);
			}
		        
%>
	<c:forEach var = "c" items = "<%=list%>">
	
	
    <div class="box">
        <div class="img">
        	
            <img src="../carimages/${c.catalogimage}" alt="Hover Effect">
           	
          <div class="carname">${c.name}</div>
             <div class="options">
                <div class="option">${c.size}&nbsp;${c.origin}&nbsp;${c.oil}</div>
             </div>
        </div>
        <div class="info"  onClick="location.href='detail.jsp?cid=${c.carId}'">
          <h3>${c.name}</h3>
            <div class="caroptions">
            ${c.price}
            </div>
            
            <p>${c.price}</p>
        </div>
    </div>
</c:forEach>
			<% } %>
        </div>        
      
    </div>    
  </div>

  
</div>
<div class="numbering">
                        <c:forEach var = "i" begin = "1" end ="${clv.pageTotalCount}">
                           <a href="catalog.jsp?page=${i}">[${i}]</a>
                        </c:forEach>
                  	</div>
<div id="footer"><img src="../img/footer.png" width="861" height="107"></div>

<script type="text/javascript">

   function searchCheck(frm) {
      if (frm.keyword.value == "") {
         alert("검색어를 입력해주세요.");
         frm.keyword.focus();
         return;
      } else {
         frm.submit();
      }
   }

</script>
</div>
</body>
</html>
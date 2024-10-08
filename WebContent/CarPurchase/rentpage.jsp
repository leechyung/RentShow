<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>대여하기</title>
<link href="../css/rentpage.css" rel="stylesheet" type="text/css">
</head>

<body>
		<%  request.setCharacterEncoding("utf-8");  %>
           
        <jsp:useBean id="cuser" class="my.model.Cuser"/>
        <jsp:setProperty property="*" name="cuser"/>
           
    	    
        <% 	    
        cuser.setCuserId((String)session.getAttribute("LOGINID"));
        Connection conn = ConnectionProvider.getConnection();       
	      String loginId = (String)session.getAttribute("LOGINID");
	      if(cuser.getCuserId()== null){
	   %>
	      <script type="text/javascript">
	         alert("로그인해야 구매 가능합니다.");
	         history.go(-1);
	      </script>   
	      
	   <% } %>
	   
	   <%
        int cid = Integer.parseInt(request.getParameter("cid"));
        cuser.setCuserId((String)session.getAttribute("LOGINID"));
      
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
            <li><a href="../cscenter/notice.jsp">공지사항</a></li>
                <li><a href="../cscenter/qna.jsp">QnA</a></li>
                <li><a href="../cscenter/faq.jsp">자주하는 질문</a></li>
         </ul>
      </li>
   </ul>
 </div>
  </div>
		  
                <img name="centerimg" src="../img/centerimg.png">
      <c:set var="c" value="<%= car %>"/>
      
          <div class="side">
               <div class="sidemenu">
                 <div class="sidemenu1">
                    차량대여
                </div>
                    <div class="sidemenu2">
                   차량대여
                </div>
                
             </div>
         </div>        
        <div class="center">
             <div class="renttop">
                대여하기
             </div>
            <form name="frm" method="post">
            <input type="hidden" name="cid" value="${c.carId}">
	<input type="hidden" name="image" value="${c.detailimage}">   
             <div class="rentinfo">
                  <div class="name">
                       <div class="name2">
                        이름
                     </div>
                       <div class="name1">
                        <input type="text" name="name" value="">
                       </div>
                  </div>
                  <div class="name">
                       <div class="name2">
                        전화번호
                     </div>
                       <div class="name1">
                         <input type="tel" name="phonenum" value="">
                       </div>
                  </div>
               <div class="name">
                       <div class="name2">
                        차이름
                     </div>
                       <div class="name1">
                         <p>${c.name}</p>
                       </div>
                  </div>
                <div class="name">
                       <div class="name2">
                        가격
                     </div>
                       <div class="name1">
                         <p>${c.price}원 / 일</p>
                       </div>
                  </div>
                <div class="name">
                       <div class="name2">
                        제조사
                     </div>
                       <div class="name1">
                         <p>${c.origin}</p>				  
                       </div>
                  </div>
                <div class="name">
                       <div class="name2">
                        연료
                     </div>
                       <div class="name1">
                         <p>${c.oil}</p>
				    	
                       </div>
                  </div>
                <div class="name">
                       <div class="name2">
                        사이즈
                     </div>
                       <div class="name1">
                         <p>${c.size}</p>
				    	
                       </div>
                  </div>
                <div class="name">
                       <div class="name2">
                        인원수
                     </div>
                       <div class="name1">
                         <p>${c.person}</p>
				    	
                       </div>
                  </div>
                <div class="name">
                       <div class="name2">
                        대여일자
                     </div>
                       <div class="name1">
                         <input type="date" name="sdate">
                       </div>
                  </div>
                <div class="name">
                       <div class="name2">
                        반납일자
                     </div>
                       <div class="name1">
                        <input type="date" name="edate">
                       </div>
                  </div>
                   <div class="name">
                       <div class="name2">
                        받을주소
                     </div>
                       <div class="addressinput" >
  						<input id="member_addr" name="address1" type="text" placeholder="주소" readonly>
  						<input type="text" name="address2" placeholder="상세주소">
  						<input id="addrbtn"  type="button" value="주소검색" readonly onclick="findAddr()">
                       </div>
                  </div>
            </div>
            

            <div class="bottom">
              <div class="bottomleft">
               <input type="button" name="purchase"  onclick="putPurchase(form)" value="대여하기">
            </div>
              <div class="bottomright">
               <input name="cancel" type="button" onclick="location.href='catalog.jsp'" value="취소">
            </div>
          </div> 
          </form>                          
        </div>
      <div class="footer">
             <input name="" type="image" src="../img/footer.png">
          </div>  
               <%	} %>   		
            
   </div>
   <script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function putPurchase(frm){
		var name = frm.name.value.trim();
		var phonenum = frm.phonenum.value.trim();
		var address1 = frm.address1.value.trim();
		var address2 = frm.address2.value.trim();
		var cid = frm.cid.value.trim();
		var sdate = frm.sdate.value.trim();
		var edate = frm.edate.value.trim();
		//location.href='purchase.jsp?bookId='+id+'&amount='+amount;
		
		location.href = "/termproject/CarPurchase/putPurchase.jsp?cid="+cid+"&name="+name+"&phonenum="+phonenum+"&address1="+address1+"&address2="+address2+"&sdate="+sdate+"&edate="+edate,"","width=1920, height=1080";
	}
</script> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>자주하는 질문</title>
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
  <div id="notice"><div id="noticetop">자주하는 질문</div>

  <div id="noticemain">
   <div id="faqmain"">
   <details>
   <summary id = "summary">개인으로도 이용이 가능한가요?</summary>
   <p id = "par">네, 개인명의로도 장기렌터카를 계약 하실 수 있습니다. <br>
	계약자가 명의가 법인(사업자)이냐 개인이냐에 따라 법인 장기렌터카와 개인 장기렌터카로 구분 됩니다. <br>
	가장 큰 차이점은 인수가능여부 및 정비 옵션 선택 여부입니다. <br>
	* 법인장기렌터카: 차량인수불가, 정비 포함 상품 <br>
	* 개인장기렌터카: 차량인수가능, 정비 옵션 선택 가능</p>
</details>
   </div>
   
   <div id="faqmain">
   <details>
   <summary id = "summary">개인장기렌터카의 보험조건은 어떻게 되나요?</summary>
   <p id = "par">대인: 무한 / 대물: 1억원 / 자기신체: 최고1억원 / 무보험상해: 2억원 / <br>
긴급출동서비스 / 자기차량손해면책 자기부담금: 국산차30만원,수입차50만원. </p>
</details>
   </div>
   
     <div id="faqmain">
   <details>
   <summary id = "summary">현금영수증발급이 가능한가요?</summary>
   <p id = "par">렌터카는 현금영수증 발행 불가 업종입니다. <br>
	단,개인사업자와 법인계약에 한해 세금계산서 발행을 합니다. </p>
</details>
   </div>
   
   <div id="faqmain">
   <details>
   <summary id = "summary">장기렌터카를 이용할 수 있는 차종 및 이용조건은 어떻게 되나요?</summary>
   <p id = "par">15인승 이하 승용 및 승합차라면 국산차나 수입차에 관계없이 가능 합니다. <br>
또한 고객님이 원하는 차종, 옵션, 색상을 직접 선택하여 장기렌터카로 이용하실 수 있습니다.<br>
장기렌터카는 만 21세 이상으로 운전면허 취득자이면 누구나 이용 가능하며 <br>
계약자의 직계가족도 추가 보험료 없이 운전하실 수 있습니다.<br>
보험조건을 만 26세 이상으로 계약하실 경우 월 렌트비를 할인 받으실 수 있습니다. </p>
</details>
   </div>
   
   <div id="faqmain">
   <details>
   <summary id = "summary">사고 시 비용처리는 어떻게 되나요?</summary>
   <p id = "par">자차사고를 제외한 사고는 보험으로 처리됩니다.<br>
본인 과실 사고 시 자기차량 수리가 필요한 경우 차량손해면책제도(CDW)에 따라 <br>
일정금액의 자기부담금(면책금)만 납부하고 수리 하실 수 있습니다. <br>
수리비용이 자기부담금(면책금)보다 적을 경우 실비용으로 직접 처리도 가능합니다. </p>
</details>
   </div>
   
   
  </div>
    </div>

  
</div>
<div id="footerinresult"><img src="../img/footer.png" width="861" height="107"></div>

</div>
</body>
</html>

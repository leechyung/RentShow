<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String uid = request.getParameter("uid");
	
	int rst = 0;
	
	try {
		Connection conn = ConnectionProvider.getConnection();
		CuserDao dao = new CuserDao();
		rst = dao.idCheck(conn, uid);		
	} catch (SQLException e) {}
	if (rst == 1) {
		out.print("입력한 아이디는 이미 존재합니다.");
	} else {
		out.print("입력한 아이디는 사용할 수 있습니다.");
	}
%>
</body>
</html>
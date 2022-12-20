<%@page import="java.util.ArrayList"%>
<%@page import="bean.khachhangbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("uft-8");
				//loaibo loai = new loaibo();
				ArrayList<khachhangbean> kh = (ArrayList<khachhangbean>)request.getAttribute("dsthongtin");
					for(khachhangbean tt: kh){%>
						 <h><%=tt.getTenkh() %></h>
					<%} %>

</body>
</html>
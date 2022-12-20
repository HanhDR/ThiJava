<%@page import="bean.xacnhanadminbean"%>
<%@page import="bean.dangnhapadminbean"%>
<%@page import="bean.khachhangbean"%>

<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  	.login-item {
			position: relative;
		}
		
		.login-item:hover .sub-login{
			display: block;
		}
			.sub-login {
			position: absolute;
			z-index: 10;
			background-color: #fff;
			width: 200px;
			top: 40px;
			left: -20px;
			box-shadow: 1px 4px 10px rgba(0, 0, 0, 0.09);
			border-radius: 6px;
			list-style: none;
			padding-left: 0;
			display: none;
		}
		.sub-login-item {
			cursor: pointer;
		}
		.sub-login-item:hover {
			background-color: rgba(0, 0, 0, 0.09);
		}
		
		.link-sub-login-item {
			color: black;
			display: block;
			padding: 12px 20px;
		}
		
		.link-sub-login-item:hover {
			text-decoration: none;
			color: #1d4bbf;
		}
  	</style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="admin">ShopPoor</a></li>
      
      <li><a href="quanlyloaiadmin">Quản Lý Loại</a></li>
      <li><a href="quanlysanphamadmin">Quản lý Sản Phẩm</a></li>
      <li><a href="xacnhanadmin">Xác Nhận</a></li>
      <li><a href="danhsachchuyentien">Danh Sách Chuyển Tiền</a></li>
    </ul>
      <%
    dangnhapadminbean ad = (dangnhapadminbean)session.getAttribute("admin");
    %>
    <ul class="nav navbar-nav navbar-right">
		 
			      <li class="login-item">
			      <% if (session.getAttribute("admin") == null){ %>
			    	 <a href="dangnhapadmin"><span class="glyphicon glyphicon-user"></span>Log In</a>
			      <%}else{ %>
			    	 <a href="#"><span class="glyphicon glyphicon-user">
			    	 	<%=ad.getTendn() %>
			    	 	</span>
			    	 </a>
			    	 <ul class="sub-login">			
					      <li class="sub-login-item"><a class="link-sub-login-item" href="admin?dx=true"">LogOut</a></li>
			     	 </ul>
			      <%} %>
			      
			      </li>
		    </ul>
  </div>
</nav>
  
<table class="table table-hover" >
<tr style="background-color: darkgray">
<th>Tên Khách Hàng</th>
<th>Tên Sản Phẩm</th>
<th>Số Lượng</th>
<th>Giá</th>
<th>Thành Tiền</th>
<th>Xác Nhận</th>
</tr>
   <%ArrayList<xacnhanadminbean> ds=(ArrayList<xacnhanadminbean>)request.getAttribute("ds");
     for(xacnhanadminbean xn: ds){
   %>
       <tr>
        <td>  <%=xn.getTenkh() %> </td>
        <td>  <%=xn.getTensp()%> </td>
        <td>  <%=xn.getSoluong() %> </td>
        <td>  <%=xn.getGia() %> </td>
        <td>  <%=xn.getThanhTien()%> </td>
        <td>  
        <a href="xacnhanchuyentienadmin?mct=<%=xn.getMactbh()%>">
           Xác nhận
        </a> </td>
        </tr>
     <%}%>  
</table>
</table>
</body>
</html>

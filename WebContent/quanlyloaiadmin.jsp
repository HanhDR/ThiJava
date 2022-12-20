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
  	<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
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
		td, th {
    padding: 5px;
}
body{
background-color: aliceblue;
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
      <li><a href="xacnhanchuyentienadmin">Danh Sách Chuyển Tiền</a></li>
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

 <form action="loaiadmin" method="post">
 <table style="width: 1000px" align="center"> 
 <tr>
 <td>
 				<table width ="200" align="right">
 				<tr>
	 			<td>Nhập Mã Loại:<input type="text" name="txtml"></td> 
	 			</tr>
	 			<tr>
	 			<td>Nhập Tên Loại:<input type="text" name="txttl"></td>
				</tr>
				<tr>
				<td> <input type="submit" name="add" value="Add"> </td>
				</tr>
				</table>

 <td>
 </form >
<td>
<table style ="width: 900px;text-align: center;">
			<tr  style="width: 900px; border: 1px solid"><td style="width: 900px ;background-color: darkturquoise" colspan="4 ">Danh Sách Loại</td>
			</tr>
			<tr>
			<td style="width: 100px; border: 1px double">Mã Loại</td>
			<td style="width: 100px; border: 1px double">Tên Loại</td>
			<td style="width: 100px; border: 1px double" colspan="2">Thao Tác</td>
			</tr>

<%				
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("uft-8");
				//loaibo loai = new loaibo();
				ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
					for(loaibean l: loai){%>				
						<tr style="border: double;"> 
						 <form action="loaiadmin?maloai=<%=l.getMaloai() %>" method="post"> 
						<td >
						<input type="text" name="txtm" value="<%=l.getMaloai()%>">
						</td>
						<td>
						<input type="text" name="txtt" value="<%=l.getTenloai()%>">
						</td>
						<td> <a href="loaiadmin?ml=<%=l.getMaloai()%> &remove=1">Delete</a></td>
						<td> <input type="submit" name ="up" value="Update">
							</td>
							</tr>
								</form>
					<%
					}
				%>	
			

	  
</table>

</td>
		</tr>
</table>

</body>
</html>

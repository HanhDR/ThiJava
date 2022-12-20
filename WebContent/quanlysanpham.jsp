

<%@page import="bean.sanphambean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.dangnhapadminbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.khachhangbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ShopPoor</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./CSS/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
	
		* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		}
		
		li.dropdown.dropbar {
		    width: 100px;
		    text-align: center;
		}
		
		.container {
		    padding: 8px;
		}
		
		.wrap-layout {
		    background-color: lightslategray;
/* 		    margin-top: 36px; */
		    padding: 12px 0 32px 0;
		    display: flex;
		    justify-content: space-around;
		    flex-wrap: wrap;
		    max-height: 150px;
		}
		
		.wrap-layout__item {
		    display: flex;
		    justify-content: center;
		    width: 100px;
		    height: 40px;
		    text-align: center;
		    line-height: 40px;
		    font-size: 18px;
		    font-weight: 700;
		    margin-top: 20px;
		    background-color: aliceblue;
		    border-radius: 10px;
		    text-decoration: none;
		}
		
		.wrap-layout__item  a{
		    text-decoration: none;
		}
		
		.wrap-layout__item:hover {
		    border: 2px solid #000;
		}
	
		.active {
			background-color: orange;
		}
		
		li.dropdown.dropbar {
		    position: absolute;
		    top: 0;
		    right: 20px;
		}
		.dropdown-menu {
			min-width: 0px;
		}
		
		.navbar-nav>li>.dropdown-menu {
		    background-color: #ccc;
		}
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
		body{
		background-color: initial;
		}
	</style>
</head>
<body>
	<%
	dangnhapadminbean ad = (dangnhapadminbean)session.getAttribute("admin");
 	ArrayList<loaibean> hang = (ArrayList<loaibean>)session.getAttribute("dshang");
	ArrayList<sanphambean> dssp = (ArrayList<sanphambean>)session.getAttribute("dssanpham"); 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8"); 
	%>
	<nav class="navbar navbar-inverse bar">
		<div class="container-fluid">
			<div class="navbar-header">
			<a class="navbar-brand" href="admin">ShopPoor</a>
			</div>
			<ul class="nav navbar-nav">			      
     		 <li><a href="quanlyloaiadmin">Quản Lý Loại</a></li>
      		<li><a href="quanlysanphamadmin">Quản lý Sản Phẩm</a></li>
      		<li><a href="xacnhanadmin">Xác Nhận</a></li>
      		<li><a href="danhsachchuyentien">Danh Sách Chuyển Tiền</a></li>
    			
				
					</ul>
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
				</li>
			</ul>
		</div>
	</nav>
	
	<div style="width: 1326px; margin: 0px 20px;">
	
	</div>
	
	
	<div style="width: 1400px; padding: 20px 0px; min-height: 525px; position: relative; margin-left: 28px;">
		<div style="width: 900px; min-height: 525px;">
			<table style="width: 900px; text-align: center;">
				<tr style="width: 900px; border: 1px solid"><td style="width: 900px ;background-color: darkturquoise" colspan="5" >Danh Sách Sản Phẩm</td></tr>
				<tr>
					<td style="width: 100px; border: 1px double;">Mã Sản Phẩm</td>
					<td style="width: 400px; border: 1px double">Tên Sản Phẩm</td>
					<td style="width: 100px; border: 1px double">Mã Loại</td>
					<td style="width: 100px; border: 1px double">Tồn Kho</td>
					<td style="width: 100px; border: 1px double">Giá</td>
				
				</tr>
				<%
				for(sanphambean sp : dssp){
				%>
				<tr>
					<td style="width: 100px; border: 1px double"><a href="quanlysanphamadmin?chonsach=true&masp=<%=sp.getMasp()%>"><%=sp.getMasp() %></a></td>
					<td style="width: 400px; border: 1px double"><%=sp.getTensp() %></td>
					<td style="width: 100px; border: 1px double"><%=sp.getMaloai() %></td>
					<td style="width: 100px; border: 1px double"><%=sp.getTonkho() %></td>
					<td style="width: 100px; border: 1px double"><%=sp.getGia() %></td>
				
				</tr>
				<%} %>
			</table>
		</div>
		<%sanphambean sanpham = (session.getAttribute("sanpham")!=null)?(sanphambean)session.getAttribute("sanpham"): new sanphambean(); %>
		<div style="width: 500px; position: absolute; right: 0; top: 0; min-height: 545px;
		 display: flex; justify-content: center; margin-top: 20px;padding-left: 20px;">
			<div style="width: 500px; min-height: 400px; position: relative;">
				<div style="width: 500px; min-height: 400px; position: absolute; top: 0;">
				<form action="themsanpham" enctype= "multipart/form-data" method="post">										 
						Tên Sản Phẩm: <input style="margin-bottom: 20px; margin-left: 2px; width: 370px; text-align: right;"
						 type="text" name="txttensp" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getTensp():""%>"> <br>
						 
						Mã Loai: <input style="margin-bottom: 20px; margin-left: 46px; width: 370px; text-align: right;"
						 type="text" name="txtmh" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getMaloai():""%>"> <br>
						 
						Tồn Kho: <input style="margin-bottom: 20px; margin-left: 42px; width: 370px; text-align: right;"
						 type="text" name="txtsl" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getTonkho():""%>"> <br>
						 
						Giá: <input style="margin-bottom: 20px; margin-left: 73px; width: 370px; text-align: right;"
						 type="text" name="txtgia" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getGia():""%>"> <br>
						 
						file: <input type="file" name="txtfile"><br>
						<input type="submit" name="them" value="ADD" style="margin-top: -12px; margin-right: 32px; margin-left: 3px; padding: 2px 16px;"> 
					
				</form> 
			</div>
			</div>
		</div>
	</div>
</body>
</html>
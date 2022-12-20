

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
		background-image: url("https://anhhd.com/wp-content/uploads/2021/10/anh-bau-troi-xanh-6-scaled.jpg")
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

	
	
	<div style="width: 1400px; padding: 20px 0px; min-height: 525px; position: relative; margin-left: -500px;">
		<%sanphambean sanpham = (session.getAttribute("sanpham")!=null)?(sanphambean)session.getAttribute("sanpham"): new sanphambean(); %>
		<div style="width: 500px; position: absolute; right: 0; top: 0; min-height: 545px;
		 display: flex; justify-content: center; margin-top: 20px;padding-left: 20px;">
			<div style="width: 500px; min-height: 400px; position: relative;">
				<div style="width: 500px; min-height: 400px; position: absolute; top: 0;">
				<form action="quanlysanphamadmin" method="post">
						 
						Tên Sản Phẩm: <input style="margin-bottom: 20px; margin-left: 29px; width: 450px; text-align: right;"
						 type="text" name="txttensp" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getTensp():""%>"> <br>
						 
						Mã Hãng: <input style="margin-bottom: 20px; margin-left: 29px; width: 450px; text-align: right;"
						 type="text" name="txtmh" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getMaloai():""%>"> <br>
						 
						Tồn Kho: <input style="margin-bottom: 20px; margin-left: 30px; width: 450px; text-align: right;"
						 type="text" name="txtsl" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getTonkho():""%>"> <br>
						 
						Giá: <input style="margin-bottom: 20px; margin-left: 33px; width: 450px; text-align: right;"
						 type="text" name="txtgia" value="<%=(session.getAttribute("sanpham")!=null)?sanpham.getGia():""%>"> <br>
						 
					<input type="submit" name="xoa" value="Delete" style="margin-top: 10px; margin-right: 32px; margin-left: 138px; padding: 4px 28px;">
					<input type="submit" name="sua" value="Update" style="margin-left: 116px; padding: 4px 28px;"> 
				</form> 
			</div>
			</div>
		</div>
	</div>
	
</body>
</html>
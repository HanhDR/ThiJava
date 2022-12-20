
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
   <link rel="stylesheet" type="text/css" href="./assets/css/footer.css">
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
      
      <li><a href="quanlyloaiadmin">Quản lý loại</a></li>
      <li><a href="quanlysanphamadmin">Quản lý sản phẩm</a></li>
      <li><a href="xacnhanadmin">Xác nhận</a></li>
      <li><a href="danhsachchuyentien">Danh sách chuyển tiền</a></li>
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
<div>
<img alt="" src="dep.jpg" style="width: 100%;
    height: 500px;
    margin-top: -20px;">
</div>	

</table>
<footer class="footer-distributed">

			<div class="footer-left">

				<h3>ShopPoor<span></span></h3>

				<p class="footer-links">
					<a href="#" class="link-1">Home</a>
					
					<a href="#">Blog</a>
				
					<a href="#">Pricing</a>
				
					<a href="#">About</a>
					
					<a href="#">Faq</a>
					
					<a href="#">Contact</a>
				</p>

				
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>74 An Duong Vuong</span> TP Hue</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+1.555.555.5555</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@company.com">deptrai@company.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>About the company</span>
					Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
				</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>

				</div>

			</div>

		</footer>
</body>
</html>

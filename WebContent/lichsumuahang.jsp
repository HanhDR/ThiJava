<%@page import="bean.lichsubean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>AJax</title>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
  	
  	<style type="text/css">
  		.navbar-inverse {
	
		background-image: url("https://t4.ftcdn.net/jpg/02/76/08/07/360_F_276080724_hltnCyDjcqAyRtLzDYo3T2jXbBtCD7fl.jpg");
		}
  		.htgio-img-title {
			width: 40px;
			height: 40px;
			object-fit: cover;
			border-radius: 50%;
		}
		
		.row-item {
			height: 50px;
		}
		
		.row-item:hover {
			background-color: rgba(0, 0, 0, 0.08);
			cursor: pointer;
		}
		
		.test {
			font-size: 24px;
			font-weight: 400;
			cursor: pointer;
			color: red;
		}
		.test:link {
			text-decoration: none;
		}
		
		.btn-action {
			display: flex;
			justify-content: center;
		}
		
		.btn-action-1 + .btn-action-1 {
			margin-left: 40px;
		}
		
		.btn-action-1 {
			font-size: 18px;
			color: #fff;
			border: 1px solid #111;
			border-radius: 6px;
			padding: 8px 12px;
			background-color: #337AB7;
			
		}
		
		.btn-action-1:hover {
			text-decoration: none;
			cursor: pointer;
		}
		
		.input-quantity {
			width: 42px;
			
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
		.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form{
		margin-left: 455px;
		}
		
  	</style>
</head>
<body>
	<% giohangbo gh = (giohangbo) session.getAttribute("gio"); %>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="home">ShopPoor</a>
    		</div>
		    <ul class="nav navbar-nav">
			       <li class="<% if (gh != null && gh.countBook() != 0) out.print("active"); %>"><a href="giohang">
			      <% if (gh != null){
			    	  if (gh.countBook() == 0)
				    		out.print("Cart");
				    	else{
				    		out.print("Cart (" + gh.countBook() + ")");
				    	} 
			      }
			      else{
			    	  out.print("Cart");
			      }
			      
			      %>
			      </a></li>
			     
			      
		    </ul>
		    
		    <form class="navbar-form navbar-left">
				 <input type="text" class="form-control" placeholder="Tìm kiếm ở đây" name="search">
		 		<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		    <ul class="nav navbar-nav navbar-right">
		    			<%
			    	 		khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");
			    	 	%>
			      <% if (kh == null){ %>
			      	<li><a href="dangky"><span class="glyphicon glyphicon-user"></span>Register</a></li>
			      <% }%>
			      <li class="login-item">
			      <% if (kh == null){ %>
			    	 <a href="ktdn"><span class="glyphicon glyphicon-user"></span>Log In</a>
			      <%}else{ %>
			    	 <a href="#"><span class="glyphicon glyphicon-user">
			    	 	<%=kh.getTenkh() %>
			    	 	</span>
			    	 </a>
			    	 <ul class="sub-login">
					      <li class="sub-login-item"><a class="link-sub-login-item" href="thongtin">Thông tin cá nhân</a></li>
					      <li class="sub-login-item"><a class="link-sub-login-item" href="removeLogin">Đăng xuất</a></li>
			     	 </ul>
			      <%} %>
			      
			      
			      </li>
		    </ul>
  		</div>
	</nav>
	
	<div class="container">
		<div class="container-fluid container">
		    <ul class="list-group list-item">
				<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("uft-8");
				
				ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
				/* loaibo loai = new loaibo(); */
					for(loaibean l: loai){%>
						<li class=""><a class="list-group-item" href="home?ml=<%=l.getMaloai()%>">
						<%=l.getTenloai()%></a></li>
					<%
					}
				%>
		    </ul>
		    
		    
		     <div>
		   
		    	
		    <table style ="width: 900px;text-align: center;">
			<tr  style="width: 900px; border: 1px solid"><td style="width: 900px ;background-color: lightsteelblue" colspan="5 ">Lịch Sử Mua Hàng</td>
			</tr>
			<tr>
			<td style="width: 300px; border: 1px double">Tên Sản Phẩm</td>
			<td style="width: 100px; border: 1px double">Giá</td>
			<td style="width: 100px; border: 1px double">Số Lượng</td>
			<td style="width: 100px; border: 1px double">Thành Tiền</td>
			<td style="width: 100px; border: 1px double">Ngày Mua</td>
			
			
			
			</tr>
		    				
		    		<% if (request.getAttribute("listlichsu") != null){
		    			ArrayList<lichsubean> listls = (ArrayList<lichsubean>) request.getAttribute("listlichsu");
		    			
		    			for (lichsubean item:listls){%>
		    				<tr>
		    					<td style="width: 300px; border: 1px double"><%=item.getTensp() %></td>
		    					<td style="width: 100px; border: 1px double"><%=item.getGia() %></td>
		    					<td  style="width: 100px; border: 1px double"><%=item.getSoluong() %></td>
		    					<td style="width: 100px; border: 1px double"><%=item.getThanhTien() %></td>
		    					<td  style="width: 100px; border: 1px double"><%=item.getNgayMua() %></td>
		    				</tr>
		    			
		    			<%}
		    		}
		    		%>
		    	
		    	</table>
		    </div>
		    
		</div>
		
	</div>
	

</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="bo.giohangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.sanphambean"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
	<title>Dep Trai</title>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
  	<link rel="stylesheet" type="text/css" href="./assets/css/footer.css">
	<style>
	.navbar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand{
	margin-left: -9px;
	}
	.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover{
background-image: url("https://t4.ftcdn.net/jpg/02/76/08/07/360_F_276080724_hltnCyDjcqAyRtLzDYo3T2jXbBtCD7fl.jpg");	}
	.active, .dot:hover {
  background-image: url("https://t4.ftcdn.net/jpg/02/76/08/07/360_F_276080724_hltnCyDjcqAyRtLzDYo3T2jXbBtCD7fl.jpg");
}
		.navbar-inverse {
	
		background-image: url("https://t4.ftcdn.net/jpg/02/76/08/07/360_F_276080724_hltnCyDjcqAyRtLzDYo3T2jXbBtCD7fl.jpg");
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
		.navbar-nav>li>a {
		margin-right: 23px;
		}
		/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
  margin-left: 200px
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */


/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
	</style>
</head>

	<% 
	
	ArrayList<sanphambean> dssp = (ArrayList<sanphambean>) session.getAttribute("dssp");
	int n=dssp.size();
	int st = (n/10 == 0) ? 1 : n/10;
	
	if(n/10 != 0) st++;
	khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");
	giohangbo gh = (giohangbo) session.getAttribute("gio"); 
	%>
	
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
    		<div class="navbar-header">
      		 <a class="navbar-brand" href="home">ShopPoor</a>
      		 
    		</div>
		    <ul class="nav navbar-nav">
			   <li class="<% if (gh != null && gh.countBook() != 0) out.print("active"); %>"><a class="navbar-brand " href="giohang">
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
		    
		    <form class="navbar-form navbar-left" style="position: absolute;left: 500px">
				 <input type="text" class="form-control" placeholder="Tim kiem o day" name="search">
		 		<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		    <ul class="nav navbar-nav navbar-right">
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
					      <li class="sub-login-item"><a class="link-sub-login-item" href="thongtin">Profile</a></li>
					      <li class="sub-login-item"><a class="link-sub-login-item" href="lichsumuahang">Purchase History</a></li>
					      <li class="sub-login-item"><a class="link-sub-login-item" href="removeLogin">LogOut</a></li>
			     	 </ul>
			      <%} %>
			      
			      </li>
		    </ul>
  		</div>
	</nav>

<div class="slideshow-container" >

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="sale.jpg" style="width:100% ;height:250px;">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="sale2.jpg" style="width:100% ;height:250px;" >
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="sale3.jpg" style="width:100% ;height:250px;" >
  <div class="text"></div>
</div>
<br>
	<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>


<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
	
	</div>
	<div class="container">
		<div class="container-fluid container">
		    <ul class="list-group list-item">
		    	<li >Danh Mục</li>
				<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("uft-8");
				//loaibo loai = new loaibo();
				ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
					for(loaibean l: loai) { %>
						<li class=""><a class="list-group-item" href="home?ml=<%=l.getMaloai()%>">
						<%=l.getTenloai()%></a></li>
					<%
					}
				%>
		    </ul>
		    <div>
		     	<%
		     		
		     		if (dssp.size() == 0){
		     	%>
		     			<h3>Danh sach sach rong</h3>
		     		<%}else{%>
		    		<table width="600" style="padding: 0 15px">
		   		
		   		 <%   	
		   
		   				
			   		    int trang = (int)request.getAttribute("trang");
			   		    int start = (trang-1)*10;
			   		    int end = (trang)*10;
			   		 if(trang  == n/10 +1){
		   					if(n%10 != 0)end = (trang -1)*10 + n%10;
		   				} 
			   		    for(int i=start;i<end;i++){
			   		    	sanphambean s = dssp.get(i);
			   		%>
			   		     <tr style="height: 380px;border: double;" >
				   		      <td style="border: double">
					   		  	 <img style="border-radius: 6px; width: 240px; height: 264px; object-fit: cover;" src="<%=s.getAnh() %>"> <br>
					   		     <%=s.getTensp()%> <br>
					   		    Price: <%=s.getGia() %> VND<br>
					   				<a href="giohang?addbook=true&ms=<%=s.getMasp()%>&tensach=<%=s.getTensp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     	<img src="mua.jpg"/>	
					   		     
					   	
					   		     </a>
					   		  </td>
				   		   
				   		   	  <% i++; 
				   		   	  if(i<n){
				   		      		s = dssp.get(i);%>
				   		     		<td>
							   		   <img style="border-radius: 6px; width: 240px; height: 264px; object-fit: cover;" src="<%=s.getAnh() %>"> <br>
					   		    		 		<%=s.getTensp()%> <br>
					   		     		Price: <%=s.getGia()%> VND<br>
					   					<a href="giohang?addbook=true&ms=<%=s.getMasp()%>&tensach=<%=s.getTensp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     		<img src="mua.jpg"/>	
					   		     
					   		     
						   		     </td>
					   		
				   		     <%} %>
				   		  </tr>
				   	<%} %>
				   	
				   	
		   		   
	   		 </table>
		
		    </div>
		    
		</div>
		
	</div>
	<nav aria-label="Page navigation example" align="center"  >
				  <ul class="pagination" >
						<%                //Button Previous
					        int back = 0;
					        if (trang == 0 || trang == 1) {
					            back = 1;//Luon la page 1
					        } else {
					            back = trang - 1;//Neu pages tu 2 tro len thi back tru 1
					        }
					    %>
				<li class="page-item"><a class="page-link" href="home?trang=<%=back%>">Previous</a></li>
				    	<%for(int i = 1; i<= st; i++){%>
				 		<li class="page-item"><a class="page-link" href="home?trang=<%=i %>"><%=i %></a></li>
				    <%} %>
				    
							     <%                //Button Previous
						        int next = 0;
						        if(trang == st){
						        	next= st;
						        }else{
						        	next = trang + 1;
						        }
						   
						    %>
				    <li class="page-item"><a class="page-link" href="home?trang=<%=next%>">Next</a></li>
				  </ul>
				</nav>
	<%} %>

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
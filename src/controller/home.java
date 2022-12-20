package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;

import bean.sanphambean;
import bo.loaibo;

import bo.sanphambo;

/**
 * Servlet implementation class home
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public home() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		loaibo lbo = new loaibo();
		
		ArrayList<loaibean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);
		ArrayList<sanphambean> dssp;
		if (session.getAttribute("dssp") == null){
			dssp = new ArrayList<sanphambean>();
			session.setAttribute("dssp", dssp);
		}	
		dssp = (ArrayList<sanphambean>) session.getAttribute("dssp");
		
		sanphambo sbo = new sanphambo();
		
		if (request.getParameter("search")!=null){
			dssp = sbo.getsanpham();
		    dssp = sbo.timKiemTheoTen(dssp, request.getParameter("search"));
		}
		else if (request.getParameter("ml")!=null){
			dssp = sbo.getsanpham();
		    dssp = sbo.timKiemTheoLoai(dssp, request.getParameter("ml"));
		}
		else {
			dssp = sbo.getsanpham();
		}
		 int trang;
	  		if(request.getParameter("trang") == null) {
	  			trang = 1;
	  		}else trang = Integer.parseInt(request.getParameter("trang"));
	  		request.setAttribute("trang", trang);
		
		
		session.setAttribute("dssp", dssp);
	
		
		RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

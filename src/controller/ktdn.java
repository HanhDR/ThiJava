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

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class ktdn
 */
@WebServlet("/ktdn")
public class ktdn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String un = request.getParameter("txtun");
		String pass = request.getParameter("txtpass");
		
		
		if (un!=null && pass!= null) {
		
//			Tạo đối  seesion
			HttpSession session = request.getSession();
			
			khachhangbo khbo = new khachhangbo();
			ArrayList<khachhangbean> dskhachhang = khbo.getdskhachhang();
			
			khachhangbean khachhang = khbo.kiemtradangnhap(un, pass);
			
			if (khachhang != null) {
				
				if (session.getAttribute("khachhang") == null) {
					session.setAttribute("khachhang", null);
				}
				
				session.setAttribute("khachhang", khachhang);
				
//				Chuyen tiep ve trang home
				response.sendRedirect("home");
			}else {
				request.setAttribute("Loi", "Tai khoan hoac mat khau chua dung");
				RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
				rd.forward(request, response);
			}
			
		}else {
//			
			RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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


/**
 * Servlet implementation class thongtin
 */
@WebServlet("/thongtin")
public class thongtin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thongtin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<khachhangbean> dsthongtin;
		if (session.getAttribute("dsthongtin") == null){
			dsthongtin = new ArrayList<khachhangbean>();
			session.setAttribute("dsthongtin", dsthongtin);
		}
		dsthongtin = (ArrayList<khachhangbean>) session.getAttribute("dsthongtin");
		session.setAttribute("dsthongtin", dsthongtin);
		
		RequestDispatcher rd = request.getRequestDispatcher("thongtin.jsp");
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

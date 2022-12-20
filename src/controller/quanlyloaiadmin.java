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
import bo.loaibo;

/**
 * Servlet implementation class quanlyloaiadmin
 */
@WebServlet("/quanlyloaiadmin")
public class quanlyloaiadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanlyloaiadmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		loaibo lbo = new loaibo();
		
		String ma=request.getParameter("txtml");
		String tl=request.getParameter("txttl");
		
		if(request.getParameter("add")!=null) {
			lbo.Themloai(ma, tl);
			
		}
		else
		if(request.getParameter("remove")!=null) {
			String ml=request.getParameter("ml");
			lbo.Xoa(ml);
			
		}
		else 
		if(request.getParameter("maloai")!=null) {
			String maloai=request.getParameter("txtm");
			String tenloai=request.getParameter("txtt");
			String mloai=request.getParameter("maloai");
			lbo.Update(tenloai, maloai, mloai);
		
		}
		ArrayList<loaibean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);
		RequestDispatcher rd =request.getRequestDispatcher("quanlyloaiadmin.jsp");
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

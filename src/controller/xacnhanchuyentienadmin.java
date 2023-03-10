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

import bean.xacnhanadminbean;
import bo.xacnhanadmindo;

/**
 * Servlet implementation class xacnhanchuyentienadmin
 */
@WebServlet("/xacnhanchuyentienadmin")
public class xacnhanchuyentienadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanchuyentienadmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		 xacnhanadmindo xnbo = new xacnhanadmindo();
		 ArrayList<xacnhanadminbean> ds = xnbo.getdanhsach();
		 String mct = request.getParameter("mct");
		 long mact=Long.parseLong(mct);
		 if(mct != null) {
			 xnbo.Xacnhan(mact);
			 //request.setAttribute("dsxn", xnbo.getdanhsach());
		 }
			RequestDispatcher rd=request.getRequestDispatcher("xacnhanadmin");
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

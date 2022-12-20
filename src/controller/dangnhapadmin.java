package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.dangnhapadminbean;
import bo.dangnhapadminbo;

/**
 * Servlet implementation class dangnhapadmin
 */
@WebServlet("/dangnhapadmin")
public class dangnhapadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapadmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un=request.getParameter("txtun");
		  String pass=request.getParameter("txtpass");
		  if(un!=null&&pass!=null) {
			  dangnhapadminbo dnbo= new dangnhapadminbo();
			  dangnhapadminbean dn=dnbo.ktdn(un, pass);
			  if(dn!=null){//Dang nhap dung
				  //Tao doi tuong session
				  HttpSession session=request.getSession();
				  session.setAttribute("admin", dn);
				  response.sendRedirect("admin");
			  }else {//Dang nhap sai
				  RequestDispatcher rd= request.getRequestDispatcher("dangnhapadmin.jsp?kt=1");
				  rd.forward(request, response);
			  }
				  
		  }else {//Chay lan dau
			  RequestDispatcher rd= request.getRequestDispatcher("dangnhapadmin.jsp");
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

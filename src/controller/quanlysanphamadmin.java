package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.sanphambean;
import bo.loaibo;
import bo.sanphambo;

/**
 * Servlet implementation class quanlysanphamadmin
 */
@WebServlet("/quanlysanphamadmin")
public class quanlysanphamadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanlysanphamadmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		sanphambo spb = new sanphambo();
		loaibo lb = new loaibo();
		HttpSession ss= request.getSession();

		if(request.getParameter("xoa") != null || request.getParameter("sua") != null) {
			sanphambean sp = (sanphambean)ss.getAttribute("sanpham");
			String tensach = request.getParameter("txttensp");
			String mahang = request.getParameter("txtmh");
			long soluong = Long.parseLong(request.getParameter("txtsl"));
			long gia = Long.parseLong(request.getParameter("txtgia"));
			if(request.getParameter("xoa") != null) {
				spb.xoa_sach(sp.getMasp());
				ss.removeAttribute("sanpham");
			}
			else {
				spb.sua_sach(new sanphambean(sp.getMasp(), tensach, soluong, gia, mahang,""));
			ss.setAttribute("sanpham", spb.timkiem_msp(sp.getMasp()));
			}
			ss.setAttribute("dssanpham", spb.getsanpham());
		}else {
			ss.setAttribute("dshang", lb.getloai());
			ss.setAttribute("dssanpham", spb.getsanpham());
			if(request.getParameter("tk") != null) {
				String key = (request.getParameter("key") != null)?request.getParameter("key"): request.getParameter("mahang");
				ss.setAttribute("dssanpham", spb.timKiemTheoTen(null, key));
			}
				
			if(request.getParameter("chonsach") != null) {
				ss.setAttribute("sanpham", spb.timkiem_msp(Long.parseLong(request.getParameter("masp").toString())));
				RequestDispatcher rd = request.getRequestDispatcher("suaxoasanphamadmin.jsp");
				rd.forward(request, response);
			}
			
		}
		RequestDispatcher rd = request.getRequestDispatcher("quanlysanpham.jsp");
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

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;


import bean.sanphambean;

public class KetNoi {
	public Connection cn;
	public void KetNoi(){
		try {
			//b1: xac dinh he quan tri csdl
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("xong b1");
			cn = DriverManager.getConnection("jdbc:sqlserver://LAPTOP-TNBT312N\\SQLEXPRESS:1433;databaseName=QlAQ;user=sa; password=1234");
			System.out.println("Ok b2");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
public static void main () {
	try {
		KetNoi kn=new KetNoi();
		kn.KetNoi();
		sanphamdao sdao=new sanphamdao(); 
		ArrayList<sanphambean> ds=new ArrayList<sanphambean>();
		ds=sdao.getsanpham();
		for (sanphambean item:ds) {
			System.out.println(item.getTensp());
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
}

}

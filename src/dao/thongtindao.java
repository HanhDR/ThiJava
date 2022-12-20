package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.khachhangbean;

public class thongtindao {
	public ArrayList<khachhangbean> getthongtin(long makh){
		   try {
			   ArrayList<khachhangbean> dsthongtin= new ArrayList<khachhangbean>();
//			   b1: ket noi vao csdl
			   KetNoi cs = new KetNoi();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from KhachHang where makh=?";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   cmd.setLong(1,makh);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				    long mkh=rs.getLong("makh");
				   String hoten = rs.getString("tenkh");
				   String diachi = rs.getString("diachi");
				   String email = rs.getString("email");
				   String sdt = rs.getString("sdt");
				   String TenDangNhap = rs.getString("tendn");
				   String MatKhau = rs.getString("pass");
				   dsthongtin.add(new khachhangbean(makh, hoten, sdt, diachi, email, TenDangNhap, MatKhau));
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   
			   return dsthongtin;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}

	}
}

package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.khachhangbean;

public class khachhangdao {
	public ArrayList<khachhangbean> getdskhachhang(){
		   try {
			   ArrayList<khachhangbean> dskhachhang= new ArrayList<khachhangbean>();
//			   b1: ket noi vao csdl
			   KetNoi kn = new KetNoi();
			   kn.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from KhachHang";
			   PreparedStatement cmd = kn.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				   long maKhachHang = rs.getLong("makh");
				   String hoten = rs.getString("tenkh");
				   String sdt = rs.getString("sdt");
				   String diachi = rs.getString("diachi");
				   String email = rs.getString("email");
				   String TenDangNhap = rs.getString("tendn");
				   String MatKhau = rs.getString("pass");
				   dskhachhang.add(new khachhangbean(maKhachHang, hoten, diachi, email, sdt, TenDangNhap, MatKhau));
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   kn.cn.close();
			   
			   return dskhachhang;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	   }
	public int ThemKhachHang(String hoten,String sdt, String email, String tendangnhap, String matkhau) throws Exception{
		KetNoi cs = new KetNoi();
		cs.KetNoi();
		
     String sql = "insert into KhachHang (tenkh,sdt, email, tendn, pass) values (?,?,?,?,?)";
     PreparedStatement cmd = cs.cn.prepareStatement(sql);    
     cmd.setString(1, hoten);
     cmd.setString(2, sdt);
     cmd.setString(3, email);
     cmd.setString(4, tendangnhap);
     cmd.setString(5, matkhau);
     
     return cmd.executeUpdate();
 }
}

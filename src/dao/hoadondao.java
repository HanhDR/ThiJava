package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import bean.khachhangbean;

public class hoadondao {
	public int maxhoadon(){
		 try {
	        	KetNoi cs = new KetNoi();
	    		cs.KetNoi();
	           String sql = "select max(mahd) as maxhd from HoaDonBH";
	           	PreparedStatement cmd = cs.cn.prepareStatement(sql);
	            ResultSet rs = cmd.executeQuery();
	            int kq = 0;
	            if(rs.next()) {
	            	kq = rs.getInt("maxhd");
	            }
	            
	            rs.close();
				   
	            return kq;
		} catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	            return 0;
		}
	}
	
	public long ThemHoaDon(long makhachhang, Date ngaylap) throws Exception{
		KetNoi cs = new KetNoi();
		cs.KetNoi();
		
        String sql = "insert into HoaDonBH (makh, ngaymua, damua) values (?,?,?)";
        PreparedStatement cmd = cs.cn.prepareStatement(sql);    
        
        cmd.setLong(1, makhachhang);
        cmd.setDate(2, new java.sql.Date(ngaylap.getTime()));
        cmd.setBoolean(3, false);
        
        return cmd.executeUpdate();
    }
	
	public long ThemChiTietHoaDon(String maSp, long soluong, long mahoadon) throws Exception{
		KetNoi cs = new KetNoi();
		cs.KetNoi();
		
        String sql = "insert into CTBanHang (masp, soluong, mahd) values (?,?,?)";
        PreparedStatement cmd = cs.cn.prepareStatement(sql);    
        
        cmd.setString(1, maSp);
        cmd.setLong(2, soluong);
        cmd.setLong(3, mahoadon);
        
        return cmd.executeUpdate();
    }
	
	public khachhangbean getkhachhang(String chechemail){
        try {
        	KetNoi cs = new KetNoi();
    		cs.KetNoi();
//			   b2: Lay du lieu ve
           String sql = "select * from KhachHang where email = ?";
           	PreparedStatement cmd = cs.cn.prepareStatement(sql);
	    	cmd.setString(1, chechemail);
            ResultSet rs = cmd.executeQuery();
            khachhangbean kh = new khachhangbean();
            if(rs.next()) {
            	long maKhachHang = rs.getLong("makh");
				   String hoten = rs.getString("tenkh");
				   String diachi = rs.getString("diachi");
				   String email = rs.getString("email");
				   String sdt = rs.getString("sdt");
				   String TenDangNhap = rs.getString("tendn");
				   String MatKhau = rs.getString("pass");
				   kh = new khachhangbean(maKhachHang, hoten, diachi, email, sdt, TenDangNhap, MatKhau);
            }
            
            rs.close();
			   
            return kh;
	} catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return null;
	}
    }
}

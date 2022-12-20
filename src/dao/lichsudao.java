package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.lichsubean;

public class lichsudao {
	public ArrayList<lichsubean> getlichsu(long makh){
        try {
        	KetNoi cs = new KetNoi();
    		cs.KetNoi();
           String sql = "select * from LSMuaHang where makh = ?";
           	PreparedStatement cmd = cs.cn.prepareStatement(sql);
	    	cmd.setLong(1, makh);
            
            ResultSet rs = cmd.executeQuery();
            ArrayList<lichsubean> listls = new ArrayList<lichsubean>();
            while(rs.next()) {
            	lichsubean ls = new lichsubean();
            	long makhachhang = rs.getInt("makh");
				String tensach = rs.getString("tensp");
				long SoLuongMua = rs.getInt("soluong");
				long gia = rs.getInt("gia");
				long ThanhTien = rs.getInt("ThanhTien");
				boolean damua =rs.getBoolean("damua");
				Date NgayMua = rs.getDate("ngaymua");
				ls = new lichsubean(makhachhang, tensach, SoLuongMua, gia, ThanhTien, damua, NgayMua);
				listls.add(ls);
            }
            
            rs.close();
			   
            return listls;
	} catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return null;
	}
    }
}

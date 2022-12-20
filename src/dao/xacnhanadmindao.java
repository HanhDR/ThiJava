package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.xacnhanadminbean;

public class xacnhanadmindao {
	public ArrayList<xacnhanadminbean> getdanhsach(){
    	try {
    		ArrayList<xacnhanadminbean> ds= new ArrayList<xacnhanadminbean>();
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select * from XacThucChiTiet where damua=0";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			ResultSet rs=cmd.executeQuery();
			while(rs.next()) {
				  long MaChiTietHD=rs.getLong("mactbh");
				  long MaHoaDon=rs.getLong("mahd");;
				  String hoten=rs.getString("tenkh");
				  String tensach=rs.getString("tensp");;
				  long SoLuongMua=rs.getLong("soluong");;
				  long gia=rs.getLong("gia");;
				  long ThanhTien=rs.getLong("ThanhTien");;
				  boolean damua=rs.getBoolean("damua");
				  ds.add(new xacnhanadminbean(MaChiTietHD, MaHoaDon, hoten, tensach, SoLuongMua, gia, ThanhTien, damua));
			}
			rs.close();kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}
    }
	public void xacnhan(long ChiTietHoaDon) {
		try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="update XacThucChiTiet set damua=1 where mactbh=?";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			cmd.setLong(1, ChiTietHoaDon);
			cmd.executeUpdate();
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<xacnhanadminbean> getdsxn(){
    	try {
    		ArrayList<xacnhanadminbean> ds= new ArrayList<xacnhanadminbean>();
    		KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select * from XacThucChiTiet where damua=1";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			ResultSet rs=cmd.executeQuery();
			while(rs.next()) {
				 long MaChiTietHD=rs.getLong("mactbh");
				  long MaHoaDon=rs.getLong("mahd");;
				  String hoten=rs.getString("tenkh");
				  String tensach=rs.getString("tensp");;
				  long SoLuongMua=rs.getLong("soluong");;
				  long gia=rs.getLong("gia");;
				  long ThanhTien=rs.getLong("ThanhTien");;
				  boolean damua=rs.getBoolean("damua");
				  ds.add(new xacnhanadminbean(MaChiTietHD, MaHoaDon, hoten, tensach, SoLuongMua, gia, ThanhTien, damua));
			}
			rs.close();kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}
    }
	public static void main(String[] args) {
		xacnhanadmindao ds=new xacnhanadmindao();
		for(xacnhanadminbean xn: ds.getdanhsach()) {
			System.out.print(xn.getTenkh());
		}
		
	}

}

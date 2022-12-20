package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	   public ArrayList<loaibean> getloai(){
		   try {
			   ArrayList<loaibean> dsloai= new ArrayList<loaibean>();
//			   b1: ket noi vao csdl
			  KetNoi cs = new KetNoi();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from Loai";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				  String maloai=rs.getString("maloai");
				   String tenloai = rs.getString("tenloai");
				   dsloai.add(new loaibean(maloai,tenloai));
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   return dsloai;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	   }
	   public int themloai(String maloai,String tenloai) throws Exception{
		   KetNoi cs = new KetNoi();
		   cs.KetNoi();
	        String sql = "insert into Loai(maloai, tenloai) values (?,?)";
	        PreparedStatement cmd = cs.cn.prepareStatement(sql);    
	        cmd.setString(1, maloai);
	        cmd.setString(2, tenloai);
	        
	        return cmd.executeUpdate();
	    }
	   public int xoa(String maloai) throws Exception{
		 //Ket Noi
		   KetNoi cs = new KetNoi();
		   cs.KetNoi();
		 String sql="delete from loai where maloai=?";
		 PreparedStatement cmd= cs.cn.prepareStatement(sql);
		  cmd.setString(1, maloai);
		  int kq=cmd.executeUpdate();
		 cmd.close();
		 return kq;
		 }
	   public int update(String tenloai, String maloai1,String maloai) throws Exception{
			 //Ket Noi
		   KetNoi cs = new KetNoi();
		   cs.KetNoi();
			 String sql="UPDATE loai"+" SET tenloai = ?"+", maloai = ?"+" WHERE maloai =?";
			 PreparedStatement cmd= cs.cn.prepareStatement(sql);
			  cmd.setString(1, tenloai);
			  cmd.setString(2, maloai1);
			  cmd.setString(3, maloai);
			  int kq=cmd.executeUpdate();
			 cmd.close();
			 return kq;
			 }
		 
}

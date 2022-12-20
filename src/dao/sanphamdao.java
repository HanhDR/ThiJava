package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.sanphambean;

public class sanphamdao {
	 public ArrayList<sanphambean> getsanpham(){
		   try {
			   ArrayList<sanphambean> dssp= new ArrayList<sanphambean>();
//			   b1: ket noi vao csdl
			  KetNoi cs = new KetNoi();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from SanPham";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				  long masp=rs.getLong("masp");
				   String tensp = rs.getString("tensp");
				   long tonkho=rs.getLong("tonkho");
				   long gia=rs.getLong("gia");
				   String maloai=rs.getString("maloai");
				   String anh=rs.getString("anh");
				   dssp.add(new sanphambean(masp, tensp, tonkho, gia, maloai, anh));
				  
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   return dssp;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	   }
	 public int them (sanphambean s) throws Exception {
			KetNoi cs = new KetNoi();
			cs.KetNoi();;
			
			String sql = "insert into sanpham(tensp, maloai,anh, tonkho, gia)\r\n"
					+ "values(?, ?, ?, ?, ?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, s.getTensp());
			cmd.setString(2, s.getMaloai());
			cmd.setString(3, s.getAnh());
			cmd.setLong(4, s.getTonkho());
			cmd.setLong(5, s.getGia());

			return cmd.executeUpdate();
		}
	 public int sua (sanphambean s) throws Exception {
		 KetNoi cs = new KetNoi();
			cs.KetNoi();;
			String sql = "update sanpham\r\n"
					+ "set tensp = ?, maloai = ?, tonkho = ?, gia = ?\r\n"
					+ "where masp = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, s.getTensp());
			cmd.setString(2, s.getMaloai());
			cmd.setLong(3, s.getTonkho());
			cmd.setLong(4, s.getGia());
			cmd.setLong(5, s.getMasp());
			return cmd.executeUpdate();
		}
		
		public int xoa (long masp) throws Exception {
			KetNoi cs = new KetNoi();
			cs.KetNoi();
			
			String sql = "delete from sanpham where masp = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, masp);
			return cmd.executeUpdate();
		}
		public static void main(String[] args) {
			sanphamdao spdao=new sanphamdao();
			try {
				spdao.them(new sanphambean(0, "sadaa", 10, 456789, "6", null));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}

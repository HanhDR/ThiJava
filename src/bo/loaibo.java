package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao = new loaidao();
	ArrayList<loaibean> ds;
	public ArrayList<loaibean> getloai(){
		ds = ldao.getloai();
		return ds;
	}
	public int Themloai(String maloai,String tenloai) {
		try {
			return ldao.themloai(maloai, tenloai);
		} catch (Exception e) {
			return 0;
		}
	}
	public int Xoa(String maloai) {
		try {
			return ldao.xoa(maloai);
		} catch (Exception e) {
			return 0;
		}
		
	}
	public int Update(String tenloai,String maloai1,String maloai) {
		try {
			return ldao.update(tenloai, maloai1, maloai);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}

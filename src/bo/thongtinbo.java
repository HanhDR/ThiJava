package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.khachhangdao;
import dao.thongtindao;

public class thongtinbo {
	thongtindao ttdao = new thongtindao();
	ArrayList<khachhangbean> ds;
	public ArrayList<khachhangbean>gettt(long makh) {
		ds = ttdao.getthongtin(makh);
		return ds;
	}
}

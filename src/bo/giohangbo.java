package bo;

import java.util.ArrayList;

import bean.giohangbean;

public class giohangbo {
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void Them(String masp, String tensp, long gia, long soLuong, String anh) {
		for (giohangbean g:ds) {
			if (g.getMasp().equals(masp)) {
				
				if (soLuong < 0)
					soLuong = 1;	
				g.setSoLuong(soLuong);
				return;
			}
		}
		
		ds.add(new giohangbean(masp, tensp, gia, soLuong, soLuong, anh));
		
	}
	public void Xoa(String masp) {
		for (int i=0; i<ds.size(); i++) {
			if (ds.get(i).getMasp().equals(masp)) {
				ds.remove(i);
				return;
			}
		}
	}

	public int countBook() {
		int count = 0;
		for (giohangbean g: ds) {
			count++;
		}
		
		return count;
	}
	public long TongTien() {
		long Sum = 0;
		for (giohangbean g: ds) {
			Sum += g.getThanhtien();
		}
		return Sum;
	}
	public void XoaAll() {
		ds.removeAll(ds);
	}
	public void XoaNhieu(String [] list) {
		for (String item: list) {
			for (int i=0; i<ds.size(); i++) {
				if (item.equals(ds.get(i).getMasp())) {
					ds.remove(i);
					i--;
				}
			}
		}
		
	}
}

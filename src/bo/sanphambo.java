package bo;

import java.util.ArrayList;

import bean.loaibean;

import bean.sanphambean;
import dao.sanphamdao;

public class sanphambo {
sanphamdao spdao=new sanphamdao();
ArrayList<sanphambean> ds ;
public ArrayList<sanphambean> getsanpham(){
	ds = spdao.getsanpham();
	return ds;
}

public ArrayList<sanphambean> timKiemTheoLoai(ArrayList<sanphambean> ds ,String maLoai) {
	ArrayList<sanphambean> dsSachCungMa = new ArrayList<sanphambean>();
	for (sanphambean item: ds) {
		if (item.getMaloai().equals(maLoai)) {
			dsSachCungMa.add(item);
		}
	}
	
	return dsSachCungMa;
}
public ArrayList<sanphambean> timKiemTheoTen(ArrayList<sanphambean> ds ,String tenLoai) {
	ArrayList<sanphambean> dsSachCungTen = new ArrayList<sanphambean>();
	for (sanphambean item: ds) {
		if (item.getTensp().toLowerCase().trim().contains(tenLoai.toLowerCase().trim())
		 || item.getMaloai().toLowerCase().trim().contains(tenLoai.toLowerCase().trim())
		
		) {
			dsSachCungTen.add(item);
		}
	}
	
	return dsSachCungTen;
}
public ArrayList<sanphambean> timkiem(String tk){
	ArrayList<sanphambean> findsach = new ArrayList<sanphambean>();
	//int n = dssach.size();
	for(sanphambean sp : spdao.getsanpham()) {
		if(sp.getTensp().trim().contains(tk.toLowerCase().trim()) 
				|| sp.getMaloai().toLowerCase().trim().contains(tk.toLowerCase().trim()))
				{
			findsach.add(sp);
		}
	}
	return findsach;
}

public sanphambean timkiem_msp(long masp){
	//int n = dssach.size();
	for(sanphambean sp : spdao.getsanpham()) {
		if(sp.getMasp() == masp){
			return sp;
		}
	}
	return null;
}

public void them_sp(sanphambean s) {
	try {
		spdao.them(s);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

}

public void sua_sach(sanphambean s) {
	try {
		spdao.sua(s);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

}

public void xoa_sach(long ms) {
	try {
		spdao.xoa(ms);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

}
}

package bean;

import java.util.Date;

public class lichsubean {
	long makh;
	String tensp;
	long soluong;
	long gia;
	long ThanhTien;
	boolean damua;
	Date ngaymua;
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsubean(long makh, String tensp, long soluong, long gia, long thanhTien, boolean damua, Date ngayMua) {
		super();
		this.makh = makh;
		this.tensp = tensp;
		this.soluong = soluong;
		this.gia = gia;
		ThanhTien = thanhTien;
		this.damua = damua;
		ngaymua = ngayMua;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public Date getNgayMua() {
		return ngaymua;
	}
	public void setNgayMua(Date ngayMua) {
		ngaymua = ngayMua;
	}
	
	
}

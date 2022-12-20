package bean;

public class giohangbean {
	String masp, tensp;
	long gia, soLuong, thanhtien;
	String anh;
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giohangbean(String masp, String tensp, long gia, long soLuong, long thanhtien, String anh) {
		super();
		this.masp = masp;
		this.tensp = tensp;
		this.gia = gia;
		this.soLuong = soLuong;
		this.thanhtien = soLuong*gia;
		this.anh = anh;
	}
	public String getMasp() {
		return masp;
	}
	public void setMasp(String masp) {
		this.masp = masp;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(long soLuong) {
		this.soLuong = soLuong;
	}
	public long getThanhtien() {
		return soLuong*gia;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
}

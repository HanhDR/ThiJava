package bean;

public class sanphambean {
private long masp;
private String tensp;
private long tonkho;
private long gia;
private String maloai;
private String anh;
public sanphambean() {
	super();
	// TODO Auto-generated constructor stub
}
public sanphambean(long masp, String tensp, long tonkho, long gia, String maloai, String anh) {
	super();
	this.masp = masp;
	this.tensp = tensp;
	this.tonkho = tonkho;
	this.gia = gia;
	this.maloai = maloai;
	this.anh = anh;
}
public long getMasp() {
	return masp;
}
public void setMasp(long masp) {
	this.masp = masp;
}
public String getTensp() {
	return tensp;
}
public void setTensp(String tensp) {
	this.tensp = tensp;
}
public long getTonkho() {
	return tonkho;
}
public void setTonkho(long tonkho) {
	this.tonkho = tonkho;
}
public long getGia() {
	return gia;
}
public void setGia(long gia) {
	this.gia = gia;
}
public String getMaloai() {
	return maloai;
}
public void setMaloai(String maloai) {
	this.maloai = maloai;
}
public String getAnh() {
	return anh;
}
public void setAnh(String anh) {
	this.anh = anh;
}

	
}

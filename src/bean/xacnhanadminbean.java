package bean;

public class xacnhanadminbean {
	private long mactbh;
	private long mahd;
	private String tenkh;
	private String tensp;
	private long soluong;
	private long gia;
	private long ThanhTien;
	private boolean damua;
	public xacnhanadminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public xacnhanadminbean(long mactbh, long mahd, String tenkh, String tensp, long soluong, long gia, long thanhTien,
			boolean damua) {
		super();
		this.mactbh = mactbh;
		this.mahd = mahd;
		this.tenkh = tenkh;
		this.tensp = tensp;
		this.soluong = soluong;
		this.gia = gia;
		ThanhTien = thanhTien;
		this.damua = damua;
	}
	public long getMactbh() {
		return mactbh;
	}
	public void setMactbh(long mactbh) {
		this.mactbh = mactbh;
	}
	public long getMahd() {
		return mahd;
	}
	public void setMahd(long mahd) {
		this.mahd = mahd;
	}
	public String getTenkh() {
		return tenkh;
	}
	public void setTenkh(String tenkh) {
		this.tenkh = tenkh;
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
	
}

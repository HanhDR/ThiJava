package bean;

public class dangnhapadminbean {
	private String tendn;
	private String pass;
	private boolean quyen;
	public dangnhapadminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public dangnhapadminbean(String tendn, String pass, boolean quyen) {
		super();
		this.tendn = tendn;
		this.pass = pass;
		this.quyen = quyen;
	}
	public String getTendn() {
		return tendn;
	}
	public void setTendn(String tendn) {
		this.tendn = tendn;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public boolean isQuyen() {
		return quyen;
	}
	public void setQuyen(boolean quyen) {
		this.quyen = quyen;
	}
	

}

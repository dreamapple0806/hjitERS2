package kr.co.hjitERS.vo;

public class InJunpyoVO {	
	private String gubun;
	private String in_jun_no;
	private String jun_no;
	private String inuser;
	private String indate;
	
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getIn_jun_no() {
		return in_jun_no;
	}
	public void setIn_jun_no(String in_jun_no) {
		this.in_jun_no = in_jun_no;
	}
	public String getJun_no() {
		return jun_no;
	}
	public void setJun_no(String jun_no) {
		this.jun_no = jun_no;
	}
	public String getInuser() {
		return inuser;
	}
	public void setInuser(String inuser) {
		this.inuser = inuser;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "JunpyoVO [gubun=" + gubun + ", in_jun_no=" + in_jun_no + ", jun_no=" + jun_no + ", inuser=" + inuser
				+ ", indate=" + indate + "]";
	}
	
	
	
	
}

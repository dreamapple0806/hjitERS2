package kr.co.hjitERS.vo;

public class DepoVO {	

	private String depo_cd;
	private String depo_contracd;
	private String depo_bankcd;
	private String depo_account;
	
	public String getDepo_cd() {
		return depo_cd;
	}
	public void setDepo_cd(String depo_cd) {
		this.depo_cd = depo_cd;
	}
	public String getDepo_contracd() {
		return depo_contracd;
	}
	public void setDepo_contracd(String depo_contracd) {
		this.depo_contracd = depo_contracd;
	}
	public String getDepo_bankcd() {
		return depo_bankcd;
	}
	public void setDepo_bankcd(String depo_bankcd) {
		this.depo_bankcd = depo_bankcd;
	}
	public String getDepo_account() {
		return depo_account;
	}
	public void setDepo_account(String depo_account) {
		this.depo_account = depo_account;
	}
	public DepoVO(String depo_cd, String depo_contracd, String depo_bankcd, String depo_account) {
		super();
		this.depo_cd = depo_cd;
		this.depo_contracd = depo_contracd;
		this.depo_bankcd = depo_bankcd;
		this.depo_account = depo_account;
	}
	public DepoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "DepoVO [depo_cd=" + depo_cd + ", depo_contracd=" + depo_contracd + ", depo_bankcd=" + depo_bankcd
				+ ", depo_account=" + depo_account + "]";
	}
	
	
	
	
	
}

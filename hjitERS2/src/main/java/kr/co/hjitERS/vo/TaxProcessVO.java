package kr.co.hjitERS.vo;

public class TaxProcessVO {	

	private String serial;
	private String jun_no;
	private String issue_date;
	private String take_user;
	private String cu_code;
	
	private String tax_snum;
	private String proc_type;
	private String ship_amt;
	private String ship_vat;
	private String ship_tot;
	
	private String cu_sangho;
	private String cu_adcode;
	private String report_stat;
	private String transyn;
	
	public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	public String getJun_no() {
		return jun_no;
	}
	public void setJun_no(String jun_no) {
		this.jun_no = jun_no;
	}
	public String getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(String issue_date) {
		this.issue_date = issue_date;
	}
	public String getTake_user() {
		return take_user;
	}
	public void setTake_user(String take_user) {
		this.take_user = take_user;
	}
	public String getCu_code() {
		return cu_code;
	}
	public void setCu_code(String cu_code) {
		this.cu_code = cu_code;
	}
	public String getTax_snum() {
		return tax_snum;
	}
	public void setTax_snum(String tax_snum) {
		this.tax_snum = tax_snum;
	}
	public String getProc_type() {
		return proc_type;
	}
	public void setProc_type(String proc_type) {
		this.proc_type = proc_type;
	}
	public String getShip_amt() {
		return ship_amt;
	}
	public void setShip_amt(String ship_amt) {
		this.ship_amt = ship_amt;
	}
	public String getShip_vat() {
		return ship_vat;
	}
	public void setShip_vat(String ship_vat) {
		this.ship_vat = ship_vat;
	}
	public String getShip_tot() {
		return ship_tot;
	}
	public void setShip_tot(String ship_tot) {
		this.ship_tot = ship_tot;
	}
	public String getCu_sangho() {
		return cu_sangho;
	}
	public void setCu_sangho(String cu_sangho) {
		this.cu_sangho = cu_sangho;
	}
	public String getCu_adcode() {
		return cu_adcode;
	}
	public void setCu_adcode(String cu_adcode) {
		this.cu_adcode = cu_adcode;
	}
	public String getReport_stat() {
		return report_stat;
	}
	public void setReport_stat(String report_stat) {
		this.report_stat = report_stat;
	}
	public String getTransyn() {
		return transyn;
	}
	public void setTransyn(String transyn) {
		this.transyn = transyn;
	}
	public TaxProcessVO(String serial, String jun_no, String issue_date, String take_user, String cu_code,
			String tax_snum, String proc_type, String ship_amt, String ship_vat, String ship_tot, String cu_sangho,
			String cu_adcode, String report_stat, String transyn) {
		super();
		this.serial = serial;
		this.jun_no = jun_no;
		this.issue_date = issue_date;
		this.take_user = take_user;
		this.cu_code = cu_code;
		this.tax_snum = tax_snum;
		this.proc_type = proc_type;
		this.ship_amt = ship_amt;
		this.ship_vat = ship_vat;
		this.ship_tot = ship_tot;
		this.cu_sangho = cu_sangho;
		this.cu_adcode = cu_adcode;
		this.report_stat = report_stat;
		this.transyn = transyn;
	}
	public TaxProcessVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "TaxProcessVO [serial=" + serial + ", jun_no=" + jun_no + ", issue_date=" + issue_date + ", take_user="
				+ take_user + ", cu_code=" + cu_code + ", tax_snum=" + tax_snum + ", proc_type=" + proc_type
				+ ", ship_amt=" + ship_amt + ", ship_vat=" + ship_vat + ", ship_tot=" + ship_tot + ", cu_sangho="
				+ cu_sangho + ", cu_adcode=" + cu_adcode + ", report_stat=" + report_stat + ", transyn=" + transyn
				+ "]";
	}
	
	
}

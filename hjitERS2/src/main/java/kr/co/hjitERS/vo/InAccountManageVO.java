package kr.co.hjitERS.vo;

public class InAccountManageVO {

	//조회조건
	private String symd; //입급일자 시작일
	private String eymd; //입금일자 종료일
	private String cu_code;	//거래처
	private String in_except;	//제외여부
	private String in_exceptprocess;	//처리/제외여부
	
	//저장 PK
	private String istcd;	//기관코드/회원사코드 
	private String vatrsno;	//가상계좌_거래_일련번호
	private String vaxclmthcd;	//정산방법 코드

	//조회결과(HIST_VIRT_ACCT_TRORI)
	private String vir_acctno; //가상계좌번호	
	private String tran_dd;	//(거래일자)입글일자
	private String tran_hh;	//(거래시간)입금시간
	private String incom_amount; //입금금액
	private String rndclrnm;	//임금의뢰인명(입금인성명)
	private String except;	//제외여부
	private String remark;	//비고
	private String process;	//처리여부_처리시들어감
	private String serial; 	//세금계산서 번호_처리시들어감
	private String outcom_amount; 	//처리금액
	
	//조회결과(c_cust)
	private String cu_sangho;	//거래처명

	public String getSymd() {
		return symd;
	}

	public void setSymd(String symd) {
		this.symd = symd;
	}

	public String getEymd() {
		return eymd;
	}

	public void setEymd(String eymd) {
		this.eymd = eymd;
	}

	public String getCu_code() {
		return cu_code;
	}

	public void setCu_code(String cu_code) {
		this.cu_code = cu_code;
	}

	public String getIn_except() {
		return in_except;
	}

	public void setIn_except(String in_except) {
		this.in_except = in_except;
	}

	public String getIn_exceptprocess() {
		return in_exceptprocess;
	}

	public void setIn_exceptprocess(String in_exceptprocess) {
		this.in_exceptprocess = in_exceptprocess;
	}

	public String getIstcd() {
		return istcd;
	}

	public void setIstcd(String istcd) {
		this.istcd = istcd;
	}

	public String getVatrsno() {
		return vatrsno;
	}

	public void setVatrsno(String vatrsno) {
		this.vatrsno = vatrsno;
	}

	public String getVaxclmthcd() {
		return vaxclmthcd;
	}

	public void setVaxclmthcd(String vaxclmthcd) {
		this.vaxclmthcd = vaxclmthcd;
	}

	public String getVir_acctno() {
		return vir_acctno;
	}

	public void setVir_acctno(String vir_acctno) {
		this.vir_acctno = vir_acctno;
	}

	public String getTran_dd() {
		return tran_dd;
	}

	public void setTran_dd(String tran_dd) {
		this.tran_dd = tran_dd;
	}

	public String getTran_hh() {
		return tran_hh;
	}

	public void setTran_hh(String tran_hh) {
		this.tran_hh = tran_hh;
	}

	public String getIncom_amount() {
		return incom_amount;
	}

	public void setIncom_amount(String incom_amount) {
		this.incom_amount = incom_amount;
	}

	public String getRndclrnm() {
		return rndclrnm;
	}

	public void setRndclrnm(String rndclrnm) {
		this.rndclrnm = rndclrnm;
	}

	public String getExcept() {
		return except;
	}

	public void setExcept(String except) {
		this.except = except;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	public String getOutcom_amount() {
		return outcom_amount;
	}

	public void setOutcom_amount(String outcom_amount) {
		this.outcom_amount = outcom_amount;
	}

	public String getCu_sangho() {
		return cu_sangho;
	}

	public void setCu_sangho(String cu_sangho) {
		this.cu_sangho = cu_sangho;
	}

	public InAccountManageVO(String symd, String eymd, String cu_code, String in_except, String in_exceptprocess,
			String istcd, String vatrsno, String vaxclmthcd, String vir_acctno, String tran_dd, String tran_hh,
			String incom_amount, String rndclrnm, String except, String remark, String process, String serial,
			String outcom_amount, String cu_sangho) {
		super();
		this.symd = symd;
		this.eymd = eymd;
		this.cu_code = cu_code;
		this.in_except = in_except;
		this.in_exceptprocess = in_exceptprocess;
		this.istcd = istcd;
		this.vatrsno = vatrsno;
		this.vaxclmthcd = vaxclmthcd;
		this.vir_acctno = vir_acctno;
		this.tran_dd = tran_dd;
		this.tran_hh = tran_hh;
		this.incom_amount = incom_amount;
		this.rndclrnm = rndclrnm;
		this.except = except;
		this.remark = remark;
		this.process = process;
		this.serial = serial;
		this.outcom_amount = outcom_amount;
		this.cu_sangho = cu_sangho;
	}

	public InAccountManageVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "InAccountManageVO [symd=" + symd + ", eymd=" + eymd + ", cu_code=" + cu_code + ", in_except="
				+ in_except + ", in_exceptprocess=" + in_exceptprocess + ", istcd=" + istcd + ", vatrsno=" + vatrsno
				+ ", vaxclmthcd=" + vaxclmthcd + ", vir_acctno=" + vir_acctno + ", tran_dd=" + tran_dd + ", tran_hh="
				+ tran_hh + ", incom_amount=" + incom_amount + ", rndclrnm=" + rndclrnm + ", except=" + except
				+ ", remark=" + remark + ", process=" + process + ", serial=" + serial + ", outcom_amount="
				+ outcom_amount + ", cu_sangho=" + cu_sangho + "]";
	}
	
	
	
}

package kr.co.hjitERS.vo;

public class BillTransItemVO {
	private String billseq;
	private String itemseq;
	private String tax;
	private String sup;
	private String danga;
	private String vlm;
	private String unit;
	private String obj;
	private String dt;
	private String remark;
	
	private int rtn;
	
	public String getBillseq() {
		return billseq;
	}
	public void setBillseq(String billseq) {
		this.billseq = billseq;
	}
	public String getItemseq() {
		return itemseq;
	}
	public void setItemseq(String itemseq) {
		this.itemseq = itemseq;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getSup() {
		return sup;
	}
	public void setSup(String sup) {
		this.sup = sup;
	}
	public String getDanga() {
		return danga;
	}
	public void setDanga(String danga) {
		this.danga = danga;
	}
	public String getVlm() {
		return vlm;
	}
	public void setVlm(String vlm) {
		this.vlm = vlm;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getObj() {
		return obj;
	}
	public void setObj(String obj) {
		this.obj = obj;
	}
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getRtn() {
		return rtn;
	}
	public void setRtn(int rtn) {
		this.rtn = rtn;
	}
	@Override
	public String toString() {
		return "BillTransItemVO [billseq=" + billseq + ", itemseq=" + itemseq + ", tax=" + tax + ", sup=" + sup
				+ ", danga=" + danga + ", vlm=" + vlm + ", unit=" + unit + ", obj=" + obj + ", dt=" + dt + ", remark="
				+ remark + "]";
	}
	
	
	
}

package org.szx.modules.apartment.entity;

/**
 * 分店
 * @author Lenovo
 *
 */
public class Subbranch extends IdEntity{
	private String branchNo;
	private String address;
	private String remark;
	public String getBranchNo() {
		return branchNo;
	}
	public void setBranchNo(String branchNo) {
		this.branchNo = branchNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}

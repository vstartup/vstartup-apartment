package org.szx.modules.apartment.entity;

import java.util.Date;
/**
 * 预约
 * @author Lenovo
 *
 */
public class Appointment extends IdEntity {

	private User user;
	private Date appDate;
	private String phoneNumber;
	private String status;
	private Date applyDate;
	
	public Date getAppDate() {
		return appDate;
	}
	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
}

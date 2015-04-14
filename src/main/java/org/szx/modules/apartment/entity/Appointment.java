package org.szx.modules.apartment.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="vs_appointment")
public class Appointment extends AutoIdEntity {
	private long customerId;
	@Temporal(TemporalType.DATE)
	private Date appointTime;
	private String phone;
	@Column(length=16)
	private int statusCode;
	@Transient
	private String statusName;
	public String getStatusName() {
		statusName=AppointmentStatus.findStatusByCode(this.getStatusCode());
		return statusName;
	}
	@Temporal(TemporalType.DATE)
	private Date applyTime;
	@Column(length=128)
	private String remark;
	public long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}
	public Date getAppointTime() {
		return appointTime;
	}
	public void setAppointTime(Date appointTime) {
		this.appointTime = appointTime;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}

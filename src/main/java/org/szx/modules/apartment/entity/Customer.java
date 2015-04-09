package org.szx.modules.apartment.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="vs_customer")
public class Customer extends AutoIdEntity {

	private String userName;
	private String password;
	private String realName;
	private String phone;
	@Column(length=16)  
	private int statusCode;
	@Transient
	private String statusName;
	@Column(length=16)  
	private int typeCode;
	@Transient
	private String typeName;
	@Temporal(TemporalType.TIMESTAMP) 
	@Column(name="reg_date")  
	private Date regDate;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
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
		//this.statusName = CustomerStatus.findStatusNameByCode(statusCode);
		this.statusCode = statusCode;
	}
	public String getStatusName(){
		this.statusName = CustomerStatus.findStatusNameByCode(getStatusCode());
		return this.statusName;
	}
	public int getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}
	public String getTypeName(){
		this.typeName = CustomerType.findTypeByCode(getTypeCode());
		return this.typeName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
} 

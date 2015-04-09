package org.szx.modules.apartment.entity;

import java.util.List;

/**
 * 房间
 * @author Lenovo
 *
 */
public class Room extends IdEntity{

	private String roomNo;
	private String status;
	private Subbranch branch;
	private String description;
	private List<String> imgList;
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Subbranch getBranch() {
		return branch;
	}
	public void setBranch(Subbranch branch) {
		this.branch = branch;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<String> getImgList() {
		return imgList;
	}
	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}
	
}

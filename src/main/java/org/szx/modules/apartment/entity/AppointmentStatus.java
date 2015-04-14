package org.szx.modules.apartment.entity;

import java.util.HashMap;
import java.util.Map;

import org.szx.common.exception.EnumNotFoundException;

public enum AppointmentStatus {
	UNHANDLE(1,"未处理"),
	CHECKING(2,"审核中"),
	HANDLED(3,"已处理");
	private int statusCode;
	private String statusName;
	private AppointmentStatus(int code,String status) {
		this.statusCode = code;
		this.statusName = status;		
	}
	
	public static String findStatusByCode(int code){
		for(AppointmentStatus status:AppointmentStatus.values()){
			if(status.statusCode==code){
				return status.statusName;
			}
		}
		throw new EnumNotFoundException("AppointMentStatus", code);

	}
	public static Map<Integer,String> convertToMap(){
		Map<Integer,String> map=new HashMap<Integer,String>();
		for(AppointmentStatus status:AppointmentStatus.values()){
			map.put(status.statusCode, status.statusName);
		}
		return map;
	}
}

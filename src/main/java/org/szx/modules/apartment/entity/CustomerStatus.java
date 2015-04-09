package org.szx.modules.apartment.entity;

import java.util.HashMap;
import java.util.Map;

import org.szx.common.exception.EnumNotFoundException;

public enum CustomerStatus {
	NORMAL(1,"正常"),
	LOCKED(2,"锁定");
	private CustomerStatus(int code, String status){
		this.code = code;
		this.status = status;
	}
	private int code;
	private String status;
	/**
	 * 通过code查找类型
	 * @param code
	 * @return
	 */
	public static String findStatusNameByCode(int code){
		for(CustomerStatus status : CustomerStatus.values()){
			if(status.code == code){
				return status.status;
			}
		}
		throw new EnumNotFoundException("CustomerStatus",code);
	}
	public static Map<Integer,String> convertToMap(){
		Map<Integer,String> map = new HashMap<Integer,String>();
		for(CustomerStatus status : CustomerStatus.values()){
			map.put(status.code, status.status);
		}
		return map;
	}
}

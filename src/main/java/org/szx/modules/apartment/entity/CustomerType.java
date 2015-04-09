package org.szx.modules.apartment.entity;

import java.util.HashMap;
import java.util.Map;

import org.szx.common.exception.EnumNotFoundException;

public enum CustomerType {
	NORMAL(1,"普通会员"),
	TENANT(2,"租户");
	private CustomerType(int code, String type){
		this.code = code;
		this.type = type;
	}
	private int code;
	private String type;
	
	/**
	 * 通过code查找类型
	 * @param code
	 * @return
	 */
	public static String findTypeByCode(int code){
		for(CustomerType type : CustomerType.values()){
			if(type.code == code){
				return type.type;
			}
		}
		throw new EnumNotFoundException("CustomerType",code);
	}
	public static Map<Integer,String> convertToMap(){
		Map<Integer,String> map = new HashMap<Integer,String>();
		for(CustomerType type : CustomerType.values()){
			map.put(type.code, type.type);
		}
		return map;
	}
}

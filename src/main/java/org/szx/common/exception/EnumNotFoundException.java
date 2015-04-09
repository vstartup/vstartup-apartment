package org.szx.common.exception;


public class EnumNotFoundException extends BaseRuntimeException{
	private static final long serialVersionUID = -5898856762029680772L;
	
	public EnumNotFoundException(String name,int code){
		this(String.format("Can not found enum {%s} us code[{%d}]",name,code));
	}
	public EnumNotFoundException(String message,Object... params){
		super(String.format(message,params));
	}
	public EnumNotFoundException(String code,String[] params){
		super(code,params);
	}
}

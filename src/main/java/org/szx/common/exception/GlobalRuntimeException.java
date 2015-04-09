package org.szx.common.exception;

/**
 全局的运行异常定义
 对于没有明确含义的运行异常可以统一使用该异常，必须在构造函数提供异常描述的代码和参数
 */
public class GlobalRuntimeException extends BaseRuntimeException{
	private static final long serialVersionUID = -4243351801813509605L;
	public GlobalRuntimeException(String message,Exception e){
		super(message,e);
	}
	public GlobalRuntimeException(String code,String[] params){
		super(code,params);
	}
}

package org.szx.common.exception;


import org.apache.commons.lang.StringUtils;


/**
 运行时类型异常基础类
 */
public class BaseRuntimeException extends RuntimeException implements
		BizException {
	private static final long serialVersionUID = 5806782400259918073L;

	private String code;

	private String[] params;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String[] getParams() {
		return params;
	}

	public void setParams(String[] params) {
		this.params = params;
	}

	public BaseRuntimeException() {
		super();
	}

	public BaseRuntimeException(String message, Exception e) {
		super(message, e);
	}

	public BaseRuntimeException(String message) {
		super(message);
	}

	public BaseRuntimeException(Exception e) {
		super(e);
	}

	public BaseRuntimeException(String code, String[] params) {
		super(code);
		this.setCode(code);
		this.setParams(params);
	}

	/* (non-Javadoc)
	 * @see java.lang.Throwable#getMessage()
	 */
	@Override
	public String getMessage() {
		if (code == null || code.length() == 0) {
			return super.getMessage();
		}
		String paramsStr = "NA";
		if (params != null) {
			paramsStr = StringUtils.join(params, ",");
		}
		String codeMessage = "code:" + code + ";parameters:" + paramsStr;
		return codeMessage;
	}

	public String toString() {
		String s = getClass().getName();
		String message = this.getMessage();
		return (message != null) ? (s + ": " + message) : s;
	}
}

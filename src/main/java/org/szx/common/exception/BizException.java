package org.szx.common.exception;


/**
 Business exception interface
 */
public interface BizException {
	public String getCode();

	public String[] getParams();
}

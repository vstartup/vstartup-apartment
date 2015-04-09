/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package org.szx.modules.apartment.web.interceptor;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springside.modules.mapper.JsonMapper;

/**
 * 打印页面访问日志，格式为:
 * {当前阶段}{目标handler}
 *
 */
@Component
public class HandlerInterceptorLogger {
	public static final String VIEW_LOGGER_NAME = "view";

	private Logger viewLogger = LoggerFactory.getLogger(VIEW_LOGGER_NAME);

	public void log(String action, String handleName) {
		viewLogger.info("view-process:{},target-handler:{}", action, handleName);
	}
}

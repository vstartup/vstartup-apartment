package org.szx.common.utils;

import java.util.Iterator;
import java.util.Locale;
import java.util.Map;



import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.support.AopUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.NoSuchMessageException;
import org.szx.common.exception.GlobalRuntimeException;
public class AppServiceHelper {

	private static final Log logger = LogFactory.getLog(AppServiceHelper.class);
	private static ApplicationContext applicationContext;
	
	public static boolean initialized = false;
	
	public static void setApplicationContext(ApplicationContext appCtxIn){
		applicationContext=appCtxIn;
		initialized = true;
	}
	
			
	public static Object findBean(String beanId) throws GlobalRuntimeException {
		
		Object service = null;
		try {			
			service = applicationContext.getBean(beanId);
		} catch (NoSuchBeanDefinitionException ex) {
			throw new GlobalRuntimeException("no such bean for["+beanId+"]", ex);
		} catch (BeansException ex) {
			throw new GlobalRuntimeException("bean exception for["+beanId+"]", ex);
		}
		return service;
	}

	
	
	public static String getMessage(String key, Object[] params, Locale locale) {
	    if(locale==null){
	        locale=new Locale("zh_CN");
	    }
	    if (!initialized || applicationContext == null) {
	    	StringBuffer sb = new StringBuffer("Message(");
	    	sb.append(key);
	    	sb.append(" Params: ");
	    	if (params != null)
	    	for (int i=0; i<params.length; i++) {
	    		sb.append(params[i] + ",");
	    	}
	    	return sb.toString();
	    }
	    String i18n="";
	    try {
            i18n=applicationContext.getMessage(key, params, locale);
        } catch (NoSuchMessageException e) {
            logger.error("i18n definition for ["+key+"] not found in properties file.",e);
        }
		return i18n;
	}

	   public static String getMessageDirect(String key, Object[] params, Locale locale) {
	        if(locale==null){
	            locale=new Locale("zh_CN");
	        }
	        return applicationContext.getMessage(key, params, locale);
	    }
}

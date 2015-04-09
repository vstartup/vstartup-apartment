package org.szx.modules.apartment.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.NamedThreadLocal;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * spring mvc的自定义拦截器
 * 记录controller访问情况，访问路径及处理过程输出
 * @author Lenovo
 *
 */
public class DefaultLogInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private HandlerInterceptorLogger interceptorLogger;
	//线程绑定变量，当前请求线程只可以访问自己的数据
	private NamedThreadLocal<String> localThread = new NamedThreadLocal<String>("HandlerDescription");
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		interceptorLogger.log("afterCompletion", localThread.get());
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		interceptorLogger.log("postHandle", localThread.get());
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if(handler!=null && handler instanceof HandlerMethod){
			HandlerMethod hMethod = (HandlerMethod)handler;
			localThread.set(String.format("%s.%s",hMethod.getBeanType().getSimpleName(), hMethod.getMethod().getName()));
			
		}else{
			localThread.set(handler==null?"":handler.toString());
		}
		interceptorLogger.log("preHandle",  localThread.get());
		
		return true;
	}

	
}

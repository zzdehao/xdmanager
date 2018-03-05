package com.tf.tadmin.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tf.tadmin.entity.Log;
import com.tf.tadmin.service.LogService;
import com.tf.tadmin.utils.JsonUtils;

/**
 * 
 * 系统日志拦截器
 * 
 * @author mo.xf
 *
 */
public class SystemLoggerInterceptor implements HandlerInterceptor {
	private static Logger logger = LoggerFactory.getLogger(SystemLoggerInterceptor.class) ;
	
	@Resource
	private LogService logService ;
	
	private long startTime ;
	
	private long endTime ;
	
	private List<String> exclusiveUrl ;
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		this.startTime = System.currentTimeMillis() ;
		
		logger.debug("preHandle:"+handler.getClass()) ;
		
		logger.info("User-Agent:" +request.getHeader("User-Agent")); 
		logger.info("URI:" +request.getRequestURI()); 
		logger.info("RemoteAddr" +request.getRemoteAddr());
		logger.info("Repuest Parameter:" + request.getParameterMap() );;
		return true;
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(modelAndView != null){
			logger.info("Result View:" + modelAndView.getViewName() );
			logger.info("Result Model Map:" + modelAndView.getModelMap());
		}
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("handler class:{}" , handler.getClass().getName());
		if(exclusiveUrl != null && this.exclusive(request.getServletPath())){
			return ;
		}
		
		if(!(handler instanceof HandlerMethod)){
			return ;
		}
		
		HandlerMethod handlerMethod = (HandlerMethod)handler ;
		endTime = System.currentTimeMillis() ;
		
		logger.info("Excetue Time:" + (endTime - startTime)) ;
		
		Log log = new Log();
		//log.setCreateTime(DateUtils.formatDateTime(System.currentTimeMillis())) ;
		log.setIp(request.getRemoteAddr()) ;
		log.setExecuteTime(endTime-startTime) ;
		log.setMethod(handlerMethod.getMethod().getName());
		log.setClassname(handlerMethod.getBeanType().getName()) ;
		log.setType("SYSTEM");
		log.setParams(JsonUtils.writeValueAsString(request.getParameterMap())) ;
		log.setUrl(request.getServletPath()) ;
		//log.setSessionid(request.getSession().getId()) ;
		log.setAgent(request.getHeader("User-Agent"));
		try{
			Subject subject = SecurityUtils.getSubject() ;
			if(subject != null){
					log.setSessionid(subject.getSession().getId().toString());
			}
		}catch(Exception e){}
		
		if(ex!= null){
			log.setRemark("Message:" + ex.getMessage()+",Cause:" + ex.getCause()) ;
		}
		logService.insert(log) ;
		
		logger.info("Request Completion");
	}

	public List<String> getExclusiveUrl() {
		return exclusiveUrl;
	}

	public void setExclusiveUrl(List<String> exclusiveUrl) {
		this.exclusiveUrl = exclusiveUrl;
	}
	
	private boolean exclusive(String url) {
		if(exclusiveUrl.contains(url)){
			return true ;
		}
		for (String str : exclusiveUrl) {
			if (str.endsWith("*")) {
				if (url.startsWith(str.substring(0, str.length() - 1))) {
					return true;
				}
			} 
		}
		return false;
	}
}

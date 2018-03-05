package com.tf.tadmin.controller;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tf.tadmin.entity.SessionUser;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.utils.Constants;
@Component
public class BaseController {

    //定位应用的省份id
    @Value("${location.provinceCode}")
    private String provinceCode ;


	/**
	 * @param url
	 * @return
	 */
	protected String redirect(String url){
		return "redirect:" + url ;
	}
	
	/**
	 * 
	 * @param url
	 * @return
	 */
	protected String forward(String url){
		return "forward:" + url ;
	}
	
	protected Message returnSuccess(){
		Message message = new Message(true, "操作成功!") ;
		return message ;
	}
	
	protected Message returnFail(String msg){
		Message message = new Message(false, msg) ;
		return message ;
	}
	
	protected Message returnFail(){
		return this.returnFail("操作失败!") ;
	}
	
	/**
     * 写出数据
     * @param res 输出的字符串
     * @throws Exception
     */
    protected void write(String res, HttpServletResponse response) throws Exception {
        Writer writer = null;
        try {
        	res = (null == res?"":res);
        	response.setCharacterEncoding("UTF-8");
    		response.setHeader("Content-type", "text/html;charset=UTF-8");  
            writer = response.getWriter();
            //logger.debug("输出JSON字符串："+res);
            writer.write(res);
        } catch (IOException e) {
            //logger.error("输出JSON字符串异常");
            throw new Exception("write json string error");
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    //logger.error("关闭输出流异常,无法关闭会导致内存溢出");
                }
            }
        }
    }
    
    protected  void fileDownload(final HttpServletResponse response, File file, String fileName) throws Exception{  
        byte[] data = FileUtil.readAsByteArray(file) ;
        fileName = URLEncoder.encode(fileName, "UTF-8");  
        response.reset();  
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");  
        response.addHeader("Content-Length", "" + data.length);  
        response.setContentType("application/octet-stream;charset=UTF-8");  
        OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());  
        outputStream.write(data);  
        outputStream.flush();  
        outputStream.close();  
    } 
    
    protected String addLike(String condition){
    	if(StringUtils.isEmpty(condition)){
    		return null ;
    	}else{
    		return "%" + condition + "%" ;
    	}
    }
    
    /**
     * 设置后台管理页面
     * @param mav
     * @param viewName
     */
    protected void setAdminView(ModelAndView mav, String viewName) {
    	mav.setViewName(Constants.ADMIN_TPL + viewName); 
	}
    protected HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }
    protected HttpServletRequest getRequestConfig() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

   protected  SessionUser getCurrentUser(){
       HttpSession session = this.getRequest().getSession();
       SessionUser user = null;
       user =(SessionUser)session.getAttribute("loginUser");
       return user;
   }
}

package com.tf.tadmin.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tf.tadmin.entity.Upload;
import com.tf.tadmin.service.UploadService;
import com.tf.tadmin.utils.DateUtils;
import com.tf.tadmin.utils.UUIDGenerator;

/**
 * 
 *
 *
 * @date 2015年12月25日
 *
 * @author mo.xf
 *
 */
@Controller
@RequestMapping(value="/upload")
public class UploadController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(UploadController.class) ;
	
	@Resource
	private UploadService uploadService ;
	
	@Value("${upload.dir}")
	private String uploadDir ;
	
	@RequestMapping(value="/upload", method={RequestMethod.GET , RequestMethod.POST})  
	public @ResponseBody Upload upload(@RequestParam MultipartFile multipartFile,HttpServletRequest req,Upload upload ) throws Exception{  
		 logger.info("文件长度: " + multipartFile.getSize());  
         logger.info("文件类型: " + multipartFile.getContentType());  
         logger.info("文件名称: " + multipartFile.getName());  
         logger.info("文件原名: " + multipartFile.getOriginalFilename()); 
         
         String date = DateUtils.formatDateTime(new Date().getTime(),DateUtils.DATE_FORMAT)  ;
         String realPath = req.getSession().getServletContext().getRealPath(this.uploadDir)+File.separator+date;
         String fileName = UUIDGenerator.getUUID() ;
         if(multipartFile.getOriginalFilename().lastIndexOf(".") > 0){
        	 fileName += multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".") ) ;
         }
         
         FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),new File(realPath, fileName) );  
         String path = req.getContextPath()+this.uploadDir+File.separator+date+File.separator+fileName ;
         
         upload.setPath(path);
         this.uploadService.save(upload) ;
         
         return upload ;
	}
	
	@RequestMapping(value="/get/{id}", method={RequestMethod.GET , RequestMethod.POST})  
	public @ResponseBody String get(Integer id){
		Upload upload =  this.uploadService.queryById(id) ;
		return upload.getPath() ;
	}

}

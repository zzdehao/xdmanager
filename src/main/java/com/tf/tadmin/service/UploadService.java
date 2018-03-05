package com.tf.tadmin.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tf.tadmin.entity.Upload;
import com.tf.tadmin.mapper.UploadMapper;

@Service
public class UploadService extends BaseService {
	
	private static Logger logger = Logger.getLogger(UploadService.class) ;
	@Resource
	private UploadMapper uploadMapper ;
	
	public Upload queryById(int id) {
		return this.uploadMapper.queryById(id) ;
	}
	
	public Upload queryByTypeAndrefid(String type , int refid) {
		return this.uploadMapper.queryByTypeAndrefid(type, refid) ;
	}
	
	public int insert(Upload upload){
		return this.uploadMapper.insert(upload) ;
	}
	
	public int update(Upload upload) {
		return this.uploadMapper.update(upload) ;
	}
	
	public int save(Upload upload){
		
		logger.info("Upload:" + upload);
		int result = 0;
		//新增
		if(upload.getRefid() == null){
			result=this.uploadMapper.insert(upload) ;
		}else{
			//修改
			if(upload.getId() == null){
				result=this.uploadMapper.insert(upload) ;
			}else{
				Upload u = this.queryById(upload.getId()) ;
				u.setRefid(null) ;
				this.uploadMapper.update(u);
				result=this.uploadMapper.insert(upload) ;
			}
		}
		return result ;
	}
	
	public int delete(int id) {
		return this.uploadMapper.delete(id) ;
	}
	
	public int delete(String type , int refid) {
		return this.uploadMapper.deleteByTypeAndrefid(type, refid) ;
	}
	
	public int updateRefid(String type , int refid){
		return this.uploadMapper.updateRefid(type , refid) ;
	}
}

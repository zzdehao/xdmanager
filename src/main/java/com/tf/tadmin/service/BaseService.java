package com.tf.tadmin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.util.ObjectUtils;

import com.tf.tadmin.mapper.BaseMapper;


/**
 * 
 * Service基类，所有的Service都继承此类
 *
 */
@SuppressWarnings("unchecked")
public class BaseService {
	@SuppressWarnings("rawtypes")
	@Resource
	private BaseMapper baseMapper ;
	
	/**
	 * 
	 * 唯一性检查
	 * 
	 * @param table
	 * @param condition
	 * @param value
	 * @param id
	 * @param isModify 是否修改
	 * @return
	 */
	public boolean uniquenessCheck(String table , String condition ,Object value , Object id , boolean isModify){
		if(value == null) return true ;
		boolean result = false ;
		List<Object> list = this.baseMapper.queryByField("id", table, condition, value) ;
		if(list.size() == 0){
			result = true ;
		}else if(list.size() == 1){
			if(isModify && ObjectUtils.nullSafeEquals(id, list.get(0))){
				result = true ;
			}
		}
		return result ;
	}
	
	protected Map<String ,Object> param(){
		return new HashMap<String ,Object>() ;
	}
}

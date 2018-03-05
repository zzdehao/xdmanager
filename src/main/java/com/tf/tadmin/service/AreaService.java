package com.tf.tadmin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tf.tadmin.entity.Area;
import com.tf.tadmin.mapper.AreaMapper;

@Service
public class AreaService extends BaseService {
	@Resource
	private AreaMapper areaMapper ;
	
	public List<Area> queryList(Integer parentId ,Integer status , Integer level) {
		return this.areaMapper.queryList(parentId, status, level) ;
	}
	
	public int updateStatus(Integer id , Integer status){
		return this.areaMapper.updateStatus(id, status) ;
	}
}

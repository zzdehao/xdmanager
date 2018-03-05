package com.tf.tadmin.mapper;

import java.util.List;

import com.tf.tadmin.entity.Resource;
import org.springframework.stereotype.Repository;

@Repository
public interface ResourceMapper extends BaseMapper<Resource, Integer>{
	public List<Resource> getResourceByRole(int roleId) ;
	
	public List<Resource> list() ;
	
	public List<Resource>  getResourceByMenu(String mid) ;
	
	public int deleteForMenu(String mid);
}

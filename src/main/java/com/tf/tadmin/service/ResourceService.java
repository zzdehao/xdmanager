package com.tf.tadmin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.tadmin.entity.Resource;
import com.tf.tadmin.entity.ResourceType;
import com.tf.tadmin.mapper.ResourceMapper;
import com.tf.tadmin.mapper.RoleMapper;
import com.tf.tadmin.utils.Constants;

/**
 * 
 *
 *
 * @date 2015年12月29日
 *
 * @author mo.xf
 *
 */
@Service
public class ResourceService extends BaseService {
	@Autowired
	private ResourceMapper resourceMapper;

    @Autowired
	private RoleMapper roleMapper ;
	
	private List<ResourceType> resourceTypeList = new ArrayList<ResourceType>() ;
	
	private Map<String, Integer> resourceTypeSortMap = null ;
	
	@PostConstruct
	public void init(){
		resourceTypeSortMap = new HashMap() ;
		
		resourceTypeList.add(new ResourceType("view","查看")) ;
		resourceTypeList.add(new ResourceType("add","增加")) ;
		resourceTypeList.add(new ResourceType("edit","编辑")) ;
		resourceTypeList.add(new ResourceType("del","删除")) ;
		resourceTypeList.add(new ResourceType("status","更新状态")) ;
		resourceTypeList.add(new ResourceType("passwd","修改密码")) ;
		resourceTypeList.add(new ResourceType("check","审核")) ;
		resourceTypeList.add(new ResourceType("uncheck","反审核")) ;
		
		resourceTypeSortMap.put("view", 1) ;
		resourceTypeSortMap.put("add", 2) ;
		resourceTypeSortMap.put("edit", 3) ;
		resourceTypeSortMap.put("del", 4) ;
		resourceTypeSortMap.put("status", 5) ;
		resourceTypeSortMap.put("passwd", 6) ;
		resourceTypeSortMap.put("check", 7) ;
		resourceTypeSortMap.put("uncheck", 8) ;
	}

	public List<Resource> getResourceByRole(int roleId) {
		return resourceMapper.getResourceByRole(roleId);
	}
	
	public List<Resource> list(){
		return this.resourceMapper.list() ;
	}
	
	public List<Resource>  getResourceByMenu(String mid){
		return this.resourceMapper.getResourceByMenu(mid) ;
	}
	
	public List<String>  getResourceNameByMenu(String mid){
		List<String> ret = new ArrayList<String>() ;
		List<Resource> list = this.resourceMapper.getResourceByMenu(mid) ;
		for(Resource resource : list){
			String key = resource.getKey() ;
			String name = resource.getName() ;
			int index = key.lastIndexOf(Constants.RESOURCE_DELIMITER) ;
			if(index > 0){
				key = key.substring(index+1) ;
			}
			ret.add(key +Constants.RESOURCE_DELIMITER + name) ;
		}
		return ret ;
	}
	
	public Integer insert(Resource resource){
		return this.resourceMapper.insert(resource) ;
	}
	
	public Integer del(Integer id){
		this.roleMapper.rolePermissionDeleteForResource(id) ;
		return this.resourceMapper.delete(id) ;
	}
	
	/**
	 * 
	 * 保存所有的资源
	 * 
	 * @param list
	 * @param mid
	 * @return
	 */
	public void saveAll(List<Resource> list ,String mid){
		List<Resource> oldList = this.getResourceByMenu(mid) ;
		if(oldList == null || oldList.size() ==0){
			for(Resource resource : list){
				this.resourceMapper.insert(resource) ;
			}
		}else{
			for(Resource resource : list){
				if(!oldList.remove(resource)){
					this.resourceMapper.insert(resource) ;
				}
			}
			
			for(Resource resource : oldList){
				this.resourceMapper.delete(resource.getId()) ;
			}
		}
	}
	
	public void deleteForMenu(String mid){
		//return this.resourceMapper.deleteForMenu(mid) ;
		List<Resource>  list = this.getResourceByMenu(mid) ;
		for(Resource resource : list){
			this.del(resource.getId()) ;
		}
	}
	
	public List<ResourceType> getResourceType(){
		return resourceTypeList ;
	}
	
	public Integer getResourceTypeSort(String key){
		return resourceTypeSortMap.get(key) ;
	}
}

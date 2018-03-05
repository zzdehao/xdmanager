package com.tf.tadmin.mapper;

import java.util.List;

import com.tf.tadmin.entity.Menu;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuMapper {
	public List<Menu> queryList() ;
	
	public List<Menu> queryListByUser(Integer userid) ;
	
	public List<Menu> combotree(String path) ;
	
	public Menu queryById(String id) ;
	
	public List<Menu> queryByPid(String pid) ;
	
	public int insert(Menu menu) ;
	
	public int update(Menu menu) ;
	
	public int delete(String id) ;
}

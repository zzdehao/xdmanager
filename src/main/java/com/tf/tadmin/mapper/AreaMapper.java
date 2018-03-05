package com.tf.tadmin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tf.tadmin.entity.Area;
import org.springframework.stereotype.Repository;

@Repository
public interface AreaMapper{
	public List<Area> queryList(@Param("parentId") Integer parentId, @Param("status") Integer status, @Param("level") Integer level) ;
	
	public int updateStatus(@Param("id") Integer id, @Param("status") Integer status) ;
}

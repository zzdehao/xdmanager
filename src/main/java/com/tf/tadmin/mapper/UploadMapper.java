package com.tf.tadmin.mapper;

import org.apache.ibatis.annotations.Param;

import com.tf.tadmin.entity.Upload;
import org.springframework.stereotype.Repository;


/**
 * 
 * @author MoXiaoFeng
 *
 */
@Repository
public interface UploadMapper {
	
	public Upload queryById(int id) ;
	
	public Upload queryByTypeAndrefid(@Param("type") String type, @Param("refid") int refid) ;
	
	public int insert(Upload upload) ;
	
	public int update(Upload upload) ;
	
	public int delete(int id) ;
	
	public int deleteByTypeAndrefid(@Param("type") String type, @Param("refid") int refid) ;
	
	public int updateRefid(@Param("type") String type, @Param("refid") int refid);

}

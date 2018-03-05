package com.tf.tadmin.mapper;


import org.apache.ibatis.annotations.Param;

import com.tf.tadmin.entity.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AdminMapper extends BaseMapper<Admin,Integer>{
	public Admin queryByLogin(@Param("login") String login) ;
    public Admin getByRoleCode(Admin admin) ;

    public List<Admin> queryPageList(Map<String, Object> map) ;

    public int pageCount(Map<String, Object> map) ;


}

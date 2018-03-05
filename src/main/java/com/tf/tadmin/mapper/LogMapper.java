package com.tf.tadmin.mapper;

import com.tf.tadmin.entity.Log;
import org.springframework.stereotype.Repository;

/**
 * 
 * 日志管理
 * 
 * @author mo.xf
 *
 */
@Repository
public interface LogMapper extends BaseMapper<Log, Integer>{
	
	public int delLogForDate(String date) ;

}

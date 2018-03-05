package com.tf.tadmin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.tf.tadmin.entity.Log;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.entity.ParamMap;
import com.tf.tadmin.mapper.LogMapper;
import com.tf.tadmin.utils.Constants;
import com.tf.tadmin.utils.DateUtils;

/**
 * 
 *
 *
 * @date 2016年1月11日
 *
 * @author mo.xf
 *
 */
@Service
public class LogService {
	@Resource
	private LogMapper logMapper ;
	
	public int insert(Log log){
		return logMapper.insert(log) ;
	}
	
	public Pager<Log> queryList(Integer start,String minDate,String maxDate){
		Pager<Log> pager = new Pager<Log>() ;
		ParamMap paramMap = ParamMap.create() ;
		paramMap.put("start", start) ;
		paramMap.put("rows", Constants.PAGE_SIZE) ;
		paramMap.put("sort", "create_time") ;
		paramMap.put("order", "desc") ;
		if(StringUtils.hasText(minDate)){
			paramMap.put("minDate", minDate) ;
		}
		if(StringUtils.hasText(maxDate)){
			paramMap.put("maxDate", DateUtils.addDay(1, maxDate)) ;
		}
		
		List<Log> rows = this.logMapper.queryList(paramMap) ;
		
		pager.setRows(rows);
		pager.setTotal(logMapper.count(paramMap));
		return pager ;
	}
	
	public int delLogForDate(String date){
		return this.logMapper.delLogForDate(date) ;
	}
}

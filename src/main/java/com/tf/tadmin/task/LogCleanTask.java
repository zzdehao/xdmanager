package com.tf.tadmin.task;

import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.tf.tadmin.service.LogService;
import com.tf.tadmin.utils.DateUtils;

/**
 * 
 * 日志定时清理器
 *
 * @date 2016年1月4日
 *
 * @author mo.xf
 *
 */
@Component
public class LogCleanTask implements Task {
	private static final Logger LOG = LoggerFactory.getLogger(LogCleanTask.class) ;
	
	/**
	 * 日志保留天数
	 */
	@Value("${log.save.day}")
	private Integer logSaveDay ;
	
	@Resource
	private LogService LogService ;

	@Scheduled(cron = "0 5 0 * * ?")
//	@Scheduled(fixedDelay = 10000)
	@Override
	public void run() {
		LOG.info("log clean task start!");
		
		String date = DateUtils.dateFormat(DateUtils.addDay(-logSaveDay, new Date())) ;
		int ret = LogService.delLogForDate(date) ;
		LOG.info("clean log total:{}" , ret);
		LOG.info("log clean task end!");
	}

}

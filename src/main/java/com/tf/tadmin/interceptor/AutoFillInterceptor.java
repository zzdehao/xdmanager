package com.tf.tadmin.interceptor;

import java.beans.PropertyDescriptor;
import java.util.Date;
import java.util.Properties;


import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.slf4j.LoggerFactory;

import com.tf.tadmin.entity.Entity;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.DateUtils;


/**
 * 
 * 主要为新增与修改时填写新增时间,人及修改时间,人
 * 
 * @author mo.xf
 * 
 * @since 1.0
 *
 */
@Intercepts({
	@Signature(type = Executor.class, method = "update", args = { MappedStatement.class, Object.class }) 
	})
public class AutoFillInterceptor implements Interceptor {
	private static org.slf4j.Logger logger = LoggerFactory.getLogger(AutoFillInterceptor.class) ;
	
	private Properties properties ;

	public Object intercept(Invocation invocation) throws Throwable {
		MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
		SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType() ;
		logger.debug("sqlCommandType:" + sqlCommandType) ;
		//判断是否新增与更新
		if(sqlCommandType.equals(SqlCommandType.INSERT) || sqlCommandType.equals(SqlCommandType.UPDATE)){
			if(invocation.getArgs().length > 1){
				Object parameter = invocation.getArgs()[1];
				logger.debug("parameter type:" + parameter.getClass().getName()) ;
				if(parameter instanceof Entity){
					Entity entity = (Entity)parameter ;
					String userid = "";
					try{
//						 HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//					     HttpSession session = request.getSession();
//					     SessionUser sessionUser = (SessionUser)session.getAttribute("sessionUser") ;
//					     userid = sessionUser.getName() ;
						
						SessionUser sessionUser = ShiroUtils.getSessionUser() ;
						if(sessionUser != null){
							userid = sessionUser.getName() ;
						}
					}catch(Exception e){
						//e.printStackTrace() ;
						logger.debug("Get userid exception:{}" ,e) ;
					}
					logger.debug("userid:" + userid ) ;
					
					PropertyDescriptor createTime = new PropertyDescriptor((String)properties.get("createTime") , Entity.class);
					PropertyDescriptor createUser = new PropertyDescriptor((String)properties.get("createUser") , Entity.class);
					PropertyDescriptor updateTime = new PropertyDescriptor((String)properties.get("updateTime") , Entity.class);
					PropertyDescriptor updateUser = new PropertyDescriptor((String)properties.get("updateUser") , Entity.class);
					
					if(sqlCommandType.equals(SqlCommandType.INSERT)){
						createTime.getWriteMethod().invoke(entity, DateUtils.formatDateTime(new Date())) ;
						createUser.getWriteMethod().invoke(entity, userid) ;
						
						updateTime.getWriteMethod().invoke(entity, DateUtils.formatDateTime(new Date())) ;
						updateUser.getWriteMethod().invoke(entity, userid) ;
					}else if(sqlCommandType.equals(SqlCommandType.UPDATE)){
						updateTime.getWriteMethod().invoke(entity, DateUtils.formatDateTime(new Date())) ;
						updateUser.getWriteMethod().invoke(entity, userid) ;
					}
				}
			}
		}
		
		return invocation.proceed();
	}

	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	public void setProperties(Properties properties) {
		this.properties = properties ;
	}

}

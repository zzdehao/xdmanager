package com.tf.tadmin.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.utils.Constants;

/**
 * 
 *
 *
 * @date 2015年12月28日
 *
 * @author mo.xf
 *
 */
public class ShiroUtils {
	public static SessionUser getSessionUser(){
		Subject sbject = SecurityUtils.getSubject() ;
		SessionUser sessionUser = (SessionUser)sbject.getPrincipal() ;
		return sessionUser ;
	}
	
	public static boolean isSupperManager(){
		boolean result = false ;
		SessionUser sessionUser = getSessionUser() ;
		if(sessionUser != null && Constants.SUPPER_MANAGER.equals(sessionUser.getName())){
			result = true ;
		}
		return result ;
	}
}

package com.tf.tadmin.shiro;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 
 *
 *
 * @date 2015年12月29日
 *
 * @author mo.xf
 *
 */
public class NoPermissionException extends AuthenticationException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4705770515358563433L;

	public NoPermissionException() {
		super();
	}

	public NoPermissionException(String message, Throwable cause) {
		super(message, cause);
	}

	public NoPermissionException(String message) {
		super(message);
	}

	public NoPermissionException(Throwable cause) {
		super(cause);
	}
}

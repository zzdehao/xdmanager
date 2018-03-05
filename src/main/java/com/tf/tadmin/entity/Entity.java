package com.tf.tadmin.entity;

/**
 * 
 * 将用户与时间抽出来
 * 
 * @author mo.xf
 *
 */
public abstract class Entity {
	/**
	 * 创建时间
	 */
	protected String create_time ;
	
	/**
	 * 更新时间
	 */
	protected String update_time ;
	
	/**
	 * 创建人
	 */
	protected String create_user ;
	
	/**
	 * 修改人
	 */
	protected String update_user ;
	
	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public String getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
}

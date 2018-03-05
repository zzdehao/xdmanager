package com.tf.tadmin.entity;

/**
 * 
 * Tree Model 基类
 *
 */
public class BaseTreeEntity extends Entity{
	protected String id ;
	
	/**
	 * 上级ID
	 */
	protected String pid ;
	
	/**
	 * 路径
	 */
	protected String path ;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}

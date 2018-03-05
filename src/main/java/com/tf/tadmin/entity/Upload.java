package com.tf.tadmin.entity;

public class Upload extends BaseEntity {
	/**
	 * 类型
	 */
	private String type ;
	/**
	 * 引用ID
	 */
	private Integer refid ;
	
	/**
	 * 路径
	 */
	private String path;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getRefid() {
		return refid;
	}

	public void setRefid(Integer refid) {
		this.refid = refid;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}

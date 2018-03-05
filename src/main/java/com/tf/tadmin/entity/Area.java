package com.tf.tadmin.entity;

/**
 * 
 * 地区管理
 *
 */
public class Area {
	private Integer id ;
	private Integer parentId ;
	private String name ;
	private String shortName ;
	
	/**
	 * 经度
	 */
	private float longitude ;
	
	/**
	 * 纬度
	 */
	private float latitude ;
	
	/**
	 * 等级(1省/直辖市,2地级市,3区县,4镇/街道)
	 */
	private Integer level ;
	
	/**
	 * 排序
	 */
	private Integer sort ;
	
	/**
	 * 状态(0禁用/1启用)
	 */
	private Integer status ;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}

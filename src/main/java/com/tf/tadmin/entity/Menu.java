package com.tf.tadmin.entity;

import java.util.List;

/**
 * 
 * 菜单管理
 *
 * @date 2015年12月28日
 *
 * @author mo.xf
 *
 */
public class Menu extends BaseTreeEntity {
	private String name ;
	
	/**
	 * 类型：1,系统菜单
	 */
	private Integer type ;
	
	private Integer sort ;
	
	/**
	 * 是否可用：1,可用,2不可用
	 */
	private Integer enable;
	
	/**
	 * URL
	 */
	private String  url;
	
	/**
	 * 图标
	 */
	private String  icon;
	
	private String key ;
	
	private String  remark;
	
	/**
	 * 是否选择
	 */
	private boolean isSelected ;
	
	/**
	 * 菜单资源
	 */
	private List<String> resource ;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getEnable() {
		return enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public boolean isSelected() {
		return isSelected;
	}

	public void setSelected(boolean isSelected) {
		this.isSelected = isSelected;
	}

	public List<String> getResource() {
		return resource;
	}

	public void setResource(List<String> resource) {
		this.resource = resource;
	}
}

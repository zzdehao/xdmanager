package com.tf.tadmin.entity;

/**
 * 
 * 资源管理
 *
 * @date 2015年10月21日
 *
 * @author mo.xf
 *
 */
public class Resource extends BaseEntity{
	private String key ;
	
	private String name ;
	
	private String menuId ;
	
	/**
	 * 是否选择
	 */
	private boolean isSelected ;
	
	/**
	 * 排序
	 */
	private Integer sort ;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public boolean isSelected() {
		return isSelected;
	}

	public void setSelected(boolean isSelected) {
		this.isSelected = isSelected;
	}
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Resource){
			try{
				Resource r = (Resource)obj ;
				if(this.key.equals(r.getKey()) && this.menuId.equals(r.getMenuId())){
					return true ;
				}
			}catch(Exception e){}
		}
		return false ;
	}
}

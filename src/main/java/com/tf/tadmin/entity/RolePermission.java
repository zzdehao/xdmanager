package com.tf.tadmin.entity;

/**
 * 
 * 角色权限
 *
 * @date 2015年12月28日
 *
 * @author mo.xf
 *
 */
public class RolePermission extends BaseEntity{
	private Integer roleId ;
	private Integer resourceId ;
	
	public RolePermission(){}
	
	public RolePermission(Integer roleId ,Integer resourceId ){
		this.roleId = roleId ;
		this.resourceId = resourceId ;
	}
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getResourceId() {
		return resourceId;
	}
	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}
}

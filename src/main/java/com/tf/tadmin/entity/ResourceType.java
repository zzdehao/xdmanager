package com.tf.tadmin.entity;

/**
 * 
 * 资源类型,目前直接在程序写死，开发需要增加直接改程序
 *
 * @date 2016年1月8日
 *
 * @author mo.xf
 *
 */
public class ResourceType {
	private String key ;
	
	private String name ;
	
	public ResourceType(){}
	
	public ResourceType(String key,String name){
		this.key = key ;
		this.name = name ;
	}

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
}

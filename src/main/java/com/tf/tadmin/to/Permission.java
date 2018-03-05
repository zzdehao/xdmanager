package com.tf.tadmin.to;

import java.util.ArrayList;
import java.util.List;

import com.tf.tadmin.entity.Menu;
/**
 * 
 *
 *
 * @date 2015年12月29日
 *
 * @author mo.xf
 *
 */
public class Permission {
	private Menu menu ;
	
	private List<MenuResource> children = new ArrayList<MenuResource>();
	
	public Permission(){}
	
	public Permission(Menu menu){
		this.menu = menu ;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public List<MenuResource> getChildren() {
		return children;
	}

	public void addChildren(MenuResource menuResource){
		this.children.add(menuResource) ;
	}
}


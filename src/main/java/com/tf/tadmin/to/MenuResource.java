package com.tf.tadmin.to;

import java.util.ArrayList;
import java.util.List;

import com.tf.tadmin.entity.Menu;
import com.tf.tadmin.entity.Resource;

public class MenuResource{
	private Menu menu ;
	
	private List<Resource> children = new ArrayList<Resource>();
	
	public MenuResource(){}
	
	public MenuResource( Menu menu){
		this.menu = menu ;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public List<Resource> getChildren() {
		return children;
	}
	
	public void addChildren(Resource resource){
		this.children.add(resource) ;
	}
}

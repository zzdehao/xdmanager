package com.tf.tadmin.controller;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tf.tadmin.entity.Menu;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.entity.Resource;
import com.tf.tadmin.service.MenuService;
import com.tf.tadmin.service.ResourceService;
import com.tf.tadmin.utils.Constants;
import com.tf.tadmin.utils.UUIDGenerator;

/**
 * 
 * 菜单管理
 */
@Controller
@RequestMapping(value = "/menu")
public class MenuController extends BaseController{
	private static final Logger LOG = LoggerFactory.getLogger(MenuController.class) ;
	
	@javax.annotation.Resource
	private MenuService menuService ;
	@javax.annotation.Resource
	private ResourceService resourceService ;
	
	@RequestMapping(value = "/index" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView() ;
		this.setAdminView(mav, "menu/menu-index");
		mav.addObject("parentItem", this.menuService.queryByPid("")) ;
		mav.addObject("rts", this.resourceService.getResourceType()) ;
		return mav ;
	}
	
	@RequestMapping(value = "/list" ,method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<Menu> list(){
		List<Menu> list = this.menuService.queryList() ;
		LOG.info("");
		return list ;
	}
	
	@RequestMapping(value = "/get/{id}" ,method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Menu get(@PathVariable String id){
		LOG.info("get menu:{}" ,id);
		Menu menu = this.menuService.queryById(id) ;
		menu.setResource(this.resourceService.getResourceNameByMenu(id));
		return menu ;
	}
	
	@RequestMapping(value = "/save" ,method = {RequestMethod.POST})
	public @ResponseBody Message save(Menu menu){
		LOG.info("add menu:[name={},url={}]" , menu.getName() , menu.getUrl());
		boolean isModify = false ;
		String id = menu.getId()  ;
		if(StringUtils.hasText(id)){
			isModify = true ;
		}
		int result = 0 ;
		menu.setType(1);//菜单类型默认为1
		
		if(isModify){
			result = this.menuService.update(menu) ;
		}else{
			menu.setId(UUIDGenerator.getUUID());
			result = this.menuService.insert(menu) ;
		}
		
		List<Resource> resourceList = new ArrayList<Resource>() ;
		if(menu.getResource() != null&&StringUtils.hasText(menu.getKey()) ){
			for(String r : menu.getResource()){
				String[] ss = r.split(Constants.RESOURCE_DELIMITER) ;
				if(ss.length == 2){
					Resource resource = new Resource() ;
					resource.setMenuId(menu.getId());
					resource.setName(ss[1]);
					resource.setKey(menu.getKey() + Constants.RESOURCE_DELIMITER + ss[0]);
					resource.setSort(resourceService.getResourceTypeSort(ss[0]));
					resourceList.add(resource) ;
				}
 			}
		}
		this.resourceService.saveAll(resourceList, menu.getId());
		
		return new Message(result) ;
	}
	
	@RequestMapping(value = "/del/{id}" ,method = {RequestMethod.POST})
	public @ResponseBody Message del(@PathVariable String id){
		int result = this.menuService.delete(id) ;
		this.resourceService.deleteForMenu(id) ;
		return new Message(result) ;
	}
	
	@RequestMapping(value = "/icon" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView icon(){
		ModelAndView mav = new ModelAndView() ;
		this.setAdminView(mav, "icon");
		return mav ;
	}
	
}

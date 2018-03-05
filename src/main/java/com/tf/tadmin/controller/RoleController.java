package com.tf.tadmin.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tf.tadmin.entity.Menu;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.entity.Resource;
import com.tf.tadmin.entity.Role;
import com.tf.tadmin.entity.RolePermission;
import com.tf.tadmin.entity.UserRole;
import com.tf.tadmin.service.MenuService;
import com.tf.tadmin.service.ResourceService;
import com.tf.tadmin.service.RoleService;
import com.tf.tadmin.to.MenuResource;
import com.tf.tadmin.to.Permission;
import com.tf.tadmin.utils.Constants;

/**
 * 
 *
 *
 * @date 2015年12月29日
 *
 * @author mo.xf
 *
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController extends BaseController {
	private static final Logger LOG = LoggerFactory.getLogger(RoleController.class) ;
	
	@javax.annotation.Resource
	private RoleService roleService ;
	
	@javax.annotation.Resource
	private ResourceService resourceService ;
	
	@javax.annotation.Resource
	private MenuService menuService ;
	
	@RequestMapping(value = "/index")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView();
		this.setAdminView(mav, "role/role-index");
		return mav ;
	}
	
	@RequestMapping(value = "/list" , method ={RequestMethod.GET , RequestMethod.POST})
	public @ResponseBody List<Role> list(@RequestParam(required=false,value="q") String name , @RequestParam(required=false, value = "s") Integer status){
		return roleService.list(name, status) ;
	}
	
	@RequestMapping(value = "/edit" , method ={RequestMethod.GET})
	public ModelAndView edit(@RequestParam(required=false) Integer id){
		ModelAndView mav = new ModelAndView() ;
		if(id != null){
			mav.addObject("role", this.roleService.get(id)) ;
		}
		this.setAdminView(mav, "role/role-edit");
		return mav ;
	}
	
	/**
	 * 
	 * 获取权限数据
	 * 
	 * @param roleid
	 * @return
	 */
	@RequestMapping(value = "/permission" , method ={RequestMethod.GET})
	public @ResponseBody Collection<Permission> permission(@RequestParam(required=false) Integer roleid){
		List<Menu> menuList = this.menuService.queryList() ;  //所有菜单
		List<Resource> resourceList = this.resourceService.list() ;//所有的资源
		Map<String,Resource> roleResourceMap = new HashMap<String,Resource>() ;
		if(roleid != null){
			List<Resource> roleResourceList = this.resourceService.getResourceByRole(roleid) ;
			for(Resource resource : roleResourceList){
				roleResourceMap.put(resource.getId()+"", resource) ;
			}
		}
		
		
		//将资源进行汇总
		Map<String,List<Resource>> resourceMap = new HashMap<String,List<Resource>>() ;
		for(Resource resource : resourceList){
			if(roleResourceMap.get(resource.getId()+"") != null){
				resource.setSelected(true);
			}
			if(resourceMap.get(resource.getMenuId()) != null){
				resourceMap.get(resource.getMenuId()).add(resource) ;
			}else{
				List<Resource> list = new ArrayList<Resource>() ;
				list.add(resource) ;
				resourceMap.put(resource.getMenuId() , list) ;
			}
			
		}
		//先处理没有上级的菜单
		Map<String,Permission> permissionMap = new HashMap<String,Permission>() ;
		for(Menu menu : menuList){
			if(StringUtils.isEmpty(menu.getPid())){
				permissionMap.put(menu.getId(), new Permission(menu)) ;
			}
		}
		//将子菜单加入到上级菜单中
		for(Menu menu : menuList){
			if(StringUtils.hasText(menu.getPid())){
				MenuResource menuResource = new MenuResource(menu) ;
				List<Resource> list = resourceMap.get(menu.getId()) ;
				if(list!= null){
					menuResource.getChildren().addAll(list);
				}
				Permission permission = permissionMap.get(menu.getPid()) ;
				if(permission != null){
					permission.addChildren(menuResource);
				}
			}
		}
		
		return permissionMap.values() ;
	}
	
	/**
	 * 
	 * 保存
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "/save" ,method = {RequestMethod.GET , RequestMethod.POST})
	public @ResponseBody Message save(Role role){
        List<Integer> resouceIds =role.getResource();
        if(resouceIds==null){
            resouceIds = new ArrayList<Integer>(0);
        }
		LOG.info("add role:[name={},resource={}]" , role.getName());
		boolean isModify = false ;
		Integer id = role.getId()  ;
		if(id != null ){
			isModify = true ;
		}
		
		if(!this.roleService.uniquenessCheck(Constants.T_ROLE, "name", role.getName(), id, isModify)){
			return new Message(false, "角色名已经存在!") ;
		}
		
		int result = 0 ;
		if(isModify){
			result = this.roleService.update(role) ;
		}else{
			result = this.roleService.insert(role) ;
		}
		
		if(isModify){
			//修改
			List<RolePermission> rolePermissionList = this.roleService.rolePermissionList(role.getId()) ;
			Map<Integer ,RolePermission> rolePermissionMap = new HashMap<Integer ,RolePermission>() ;
			for(RolePermission rolePermission : rolePermissionList){
				rolePermissionMap.put(rolePermission.getResourceId(), rolePermission) ;
			}
			//判断是否已经存，不存在就新增
			for(Integer resourceId : role.getResource()){
				if(rolePermissionMap.remove(resourceId) == null){
					RolePermission rolePermission = new RolePermission(role.getId(),resourceId);
					this.roleService.rolePermissionInsert(rolePermission) ;
				}
			}
			
			for(RolePermission rolePermission :rolePermissionMap.values()){
				this.roleService.rolePermissionDelete(rolePermission.getId()) ;
			}
		}else{
            if(resouceIds.size()>0) {
                for (Integer resourceId : role.getResource()) {
                    RolePermission rolePermission = new RolePermission(role.getId(), resourceId);
                    this.roleService.rolePermissionInsert(rolePermission);
                }
            }
		}
		return new Message(result) ;
	}
	
	/**
	 * 
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del/{id}" ,method = {RequestMethod.POST})
	public @ResponseBody Message del(@PathVariable Integer id){
		int ret = this.roleService.delete(id) ;
		this.roleService.rolePermissionDeleteForRole(id) ; //同时删除授权信息
		return new Message(ret) ;
	}
	
	/**
	 * 
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delall" , method = {RequestMethod.POST})
	public @ResponseBody Message delAll(@RequestParam(value ="id[]" , required = false) Integer[] ids){
		if(ids != null){
			for(Integer id :ids){
				this.roleService.delete(id);
				this.roleService.rolePermissionDeleteForRole(id) ; //同时删除授权信息
			}
		}
		
		return new Message() ;
	}
	
	/**
	 * 
	 * 根据用户角色列表
	 * 
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getuserrole/{uid}" , method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<UserRole> getUserRole(@PathVariable Integer uid){
		return this.roleService.getUserRole(uid) ;
	}
	
	@RequestMapping(value = "/status/{id}/{s}" , method = {RequestMethod.POST})
	public @ResponseBody Message status(@PathVariable Integer id ,@PathVariable Integer s){
		if(s != 1 && s != 0){
			return new Message(false , "更新的状态不对") ;
		}
		Role role = new Role() ;
		role.setId(id);
		role.setStatus(s);
		int ret =this.roleService.update(role) ;
		return new Message(ret) ;
	}
}

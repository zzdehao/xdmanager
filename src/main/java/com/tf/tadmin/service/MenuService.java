package com.tf.tadmin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.Menu;
import com.tf.tadmin.mapper.MenuMapper;
import com.tf.tadmin.utils.Constants;


@Service
public class MenuService {
	@Resource
	private MenuMapper menuMapper ;
	
	
	public List<Menu> queryList(){
		return this.menuMapper.queryList() ;
	}
	
	public List<Menu> queryListByUser(Integer userid){
		List<Menu> list = this.menuMapper.queryListByUser(userid) ;
		List<Menu> parent = this.menuMapper.queryByPid("") ;
		parent.addAll(list) ;
		return parent ;
	}
	
	public List<Menu> combotree(String path){
		return this.menuMapper.combotree(path) ;
	}
	
	public Menu queryById(String id){
		return this.menuMapper.queryById(id) ;
	}
	
	public List<Menu> queryByPid(String pid) {
		return this.menuMapper.queryByPid(pid) ;
	}
	
	public int insert(Menu menu) {
		if(StringUtils.isEmpty(menu.getPid())){
			menu.setPath(menu.getId());
		}else{
			menu.setPath(this.menuMapper.queryById(menu.getPid()).getPath() + "," + menu.getId());
		}
		
		return this.menuMapper.insert(menu) ;
	}
	
	public int update(Menu menu){
		if(StringUtils.isEmpty(menu.getPid())){
			menu.setPath(menu.getId());
		}else{
			menu.setPath(this.menuMapper.queryById(menu.getPid()).getPath() + "," + menu.getId());
		}
		int result =  this.menuMapper.update(menu) ;
		for(Menu m : this.menuMapper.queryByPid(menu.getId())){
			this.update(m) ;
		}
		
		return result ;
	}
	
	public int delete(String id){
		return this.menuMapper.delete(id) ;
	}
	
	/**
	 * 根据用户初始化菜单
	 * @param admin
	 * @return
	 */
	public String initMenu(Admin admin){
		StringBuffer sb = new StringBuffer() ;
		List<Menu> list = null ;
		//如果是超级管理员
		if(Constants.SUPPER_MANAGER.equals(admin.getName())){
			list =this.queryList() ;
		}else{
			list = this.queryListByUser(admin.getId()) ;
		}
		
		Map<String,List<Menu>> map = new HashMap<String,List<Menu>>() ;
		
		List<Menu> parents = new ArrayList<Menu>() ;

		Iterator<Menu> it = list.iterator() ;
		
		while(it.hasNext()){
			Menu m = it.next() ;
			if(StringUtils.isEmpty(m.getPid())){
				List<Menu> l = new ArrayList<Menu>() ;
				map.put(m.getId(), l) ;
				parents.add(m) ;
				it.remove(); 
			}
		}
		
		for(Menu m : list){
			List<Menu> l = map.get(m.getPid()) ;
			if(l != null){
				l.add(m) ;
			}
		}
		//String li = "<li><a _href=\"%s\" href=\"javascript:;\">%s</a></li>";
		String li = "<li><a _href=\"%s\" href=\"javascript:;\"><i class=\"%s\"></i> %s</a></li>";
		String dl = "<dl><dt><i class=\"%s\"></i> %s<i class=\"Hui-iconfont menu_dropdown-arrow\">&#xe6d5;</i></dt> <dd><ul>%s</ul></dl>";
		for(Menu parent : parents){
			StringBuffer temp = new StringBuffer() ;
			List<Menu> childer =  map.get(parent.getId()) ;
			if(childer.size() > 0){
				for(Menu m :childer){
					//temp.append(String.format(li, m.getUrl() , m.getName())) ;
					temp.append(String.format(li, m.getUrl() ,m.getIcon() , m.getName())) ;
				}
				sb.append(String.format(dl, parent.getIcon() , parent.getName() , temp.toString())) ;
			}
		}
		return sb.toString() ;
	}
}

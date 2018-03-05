package com.tf.tadmin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.tadmin.entity.Role;
import com.tf.tadmin.entity.RolePermission;
import com.tf.tadmin.entity.UserRole;
import com.tf.tadmin.mapper.RoleMapper;

@Service
public class RoleService extends BaseService{
	@Autowired
	private RoleMapper roleMapper ;
	
	public List<Role> getRoleByUser(int userid) {
		return this.roleMapper.getRoleByUser(userid) ;
	}
	
	public List<Role> list(String name , Integer status) {
		Map<String , Object> param = this.param() ;
		param.put("status", status) ;
		param.put("name" , name);
		
		return this.roleMapper.queryList(param) ;
	}
	
	public Role get(int id) {
		return this.roleMapper.queryById(id) ;
	}
    public Role getByRoleCode(String  code) {
        return this.roleMapper.getByRoleCode(code) ;
    }
	
	public int insert(Role role) {
		return this.roleMapper.insert(role) ;
	}
	
	public int update(Role role){
		return this.roleMapper.update(role) ;
	}
	
	public int delete(int id ) {
		return this.roleMapper.delete(id) ;
	}
	
	public List<RolePermission> rolePermissionList(Integer roleId){
		return this.roleMapper.rolePermissionList(roleId) ;
	}
	
	public int rolePermissionInsert(RolePermission rolePermission){
		return this.roleMapper.rolePermissionInsert(rolePermission) ;
	}
	
	public int rolePermissionDelete(Integer id){
		return this.roleMapper.rolePermissionDelete(id) ;
	}
	
	public int rolePermissionDeleteForRole(Integer roleId){
		return this.roleMapper.rolePermissionDeleteForRole(roleId) ;
	}
	/**
	 * 根据Resource删除权限
	 * @param rid
	 * @return
	 */
	public int rolePermissionDeleteForResource(Integer rid){
		return this.roleMapper.rolePermissionDeleteForResource(rid) ;
	}
	
	public List<UserRole> getUserRole(Integer uid){
		return this.roleMapper.getUserRole(uid) ;
	}
	
	public void saveAllRole(List<Integer> roles , Integer uid){
		if(roles == null){
			roles = new ArrayList<Integer>() ;
		}
		List<UserRole> oldList = this.getUserRole(uid) ;
		if(oldList == null || oldList.size() == 0){
			for(Integer role: roles){
				UserRole userRole = new UserRole() ;
				userRole.setRoleId(role);
				userRole.setUserId(uid);
				this.roleMapper.userRoleInsert(userRole) ;
			}
		}else{
			for(Integer role: roles){
				UserRole userRole = new UserRole() ;
				userRole.setRoleId(role);
				userRole.setUserId(uid);
				if(!oldList.remove(userRole)){
					this.roleMapper.userRoleInsert(userRole) ;
				}
			}
			
			for(UserRole userRole :oldList){
				this.roleMapper.userRoleDelete(userRole.getId()) ;
			}
		}
	}
}

package com.tf.tadmin.mapper;

import java.util.List;

import com.tf.tadmin.entity.Role;
import com.tf.tadmin.entity.RolePermission;
import com.tf.tadmin.entity.UserRole;
import org.springframework.stereotype.Repository;
@Repository
public interface RoleMapper extends BaseMapper<Role, Integer>{
	public List<Role> getRoleByUser(int userid) ;
	
	public List<RolePermission> rolePermissionList(Integer roleId);
	
	public int rolePermissionInsert(RolePermission rolePermission);
	
	public int rolePermissionDelete(Integer id);
	
	public int rolePermissionDeleteForRole(Integer roleId);
	
	/**
	 * 根据Resource删除权限
	 * @param rid
	 * @return
	 */
	public int rolePermissionDeleteForResource(Integer rid);
	
	public List<UserRole> getUserRole(Integer uid) ;
	
	public int userRoleInsert(UserRole userRole);
	
	public int userRoleDelete(Integer id);
	
	public int userRoleDeleteForUser(Integer uid);
	
	public int userRoleDeleteForRole(Integer rid);

    public Role getByRoleCode(String roleCode) ;
}

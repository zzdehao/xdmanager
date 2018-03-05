package com.tf.tadmin.shiro;
import com.tf.tadmin.service.*;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.Resource;
import com.tf.tadmin.entity.Role;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.utils.Constants;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
/**
 * 用户登录访问权限认证
 *
 */
public class ShiroAuthorizingRealm extends AuthorizingRealm {

    private static Logger LOGGER = LoggerFactory.getLogger(ShiroAuthorizingRealm.class);

    @javax.annotation.Resource
	private AdminService adminService ;

    @javax.annotation.Resource
    private RoleService roleService ;

    @javax.annotation.Resource
    private ResourceService resourceService ;

    @javax.annotation.Resource
    private MenuService menuService;

    @javax.annotation.Resource
    private ProvinceCityService provinceCityService;

    /**
     * Shiro登录认证(原理：用户提交 用户名和密码  ---
     * shiro 封装令牌 ---- realm 通过用户名将密码查询返回 ----
     * shiro 自动去比较查询出密码和用户输入密码是否一致---- 进行登陆控制 )
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        LOGGER.info("Shiro开始登录认证");
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

        String unameAndpLevel = token.getUsername();
        String uname[] = unameAndpLevel.split(Constants.USERNAME_DELIMITER);
        String username = uname[0];
        String roleCode = uname[1];
        //手机号或账号登录
        Admin admin = adminService.get(username);
        //Admin admin = adminService.getByRoleCode(username,roleCode);
        if (admin == null) {
            return null;
        }
        //非超级管理员
        if (!Constants.SUPPER_MANAGER.equals(admin.getName())){
            if (!roleCode.equals(admin.getRoleCode())) {
                throw new NoPermissionException();
            }
        }
        if( admin.getStatus() == 0){
        	throw new LockedAccountException();
        }
        List<Role> roleList = null ;
        //如果用户选择的其他，并且用户名为admin则为超级管理员

       if (Constants.SUPPER_MANAGER.equals(admin.getName())) {
                //超级管理员，拥有所有角色
                roleList = this.roleService.list(null, null);
            }
        else{
        	roleList = this.roleService.getRoleByUser(admin.getId()) ;
        }
        String menu = this.menuService.initMenu(admin) ;
        if(StringUtils.isEmpty(menu)){
        	throw new NoPermissionException() ;
        }
        //设置角色码信息
        if(StringUtils.isEmpty(admin.getRoleCode())){
            admin.setRoleCode(roleCode);
        }
        SessionUser sessionUser = new SessionUser(admin.getId() ,admin.getName(),roleList , menu) ;
        sessionUser.setAdmin(admin);
        Role role = this.roleService.getByRoleCode(roleCode);
        if(role!=null){
            sessionUser.setRoleName(role.getName());
        }
        // 认证缓存信息
        return new SimpleAuthenticationInfo(sessionUser, admin.getPassword().toCharArray(), getName());

    }
    /**
     * Shiro权限认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        //ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
    	SessionUser sessionUser = (SessionUser) principals.getPrimaryPrincipal();
    	LOGGER.info("Shiro AuthorizationInfo:{}" , sessionUser);

    	SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

    	List<Role> roleList = sessionUser.getRoles() ;
    	List<Resource> resourceList = new LinkedList<Resource>() ;

    	if(Constants.SUPPER_MANAGER.equals(sessionUser.getName())){
    		//超级管理员，拥有所有角色及资源权限
    		resourceList = this.resourceService.list() ;
    	}else{
    		for(Role role : roleList){
    			List<Resource> temp = this.resourceService.getResourceByRole(role.getId()) ;
    			resourceList.addAll(temp) ;
    		}
    	}
    	Set<String> roleSet = new HashSet<String>() ;
    	Set<String> resourceSet = new HashSet<String>() ;
    	for(Role role : roleList){
    		roleSet.add(role.getName()) ;
    	}

		for(Resource resource : resourceList){
			resourceSet.add(resource.getKey()) ;
		}

		info.addRoles(roleSet);
		info.addStringPermissions(resourceSet);

        return info;
    }
}

package com.tf.tadmin.service;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.entity.ParamMap;
import com.tf.tadmin.entity.yewu.TDict;
import com.tf.tadmin.utils.Constants;
import org.springframework.stereotype.Service;
import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.mapper.AdminMapper;
import com.tf.tadmin.mapper.RoleMapper;
@Service
public class AdminService extends BaseService{
	@Resource
	private AdminMapper adminMapper ;
	
	@Resource
	private RoleMapper roleMapper ;
	
	public List<Admin> list(Integer s , String q){
		Map<String , Object> param = this.param() ;
		param.put("status", s) ;
		param.put("q" , q);
		
		return this.adminMapper.queryList(param) ;
	}
	
	public int add(Admin admin){
		return this.adminMapper.insert(admin) ;
	}
	
	public int update(Admin admin){
		return this.adminMapper.update(admin) ;
	}
	
	public int del(int id){
		this.roleMapper.userRoleDeleteForUser(id) ;
		return this.adminMapper.delete(id) ;
	}
	
	public Admin get(int id){
		return this.adminMapper.queryById(id) ;
	}
	
	public Admin get(String login){
		return this.adminMapper.queryByLogin(login) ;
	}
    public Admin getByRoleCode(String login,String rcode){
        Admin qadmin = new Admin();
        qadmin.setName(login);
        qadmin.setTel(login);
        qadmin.setEmail(login);
        qadmin.setRoleCode(rcode);
        return this.adminMapper.getByRoleCode(qadmin);
    }

    public Pager<Admin> queryUserList(Integer start, Map<String,Object> param){
        Pager<Admin> pager = new Pager<Admin>() ;
        ParamMap paramMap = ParamMap.create() ;
        paramMap.put("start", start) ;
        paramMap.put("rows", Constants.PAGE_SIZE) ;
        paramMap.put("sort", "id") ;
        paramMap.put("order", "desc") ;
        paramMap.putAll(param);
        List<Admin> rows = this.adminMapper.queryPageList(paramMap) ;
        pager.setRows(rows);
        pager.setTotal(adminMapper.pageCount(paramMap));
        return pager ;
    }

}

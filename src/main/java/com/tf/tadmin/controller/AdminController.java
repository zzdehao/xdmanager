package com.tf.tadmin.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
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
import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.service.AdminService;
import com.tf.tadmin.service.RoleService;
import com.tf.tadmin.shiro.NoPermissionException;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.Constants;
/**
 * 17600180016
 * 111111
 * 一人只能单角色
 * 登录
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController{
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class) ;
	
	@Resource
	private AdminService adminService ;
	
	@Resource
	private RoleService roleService ;

    /**
     * 根目录定位首页-直接转到登录页
     * @return
     */
    @RequestMapping(value = {"/",""} , method = {RequestMethod.GET , RequestMethod.POST})
    public String redirect(){
        return "redirect:/admin/login";
    }
	/**
     * 登录成功后,展现主页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = {"/main",""} ,method = {RequestMethod.GET})
	public ModelAndView admin(HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView() ;
		SessionUser sessionUser = ShiroUtils.getSessionUser() ;
		mav.addObject("menu", sessionUser.getMenu()) ;
		this.setAdminView(mav, "admin-main");
		return mav ;
	}
	/**
	 * 定位到登录页
	 */
	@RequestMapping(value = "/login" , method = {RequestMethod.GET , RequestMethod.POST})
	public void login(HttpServletRequest request , HttpServletResponse response) throws Exception{
		if("GET".equals(request.getMethod())){
			request.getRequestDispatcher("/WEB-INF/views/admin/admin-login.jsp").forward(request, response);
			return ;
		}else{
			boolean r = true ;
            //登录名
			String uname = request.getParameter("uname") ;
            //密码
			String password = request.getParameter("password") ;

            String plevel = request.getParameter("plevel") ;

            uname = uname+Constants.USERNAME_DELIMITER+plevel;
			LOGGER.info("Login Info:uname={},password={}" , uname , password);
			String msg = "";
            SessionUser currentUser = null;
			if(StringUtils.hasText(uname) && StringUtils.hasText(password)){

				Subject subject = SecurityUtils.getSubject();
				UsernamePasswordToken token = new UsernamePasswordToken(uname, password.toCharArray());
		        token.setRememberMe(true);
		        try {
		        	subject.login(token);
                    currentUser =(SessionUser) subject.getPrincipal();
		        }catch(LockedAccountException e){
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "用户已经被锁定,请联系管理员!";
		        	r = false ;
		        }catch(IncorrectCredentialsException e){
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "登录名或密码不正确!";
		        	r = false ;
		        }catch (NoPermissionException e) {
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "用户没有权限登录,请联系管理员授权!";
		        	r = false ;
				}catch (Exception e) {
                    e.printStackTrace();
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "登录名或密码不正确!";
		        	r = false ;
		        }
			}else{
				msg = "登录名或密码不能为空!";
				r = false ;
			}
			request.getSession().setAttribute("loginUser",currentUser);
            //this.write("{\"r\":false,\"m\":\""+msg+"\"}", response);
			this.write(String.format("{\"r\":%s,\"m\":\"%s\"}", r , msg), response);
		}
	}
	
	/**
	 * 注销
	 */
	@RequestMapping(value = "/logout" ,method = {RequestMethod.POST})
	public @ResponseBody Message logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return new Message() ;
	}
	
	@RequestMapping(value = "/index" ,method = {RequestMethod.GET})
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView() ;
		this.setAdminView(mav, "admin-index");
		return mav ;
	}
	
	@RequestMapping(value = "/edit" ,method = {RequestMethod.GET})
	public ModelAndView edit(@RequestParam(required = false) Integer id){
		ModelAndView mav = new ModelAndView() ;
		if(id != null){
			mav.addObject("admin", this.adminService.get(id));
		}
		//todo
		mav.addObject("roles", this.roleService.list(null, 1)) ;
		this.setAdminView(mav, "admin-edit");
		return mav ;
	}
	
	/**
	 * 保存
	 * @param admin
	 * @return
	 */
	@RequestMapping(value = "/save" ,method = {RequestMethod.GET , RequestMethod.POST})
	public @ResponseBody Message save(Admin admin){
		boolean isModify = false ;
		Integer id = admin.getId()  ;
		if(id != null ){
			isModify = true ;
		}
		
		if(!this.adminService.uniquenessCheck(Constants.T_ADMIN, "name", admin.getName(), id, isModify)){
			return new Message(false, "用户名已经存在!") ;
		}
		if(!this.adminService.uniquenessCheck(Constants.T_ADMIN, "tel", admin.getTel(), id, isModify) ){
			return new Message(false, "手机号码已经存在!") ;
		}
		if(!this.adminService.uniquenessCheck(Constants.T_ADMIN, "email", admin.getEmail(), id, isModify) ){
			return new Message(false, "邮箱已经存在!") ;
		}
		
		int result = 0 ;
        try {
            if (isModify) {
                result = this.adminService.update(admin);
            } else {
                result = this.adminService.add(admin);
            }
            this.roleService.saveAllRole(admin.getRoles(), admin.getId());
        }catch (Exception ex){
            ex.printStackTrace();
            result=0;
        }
		return new Message(result) ;
	}
	
	@RequestMapping(value = "/del/{id}" , method = {RequestMethod.POST})
	public @ResponseBody Message del(@PathVariable Integer id){
		Admin admin = adminService.get(id) ;
		if(admin== null){
			return new Message(false) ;
		}else if("admin".equals(admin.getName())){
			return new Message(false,"超级管理员不能删除") ;
		}else if(ShiroUtils.getSessionUser().getName().equals(admin.getName())){
			return new Message(false,"亲，自己把自己干掉不行吧!") ;
		}
		int result = this.adminService.del(id) ;
		return new Message(result) ;
	}
	
	@RequestMapping(value = "/delall" , method = {RequestMethod.POST})
	public @ResponseBody Message delAll(@RequestParam(value ="id[]" , required = false) Integer[] ids){
		//this.adminService.del(id) ;
		if(ids != null){
			for(Integer id :ids){
				this.adminService.del(id) ;
			}
		}
		
		return new Message() ;
	}
	
	@RequestMapping(value = "/list" ,method = {RequestMethod.GET})
	public @ResponseBody List<Admin> list(@RequestParam(required = false , value = "s") Integer s ,
                                          @RequestParam(required = false , value = "q") String q){
		return this.adminService.list(s,q) ;
	}
	
	@RequestMapping(value = "/navigate" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView navigate(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("javaVersion", System.getProperty("java.version")) ;
		mav.addObject("env", System.getenv()) ;
		this.setAdminView(mav, "navigate");
		return mav;
	}
	
}

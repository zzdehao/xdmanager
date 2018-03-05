package com.tf.tadmin.controller.yewu;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.*;
import com.tf.tadmin.service.AdminService;
import com.tf.tadmin.service.RoleService;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wugq on 2017/12/23.
 * 用户管理
 */
@Controller
public class UserController extends BaseController {
    private static  final String pageDir="/yewu/user";
    @Resource
    private AdminService adminService ;

    @Resource
    private RoleService roleService ;

    @RequestMapping(value = "/yewu/user" ,method = {RequestMethod.GET})
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView() ;
        mav.setViewName(pageDir+"/user-index");
        return mav;
    }
    @RequestMapping(value = "/yewu/user/edit" ,method = {RequestMethod.GET})
    public ModelAndView edit(@RequestParam(required = false) Integer id){
        SessionUser currentUser = this.getCurrentUser();
        ModelAndView mav = new ModelAndView() ;
        if(id != null){
            mav.addObject("admin", this.adminService.get(id));
        }
        List<Role> roles = getRoles(currentUser);
        mav.addObject("roles",roles) ;
        mav.setViewName(pageDir+"/user-edit");
        return mav ;
    }

    private List<Role> getRoles(SessionUser currentUser) {
        List<Role> roles = new ArrayList<Role>();
        if(Constants.UserRole.MANAGER.equals(currentUser.getRoleCode())){
            List<Role> tempRoles = this.roleService.list(null, 1);
            for(Role r:tempRoles){
                if(!r.getRoleCode().equals(Constants.UserRole.SUPER)){
                    roles.add(r);
                }
            }
        }
        if(Constants.UserRole.SUPER.equals(currentUser.getRoleCode())||
                Constants.UserRole.QITA.equals(currentUser.getRoleCode())||
                Constants.UserRole.ADMIN.equals(currentUser.getRoleCode())){
            List<Role> tempRoles = this.roleService.list(null, 1);
            roles = tempRoles;
        }
        if(Constants.UserRole.PROVINCE.equals(currentUser.getRoleCode())){
            List<Role> tempRoles = this.roleService.list(null, 1);
            for(Role r:tempRoles){
                if(!r.getRoleCode().equals(Constants.UserRole.SUPER)&&
                        !r.getRoleCode().equals(Constants.UserRole.MANAGER)){
                    roles.add(r);
                }
            }
        }
        return roles;
    }

    /**
     * 保存
     * @param admin
     * @return
     */
    @RequestMapping(value = "/yewu/user/save" ,method = {RequestMethod.GET , RequestMethod.POST})
    public @ResponseBody
    Message save(Admin admin){
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

    @RequestMapping(value = "/yewu/user/del/{id}" , method = {RequestMethod.POST})
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
    @RequestMapping(value = "/yewu/user/list")
    public @ResponseBody
    Pager<Admin> list(@RequestParam(required=true) Integer page,
                      @RequestParam(required = false , value = "q") String q){
        SessionUser currentUser = this.getCurrentUser();

        int start = (page - 1)* Constants.PAGE_SIZE ;
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("isSuper","0");
        if(!StringUtils.isEmpty(q)){
            param.put("q",q);
        }
        if(Constants.UserRole.QITA.equals(currentUser.getRoleCode())||
                Constants.UserRole.ADMIN.equals(currentUser.getRoleCode())||
                Constants.UserRole.SUPER.equals(currentUser.getRoleCode())){
            param.put("isSuper","1");
        }
        Pager<Admin> pager = this.adminService.queryUserList(start,param) ;
        return pager;
    }

    /**
     * 个人信息
     * @return
     */
    @RequestMapping(value = "/yewu/user/userinfo" ,method = {RequestMethod.GET})
    public ModelAndView userinfo(){
        SessionUser currentUser = this.getCurrentUser();
        ModelAndView mav = new ModelAndView() ;
        Admin admin =  this.adminService.get(currentUser.getId());
        mav.addObject("admin",admin);
        List<Role> roles = getRoles(currentUser);
        mav.addObject("roles",roles) ;
        mav.setViewName(pageDir+"/user-userinfo");
        return mav;
    }

    /**
     * 修改密码
     * @return
     */
    @RequestMapping(value = "/yewu/user/password" ,method = {RequestMethod.GET})
    public ModelAndView modifypass(){
        SessionUser currentUser = this.getCurrentUser();
        ModelAndView mav = new ModelAndView() ;
        Admin admin =  this.adminService.get(currentUser.getId());
        mav.addObject("admin",admin);
        List<Role> roles = getRoles(currentUser);
        mav.addObject("roles",roles) ;
        mav.setViewName(pageDir+"/user-password");
        return mav;
    }

    /**
     * 修改密码
     * @return
     */
    @RequestMapping(value = "/yewu/user/updatepw" ,method = {RequestMethod.GET , RequestMethod.POST})
    public ModelAndView updatepw(HttpServletRequest request) {
        SessionUser currentUser = this.getCurrentUser();
        //HttpServletRequest request = this.getRequest();
        String oldPw = request.getParameter("oldPw");
        String newPw = request.getParameter("newPw");
        String repeatPw = request.getParameter("repeatPw");
        Admin user = new Admin();
        user.setId(currentUser.getId());
        user.setPassword(newPw);
        adminService.update(user);

        ModelAndView mav = new ModelAndView() ;
        mav.setViewName(pageDir+"/user-password");
        return mav;
    }
    /**
     * 账号添加
     * @param model
     * @return
     */
    @RequestMapping("/yewu/addadmin")
    public String addadmin(Model model){
        return pageDir+"/user-addadmin";
    }
    /**
     * 人员管理
     * @param model
     * @return
     */
    @RequestMapping("/yewu/listadmin")
    public String listadmin(Model model){
        return pageDir+"/user-listadmin";
    }

    /**
     * 修改面
     * @param model
     * @return
     */
    @RequestMapping("/yewu/modifypass")
    public String modifypass(Model model){
        return pageDir+"/user-modifypass";
    }

    /**
     * 日志密码
     * @param model
     * @return
     */
    @RequestMapping("/yewu/loglist")
    public String loglist(Model model){
        return pageDir+"/loglist";
    }

}

package com.tf.biz.dataimp;
import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.utils.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.Map;
/**
 * Created by wugq on 2018/3/5.
 * 导入
 * 1）导入人员
 * 2) 导入店铺(社会渠道、自有渠道、小微渠道)
 * 3) 导入计划
 */
@Controller
@RequestMapping(value = "${adminPath}/import")
public class DataImpController extends BaseController {

    @Autowired
    private DataImpService impService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    /******************************导入人员*****************************/
    @RequestMapping(value = "/userIndex")
    public ModelAndView userIndex(){
        ModelAndView mav = new ModelAndView() ;
        this.setBizView(mav, "import/user-index");
        return mav ;
    }

    /**
     * 分页查询
     * @param page 当前页码
     * @return
     */
    @RequestMapping(value = "/userList")
    public @ResponseBody Pager<BizImportUser> userList(
            @RequestParam(required=true)  Integer page){
        int start = (page - 1)*Constants.PAGE_SIZE ;
        Map<String,Object> param = new HashMap<String,Object>();
        Pager<BizImportUser> pager = this.impService.queryUserList(start,param) ;
        return pager;
    }

}

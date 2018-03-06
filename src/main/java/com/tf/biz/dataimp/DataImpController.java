package com.tf.biz.dataimp;
import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.biz.imp.entity.BizImportBatch;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.entity.Upload;
import com.tf.tadmin.utils.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
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

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${upload.dir}")
    private String uploadDir;

    @Autowired
    private DataImpService impService;

    /**************************1-上传所有文件列表****************************************/
    @RequestMapping(value = "/upfileIndex")
    public ModelAndView upfileIndex(){
        ModelAndView mav = new ModelAndView() ;
        this.setBizView(mav, "import/upfile-index");
        return mav ;
    }

    /**
     * 分页查询
     * @param page 当前页码
     * @return
     */
    @RequestMapping(value = "/upfileList")
    public @ResponseBody Pager<BizImportBatch> upfileList(
            @RequestParam(required=true)  Integer page){
        int start = (page - 1)*Constants.PAGE_SIZE ;
        Map<String,Object> param = new HashMap<String,Object>();
        Pager<BizImportBatch> pager = this.impService.queryUpLoadFileList(start,param) ;
        return pager;
    }


    /******************************2-导入人员*****************************/
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
    /**
     * 定位到导入页面
     * @return
     */
    @RequestMapping(value = "/toImpPage")
    public ModelAndView toImpPage(){
        ModelAndView mav = new ModelAndView() ;
        this.setBizView(mav, "import/user-import");
        return mav ;
    }
    /**
     * 导入人员信息
     * 1)上传临时附件表(生成批次号信息)
     * 2)解析文件放入数据表
     * @param multipartFile
     * @param req
     * @param upload
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/importUser", method = {RequestMethod.POST})
    public ModelAndView importUser(@RequestParam MultipartFile multipartFile,
                       HttpServletRequest req, Upload upload) throws Exception {
        ModelAndView mav = new ModelAndView();
        String realPath = req.getSession().getServletContext().getRealPath(this.uploadDir);
        String webPath = req.getContextPath() + this.uploadDir;
        FilePath filePath= new FilePath(realPath, webPath);
        try{
            this.impService.saveImpUserData(multipartFile,filePath,null);
            this.setBizView(mav, "import/user-index");
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return mav;
    }
    /******************************3-导入计划*****************************/



}

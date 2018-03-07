package com.tf.biz.dataimp;
import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.biz.imp.constant.ImportEnum;
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
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.Inflater;

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
        List<Map<String,String>> fileTypes = new ArrayList<Map<String,String>>();
        for(ImportEnum.ImportType e:ImportEnum.ImportType.values()){
            Map<String,String> data = new HashMap<String,String>(2);
            data.put("code",e.getCode()+"");
            data.put("typeName",e.getFullName(e.getCode()));
            fileTypes.add(data);
            System.out.println("data:"+data.toString());
        }
        mav.addObject("fileTypes",fileTypes);
        this.setBizView(mav, "import/upfile-index");
        return mav ;
    }

    /**
     * 分页查询
     * @param page 当前页码
     * @return
     */
    @RequestMapping(value = "/upfileList")
    public @ResponseBody Pager<Map> upfileList(
            @RequestParam(required=true)  Integer page){
        int start = (page - 1)*Constants.PAGE_SIZE ;
        Map<String,Object> param = new HashMap<String,Object>();
        Pager<BizImportBatch> pager = this.impService.queryUpLoadFileList(start,param) ;
        Pager<Map> dataPager = new Pager<Map>();
        List<Map> dataList =  new ArrayList<Map>();
        for(BizImportBatch row:pager.getRows()){
            Map data = new HashMap();
            data.put("batchName",row.getBatchName());
            data.put("importTypeName",ImportEnum.ImportType.getFullName(row.getImportType()));
            data.put("importType",row.getImportType());
            data.put("fileName",row.getFileName());
            //文件路径
            data.put("filePath",row.getFilePath());
            data.put("createTime",row.getCreateTime());
            data.put("remark",row.getRemark());
            data.put("id",row.getId());
            dataList.add(data);
        }
        dataPager.setRows(dataList);
        dataPager.setTotal(pager.getTotal());
        return dataPager;
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
     *
     * @return
     */
    @RequestMapping(value = "/toImpPage")
    public ModelAndView toImpPage(@RequestParam(value = "importType") String importType){
        ModelAndView mav = new ModelAndView() ;
        /**
         *  SELF_CHANNEL(11, "自有渠道","店铺"),
            WORLD_CHANNEL(12, "社会渠道","店铺"),
            SMALL_CHANNEL(13, "小微渠道","店铺"),
            USER(21, "人员","人员"),
           SELF_CHANNEL_PLAN(31, "自有渠道","巡检计划"),
           WORLD_CHANNEL_PLAN(32, "社会渠道","巡检计划"),
           SMALL_CHANNEL_PLAN(33, "小微渠道","巡检计划");
         */
        mav.addObject("importType",importType);
        mav.addObject("importTypeName",ImportEnum.ImportType.getFullName(Integer.parseInt(importType)));
        String action="";
        String backAction="upfileIndex";
        if(Integer.parseInt(importType)==11||
                Integer.parseInt(importType)==12||
                Integer.parseInt(importType)==13){
            action="importStore";
        }
        if(Integer.parseInt(importType)==21){
            action="importUser";
            backAction="userIndex";
        }
        if(Integer.parseInt(importType)==31||
                Integer.parseInt(importType)==32||
                Integer.parseInt(importType)==33){
            action="importCheckPlan";
        }
        mav.addObject("action",action);
        mav.addObject("backAction",backAction);
        this.setBizView(mav, "import/file-import");
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
    @RequestMapping(value = "/importCheckPlan", method = {RequestMethod.POST})
    public ModelAndView importCheckPlan(@RequestParam MultipartFile multipartFile,
                                   HttpServletRequest req, Upload upload) throws Exception {
        ModelAndView mav = new ModelAndView();
        /**
         SELF_CHANNEL(11, "自有渠道","店铺"),
         WORLD_CHANNEL(12, "社会渠道","店铺"),
         SMALL_CHANNEL(13, "小微渠道","店铺"),
         USER(21, "人员","人员"),
         SELF_CHANNEL_PLAN(31, "自有渠道","巡检计划"),
         WORLD_CHANNEL_PLAN(32, "社会渠道","巡检计划"),
         SMALL_CHANNEL_PLAN(33, "小微渠道","巡检计划");
         */
        String importType=req.getParameter("importType");
        String realPath = req.getSession().getServletContext().getRealPath(this.uploadDir);
        String webPath = req.getContextPath() + this.uploadDir;
        FilePath filePath= new FilePath(realPath, webPath);
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("importType",importType);
        try{
            this.impService.saveImportCheckPlanData(multipartFile,filePath,param);
            this.setBizView(mav, "import/checkplan-index");
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return mav;
    }









}

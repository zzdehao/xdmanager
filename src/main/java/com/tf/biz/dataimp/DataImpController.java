package com.tf.biz.dataimp;
import com.tf.biz.check.entity.BizCheckPlan;
import com.tf.biz.imp.ImportService;
import com.tf.biz.imp.constant.ImportEnum;
import com.tf.biz.imp.entity.BizImportBatch;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.biz.store.StoreService;
import com.tf.biz.store.entity.BizStore;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.service.AdminService;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.Constants;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

/**
 * Created by wugq on 2018/3/5.
 * 导入
 * 1）导入人员
 * 2) 导入店铺(社会渠道、自有渠道、小微渠道)
 * 3) 导入计划
 * 通常自有渠道和小微渠道只有一个名称，就是渠道名称，
 * 而社会渠道的渠道名称指的是代理商的名称，
 * 而一个代理商不一定只有一家店铺，
 * 所以他的店铺名称可能和渠道名称不是一个，
 * 所以需要单独列出来。
 */
@Controller
@RequestMapping(value = "${adminPath}/import")
public class DataImpController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StoreService storeService;
    @Autowired
    private DataImpService impService;

    @Autowired
    private AdminService adminService;
    @Autowired
    private ImportService importService;


    /**************************1-导入人员****************************************/
    @RequestMapping(value = "/userFileIndex")
    public ModelAndView upfileIndex() {
        ModelAndView mav = new ModelAndView();
        this.setBizView(mav, "import/userfile-index");
        return mav;
    }


    /**
     * 分页查询
     * @param page 当前页码
     * @return
     */
    @RequestMapping(value = "/userFileList")
    public
    @ResponseBody
    Pager<Map> userFileList(HttpServletRequest request,
                          @RequestParam(required = true) Integer page) {
        int start = (page - 1) * Constants.PAGE_SIZE;
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("importType", ImportEnum.ImportType.USER.getCode());
        Pager<BizImportBatch> pager = this.impService.queryUpLoadFileList(start, param);
        Pager<Map> dataPager = new Pager<Map>();
        List<Map> dataList = new ArrayList<Map>();
        for (BizImportBatch row : pager.getRows()) {
            Map data = new HashMap();
            data.put("batchName", row.getBatchName());
            data.put("importTypeName", ImportEnum.ImportType.getFullName(row.getImportType()));
            data.put("importType", row.getImportType());
            data.put("fileName", row.getFileName());
            //文件路径
            data.put("filePath", row.getFilePath());
            data.put("createTime", row.getCreateTime());
            data.put("remark", row.getRemark());
            data.put("id", row.getId());
            dataList.add(data);
        }
        dataPager.setRows(dataList);
        dataPager.setTotal(pager.getTotal());
        return dataPager;
    }
    /**
     * 定位到导入人员页面
     * @return
     */
    @RequestMapping(value = "/toImpUserPage")
    public ModelAndView toImpUserPage() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("importType", ImportEnum.ImportType.USER.getCode());
        mav.addObject("importTypeName",
                ImportEnum.ImportType.getFullName(ImportEnum.ImportType.USER.getCode()));
        String action = "";
        String backAction = "userFileIndex";
        action = "importUser";
        mav.addObject("action", action);
        mav.addObject("backAction", backAction);
        this.setBizView(mav, "import/user-import");
        return mav;
    }

    /**
     * 导入人员信息
     * 1)上传临时附件表(生成批次号信息)
     * 2)解析文件放入数据表
     * @param multipartFile
     * @param req
     * @param importType    21人员
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/importUser", method = {RequestMethod.POST})
    public ModelAndView importUser(@RequestParam MultipartFile multipartFile,
                                   HttpServletRequest req,
                                   @RequestParam(value = "importType") Integer importType) throws Exception {
        ModelAndView mav = new ModelAndView();
        FilePath filePath = getUploadFilePath("");
        try {
            this.impService.saveImpUserData(multipartFile, filePath, null);
            this.setBizView(mav, "import/userfile-index");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return mav;
    }

    /**
     * 删除文件
     * @param id
     * @return
     */
    @RequestMapping(value = "/delUserFile/{id}" , method = {RequestMethod.POST})
    public @ResponseBody Message delUserFile(@PathVariable Integer id){
        final Date now = new Date();
        final SessionUser sessionUser = ShiroUtils.getSessionUser();
        final int userId = sessionUser.getId();
        final String name = sessionUser.getName();
        try{
            BizImportBatch bizBatch = new BizImportBatch();
            bizBatch.setId(Long.parseLong(id.toString()));
            bizBatch.setIsDeleted(1);
            bizBatch.setDeleteTime(now);
            bizBatch.setDeleteUserId(userId);
            bizBatch.setDeleteUserName(name);
            this.impService.update(bizBatch);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return new Message(1) ;
    }

    /**********************2-导入店铺*****************************************/
    @RequestMapping(value = "/storeFileIndex")
    public ModelAndView storeFileIndex() {
        ModelAndView mav = new ModelAndView();
        this.setBizView(mav, "import/storefile-index");
        return mav;
    }
    @RequestMapping(value = "/storeFileList")
    public
    @ResponseBody
    Pager<Map> storeFileList(HttpServletRequest request,
                            @RequestParam(required = true) Integer page,
                             @RequestParam(required = false) Integer importType) {
        int start = (page - 1) * Constants.PAGE_SIZE;
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("importType", importType);
        List<Integer> importTypes= new ArrayList<Integer>();
        importTypes.add(11);
        importTypes.add(12);
        importTypes.add(13);
        param.put("importTypes", importTypes);
        Pager<Map> dataPager = new Pager<Map>();
        List<Map> dataList = new ArrayList<Map>();
        Pager<BizImportBatch> pager = this.impService.queryUpLoadFileList(start, param);
        for (BizImportBatch row : pager.getRows()) {
            Map data = new HashMap();
            data.put("batchName", row.getBatchName());
            data.put("importTypeName", ImportEnum.ImportType.getFullName(row.getImportType()));
            data.put("importType", row.getImportType());
            data.put("fileName", row.getFileName());
            //文件路径
            data.put("filePath", row.getFilePath());
            data.put("createTime", row.getCreateTime());
            data.put("remark", row.getRemark());
            data.put("id", row.getId());
            dataList.add(data);
        }
        dataPager.setRows(dataList);
        dataPager.setTotal(pager.getTotal());
        return dataPager;
    }
    /**
     * 定位到导入店铺页面
     * @return
     */
    @RequestMapping(value = "/toImpStorePage")
    public ModelAndView toImpStorePage(@RequestParam(value = "importType") String importType) {
        ModelAndView mav = new ModelAndView();
        /**
         SELF_CHANNEL(11, "自有渠道","店铺"),
         WORLD_CHANNEL(12, "社会渠道","店铺"),
         SMALL_CHANNEL(13, "小微渠道","店铺"),
         USER(21, "人员","人员"),
         */
        mav.addObject("importType", importType);
        mav.addObject("importTypeName",
                ImportEnum.ImportType.getFullName(Integer.parseInt(importType)));
        String action = "";
        String backAction = "storeFileIndex";
        if (Integer.parseInt(importType) == ImportEnum.ImportType.SELF_CHANNEL.getCode() ||
                Integer.parseInt(importType) == ImportEnum.ImportType.WORLD_CHANNEL.getCode() ||
                Integer.parseInt(importType) == ImportEnum.ImportType.SMALL_CHANNEL.getCode()) {
            action = "importStore";
        }
        mav.addObject("action", action);
        mav.addObject("backAction", backAction);
        this.setBizView(mav, "import/store-import");
        return mav;
    }
    /**
     * 店铺与巡店人员应该是一多关系，没有隶属关系？？？？
     * @param multipartFile
     * @param req
     * @param importType
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/importStore", method = {RequestMethod.POST})
    public ModelAndView importStore(@RequestParam MultipartFile multipartFile,
                                    HttpServletRequest req,
                                    @RequestParam(value = "importType") Integer importType) throws Exception {
        ModelAndView mav = new ModelAndView();
        FilePath filePath = getUploadFilePath("");
        try {
            /**
             * 11, "自有渠道","店铺",
               12, "社会渠道","店铺",
               13, "小微渠道","店铺",
             */
            this.storeService.saveMultipartFile(multipartFile,
                    filePath,
                    ImportEnum.ImportType.getByCode(importType));
            this.setBizView(mav, "import/storefile-index");
        } catch (Exception ex) {
            ex.printStackTrace();
            this.setBizView(mav, "import/storefile-index");
        }
        return mav;
    }


    /******************************3-导入计划*****************************/
    @RequestMapping(value = "/planfileIndex")
    public ModelAndView planfileIndex() {
        ModelAndView mav = new ModelAndView();
        this.setBizView(mav, "import/planfile-index");
        return mav;
    }

    /**
     * 进入导入计划页面
      * @param importType
     * @return
     */
    @RequestMapping(value = "/toPlanImport")
    public ModelAndView toplanImpPage(@RequestParam(value = "importType") String importType) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("importType", importType);
        mav.addObject("importTypeName",
                ImportEnum.ImportType.getFullName(Integer.parseInt(importType)));
        this.setBizView(mav, "import/plan-import");
        return mav;
    }
    /**
     * 导入计划
     * 1)上传临时附件表(生成批次号信息)
     * 2)解析文件放入数据表
     * @param planFile
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/importCheckPlan", method = {RequestMethod.POST})
    public ModelAndView importPlan(@RequestParam MultipartFile planFile,
                                        HttpServletRequest req) throws Exception {
        ModelAndView mav = new ModelAndView();
        /**
         SELF_CHANNEL_PLAN(31, "自有渠道","巡检计划"),
         WORLD_CHANNEL_PLAN(32, "社会渠道","巡检计划"),
         SMALL_CHANNEL_PLAN(33, "小微渠道","巡检计划");
         */
        String importType = req.getParameter("importType");
        /**
        String realPath = req.getSession().getServletContext().getRealPath(this.uploadDir);
        String webPath = req.getContextPath() + this.uploadDir;
         */
        FilePath filePath = getUploadFilePath("");

        String minDate = req.getParameter("minDate");
        String maxDate = req.getParameter("maxDate");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("minDate", minDate);
        param.put("maxDate", maxDate);
        ImportEnum.ImportType typeEum = null;
        if (importType.equals("31")) {
            typeEum = ImportEnum.ImportType.SELF_CHANNEL_PLAN;
        } else if (importType.equals("32")) {
            typeEum = ImportEnum.ImportType.WORLD_CHANNEL_PLAN;
        } else {
            typeEum = ImportEnum.ImportType.SMALL_CHANNEL_PLAN;
        }
        try {
            this.impService.saveImportCheckPlanData(planFile, filePath, param, typeEum);
            this.setBizView(mav, "import/planfile-index");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return mav;
    }

    @RequestMapping(value = "/planfileList")
    public
    @ResponseBody
    Pager<Map> planfileList(
            @RequestParam(required = true) Integer page) {
        int start = (page - 1) * Constants.PAGE_SIZE;
        Map<String, Object> param = new HashMap<String, Object>();
        /**
         *   SELF_CHANNEL_PLAN(31, "自有渠道","巡检计划"),
         WORLD_CHANNEL_PLAN(32, "社会渠道","巡检计划"),
         SMALL_CHANNEL_PLAN(33, "小微渠道","巡检计划");
         */
        List<Integer> importTypes = new ArrayList<Integer>();
        importTypes.add(ImportEnum.ImportType.SELF_CHANNEL_PLAN.getCode());
        importTypes.add(ImportEnum.ImportType.WORLD_CHANNEL_PLAN.getCode());
        importTypes.add(ImportEnum.ImportType.SMALL_CHANNEL_PLAN.getCode());
        param.put("importTypes", importTypes);
        Pager<BizImportBatch> pager = this.impService.queryUpLoadFileList(start, param);
        Pager<Map> dataPager = new Pager<Map>();
        List<Map> dataList = new ArrayList<Map>();
        for (BizImportBatch row : pager.getRows()) {
            Map data = new HashMap();
            data.put("batchName", row.getBatchName());
            data.put("importTypeName", ImportEnum.ImportType.getFullName(row.getImportType()));
            data.put("importType", row.getImportType());
            data.put("fileName", row.getFileName());
            //文件路径
            data.put("filePath", row.getFilePath());
            data.put("createTime", row.getCreateTime());
            data.put("remark", row.getRemark());
            data.put("id", row.getId());
            dataList.add(data);
        }
        dataPager.setRows(dataList);
        dataPager.setTotal(pager.getTotal());
        return dataPager;
    }

    /**
     * 计划明细页面
     * @return
     */
    @RequestMapping(value = "/planIndex")
    public ModelAndView planIndex() {
        ModelAndView mav = new ModelAndView();
        this.setBizView(mav, "import/plan-list");
        return mav;
    }

    @RequestMapping(value = "/planList")
    public  @ResponseBody
    Pager<BizCheckPlan> planList(HttpServletRequest request,
                             @RequestParam(required = true) Integer page,
                             @RequestParam(required = false,defaultValue = "-99") Integer batchId) {
        int start = (page - 1) * Constants.PAGE_SIZE;
        //查询条件

        Map<String, Object> param = new HashMap<String, Object>();
        param.put("batchId", batchId);
        Pager<BizCheckPlan> pager = this.impService.queryPlanList(start, param);
        return pager;
    }


    /********************************店铺信息列表*********************/
    @RequestMapping(value = "/toStoreList")
    public ModelAndView toStoreList() {
        ModelAndView mav = new ModelAndView();
        this.setBizView(mav, "import/store-list");
        return mav;
    }

    @RequestMapping(value = "/storeList")
    public   @ResponseBody
    Pager<BizStore> storeList(HttpServletRequest request,
                              @RequestParam(required = true) Integer page,
                              @RequestParam(required = false,defaultValue = "-1") Integer channelType) {
        int start = (page - 1) * Constants.PAGE_SIZE;
        //查询条件
        String key = request.getParameter("key");
        if(StringUtils.isEmpty(key)){
            key="";
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("channelType", channelType);
        param.put("key", key);
        Pager<BizStore> pager = this.impService.queryStoreList(start, param);
        return pager;
    }
    @RequestMapping(value = "/validChannelCode")
    @ResponseBody
    public Map<String,String> validChannelCode(HttpServletRequest request) {
        //param=1100&name=channelCode
        //Ajax中会POST过来变量param和name。param是文本框的值，name是文本框的name属性
        String channelCode = request.getParameter("param");
        String name = request.getParameter("name");
        Map<String,String> result = new HashMap<String,String>();
        result.put("info","渠道编号可用");
        result.put("status","y");
        if(!StringUtils.isEmpty(channelCode)){
           Long count =  this.impService.getStoreByChannelCodeCount(channelCode);
           if(count>0){
               result.put("info","渠道编号已存在");
               result.put("status","n");
           }
        }
        /**
         * {
         "info":"验证通过！",
         "status":"y"
         }
         */
        return result;

    }

    @RequestMapping(value = "/storeEdit")
    public ModelAndView storeEdit(@RequestParam(required = false) Integer id) {
        ModelAndView mav = new ModelAndView();
        if (id != null) {
            mav.addObject("store", this.storeService.getStoreById(id));
        }
        this.setBizView(mav, "import/store-edit");
        return mav;
    }

    @RequestMapping(value = "/saveStore", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public  Message saveStore(BizStore store) {
        int result = 1 ;
        try {
            this.storeService.saveOrUpdate(store);
        } catch (Exception ex) {
            ex.printStackTrace();
            result=0;
        }
        return new Message(result);
    }

    @RequestMapping(value = "/delStore/{id}" , method = {RequestMethod.POST})
    public @ResponseBody Message del(@PathVariable Integer id){
        BizStore store = storeService.getStoreById(id);
        int result = 0;
        if(store== null){
            return new Message(false) ;
        }
        result= this.impService.delStore(id);
        return new Message(result) ;
    }
    /******************************巡店人员信息***********************************************/

    @RequestMapping(value = "/toXuserList")
    public ModelAndView toXuserList() {
        ModelAndView mav = new ModelAndView();
        this.setBizView(mav, "import/xuser-list");
        return mav;
    }

    @RequestMapping(value = "/xuserList")
    public
    @ResponseBody
    Pager<Admin> xuserList(HttpServletRequest request,
                           @RequestParam(required = true) Integer page) {
        int start = (page - 1) * Constants.PAGE_SIZE;
        //查询条件
        String q = request.getParameter("q");
        if(StringUtils.isEmpty(q)){
            q="";
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("q",q);
        param.put("onlyImport","1");
        //导入用户信息
        Pager<Admin> pager = this.adminService.queryUserList(start, param);
        return pager;
    }

    @RequestMapping(value = "/xuserEdit")
    public ModelAndView xuserEdit(@RequestParam(required = false) Integer id) {
        ModelAndView mav = new ModelAndView();

        if (id != null) {
            Admin admin = this.adminService.get(id);
            mav.addObject("xuser",admin);
        }
        this.setBizView(mav, "import/xuser-edit");
        return mav;
    }
    @RequestMapping(value = "/delxuser/{id}" , method = {RequestMethod.POST})
    public @ResponseBody Message delxuser(@PathVariable Integer id){
        Integer state = impService.delXuser(id);
        if(state== -1){
            return new Message(false) ;
        }
        return new Message(state) ;
    }
    /**
     * 下载文件
     * @param request
     * @param response
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getDownFile/{id}" , method = {RequestMethod.POST})
    public ResponseEntity<byte[]>  getDownFile(HttpServletRequest request,
                            HttpServletResponse response,
                            @PathVariable Integer id) throws  Exception{
        BizImportBatch batch =  this.importService.getImportBatch(Long.parseLong(id.toString()));
        if(batch!=null) {
            String path = this.downLoadPreffix + batch.getFilePath();
            File file = new File(path);
            HttpHeaders headers = new HttpHeaders();
            String fileName = new String(batch.getBatchName().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
            headers.setContentDispositionFormData("attachment", fileName);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                    headers, HttpStatus.CREATED);
        }
        return null;

    }


}

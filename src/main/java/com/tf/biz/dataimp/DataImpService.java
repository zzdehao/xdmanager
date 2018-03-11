package com.tf.biz.dataimp;
import com.tf.biz.check.entity.BizCheckPlan;
import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.biz.dataimp.entity.BizImportUserExample;
import com.tf.biz.dataimp.mapper.BizImportUserMapper;
import com.tf.biz.imp.ImportService;
import com.tf.biz.imp.constant.ImportEnum;
import com.tf.biz.imp.entity.BizImportBatch;
import com.tf.biz.imp.entity.BizImportBatchExample;
import com.tf.biz.imp.mapper.BizImportBatchMapper;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.entity.BizStoreExample;
import com.tf.biz.store.mapper.BizStoreMapper;
import com.tf.common.utils.MD5;
import com.tf.common.utils.ObjectExcelRead;
import com.tf.tadmin.entity.*;
import com.tf.tadmin.mapper.AdminMapper;
import com.tf.tadmin.mapper.RoleMapper;
import com.tf.tadmin.service.BaseService;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.Constants;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
/**
 * Created by wugq on 2018/3/6.
 */
@Service
@Transactional
public class DataImpService extends BaseService {

    @Value("${init.password}")
    private String initPassword;

    @Value("${init.roleCode}")
    private String initRoleCode;
    @Autowired
    private BizImportUserMapper importUserMapper;
    @Autowired
    private ImportService importService;

    @Autowired
    private AdminMapper   adminMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private BizImportBatchMapper batchMapper;
    @Autowired
    private BizStoreMapper bizStoreMapper;

    public Pager<BizImportUser> queryUserList(Integer start, Map<String, Object> param) {
        //limit ${start},${rows}
        int rows = Constants.PAGE_SIZE;
        Pager<BizImportUser> pager = new Pager<BizImportUser>();
        //组件查询条件
        BizImportUserExample express = new BizImportUserExample();
        express.setLimit(rows);
        express.setOffset(start);
        // limit 4 offset 9 4表示返回4行，9表示从表的第十行开始
        express.setOrderByClause(" create_time desc ");
        //增加查询条件
        BizImportUserExample.Criteria queryExpress = express.createCriteria();
        List<BizImportUser> list = importUserMapper.selectByExample(express);
        Long count = importUserMapper.countByExample(express);
        pager.setRows(list);
        pager.setTotal(count.intValue());
        return pager;
    }

    /**
     *  上传文件以及解析
     *  放入临时表
     *  并放入用户表
     *  注意:
     *  初始密码为:11111111 初始角色为:general
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean saveImpUserData(MultipartFile multipartFile,
                                   FilePath filePath, Map<String, Object> param)
            throws IOException, InvalidFormatException {
        Long batchId = this.importService.save(multipartFile, filePath, ImportEnum.ImportType.USER.getCode());
        //解析文件
        InputStream inputStream = multipartFile.getInputStream();
        /**
         * @param startrow  //开始行号
         * @param startcol  //开始列号
         * @param endcol   //结束列号
         * @param sheetnum //sheet
         */
        List<Map> readDatas = (List) ObjectExcelRead.readExcelInputStream(inputStream, 1, 0, 13, 0);
        System.out.println("readDatas:" + readDatas.size());
        List<BizImportUser> importData = new ArrayList<BizImportUser>();
        List<Admin> userData = new ArrayList<Admin>();
        if (readDatas != null && readDatas.size() > 0) {
            Role role = roleMapper.getByRoleCode(initRoleCode);
            BizImportUser userPo = null;
            Admin admin = null;
            for (Map data : readDatas) {
                userPo = new BizImportUser();
                admin = new Admin();
                admin.setBlz1(batchId.toString());
                userPo.setBatchId(batchId);
                //检查数据项 姓名  手机号码
                String uname = (String) data.get("var0");
                String phone = (String) data.get("var6");
                if(StringUtils.isEmpty(uname)&&StringUtils.isEmpty(phone)){
                    continue;
                }
                userPo.setUserName((String) data.get("var0"));//姓名
                admin.setTrueName(userPo.getUserName());

                userPo.setUserId((String) data.get("var1"));//UserID
                admin.setBlz2(userPo.getUserId().toString());
                userPo.setProvinceName((String) data.get("var2"));//省（I级）_2
                admin.setProvinceName(userPo.getProvinceName());
                userPo.setCityName((String) data.get("var3"));//地市（二级）_3
                admin.setCityName(userPo.getCityName());
                userPo.setThreelevelName((String) data.get("var4"));//联通/代理商/其它（三级）_1
                admin.setBusTypename(userPo.getThreelevelName());
                userPo.setFourLevelname((String) data.get("var5"));//部门/团队/网格（四级）_1
                admin.setDeptName(userPo.getFourLevelname());
                userPo.setFiveLevelphone((String) data.get("var6"));//联系电话（五级）
                admin.setTel(userPo.getFiveLevelphone());
                //导入人员账号name为tel
                admin.setName(userPo.getFiveLevelphone());
                userPo.setSecondPhone((String) data.get("var7"));//第二联系电话
                admin.setTel2(userPo.getSecondPhone());
                userPo.setDutyName((String) data.get("var8"));//职务
                admin.setDutyName(userPo.getDutyName());
                userPo.setGridName((String) data.get("var9"));//网格名称
                admin.setGridName(userPo.getGridName());
                userPo.setGridCode((String) data.get("var10"));//网格代码
                admin.setGridCode(userPo.getGridCode());

                userPo.setDataUpdatetime((String) data.get("var11"));//数据更新时间
                admin.setDataupDate(userPo.getDataUpdatetime());

                userPo.setQita1((String) data.get("var12"));//其它信息1
                userPo.setQita1(userPo.getQita1());
                userPo.setQita2((String) data.get("var13"));//其它信息2
                admin.setQita2(userPo.getQita2());

                admin.setRoleCode(initRoleCode);
                admin.setNickname(userPo.getFiveLevelphone());
                admin.setPassword(MD5.getMD5(initPassword));
                userData.add(admin);
                importData.add(userPo);
            }
            //保存数据
            final Date now = new Date();
            final SessionUser sessionUser = ShiroUtils.getSessionUser();
            final int userId = sessionUser.getId();
            final String name = sessionUser.getName();
            importData.forEach(s -> {
                s.setBatchId(batchId);
                s.setCreateTime(now);
                s.setCreateUserId(userId);
                s.setCreateUserName(name);
                this.importUserMapper.insertSelective(s);
            });
            //生成用户与角色信息
            userData.forEach(u -> {
                //生成用户信息
                Admin qadmin = this.adminMapper.queryByLogin(u.getTel());
                if(qadmin==null) {
                    this.adminMapper.insert(u);
                    UserRole urole = new UserRole();
                    urole.setRoleId(role.getId());
                    urole.setUserId(u.getId());
                    //生成角色人员信息
                    this.roleMapper.userRoleInsert(urole);
                }
            });
        }
        return true;
    }
    /**
     * 上传文件列表
     * @param start
     * @param param
     * @return
     */
    public Pager<BizImportBatch> queryUpLoadFileList(Integer start, Map<String, Object> param) {
        //limit ${start},${rows}
        int rows = Constants.PAGE_SIZE;
        Pager<BizImportBatch> pager = new Pager<BizImportBatch>();
        //组件查询条件
        BizImportBatchExample express = new BizImportBatchExample();
        express.setLimit(rows);
        express.setOffset(start);
        // limit 4 offset 9 4表示返回4行，9表示从表的第十行开始
        express.setOrderByClause(" create_time desc ");
        //增加查询条件
        BizImportBatchExample.Criteria queryExpress = express.createCriteria();
        if(param!=null){
            Object obj = param.get("importTypes");
            if(obj!=null) {
                List<Integer> importTypes =(List<Integer>)obj;
                 queryExpress.andImportTypeIn(importTypes);
            }
            Object importType =param.get("importType");
            if(importType!=null) {
                queryExpress.andImportTypeEqualTo((Integer)importType);
            }
        }
        List<BizImportBatch> list = batchMapper.selectByExample(express);
        Long count = batchMapper.countByExample(express);
        pager.setRows(list);
        pager.setTotal(count.intValue());
        return pager;
    }
    /**
     * 导入计划
     * @param multipartFile
     * @param filePath
     * @param param
     * @return
     * @throws IOException
     * @throws InvalidFormatException
     */
    public boolean saveImportCheckPlanData(MultipartFile multipartFile,
                                   FilePath filePath,
                                   Map<String, Object> param,
                                           ImportEnum.ImportType importType)
            throws IOException, InvalidFormatException {
        /**
         * SELF_CHANNEL_PLAN(31, "自有渠道","巡检计划"),
           WORLD_CHANNEL_PLAN(32, "社会渠道","巡检计划"),
           SMALL_CHANNEL_PLAN(33, "小微渠道","巡检计划");
         */
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        ParsePosition pos = new ParsePosition(0);

        String  minDate = (String)param.get("minDate");
        String  maxDate = (String)param.get("maxDate");
        Long batchId = this.importService.save(multipartFile,
                filePath,importType.getCode());
        //解析文件
        InputStream inputStream = multipartFile.getInputStream();
        List<Map> readDatas = (List) ObjectExcelRead.readExcelInputStream(inputStream, 1, 0, 13, 0);
        List<BizCheckPlan> planData = new ArrayList<BizCheckPlan>();
        if (readDatas != null && readDatas.size() > 0) {
            BizCheckPlan plan = null;
            for(Map data : readDatas) {
                plan = new BizCheckPlan();
                plan.setBatchId(batchId);
                plan.setCheckStartDate(formatter.parse(minDate, pos));
                plan.setCheckEndDate(formatter.parse(maxDate, pos));
                //检查数据项  渠道编码
                String channelCode = (String)data.get("var1");
                if(StringUtils.isEmpty(channelCode)){
                    continue;
                }
                /**
                 * 1、自有渠道
                   渠道编码
                   地市
                   区县分公司名称
                   区县分公司编码
                   渠道名称
                   渠道类型
                   详细地址
                   备注
                   是否是有效渠道
                   人员匹配（渠道经理）
                   渠道经理电话
                   巡店人
                   巡店人电话
                 */
            }
        }
        return true;
    }

    /**
     * 查询店铺信息
     * @param start
     * @param param
     * @return
     */
    public Pager<BizStore> queryStoreList(Integer start, Map<String, Object> param) {
        //limit ${start},${rows}
        int rows = Constants.PAGE_SIZE;
        Pager<BizStore> pager = new Pager<BizStore>();
        String key=(String)param.get("key");
        Integer channelType =(Integer)param.get("channelType");
        //组件查询条件
        BizStoreExample express = new BizStoreExample();
        express.setLimit(rows);
        express.setOffset(start);
        express.setOrderByClause(" create_time desc ");
        //增加查询条件where channel_type=1 and ()效果
        BizStoreExample.Criteria cc= express.createCriteria();
        if(!StringUtils.isEmpty(key)) {
            cc.andChannelNameLike("%"+key+"%");
            BizStoreExample.Criteria c2= express.createCriteria().andChannelCodeLike("%"+key+"%");
            BizStoreExample.Criteria c3= express.createCriteria().andStoreNameLike("%"+key+"%");
            if(channelType!=-1){
                cc.andChannelTypeEqualTo(channelType);
                c2.andChannelTypeEqualTo(channelType);
                c3.andChannelTypeEqualTo(channelType);
            }
            express.or(c2);
            express.or(c3);
        }else{
            if(channelType!=-1){
                cc.andChannelTypeEqualTo(channelType);
            }
        }
        List<BizStore> list = bizStoreMapper.selectByExample(express);
        Long count = bizStoreMapper.countByExample(express);
        pager.setRows(list);
        pager.setTotal(count.intValue());
        return pager;
    }
    public int delStore(Integer id){
       return this.bizStoreMapper.deleteByPrimaryKey(Long.parseLong(id.toString()));
    }
}

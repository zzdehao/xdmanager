package com.tf.biz.dataimp;
import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.biz.dataimp.entity.BizImportUserExpress;
import com.tf.biz.dataimp.mapper.BizImportUserMapper;
import com.tf.biz.imp.ImportService;
import com.tf.biz.imp.constant.ImportEnum;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.common.utils.ObjectExcelRead;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.service.BaseService;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.Constants;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.io.InputStream;
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
    @Autowired
    private BizImportUserMapper bizImportUserMapper;
    @Autowired
    private ImportService importService;

    public Pager<BizImportUser> queryUserList(Integer start, Map<String, Object> param) {
        //limit ${start},${rows}
        int rows = Constants.PAGE_SIZE;
        Pager<BizImportUser> pager = new Pager<BizImportUser>();
        //组件查询条件
        BizImportUserExpress express = new BizImportUserExpress();
        express.setLimit(rows);
        express.setOffset(start);
        // limit 4 offset 9 4表示返回4行，9表示从表的第十行开始
        express.setOrderByClause(" create_time desc ");
        BizImportUserExpress.Criteria queryExpress = express.createCriteria();

        List<BizImportUser> list = bizImportUserMapper.selectByExpress(express);
        Long count = bizImportUserMapper.countByExpress(express);
        pager.setRows(list);
        pager.setTotal(count.intValue());
        return pager;
    }

    /**
     *  上传文件以及解析
     *  放入临时表
     * @return
     */
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
        int count = 0;
        if (readDatas != null && readDatas.size() > 0) {
            BizImportUser userPo = null;
            for (Map data : readDatas) {
                userPo = new BizImportUser();
                userPo.setBatchId(batchId);
                //检查数据项 姓名  手机号码
                String uname = (String) data.get("var0");
                String phone = (String) data.get("var6");
                if(StringUtils.isEmpty(uname)&&StringUtils.isEmpty(phone)){
                    continue;
                }
                userPo.setUserName((String) data.get("var0"));//姓名
                userPo.setUserId((String) data.get("var1"));//UserID
                userPo.setProvinceName((String) data.get("var2"));//省（I级）_2
                userPo.setCityName((String) data.get("var3"));//地市（二级）_3
                userPo.setThreelevelName((String) data.get("var4"));//联通/代理商/其它（三级）_1
                userPo.setFourLevelname((String) data.get("var5"));//部门/团队/网格（四级）_1
                userPo.setFiveLevelphone((String) data.get("var6"));//联系电话（五级）
                userPo.setSecondPhone((String) data.get("var7"));//第二联系电话

                userPo.setDutyName((String) data.get("var8"));//职务
                userPo.setGridName((String) data.get("var9"));//网格名称
                userPo.setGridCode((String) data.get("var10"));//网格代码
                userPo.setDataUpdatetime((String) data.get("var11"));//数据更新时间
                userPo.setQita1((String) data.get("var12"));//其它信息1
                userPo.setQita2((String) data.get("var13"));//其它信息2
                importData.add(userPo);
                count++;
            }
            //保存数据
            final Date now = new Date();
            final SessionUser sessionUser = ShiroUtils.getSessionUser();
            final int userId = sessionUser.getId();
            final String trueName = sessionUser.getTrueName();
            importData.forEach(s -> {
                s.setBatchId(batchId);
                s.setCreateTime(now);
                s.setCreateUserId(userId);
                s.setCreateUserName(trueName);
                this.bizImportUserMapper.insertSelective(s);
            });
        }
        return true;

    }
}

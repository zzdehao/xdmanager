package com.tf.biz.store;

import com.tf.biz.imp.ImportService;
import com.tf.biz.imp.constant.ImportEnum;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.entity.BizStoreExample;
import com.tf.biz.store.mapper.BizStoreMapper;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.ExcelUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class StoreService {

    @Autowired
    private BizStoreMapper bizStoreMapper;

    @Autowired
    private ImportService importService;

    public void saveMultipartFile(MultipartFile multipartFile,
                                  FilePath filePath,ImportEnum.ImportType importType)
            throws IOException, InvalidFormatException {
        Long batchId = this.importService.save(multipartFile,
                filePath,
                importType.getCode());
        InputStream inputStream = multipartFile.getInputStream();
        Workbook wb = WorkbookFactory.create(inputStream);
        Sheet sheet = wb.getSheetAt(0);
        List<BizStore> storeList = this.buildStoreList(sheet,importType);
        this.saveBatch(storeList, batchId);
    }

    public void saveBatch(List<BizStore> bizStoreList, Long batchId){
        final Date now = new Date();
        final SessionUser sessionUser = ShiroUtils.getSessionUser();
        final int userId = sessionUser.getId();
        final String trueName = sessionUser.getTrueName();
        bizStoreList.forEach(s -> {
            s.setBatchId(batchId);
            s.setCreateTime(now);
            s.setCreateUserId(userId);
            s.setCreateUserName(trueName);
            this.save(s);
        });
    }

    void save(BizStore bizStore){
        this.bizStoreMapper.insertSelective(bizStore);
    }

    private List<BizStore> buildStoreList(Sheet sheet,ImportEnum.ImportType importType) {

        List<BizStore> bizStoreList = new ArrayList<>(sheet.getLastRowNum() + 1);
        for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
            Row row = sheet.getRow(rowNum);
            if (row == null) {
                continue;
            }
            BizStore bizStore = new BizStore();
            int i = 0;
            if(importType==ImportEnum.ImportType.SELF_CHANNEL) {
                //bizStore.setChannelType(ImportEnum.ImportType.SELF_CHANNEL.getCode());
                /**
                 *
                 ID
                 渠道编码
                 地市
                 区县分公司名称
                 区县分公司编码
                 渠道名称
                 渠道类型
                 详细地址
                 备注
                 是否是有效渠道
                 人员匹配(渠道经理)
                 渠道经理电话
                 巡店人
                 巡店人电话
                 */
                String cid = ExcelUtil.getFromCell(row.getCell(i++));
                String ccode = ExcelUtil.getFromCell(row.getCell(i++));
                String ds=ExcelUtil.getFromCell(row.getCell(i++));
                if(!StringUtils.isEmpty(cid)
                        &&!StringUtils.isEmpty(ccode)
                        &&!StringUtils.isEmpty(ds)) {
                    bizStore.setChannelId(Integer.valueOf(cid)); //渠道ID
                    bizStore.setChannelCode(ccode); //渠道编码
                    bizStore.setCityId(null); //地市
                    bizStore.setCityName(ds); //地市
                    bizStore.setCompanyName(ExcelUtil.getFromCell(row.getCell(i++)));  //区县分公司名称
                    bizStore.setCompanyCode(ExcelUtil.getFromCell(row.getCell(i++)));  // 区县分公司编码
                    bizStore.setChannelName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道名称
                    bizStore.setChannelType(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //渠道类型
                    bizStore.setProvinceId(null); //省ID
                    bizStore.setProvinceName(null); //省名称
                    bizStore.setAddressDetail(ExcelUtil.getFromCell(row.getCell(i++))); //详细地址
                    bizStore.setRemark(ExcelUtil.getFromCell(row.getCell(i++)));//备注

                    String IsValidChannel = ExcelUtil.getFromCell(row.getCell(i++));//是否有效渠道
                    if ("是".equals(IsValidChannel)) {
                        bizStore.setIsValidChannel(1);//是否有效渠道
                    } else {
                        bizStore.setIsValidChannel(0);//是否有效渠道
                    }
                    bizStore.setChannelManagerId(0); //渠道经理ID
                    bizStore.setChannelManagerName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理姓名
                    bizStore.setChannelManagerPhone(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理电话
                    //todo 巡店人姓名和巡店人电话
                    bizStore.setLongitude("0"); //经度
                    bizStore.setLatitude("0"); //纬度

                    bizStoreList.add(bizStore);
                }

            }
            else if(importType==ImportEnum.ImportType.WORLD_CHANNEL) {
                //bizStore.setChannelType(ImportEnum.ImportType.WORLD_CHANNEL.getCode());
                /**
                 *
                 ID
                 渠道编码
                 地市
                 区县分公司名称
                 区县分公司编码
                 渠道名称
                 渠道类型
                 店铺名称
                 详细地址
                 备注
                 是否是有效渠道
                 人员匹配（渠道经理）
                 渠道经理电话
                 巡店人
                 巡店人电话
                 */
                String cid = ExcelUtil.getFromCell(row.getCell(i++));
                String ccode = ExcelUtil.getFromCell(row.getCell(i++));
                String ds=ExcelUtil.getFromCell(row.getCell(i++));
                if(!StringUtils.isEmpty(cid)
                        &&!StringUtils.isEmpty(ccode)
                        &&!StringUtils.isEmpty(ds)) {


                    bizStore.setChannelId(Integer.valueOf(cid)); //渠道ID
                    bizStore.setChannelCode(ccode); //渠道编码
                    bizStore.setCityId(null); //地市id
                    bizStore.setCityName(ds); //地市
                    bizStore.setCompanyName(ExcelUtil.getFromCell(row.getCell(i++)));  //区县分公司名称
                    bizStore.setCompanyCode(ExcelUtil.getFromCell(row.getCell(i++)));  // 区县分公司编码
                    bizStore.setChannelName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道名称
                    bizStore.setChannelType(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //渠道类型
                    bizStore.setProvinceId(null); //省ID
                    bizStore.setProvinceName(null); //省名称
                    //diff
                    bizStore.setStoreName(ExcelUtil.getFromCell(row.getCell(i++))); //店铺名称
                    bizStore.setAddressDetail(ExcelUtil.getFromCell(row.getCell(i++))); //详细地址
                    bizStore.setRemark(ExcelUtil.getFromCell(row.getCell(i++)));//备注

                    String IsValidChannel = ExcelUtil.getFromCell(row.getCell(i++));//是否有效渠道
                    if ("是".equals(IsValidChannel)) {
                        bizStore.setIsValidChannel(1);//是否有效渠道
                    } else {
                        bizStore.setIsValidChannel(0);//是否有效渠道
                    }
                    bizStore.setChannelManagerId(0); //渠道经理ID
                    bizStore.setChannelManagerName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理姓名
                    bizStore.setChannelManagerPhone(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理电话
                    //todo 巡店人姓名和巡店人电话
                    bizStore.setLongitude("0"); //经度
                    bizStore.setLatitude("0"); //纬度

                    bizStoreList.add(bizStore);
                }
            }
            else if(importType==ImportEnum.ImportType.SMALL_CHANNEL) {
                //bizStore.setChannelType(ImportEnum.ImportType.SMALL_CHANNEL.getCode());
                /**
                 ID
                 渠道编码
                 平台商名称
                 平台商编码
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
                String cid = ExcelUtil.getFromCell(row.getCell(i++));
                String ccode = ExcelUtil.getFromCell(row.getCell(i++));
                if(!StringUtils.isEmpty(cid)
                        &&!StringUtils.isEmpty(ccode)
                        ) {

                    bizStore.setChannelId(Integer.valueOf(cid)); //渠道ID
                    bizStore.setChannelCode(ccode); //渠道编码
                    //diff
                    bizStore.setPlatformName(ExcelUtil.getFromCell(row.getCell(i++)));//平台商名称
                    bizStore.setPlatformCode(ExcelUtil.getFromCell(row.getCell(i++)));//平台商编码
                    bizStore.setCityId(null); //地市
                    bizStore.setCityName(ExcelUtil.getFromCell(row.getCell(i++))); //地市
                    bizStore.setCompanyName(ExcelUtil.getFromCell(row.getCell(i++)));  //区县分公司名称
                    bizStore.setCompanyCode(ExcelUtil.getFromCell(row.getCell(i++)));  // 区县分公司编码
                    bizStore.setChannelName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道名称
                    bizStore.setChannelType(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //渠道类型
                    bizStore.setProvinceId(null); //省ID
                    bizStore.setProvinceName(null); //省名称
                    bizStore.setAddressDetail(ExcelUtil.getFromCell(row.getCell(i++))); //详细地址
                    bizStore.setRemark(ExcelUtil.getFromCell(row.getCell(i++)));//备注

                    String IsValidChannel = ExcelUtil.getFromCell(row.getCell(i++));//是否有效渠道
                    if ("是".equals(IsValidChannel)) {
                        bizStore.setIsValidChannel(1);//是否有效渠道
                    } else {
                        bizStore.setIsValidChannel(0);//是否有效渠道
                    }
                    bizStore.setChannelManagerId(0); //渠道经理ID
                    bizStore.setChannelManagerName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理姓名
                    bizStore.setChannelManagerPhone(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理电话
                    //todo 巡店人姓名和巡店人电话
                    bizStore.setLongitude("0"); //经度
                    bizStore.setLatitude("0"); //纬度

                    bizStoreList.add(bizStore);
                }
            }
        }
        return bizStoreList;
    }
    List<BizStore> findStore(BizStoreExample example){
        return this.bizStoreMapper.selectByExample(example);
    }

    public BizStore getStoreById(Integer id){
        return this.bizStoreMapper.selectByPrimaryKey(Long.parseLong(id.toString()));
    }
}

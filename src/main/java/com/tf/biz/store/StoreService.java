package com.tf.biz.store;
import com.tf.biz.common.StaticDataMap;
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
import java.util.*;

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
        String batchName=importService.createBatchId(ImportEnum.ImportType.getFullName(importType.getCode()));
        Map<String,String> paramMap = new HashMap<String,String>();
        paramMap.put("batchName",batchName);
        Long batchId = this.importService.save(multipartFile,
                filePath,
                importType.getCode(),paramMap);
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
            this.saveOrUpdate(s);
        });
    }

    public void saveOrUpdate(BizStore bizStore){

        if(bizStore.getId()==null){
            this.bizStoreMapper.insertSelective(bizStore);
        }else{
            this.bizStoreMapper.updateByPrimaryKeySelective(bizStore);
        }

    }
    private Integer  getCityOrProvinceCode(String name){
        Map<String,String>  provinceCityeMapping = StaticDataMap.provinceAndCityNameToCodeMapping;
        try {
            if (!StringUtils.isEmpty(name)) {
                return Integer.parseInt(provinceCityeMapping.get(name.trim()));

            } else {
                return null;
            }
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
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
                 渠道编码
                 省
                 市
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
                String ccode = ExcelUtil.getFromCell(row.getCell(i++));
                if(!StringUtils.isEmpty(ccode)) {
                    bizStore.setChannelId(0); //渠道ID,暂时去掉
                    bizStore.setChannelCode(ccode); //渠道编码

                    bizStore.setProvinceName(ExcelUtil.getFromCell(row.getCell(i++)));
                    bizStore.setProvinceCode(getCityOrProvinceCode(bizStore.getProvinceName()));
                    bizStore.setCityName(ExcelUtil.getFromCell(row.getCell(i++))); //市
                    bizStore.setCityCode(getCityOrProvinceCode(bizStore.getCityName()));

                    bizStore.setCompanyName(ExcelUtil.getFromCell(row.getCell(i++)));  //区县分公司名称
                    bizStore.setCompanyCode(ExcelUtil.getFromCell(row.getCell(i++)));  // 区县分公司编码
                    bizStore.setChannelName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道名称
                    String channelType=ExcelUtil.getFromCell(row.getCell(i++));
                    if("自有渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.SELF.getCode()); //渠道类型

                    }
                    if("社会渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.WORLD.getCode()); //渠道类型

                    }
                    if("小微渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.SMALL.getCode()); //渠道类型

                    }
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
                 渠道编码
                 省市
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
                String ccode = ExcelUtil.getFromCell(row.getCell(i++));
                if(!StringUtils.isEmpty(ccode)) {
                    bizStore.setChannelId(0); //渠道ID
                    bizStore.setChannelCode(ccode); //渠道编码

                    bizStore.setProvinceName(ExcelUtil.getFromCell(row.getCell(i++)));
                    bizStore.setProvinceCode(getCityOrProvinceCode(bizStore.getProvinceName()));
                    bizStore.setCityName(ExcelUtil.getFromCell(row.getCell(i++))); //市
                    bizStore.setCityCode(getCityOrProvinceCode(bizStore.getCityName()));

                    bizStore.setCompanyName(ExcelUtil.getFromCell(row.getCell(i++)));  //区县分公司名称
                    bizStore.setCompanyCode(ExcelUtil.getFromCell(row.getCell(i++)));  // 区县分公司编码
                    bizStore.setChannelName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道名称
                    String channelType=ExcelUtil.getFromCell(row.getCell(i++));
                    if("自有渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.SELF.getCode()); //渠道类型

                    }
                    if("社会渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.WORLD.getCode()); //渠道类型

                    }
                    if("小微渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.SMALL.getCode()); //渠道类型

                    }
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
                 渠道编码
                 平台商名称
                 平台商编码
                 省
                 市
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
                String ccode = ExcelUtil.getFromCell(row.getCell(i++));
                if(!StringUtils.isEmpty(ccode)) {
                    bizStore.setChannelId(0); //渠道ID
                    bizStore.setChannelCode(ccode); //渠道编码
                    //diff
                    bizStore.setPlatformName(ExcelUtil.getFromCell(row.getCell(i++)));//平台商名称
                    bizStore.setPlatformCode(ExcelUtil.getFromCell(row.getCell(i++)));//平台商编码

                    bizStore.setProvinceName(ExcelUtil.getFromCell(row.getCell(i++)));
                    bizStore.setProvinceCode(getCityOrProvinceCode(bizStore.getProvinceName()));
                    bizStore.setCityName(ExcelUtil.getFromCell(row.getCell(i++))); //市
                    bizStore.setCityCode(getCityOrProvinceCode(bizStore.getCityName()));

                    bizStore.setCompanyName(ExcelUtil.getFromCell(row.getCell(i++)));  //区县分公司名称
                    bizStore.setCompanyCode(ExcelUtil.getFromCell(row.getCell(i++)));  // 区县分公司编码
                    bizStore.setChannelName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道名称

                    String channelType=ExcelUtil.getFromCell(row.getCell(i++));
                    if("自有渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.SELF.getCode()); //渠道类型
                    }
                    if("社会渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.WORLD.getCode()); //渠道类型
                    }
                    if("小微渠道".equals(channelType)) {
                        bizStore.setChannelType(ImportEnum.ChannelType.SMALL.getCode()); //渠道类型
                    }
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

    public List<BizStore> findStore(BizStoreExample example){
        return this.bizStoreMapper.selectByExample(example);
    }
    public BizStore getStoreById(Integer id){
        return this.bizStoreMapper.selectByPrimaryKey(Long.parseLong(id.toString()));
    }



}

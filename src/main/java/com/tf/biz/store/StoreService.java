package com.tf.biz.store;

import com.tf.biz.imp.ImportService;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.mapper.BizStoreMapper;
import com.tf.tadmin.utils.ExcelUtil;
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
import java.util.List;

@Service
@Transactional
public class StoreService {

    @Autowired
    private BizStoreMapper bizStoreMapper;

    @Autowired
    private ImportService importService;

    void saveMultipartFile(MultipartFile multipartFile, FilePath filePath) throws IOException, InvalidFormatException {
        Long batchId = this.importService.save(multipartFile, filePath);
        InputStream inputStream = multipartFile.getInputStream();
        Workbook wb = WorkbookFactory.create(inputStream);
        Sheet sheet = wb.getSheetAt(0);
        List<BizStore> storeList = this.buildStoreList(sheet);
        this.saveBatch(storeList, batchId);
    }

    void saveBatch(List<BizStore> bizStoreList, Long batchId){
        bizStoreList.forEach(s -> {
            s.setBatchId(batchId);
            this.save(s);
        });
    }

    void save(BizStore bizStore){
        this.bizStoreMapper.insertSelective(bizStore);
    }

    private List<BizStore> buildStoreList(Sheet sheet) {
        List<BizStore> bizStoreList = new ArrayList<>(sheet.getLastRowNum() + 1);
        for (int rowNum = 2; rowNum <= sheet.getLastRowNum(); rowNum++) {
            Row row = sheet.getRow(rowNum);
            if (row == null) {
                continue;
            }
            BizStore bizStore = new BizStore();
            int i = 0;
            bizStore.setChannelId(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //渠道ID
            bizStore.setChannelCode(ExcelUtil.getFromCell(row.getCell(i++))); //渠道编码
            bizStore.setChannelName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道名称
            bizStore.setChannelType(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //渠道类型
            bizStore.setCompanyCode(ExcelUtil.getFromCell(row.getCell(i++)));  // 区县分公司编码
            bizStore.setCompanyName(ExcelUtil.getFromCell(row.getCell(i++)));  //区县分公司名称
            bizStore.setProvinceId(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //省ID
            bizStore.setProvinceName(ExcelUtil.getFromCell(row.getCell(i++))); //省名称
            bizStore.setCityId(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //市ID
            bizStore.setCityName(ExcelUtil.getFromCell(row.getCell(i++))); //市名称
            bizStore.setAddressDetail(ExcelUtil.getFromCell(row.getCell(i++))); //详细地址
            bizStore.setLongitude(ExcelUtil.getFromCell(row.getCell(i++))); //经度
            bizStore.setLatitude(ExcelUtil.getFromCell(row.getCell(i++))); //纬度
            bizStore.setChannelManagerId(Integer.valueOf(ExcelUtil.getFromCell(row.getCell(i++)))); //渠道经理ID
            bizStore.setChannelManagerName(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理姓名
            bizStore.setChannelManagerPhone(ExcelUtil.getFromCell(row.getCell(i++))); //渠道经理电话
            bizStoreList.add(bizStore);
        }
        return bizStoreList;
    }

}

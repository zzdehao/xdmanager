package com.tf.biz.check;

import com.tf.biz.check.entity.*;
import com.tf.biz.check.mapper.BizCheckDetailMapper;
import com.tf.biz.check.mapper.BizCheckPlanMapper;
import com.tf.biz.check.param.BizCheckDetailColResponse;
import com.tf.biz.store.StoreService;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.entity.BizStoreExample;
import com.tf.tadmin.service.DicService;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@Transactional
public class CheckService {

    private final String typeCode = "checkyesno";

    @Autowired
    private DicService dicService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private BizCheckPlanMapper bizCheckPlanMapper;

    @Autowired
    private BizCheckDetailMapper bizCheckDetailMapper;

    @Autowired
    private BizCheckDetailItemMapper bizCheckDetailItemMapper;

    @Transactional(readOnly = true)
    XSSFWorkbook createExcel(BizCheckDetail checkDetail, Integer limit, Integer offset) {

        List<BizCheckDetailColResponse> checkDetailColResponseList = this.findList(checkDetail, limit, offset);

        return buildExcel(tDictList, checkDetailColResponseList);
    }

    private List findList(BizCheckDetail checkDetail, Integer limit, Integer offset) {

        List<BizCheckDetailColResponse> checkDetailColResponseList = new ArrayList<>();

        BizCheckDetailExample detailExample = new BizCheckDetailExample();
        detailExample.createCriteria().andIdIn(detailIdList);
        //检查详情列表
        List<BizCheckDetail> detailList = this.bizCheckDetailMapper.selectByExample(detailExample);
        //店铺ID列表
        List<Long> storeIdList = detailList.stream().map(BizCheckDetail::getStoreId).distinct().collect(Collectors.toList());

        BizStoreExample exampleStore = new BizStoreExample();
        exampleStore.createCriteria().andIdIn(storeIdList);
        List<BizStore> storeList = this.storeService.findStore(exampleStore);
        if (CollectionUtils.isEmpty(storeList)) {
            return checkDetailColResponseList;
        }
        //店铺Map
        Map<Long, BizStore> storeMap = storeList.stream().collect(Collectors.toMap(BizStore::getId, Function.identity()));

        detailList.forEach(d -> {
            BizCheckDetailColResponse checkDetailColResponse = new BizCheckDetailColResponse();
            checkDetailColResponseList.add(checkDetailColResponse);
            checkDetailColResponse.setBizStore(storeMap.get(d.getStoreId()));
            checkDetailColResponse.setBizCheckDetail(d);
            checkDetailColResponse.setColMap(itemMap.get(d.getId()));
        });

        return checkDetailColResponseList;
    }

//    @Transactional(readOnly = true)
//    XSSFWorkbook createExcel(HttpServletRequest request) {
//        //列名列表
//        List<TDict> tDictList = this.dicService.list(typeCode);
//        List<BizCheckDetailColResponse> checkDetailColResponseList = this.findList(request, tDictList);
//
//        return buildExcel(tDictList, checkDetailColResponseList);
//    }
//
//    private List findList(HttpServletRequest request, List<TDict> tDictList) {
//
//        List<BizCheckDetailColResponse> checkDetailColResponseList = new ArrayList<>();
//
//        BizCheckDetailItemExample itemExample = new BizCheckDetailItemExample();
//        BizCheckDetailItemExample.Criteria criteria = itemExample.createCriteria();
//        AtomicBoolean flag = new AtomicBoolean(false);
//        tDictList.forEach((TDict d) -> {
//            String colName = d.getValue();
//            String value = request.getParameter(colName);
//            if (!StringUtils.isBlank(value)) {
//                flag.set(true);
//                criteria.andColNameEqualTo(colName).andValueEqualTo(Integer.parseInt(value));
//            }
//        });
//
//        //检查项列表
//        List<BizCheckDetailItem> itemList = this.bizCheckDetailItemMapper.selectByExample(itemExample);
//        Map<Long, List<BizCheckDetailItem>> itemListMap = itemList.stream().collect(Collectors.groupingBy(BizCheckDetailItem::getCheckDetailId, Collectors.toList()));
//        Map<Long, Map<String, Object>> itemMap = new HashMap<>();
//        itemListMap.forEach((k, v) -> {
//            Map<String, Object> colMap = new HashMap<>();
//            v.forEach(l -> {
//                colMap.put(l.getColName(), l.getValue());
//            });
//            itemMap.put(k, colMap);
//        });
//        if (CollectionUtils.isEmpty(itemList)) {
//            return checkDetailColResponseList;
//        }
//        //检查详情Id
//        List<Long> detailIdList = itemList.stream().map(BizCheckDetailItem::getCheckDetailId).distinct().collect(Collectors.toList());
//
//        BizCheckDetailExample detailExample = new BizCheckDetailExample();
//        detailExample.createCriteria().andIdIn(detailIdList);
//        //检查详情列表
//        List<BizCheckDetail> detailList = this.bizCheckDetailMapper.selectByExample(detailExample);
//        //店铺ID列表
//        List<Long> storeIdList = detailList.stream().map(BizCheckDetail::getStoreId).collect(Collectors.toList());
//
//        BizStoreExample exampleStore = new BizStoreExample();
//        exampleStore.createCriteria().andIdIn(storeIdList);
//        List<BizStore> storeList = this.storeService.findStore(exampleStore);
//        if (CollectionUtils.isEmpty(storeList)) {
//            return checkDetailColResponseList;
//        }
//        //店铺Map
//        Map<Long, BizStore> storeMap = storeList.stream().collect(Collectors.toMap(BizStore::getId, Function.identity()));
//
//        detailList.forEach(d -> {
//            BizCheckDetailColResponse checkDetailColResponse = new BizCheckDetailColResponse();
//            checkDetailColResponseList.add(checkDetailColResponse);
//            checkDetailColResponse.setBizStore(storeMap.get(d.getStoreId()));
//            checkDetailColResponse.setBizCheckDetail(d);
//            checkDetailColResponse.setColMap(itemMap.get(d.getId()));
//        });
//
//        return checkDetailColResponseList;
//    }
//
//    private XSSFWorkbook buildExcel(List<TDict> tDictList, List<BizCheckDetailColResponse> checkDetailColResponseList) {
//        FileOutputStream fileOut = null;
//        BufferedImage bufferImg = null;
//
//        XSSFWorkbook workBook = new XSSFWorkbook();
//        XSSFSheet sheet = workBook.createSheet("巡店检查记录");
//        XSSFRow headRow = sheet.createRow(0);
//        XSSFCell cell = null;
//        int n = 0;
//        cell = headRow.createCell(n++);
//        cell.setCellValue("计划批次");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("省份");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("城市");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("渠道名称");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("公司名称");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("店铺名称");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("平台名称");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("详细地址");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("渠道管理员");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("渠道管理员电话");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("检查人");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("检查时间");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("经度");
//        cell = headRow.createCell(n++);
//        cell.setCellValue("纬度");
//
//        for (int i = 0, size = tDictList.size(); i < size; i++) {
//            cell = headRow.createCell(i + n);
//            cell.setCellValue(tDictList.get(i).getName());
//        }
//
//        for (int i = 0, size = checkDetailColResponseList.size(); i < size; i++) {
//            BizCheckDetailColResponse checkDetailColResponse = checkDetailColResponseList.get(i);
//            String provinceName = checkDetailColResponse.getBizStore().getProvinceName();
//            String cityName = checkDetailColResponse.getBizStore().getCityName();
//            String channelName = checkDetailColResponse.getBizStore().getChannelName();
//            String companyName = checkDetailColResponse.getBizStore().getCompanyName();
//            String storeName = checkDetailColResponse.getBizStore().getStoreName();
//            String platformName = checkDetailColResponse.getBizStore().getPlatformName();
//            String addressDetail = checkDetailColResponse.getBizStore().getAddressDetail();
//            String channelManagerName = checkDetailColResponse.getBizStore().getChannelManagerName();
//            String channelManagerPhone = checkDetailColResponse.getBizStore().getChannelManagerPhone();
//            String checkUserName = checkDetailColResponse.getBizCheckDetail().getCheckUserName();
//            Date checkTime = checkDetailColResponse.getBizCheckDetail().getCheckTime();
//            String checkLongitude = checkDetailColResponse.getBizCheckDetail().getCheckLongitude();
//            String checkLatitude = checkDetailColResponse.getBizCheckDetail().getCheckLatitude();
//            headRow = sheet.createRow(i + 1);
//            int k = 0;
//            cell = headRow.createCell(k++);
//            cell.setCellValue("01");
//            cell = headRow.createCell(k++);
//            cell.setCellValue(provinceName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(cityName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(channelName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(companyName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(storeName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(platformName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(addressDetail);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(channelManagerName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(channelManagerPhone);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(checkUserName);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(checkTime);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(checkLongitude);
//            cell = headRow.createCell(k++);
//            cell.setCellValue(checkLatitude);
//
//            Map<String, Object> colMap = checkDetailColResponse.getColMap();
//            for (int j = 0; j < tDictList.size(); j++) {
//                cell = headRow.createCell(j + k);
//                String value = "是";
//                if("1".equals(String.valueOf(colMap.get(tDictList.get(j).getValue())))){
//                    value = "否";
//                }
//                cell.setCellValue(value);
//            }
//        }
////        try {
////            ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
////            bufferImg = ImageIO.read(new File("D:/1.jpg"));
////            ImageIO.write(bufferImg, "jpg", byteArrayOut);
////            XSSFDrawing patriarch = sheet.createDrawingPatriarch();
////            XSSFClientAnchor anchor = new XSSFClientAnchor(0, 0, 0, 0, (short) 3, 0, (short) 5, 7);
////            patriarch.createPicture(anchor, workBook.addPicture(byteArrayOut.toByteArray(), XSSFWorkbook.PICTURE_TYPE_JPEG));
////        } catch (IOException e) {
////            e.printStackTrace();
////        }
//
//        return workBook;
//    }

    @Transactional(readOnly = true)
    public List<BizCheckPlan> findCheckPlan(BizCheckPlanExample example) {
        return this.bizCheckPlanMapper.selectByExample(example);
    }

    @Transactional(readOnly = true)
    public List<BizCheckDetail> findCheckDetail(BizCheckDetailExample example) {
        return this.bizCheckDetailMapper.selectByExample(example);
    }

}

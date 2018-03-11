package com.tf.biz.check;

import com.tf.biz.check.entity.*;
import com.tf.biz.check.mapper.BizCheckDetailMapper;
import com.tf.biz.check.mapper.BizCheckPlanMapper;
import com.tf.biz.check.param.BizCheckDetailColResponse;
import com.tf.biz.check.param.BizCheckDetailResponse;
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

    private Map<Integer, String> checkOkMap = new HashMap(){{
        put(1, "是");
        put(2, "否");
    }};

    private Map<Integer, String> checkRegionMap = new HashMap(){{
        put(1, "城区");
        put(2, "城郊");
        put(3, "县城");
        put(4, "乡镇");
        put(5, "其他");
    }};

    private Map<Integer, String> checkMendianMap = new HashMap(){{
        put(1, "联通专营终端卖场");
        put(2, "联通专营");
        put(3, "开放型终端卖场");
        put(4, "代理点");
        put(5, "社区沃店(宽带)");
        put(6, "移动排他终端卖场");
        put(7, "电信排他终端卖场");
    }};

    private Map<Integer, String> checkYtsqMap = new HashMap(){{
        put(1, "通讯商圈");
        put(2, "商业区");
        put(3, "学校");
        put(4, "社区");
        put(5, "工业园区");
        put(6, "办公楼宇");
        put(7, "其他");
    }};

    private Map<Integer, String> checkAreaMap = new HashMap(){{
        put(1, "20平米以下");
        put(2, "20-50平米");
        put(3, "50-100平米");
        put(4, "100平米以上");
    }};

    private Map<Integer, String> checkMembersMap = new HashMap(){{
        put(1, "3人以下");
        put(2, "4-6人");
        put(3, "7-10人");
        put(4, "大于10人");
    }};

    private Map<Integer, String> checkScopMap = new HashMap(){{
        put(1, "非常熟练");
        put(2, "一般熟练");
        put(3, "不太熟练");
        put(4, "不熟练");
    }};

    private Map<Integer, String> checkLiangMap = new HashMap(){{
        put(1, "0");
        put(2, "<20");
        put(3, "20-50");
        put(4, "50-100");
        put(5, "100以上");
    }};



    @Transactional(readOnly = true)
    XSSFWorkbook createExcel(BizCheckDetail checkDetail, Integer limit, Integer offset) {

        List<BizCheckDetailResponse> checkDetailResponses = this.findList(checkDetail, limit, offset);

        return buildExcel(checkDetailResponses);
    }

    List<BizCheckDetailResponse> findList(BizCheckDetail checkDetail, Integer limit, Integer offset) {

        List<BizCheckDetailResponse> checkDetailResponses = new ArrayList<>();

        BizCheckDetailExample detailExample = new BizCheckDetailExample();
        detailExample.setLimit(limit);
        detailExample.setOffset(offset);
        detailExample.setOrderByClause("check_time desc");

        //检查详情列表
        List<BizCheckDetail> detailList = this.bizCheckDetailMapper.selectByExample(detailExample);
        if (CollectionUtils.isEmpty(detailList)) {
            return checkDetailResponses;
        }
        //店铺ID列表
        List<Long> storeIdList = detailList.stream().map(BizCheckDetail::getStoreId).distinct().collect(Collectors.toList());

        BizStoreExample exampleStore = new BizStoreExample();
        exampleStore.createCriteria().andIdIn(storeIdList);
        List<BizStore> storeList = this.storeService.findStore(exampleStore);
        if (CollectionUtils.isEmpty(storeList)) {
            return checkDetailResponses;
        }
        //店铺Map
        Map<Long, BizStore> storeMap = storeList.stream().collect(Collectors.toMap(BizStore::getId, Function.identity()));

        detailList.forEach(d -> {
            BizCheckDetailResponse checkDetailColResponse = new BizCheckDetailResponse();
            checkDetailResponses.add(checkDetailColResponse);
            checkDetailColResponse.setBizStore(storeMap.get(d.getStoreId()));
            checkDetailColResponse.setBizCheckDetail(d);
        });

        return checkDetailResponses;
    }

    private String getMapValue(Map<Integer, String> map, Integer key){
        return map.get(key);
    }

    private XSSFWorkbook buildExcel( List<BizCheckDetailResponse> checkDetailResponses) {
//        FileOutputStream fileOut = null;
//        BufferedImage bufferImg = null;

        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet("巡店检查记录");
        XSSFRow headRow = sheet.createRow(0);
        XSSFCell cell = null;
        int n = 0;
        cell = headRow.createCell(n++);
        cell.setCellValue("计划批次");
        cell = headRow.createCell(n++);
        cell.setCellValue("省份");
        cell = headRow.createCell(n++);
        cell.setCellValue("城市");
        cell = headRow.createCell(n++);
        cell.setCellValue("渠道名称");
        cell = headRow.createCell(n++);
        cell.setCellValue("公司名称");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺名称");
        cell = headRow.createCell(n++);
        cell.setCellValue("平台名称");
        cell = headRow.createCell(n++);
        cell.setCellValue("详细地址");
        cell = headRow.createCell(n++);
        cell.setCellValue("渠道管理员");
        cell = headRow.createCell(n++);
        cell.setCellValue("渠道管理员电话");
        cell = headRow.createCell(n++);
        cell.setCellValue("检查人");
        cell = headRow.createCell(n++);
        cell.setCellValue("检查时间");
        cell = headRow.createCell(n++);
        cell.setCellValue("经度");
        cell = headRow.createCell(n++);
        cell.setCellValue("纬度");

        cell = headRow.createCell(n++);
        cell.setCellValue("店铺是否存在");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺实际名称是否相符");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺实际巡查地址省");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺实际巡查地址城市");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺实际巡查地址");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺地域类型");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺门店类型");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺类型业态商圈");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺面积类型");
        cell = headRow.createCell(n++);
        cell.setCellValue("店铺人员规模");
        cell = headRow.createCell(n++);
        cell.setCellValue("近一个月是否变更");
        cell = headRow.createCell(n++);
        cell.setCellValue("忙时人数");
        cell = headRow.createCell(n++);
        cell.setCellValue("闲时人数");
        cell = headRow.createCell(n++);
        cell.setCellValue("营业员受理业务程度");
        cell = headRow.createCell(n++);
        cell.setCellValue("营业员对内部套餐策略数量程度");
        cell = headRow.createCell(n++);
        cell.setCellValue("终端营销策略数量");
        cell = headRow.createCell(n++);
        cell.setCellValue("对客户是否主动营销");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否推出4g");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否推出全网通");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否主推机型");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否干净卫生");
        cell = headRow.createCell(n++);
        cell.setCellValue("宣传是否合规");
        cell = headRow.createCell(n++);
        cell.setCellValue("店内动线是否设计合规");
        cell = headRow.createCell(n++);
        cell.setCellValue("月销售终端数量");
        cell = headRow.createCell(n++);
        cell.setCellValue("异网发展能力");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否联通门头");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否联通灯箱");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否联通标牌");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否联通二维码");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否有实名制公告");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否联通背景墙");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否联通柜台贴");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否opp专区");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否有金立专柜");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否vivo专柜");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否为华为专柜");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否三星专柜");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否苹果专柜");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否魅族");
        cell = headRow.createCell(n++);
        cell.setCellValue("是否2g,3g专柜");
        cell = headRow.createCell(n++);
        cell.setCellValue("社会机型库存数量");
        cell = headRow.createCell(n++);
        cell.setCellValue("自由机型库存数量");


        for (int i = 0, size = checkDetailResponses.size(); i < size; i++) {
            BizCheckDetailResponse checkDetailResponse = checkDetailResponses.get(i);
            String planBatchName = checkDetailResponse.getBizCheckDetail().getPlanBatchName();
            String provinceName = checkDetailResponse.getBizStore().getProvinceName();
            String cityName = checkDetailResponse.getBizStore().getCityName();
            String channelName = checkDetailResponse.getBizStore().getChannelName();
            String companyName = checkDetailResponse.getBizStore().getCompanyName();
            String storeName = checkDetailResponse.getBizStore().getStoreName();
            String platformName = checkDetailResponse.getBizStore().getPlatformName();
            String addressDetail = checkDetailResponse.getBizStore().getAddressDetail();
            String channelManagerName = checkDetailResponse.getBizStore().getChannelManagerName();
            String channelManagerPhone = checkDetailResponse.getBizStore().getChannelManagerPhone();
            String checkUserName = checkDetailResponse.getBizCheckDetail().getCheckUserName();
            Date checkTime = checkDetailResponse.getBizCheckDetail().getCheckTime();
            String checkLongitude = checkDetailResponse.getBizCheckDetail().getCheckLongitude();
            String checkLatitude = checkDetailResponse.getBizCheckDetail().getCheckLatitude();
            headRow = sheet.createRow(i + 1);
            int k = 0;
            cell = headRow.createCell(k++);
            cell.setCellValue(planBatchName);
            cell = headRow.createCell(k++);
            cell.setCellValue(provinceName);
            cell = headRow.createCell(k++);
            cell.setCellValue(cityName);
            cell = headRow.createCell(k++);
            cell.setCellValue(channelName);
            cell = headRow.createCell(k++);
            cell.setCellValue(companyName);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeName);
            cell = headRow.createCell(k++);
            cell.setCellValue(platformName);
            cell = headRow.createCell(k++);
            cell.setCellValue(addressDetail);
            cell = headRow.createCell(k++);
            cell.setCellValue(channelManagerName);
            cell = headRow.createCell(k++);
            cell.setCellValue(channelManagerPhone);
            cell = headRow.createCell(k++);
            cell.setCellValue(checkUserName);
            cell = headRow.createCell(k++);
            cell.setCellValue(checkTime);
            cell = headRow.createCell(k++);
            cell.setCellValue(checkLongitude);
            cell = headRow.createCell(k++);
            cell.setCellValue(checkLatitude);

            String storeExistsok = this.checkRegionMap.get(checkDetailResponse.getBizCheckDetail().getStoreExistsok());
            String storeRealnameok = this.checkRegionMap.get(checkDetailResponse.getBizCheckDetail().getStoreRealnameok());
            String storeCheckProvinceName = checkDetailResponse.getBizCheckDetail().getStoreCheckProvinceName();
            String storeCheckCityName = checkDetailResponse.getBizCheckDetail().getStoreCheckCityName();
            String storeAddress = checkDetailResponse.getBizCheckDetail().getStoreAddress();
            //区域
            String storeRegiontype = this.getMapValue(checkRegionMap, checkDetailResponse.getBizCheckDetail().getStoreRegiontype());
            //门店类型
            String storeMendiantype = this.getMapValue(checkMendianMap, checkDetailResponse.getBizCheckDetail().getStoreMendiantype());
            //业态
            String storeYtsqtype = this.getMapValue(checkYtsqMap, checkDetailResponse.getBizCheckDetail().getStoreYtsqtype());
            //面积
            String storeAreatype = this.getMapValue(checkAreaMap, checkDetailResponse.getBizCheckDetail().getStoreAreatype());
            //人员数量
            String storeMemberstype = this.getMapValue(checkMembersMap, checkDetailResponse.getBizCheckDetail().getStoreMemberstype());
            String storeNmonthChangeok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreNmonthChangeok());
            int storeBusyUsercount = checkDetailResponse.getBizCheckDetail().getStoreBusyUsercount();
            int storeFreeUsercount = checkDetailResponse.getBizCheckDetail().getStoreFreeUsercount();
            //业务熟练
            String storeMemberBusscope = this.getMapValue(checkScopMap, checkDetailResponse.getBizCheckDetail().getStoreMemberBusscope());
            //套餐熟练
            String storeMemberTaocanScope = this.getMapValue(checkScopMap, checkDetailResponse.getBizCheckDetail().getStoreMemberTaocanScope());
            //终端熟练
            String storeMemberTerminalPolicy = this.getMapValue(checkScopMap, checkDetailResponse.getBizCheckDetail().getStoreMemberTerminalPolicy());
            String storeMemeberActivesellok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreMemeberActivesellok());
            String store4gok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStore4gok());
            String storeAllnetok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreAllnetok());
            String storeFirstRecdTerminal = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreFirstRecdTerminal());
            String storeHealthok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreHealthok());
            String storeConductok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreConductok());
            String storeDonglineok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreDonglineok());
            //月销售量
            String storeMonthSalecount = this.getMapValue(checkLiangMap, checkDetailResponse.getBizCheckDetail().getStoreMonthSalecount());
            //业务发展能力
            String storeDifExpandability = this.getMapValue(checkLiangMap, checkDetailResponse.getBizCheckDetail().getStoreDifExpandability());
            String storeDoortouok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreDoortouok());
            String storeDengxiangok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreDengxiangok());
            String storeBrandok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreBrandok());
            String storeQrcode = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreQrcode());
            String storeRealnameNoticeok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreRealnameNoticeok());
            String storeBackwall = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreBackwall());
            String storeBartie = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreBartie());
            String storeZqOppok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZqOppok());
            String storeZqJinliok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZqJinliok());
            String storeZqVivook = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZqVivook());
            String storeZqHuaweiok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZqHuaweiok());
            String storeZqSamsongok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZqSamsongok());
            String storeZqAppleok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZqAppleok());
            String storeZqMeizuok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZqMeizuok());
            String storeZq2g3gok = this.checkOkMap.get(checkDetailResponse.getBizCheckDetail().getStoreZq2g3gok());
            int storeKccheckOutcount = checkDetailResponse.getBizCheckDetail().getStoreKccheckOutcount();
            int storeKccheckSelfcount = checkDetailResponse.getBizCheckDetail().getStoreKccheckSelfcount();

            cell = headRow.createCell(k++);
            cell.setCellValue(storeExistsok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeRealnameok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeCheckProvinceName);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeCheckCityName);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeAddress);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeRegiontype);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeMendiantype);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeYtsqtype);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeAreatype);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeMemberstype);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeNmonthChangeok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeBusyUsercount);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeFreeUsercount);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeMemberBusscope);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeMemberTaocanScope);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeMemberTerminalPolicy);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeMemeberActivesellok);
            cell = headRow.createCell(k++);
            cell.setCellValue(store4gok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeAllnetok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeFirstRecdTerminal);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeHealthok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeConductok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeDonglineok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeMonthSalecount);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeDifExpandability);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeDoortouok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeDengxiangok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeBrandok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeQrcode);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeRealnameNoticeok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeBackwall);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeBartie);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZqOppok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZqJinliok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZqVivook);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZqHuaweiok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZqSamsongok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZqAppleok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZqMeizuok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeZq2g3gok);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeKccheckOutcount);
            cell = headRow.createCell(k++);
            cell.setCellValue(storeKccheckSelfcount);


        }
//        try {
//            ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
//            bufferImg = ImageIO.read(new File("D:/1.jpg"));
//            ImageIO.write(bufferImg, "jpg", byteArrayOut);
//            XSSFDrawing patriarch = sheet.createDrawingPatriarch();
//            XSSFClientAnchor anchor = new XSSFClientAnchor(0, 0, 0, 0, (short) 3, 0, (short) 5, 7);
//            patriarch.createPicture(anchor, workBook.addPicture(byteArrayOut.toByteArray(), XSSFWorkbook.PICTURE_TYPE_JPEG));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        return workBook;
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

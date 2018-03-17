/**
 * Created by Administrator on 2018/3/17.
 */
var checkMap = {
    okMap: {
        1: "是",
        2: "否"
    },
    regionMap: {
        1: "城区",
        2: "城郊",
        3: "县城",
        4: "乡镇",
        5: "其他"
    },
    mendianMap: {
        1: "联通专营终端卖场",
        2: "联通专营",
        3: "开放型终端卖场",
        4: "代理点",
        5: "社区沃店(宽带)",
        6: "移动排他终端卖场",
        7: "电信排他终端卖场"
    },
    ytsqMap: {
        1: "通讯商圈",
        2: "商业区",
        3: "学校",
        4: "社区",
        5: "工业园区",
        6: "办公楼宇",
        7: "其他"
    },
    mendianMap: {
        1: "通讯商圈",
        2: "商业区",
        3: "学校",
        4: "社区",
        5: "工业园区",
        6: "办公楼宇",
        7: "其他"
    },
    areaMap: {
        1: "20平米以下",
        2: "20-50平米",
        3: "50-100平米",
        4: "100平米以上"
    },
    membersMap: {
        1: "3人以下",
        2: "4-6人",
        3: "7-10人",
        4: "大于10人"
    },
    scopMap: {
        1: "非常熟练",
        2: "一般熟练",
        3: "不太熟练",
        4: "不熟练"
    },
    liangMap: {
        1: "0",
        2: "<20",
        3: "20-50",
        4: "50-100",
        5: "100以上"
    }
}

function checkOkMap(key) {
    return checkMap.okMap[key];
}

function checkRegionMap(key) {
    return checkMap.regionMap[key];
}

function checkMendianMap(key) {
    return checkMap.mendianMap[key];
}

function checkYtsqMap(key) {
    return checkMap.ytsqMap[key];
}

function checkAreaMap(key) {
    return checkMap.areaMap[key];
}

function checkMembersMap(key) {
    return checkMap.membersMap[key];
}

function checkScopMap(key) {
    return checkMap.scopMap[key];
}

function checkLiangMap(key) {
    return checkMap.liangMap[key];
}

var keyAndValueList = [
    {title: "计划批次", key: "bizCheckDetail.planBatchName", map: ""},
    {title: "省份", key: "bizStore.provinceName", map: ""},
    {title: "城市", key: "bizStore.cityName", map: ""},
    {title: "渠道名称", key: "bizStore.channelName", map: ""},
    {title: "公司名称", key: "bizStore.companyName", map: ""},
    {title: "店铺名称", key: "bizStore.storeName", map: ""},
    {title: "平台名称", key: "bizStore.platformName", map: ""},
    {title: "详细地址", key: "bizStore.addressDetail", map: ""},
    {title: "渠道管理员", key: "bizStore.channelManagerName", map: ""},
    {title: "渠道管理员电话", key: "bizStore.channelManagerPhone", map: ""},
    {title: "检查人", key: "bizCheckDetail.checkUserName", map: ""},
    {title: "检查时间", key: "bizCheckDetail.checkTime", map: ""},
    {title: "经度", key: "bizCheckDetail.checkLongitude", map: ""},
    {title: "纬度", key: "bizCheckDetail.checkLatitude", map: ""},
    {title: "店铺是否存在", key: "bizCheckDetail.storeExistsok", map: ""},
    {title: "店铺实际名称是否相符", key: "bizCheckDetail.storeRealnameok", map: ""},
    {title: "店铺实际巡查地址省", key: "bizCheckDetail.storeCheckProvinceName", map: ""},
    {title: "店铺实际巡查地址城市", key: "bizCheckDetail.storeCheckCityName", map: ""},
    {title: "店铺实际巡查地址", key: "bizCheckDetail.storeAddress", map: ""},
    {title: "店铺地域类型", key: "bizCheckDetail.storeRegiontype", map: "checkRegionMap"},
    {title: "店铺门店类型", key: "bizCheckDetail.storeMendiantype", map: "checkMendianMap"},
    {title: "店铺类型业态商圈", key: "bizCheckDetail.storeYtsqtype", map: "checkYtsqMap"},
    {title: "店铺面积类型", key: "bizCheckDetail.storeAreatype", map: "checkAreaMap"},
    {title: "店铺人员规模", key: "bizCheckDetail.storeMemberstype", map: "checkMembersMap"},
    {title: "近一个月是否变更", key: "bizCheckDetail.storeNmonthChangeok", map: "checkOkMap"},
    {title: "忙时人数", key: "bizCheckDetail.storeBusyUsercount", map: ""},
    {title: "闲时人数", key: "bizCheckDetail.storeFreeUsercount", map: ""},
    {title: "营业员受理业务程度", key: "bizCheckDetail.storeMemberBusscope", map: "checkScopMap"},
    {title: "营业员对内部套餐策略数量程度", key: "bizCheckDetail.storeMemberTaocanScope", map: "checkScopMap"},
    {title: "终端营销策略数量", key: "bizCheckDetail.storeMemberTerminalPolicy", map: "checkScopMap"},
    {title: "对客户是否主动营销", key: "bizCheckDetail.storeMemeberActivesellok", map: "checkOkMap"},
    {title: "是否推出4g", key: "bizCheckDetail.store4gok", map: "checkOkMap"},
    {title: "是否推出全网通", key: "bizCheckDetail.storeAllnetok", map: "checkOkMap"},
    {title: "是否主推机型", key: "bizCheckDetail.storeFirstRecdTerminal", map: "checkOkMap"},
    {title: "是否干净卫生", key: "bizCheckDetail.storeHealthok", map: "checkOkMap"},
    {title: "宣传是否合规", key: "bizCheckDetail.storeConductok", map: "checkOkMap"},
    {title: "店内动线是否设计合规", key: "bizCheckDetail.storeDonglineok", map: "checkOkMap"},
    {title: "月销售终端数量", key: "bizCheckDetail.storeMonthSalecount", map: "checkLiangMap"},
    {title: "异网发展能力", key: "bizCheckDetail.storeDifExpandability", map: "checkLiangMap"},
    {title: "是否联通门头", key: "bizCheckDetail.storeDoortouok", map: "checkLiangMap"},
    {title: "是否联通灯箱", key: "bizCheckDetail.storeDengxiangok", map: "checkLiangMap"},
    {title: "是否联通标牌", key: "bizCheckDetail.storeBrandok", map: "checkLiangMap"},
    {title: "是否联通二维码", key: "bizCheckDetail.storeQrcode", map: "checkLiangMap"},
    {title: "是否有实名制公告", key: "bizCheckDetail.storeRealnameNoticeok", map: "checkLiangMap"},
    {title: "是否联通背景墙", key: "bizCheckDetail.storeBackwall", map: "checkLiangMap"},
    {title: "是否联通柜台贴", key: "bizCheckDetail.storeBartie", map: "checkLiangMap"},
    {title: "是否opp专区", key: "bizCheckDetail.storeZqOppok", map: "checkLiangMap"},
    {title: "是否有金立专柜", key: "bizCheckDetail.storeZqJinliok", map: "checkLiangMap"},
    {title: "是否vivo专柜", key: "bizCheckDetail.storeZqVivook", map: "checkLiangMap"},
    {title: "是否为华为专柜", key: "bizCheckDetail.storeZqHuaweiok", map: "checkLiangMap"},
    {title: "是否三星专柜", key: "bizCheckDetail.storeZqSamsongok", map: "checkLiangMap"},
    {title: "是否苹果专柜", key: "bizCheckDetail.storeZqAppleok", map: "checkLiangMap"},
    {title: "是否魅族", key: "bizCheckDetail.storeZqMeizuok", map: "checkLiangMap"},
    {title: "是否2g,3g专柜", key: "bizCheckDetail.storeZq2g3gok", map: "checkLiangMap"},
    {title: "社会机型库存数量", key: "bizCheckDetail.storeKccheckOutcount", map: ""},
    {title: "自由机型库存数量", key: "bizCheckDetail.storeKccheckSelfcount", map: ""}
]
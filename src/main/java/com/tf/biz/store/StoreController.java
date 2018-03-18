package com.tf.biz.store;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.entity.BizStoreExample;
import com.tf.common.utils.Tools;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Upload;
import com.tf.tadmin.service.UploadService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author mo.xf
 * @date 2015年12月25日
 */
@Controller
public class StoreController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private UploadService uploadService;

    @Autowired
    private StoreService storeService;


    @RequestMapping(value = "/store/map", method = {RequestMethod.GET})
    public ModelAndView storeMap(HttpServletResponse response, HttpServletRequest request, Upload upload) throws Exception {
        return new ModelAndView("biz/store/store_map");
    }


    @RequestMapping(value = "/store/map/query", method = {RequestMethod.GET})
    @ResponseBody
    public Object storeQuery(@RequestParam Map<String, String> param) throws Exception {
        BizStoreExample example = new BizStoreExample();
        this.buildStoreQuery(example, param);
        example.setOrderByClause("id desc");
        List<BizStore> list = this.storeService.findStore(example);
        return list;
    }

    private BizStoreExample.Criteria buildStoreQuery(BizStoreExample example, Map<String, String> param){

        BizStoreExample.Criteria criteria = example.createCriteria();

        String channelCode =  param.get("channelCode");
        if(StringUtils.isNotBlank(channelCode)){
            criteria.andChannelCodeEqualTo(channelCode);
        }
        String storeName =  param.get("storeName");
        if(StringUtils.isNotBlank(storeName)){
            criteria.andStoreNameLike("%" + storeName + "%");
        }
        String batchId =  param.get("batchId");
        if(StringUtils.isNotBlank(batchId)){
            criteria.andBatchIdEqualTo(Long.parseLong(batchId));
        }
        String startTime =  param.get("startTime");
        String endTime =  param.get("endTime");
        if (startTime != null && endTime != null) {
            Date startDate = Tools.str2Date(startTime + " 00:00:00");
            Date endDate = Tools.str2Date(endTime + " 23:59:59");
            criteria.andCreateTimeBetween(startDate, endDate);
        } else if (startTime != null) {
            Date startDate = Tools.str2Date(startTime + " 00:00:00");
            criteria.andCreateTimeGreaterThanOrEqualTo(startDate);
        } else if (endTime != null) {
            Date endDate = Tools.str2Date(endTime + " 23:59:59");
            criteria.andCreateTimeLessThanOrEqualTo(endDate);
        }

        return criteria;

    }

}

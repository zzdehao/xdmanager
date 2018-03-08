package com.tf.biz.store;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.entity.BizStoreExample;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Upload;
import com.tf.tadmin.service.UploadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
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


    @RequestMapping(value = "/store/map/query", method = {RequestMethod.POST})
    @ResponseBody
    public Object storeQuery(@RequestBody BizStore bizStore) throws Exception {
        BizStoreExample example = new BizStoreExample();
        example.setOrderByClause("id");
        List<BizStore> list = this.storeService.findStore(example);
        return list;
    }

}

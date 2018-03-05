package com.tf.tadmin.controller.yewu;

import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.ProvinceCity;
import com.tf.tadmin.service.ProvinceCityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by wugq on 2017/12/31.
 */
@Controller
public class ProvinceCityController extends BaseController {
    @Autowired
    private ProvinceCityService provinceCityService;

    @RequestMapping(value = "/yewu/province/getProvince" ,method = {RequestMethod.GET})
    public @ResponseBody
    List<ProvinceCity> getProvince(@RequestParam(required = false , value = "code") String code){
        return this.provinceCityService.getAllProvinces(code);
    }
    @RequestMapping(value = "/yewu/province/getCity" ,method = {RequestMethod.GET})
    public @ResponseBody
    List<ProvinceCity> getCity(@RequestParam(required = false , value = "provinceCode") String provinceCode){
        return this.provinceCityService.getProvinceCityByParentCode(provinceCode);
    }
}

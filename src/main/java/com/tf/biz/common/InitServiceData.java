package com.tf.biz.common;
import com.tf.tadmin.entity.ProvinceCity;
import com.tf.tadmin.service.DicService;
import com.tf.tadmin.service.ProvinceCityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.List;
/**
 * Created by wugq on 2018/3/15.
 */
@Component
public class InitServiceData {
    @Autowired
    private ProvinceCityService provinceCityService;
    @Autowired
    private DicService dicService;
    @PostConstruct
    public void initLoadData(){
        //System.out.println("--------------initLoadData------------");
        StaticDataMap.provinceAndCityCodeToNameMapping.clear();
        StaticDataMap.provinceAndCityNameToCodeMapping.clear();
        List<ProvinceCity> dataList = provinceCityService.getAllProvinces();
        dataList.forEach(data->{
            StaticDataMap.provinceAndCityCodeToNameMapping.put(data.getCode().trim(),data.getName().trim()) ;
            StaticDataMap.provinceAndCityNameToCodeMapping.put(data.getName().trim(),data.getCode().trim()) ;
        });
        System.out.println("nameToNode:"+StaticDataMap.provinceAndCityNameToCodeMapping.toString());
    }

}

package com.tf.tadmin.service;
import com.tf.tadmin.entity.ProvinceCity;
import com.tf.tadmin.mapper.ProvinceCityMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProvinceCityService extends BaseService {
	@Resource
	private ProvinceCityMapper provinceCityMapper ;
	
	public List<ProvinceCity> queryList(Integer parentId , String code , Integer level) {
		return this.provinceCityMapper.queryList(parentId, code, level,null) ;
	}
    public ProvinceCity getCityProvinceByCode(String code){
        return this.provinceCityMapper.getCityProvinceByCode(code) ;
    }

    public List<ProvinceCity> getAllProvinces(String code) {
        return this.provinceCityMapper.queryList(null,code, 0,null) ;
    }
    public List<ProvinceCity> getProvinceCityByParentId(Integer parentId) {
        return this.provinceCityMapper.queryList(parentId, "", null,null) ;
    }
    public List<ProvinceCity> getProvinceCityByParentCode(String provinceCode) {
        ProvinceCity parent = this.getCityProvinceByCode(provinceCode);
        return this.provinceCityMapper.queryList(parent.getId(), "", null,null) ;
    }
}

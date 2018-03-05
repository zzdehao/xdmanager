package com.tf.tadmin.mapper;
import com.tf.tadmin.entity.ProvinceCity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProvinceCityMapper {
    public List<ProvinceCity> queryList(@Param("parentId") Integer parentId,
                                        @Param("code") String code,
                                        @Param("level") Integer level,
                                        @Param("id") Integer id) ;

    public ProvinceCity getCityProvinceByCode(@Param("code") String code);



}

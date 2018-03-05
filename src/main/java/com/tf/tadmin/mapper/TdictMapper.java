package com.tf.tadmin.mapper;
import com.tf.tadmin.entity.yewu.TDict;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TdictMapper extends BaseMapper<TDict,Integer>{
    List<TDict> queryTypeList();

    TDict queryById(Integer id);

}

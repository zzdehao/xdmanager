package com.tf.biz.check.mapper;

import com.tf.biz.check.entity.BizCheckDetail;
import com.tf.biz.check.entity.BizCheckDetailExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BizCheckDetailMapper {
    long countByExample(BizCheckDetailExample example);

    int deleteByExample(BizCheckDetailExample example);

    int deleteByPrimaryKey(Long id);

    int insert(BizCheckDetail record);

    int insertSelective(BizCheckDetail record);

    List<BizCheckDetail> selectByExample(BizCheckDetailExample example);

    BizCheckDetail selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") BizCheckDetail record, @Param("example") BizCheckDetailExample example);

    int updateByExample(@Param("record") BizCheckDetail record, @Param("example") BizCheckDetailExample example);

    int updateByPrimaryKeySelective(BizCheckDetail record);

    int updateByPrimaryKey(BizCheckDetail record);
}
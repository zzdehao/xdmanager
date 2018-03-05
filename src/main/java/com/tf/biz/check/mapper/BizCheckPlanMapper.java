package com.tf.biz.check.mapper;

import com.tf.biz.check.entity.BizCheckPlan;
import com.tf.biz.check.entity.BizCheckPlanExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BizCheckPlanMapper {
    long countByExample(BizCheckPlanExample example);

    int deleteByExample(BizCheckPlanExample example);

    int deleteByPrimaryKey(Long id);

    int insert(BizCheckPlan record);

    int insertSelective(BizCheckPlan record);

    List<BizCheckPlan> selectByExample(BizCheckPlanExample example);

    BizCheckPlan selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") BizCheckPlan record, @Param("example") BizCheckPlanExample example);

    int updateByExample(@Param("record") BizCheckPlan record, @Param("example") BizCheckPlanExample example);

    int updateByPrimaryKeySelective(BizCheckPlan record);

    int updateByPrimaryKey(BizCheckPlan record);
}
package com.tf.biz.dataimp.mapper;

import com.tf.biz.dataimp.entity.BizImportCheckPlan;
import com.tf.biz.dataimp.entity.BizImportCheckPlanExpress;
import com.tf.biz.store.entity.BizStore;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BizImprotCheckPlanMapper {
    long countByExpress(BizImportCheckPlanExpress Express);

    int deleteByExpress(BizImportCheckPlanExpress Express);

    int deleteByPrimaryKey(Long id);

    int insert(BizStore record);

    int insertSelective(BizStore record);

    List<BizImportCheckPlan> selectByExpress(BizImportCheckPlanExpress Express);

    BizImportCheckPlan selectByPrimaryKey(Long id);

    int updateByExpressSelective(@Param("record") BizStore record, @Param("Express") BizImportCheckPlanExpress Express);

    int updateByExpress(@Param("record") BizStore record, @Param("Express") BizImportCheckPlanExpress Express);

    int updateByPrimaryKeySelective(BizStore record);

    int updateByPrimaryKey(BizStore record);
}
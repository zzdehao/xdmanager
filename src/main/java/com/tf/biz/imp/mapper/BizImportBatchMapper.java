package com.tf.biz.imp.mapper;

import com.tf.biz.imp.entity.BizImportBatch;
import com.tf.biz.imp.entity.BizImportBatchExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BizImportBatchMapper {
    long countByExample(BizImportBatchExample example);

    int deleteByExample(BizImportBatchExample example);

    int deleteByPrimaryKey(Long id);

    int insert(BizImportBatch record);

    int insertSelective(BizImportBatch record);

    List<BizImportBatch> selectByExample(BizImportBatchExample example);

    BizImportBatch selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") BizImportBatch record, @Param("example") BizImportBatchExample example);

    int updateByExample(@Param("record") BizImportBatch record, @Param("example") BizImportBatchExample example);

    int updateByPrimaryKeySelective(BizImportBatch record);

    int updateByPrimaryKey(BizImportBatch record);
}
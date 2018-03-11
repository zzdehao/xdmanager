package com.tf.biz.dataimp.mapper;

import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.biz.dataimp.entity.BizImportUserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BizImportUserMapper {
    long countByExample(BizImportUserExample example);

    int deleteByExample(BizImportUserExample example);

    int deleteByPrimaryKey(Long id);

    int insert(BizImportUser record);

    int insertSelective(BizImportUser record);

    List<BizImportUser> selectByExample(BizImportUserExample example);

    BizImportUser selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") BizImportUser record, @Param("example") BizImportUserExample example);

    int updateByExample(@Param("record") BizImportUser record, @Param("example") BizImportUserExample example);

    int updateByPrimaryKeySelective(BizImportUser record);

    int updateByPrimaryKey(BizImportUser record);
}
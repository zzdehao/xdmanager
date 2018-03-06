package com.tf.biz.dataimp.mapper;
import java.util.List;
import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.biz.dataimp.entity.BizImportUserExpress;
import org.apache.ibatis.annotations.Param;

public interface BizImportUserMapper {
    long countByExpress(BizImportUserExpress Express);

    int deleteByExpress(BizImportUserExpress Express);

    int deleteByPrimaryKey(Long id);

    int insert(BizImportUser record);

    int insertSelective(BizImportUser record);

    List<BizImportUser> selectByExpress(BizImportUserExpress Express);

    BizImportUser selectByPrimaryKey(Long id);

    int updateByExpressSelective(@Param("record") BizImportUser record, @Param("Express") BizImportUserExpress Express);

    int updateByExpress(@Param("record") BizImportUser record, @Param("Express") BizImportUserExpress Express);

    int updateByPrimaryKeySelective(BizImportUser record);

    int updateByPrimaryKey(BizImportUser record);
}
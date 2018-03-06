package com.tf.biz.dataimp;
import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.biz.dataimp.entity.BizImportUserExpress;
import com.tf.biz.dataimp.mapper.BizImportUserMapper;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by wugq on 2018/3/6.
 */
@Service
@Transactional
public class DataImpService {
  @Autowired
  private BizImportUserMapper bizImportUserMapper;

  public Pager<BizImportUser>  queryUserList(Integer start, Map<String,Object> param) {
      //limit ${start},${rows}
      int rows= Constants.PAGE_SIZE;
      Pager<BizImportUser> pager = new Pager<BizImportUser>();
      //组件查询条件
      BizImportUserExpress express = new BizImportUserExpress();
      express.setLimit(start);
      express.setOffset(rows);
      express.setOrderByClause(" create_time desc ");
      BizImportUserExpress.Criteria queryExpress=express.createCriteria();

      List<BizImportUser> list= bizImportUserMapper.selectByExpress(express);
      Long count = bizImportUserMapper.countByExpress(express);
      pager.setRows(list);
      pager.setTotal(count.intValue());
      return  pager;

  }
}

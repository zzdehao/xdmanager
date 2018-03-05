package com.tf.tadmin.service;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.entity.ParamMap;
import com.tf.tadmin.entity.yewu.TDict;
import com.tf.tadmin.mapper.TdictMapper;
import com.tf.tadmin.utils.Constants;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class DicService extends BaseService{
	@Resource
	private TdictMapper tdictMapper ;

    public  List<TDict> queryTypeList(){
        return tdictMapper.queryTypeList();
    }
	public List<TDict> list(Integer s , String q){
		Map<String , Object> param = this.param() ;
		param.put("status", s) ;
		param.put("q" , q);
		return this.tdictMapper.queryList(param) ;
	}
    public Pager<TDict> queryList(Integer start, Map<String,Object> param){
        Pager<TDict> pager = new Pager<TDict>() ;
        ParamMap paramMap = ParamMap.create() ;
        paramMap.put("start", start) ;
        paramMap.put("rows", Constants.PAGE_SIZE) ;
        paramMap.put("sort", "type,id") ;
        paramMap.put("order", "desc") ;
        paramMap.putAll(param);
        List<TDict> rows = this.tdictMapper.queryList(paramMap) ;
        pager.setRows(rows);
        pager.setTotal(tdictMapper.count(paramMap));
        return pager ;
    }

    public TDict queryById(Integer id){
        return this.tdictMapper.queryById(id);
    }
    public int insert(TDict dict) {
        return this.tdictMapper.insert(dict) ;
    }

    public int update(TDict dict){
        return this.tdictMapper.update(dict) ;
    }
    public int delete(int id ) {
        return this.tdictMapper.delete(id) ;
    }




}

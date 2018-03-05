package com.tf.tadmin.mapper;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
public interface BaseMapper<T,K> {
	public List<Object> queryByField(@Param("field") String field, @Param("table") String table, @Param("condition") String condition, @Param("value") Object value) ;
	
	public int execSQL(@Param("sql") String sql);
	
	public int execSelectSQL(@Param("sql") String sql);
	
	
	public List<T> queryList(Map<String, Object> map) ;
	
	public int count(Map<String, Object> map) ;
	
	public T queryById(@Param("id") K id) ;
	
	public int insert(T entry) ;
	
	public int update(T entry);
	
	public int delete(@Param("id") K id) ;
}

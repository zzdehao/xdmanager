package com.tf.tadmin.entity;

import java.util.List;

import com.tf.tadmin.utils.Constants;

/**
 * 分页信息
 * @param <T>
 */
public class Pager<T> {
	public List<T> rows ;
	
	public int total ;

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	public int getPages(){
		if(this.total % Constants.PAGE_SIZE == 0){
			return this.total / Constants.PAGE_SIZE ;
		}else{
			return this.total / Constants.PAGE_SIZE + 1;
		}
	}
}

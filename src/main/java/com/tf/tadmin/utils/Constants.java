package com.tf.tadmin.utils;

public interface Constants {
	/**
	 * 
	 */
	public static final String T_ADMIN = "t_admin" ;
	
	public static final String T_ROLE = "t_role" ;
	
	/**
	 * 
	 */
	public static final String ADMIN_TPL = "admin/";
	
	/**
	 * 超级管理员
	 */
	public static final String SUPPER_MANAGER = "admin";
	
	/**
	 * 分页每页数量
	 */
	public static final Integer PAGE_SIZE = 10 ;
	
	/**
	 * 资源分隔符
	 */
	public static final String RESOURCE_DELIMITER = ":";

    public static final String USERNAME_DELIMITER = ",yxd,";

    public static class UserRole{
        public  static  final String CITY="city";
        public  static  final String PROVINCE="province";
        public  static  final String QITA="qita";
        public  static  final String GRID="grid";
        public  static  final String MANAGER="manager";
        public  static  final String SUPER="super";
        public  static  final String ADMIN="admin";

    }
    //表示所有地市
    public static final String ALL_PROVICECITY = "all";
}

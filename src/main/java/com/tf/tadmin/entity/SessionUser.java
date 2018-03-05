package com.tf.tadmin.entity;

import java.io.Serializable;
import java.util.List;

public class SessionUser implements Serializable{

	private static final long serialVersionUID = 7872581604453257086L;
	
	private Integer id ;

	private String name ;
	
	private List<Role> roles ;
	
	private String menu ;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public long loginTime ;

    private String roleCode;

    private Integer storeId;

    private String roleName;

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    private String storeName;

    private String trueName;



    public String getShowAreaName() {
        return showAreaName;
    }

    public void setShowAreaName(String showAreaName) {
        this.showAreaName = showAreaName;
    }

    private String cityCode;
    //显示省份和城市名字（省份[城市]）
    private String  showAreaName;

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }


    private String provinceCode;
	public SessionUser(){}

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public SessionUser(int id, String name , List<Role> roles , String menu){
		this.id = id ;
		this.name = name ;
		this.roles = roles ;
		this.menu = menu ;
		loginTime = System.currentTimeMillis() ;
	}
    public void setAdmin(Admin admin){
        this.setCityCode(admin.getCityCode());
        this.setProvinceCode(admin.getProvinceCode());
        this.setStoreId(admin.getStoreId());
        this.setStoreName(admin.getStoreName());
        this.setRoleCode(admin.getRoleCode());
        this.setTrueName(admin.getTrueName());
    }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(long loginTime) {
		this.loginTime = loginTime;
	}
	
	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String toString() {
		return String.format("SessionUser:[name=%s ,loginTime=%s]", name , loginTime);
	}
}

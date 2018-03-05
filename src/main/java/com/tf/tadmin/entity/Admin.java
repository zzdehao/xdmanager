package com.tf.tadmin.entity;

import java.util.List;
import com.tf.tadmin.utils.Constants;
import com.tf.tadmin.utils.MD5Utils;
public class Admin extends BaseEntity{
	private String name ;
	
	/**
	 * 昵称
	 */
	private String nickname ;
	
	private String password ;
	
	/**
	 * 部门ID，预留
	 */
	private Integer deptId ; 
	
	private String tel ;
	
	private String email ;
	
	/**
	 * 状态：1启用，2停用
	 */
	private Integer status=1 ;
	
	private String remark ;
	
	private List<Integer> roles ;

    private String blz1;
    private String blz2;

    public String getBlz1() {
        return blz1;
    }

    public void setBlz1(String blz1) {
        this.blz1 = blz1;
    }

    public String getBlz2() {
        return blz2;
    }

    public void setBlz2(String blz2) {
        this.blz2 = blz2;
    }

    public String getBlz3() {
        return blz3;
    }

    public void setBlz3(String blz3) {
        this.blz3 = blz3;
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

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    private String blz3;
    private Integer storeId=-99;
    private String storeName="";

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

    private String userType="00";
    private String cityCode= Constants.ALL_PROVICECITY;
    private String provinceCode=Constants.ALL_PROVICECITY;
    private String roleCode="";

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    private String trueName;

	public String toString() {
		return String.format("name=%s,nickname=%s,deptId=%s,tel=%s,email=%s,status=%s,remark=%s",name , nickname ,deptId , tel , email , status , remark) ;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		if(password.length() == 32){
			this.password = password;
		}else{
			this.password = MD5Utils.encoderByMd5With32Bit(password) ;
		}
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<Integer> getRoles() {
		return roles;
	}

	public void setRoles(List<Integer> roles) {
		this.roles = roles;
	}
}
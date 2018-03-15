package com.tf.tadmin.entity;

import java.util.List;

import com.tf.biz.dataimp.entity.BizImportUser;
import com.tf.tadmin.utils.Constants;
import com.tf.tadmin.utils.MD5Utils;
public class Admin extends BaseEntity{
	private String name ;

	private String provinceName;//省名称

	private String cityName;//地市名称

	private String busTypename;

	private String deptName;

	private String tel2;

	private String gridCode;

	private String gridName;

	private String dutyCode;

	private String dutyName;

	private String dataupDate;

	private String qita1;

	private String qita2;



	private String blz3;
	private Integer storeId=-99;
	private String storeName="";
	private String userType="00";
	private String cityCode= "";
	private String provinceCode="";
	private String roleCode="";
	private String trueName;

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


    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }



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

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getBusTypename() {
		return busTypename;
	}

	public void setBusTypename(String busTypename) {
		this.busTypename = busTypename;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getGridCode() {
		return gridCode;
	}

	public void setGridCode(String gridCode) {
		this.gridCode = gridCode;
	}

	public String getGridName() {
		return gridName;
	}

	public void setGridName(String gridName) {
		this.gridName = gridName;
	}

	public String getDutyCode() {
		return dutyCode;
	}

	public void setDutyCode(String dutyCode) {
		this.dutyCode = dutyCode;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	public String getDataupDate() {
		return dataupDate;
	}

	public void setDataupDate(String dataupDate) {
		this.dataupDate = dataupDate;
	}

	public String getQita1() {
		return qita1;
	}

	public void setQita1(String qita1) {
		this.qita1 = qita1;
	}

	public String getQita2() {
		return qita2;
	}

	public void setQita2(String qita2) {
		this.qita2 = qita2;
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
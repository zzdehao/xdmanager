package com.tf.biz.dataimp.entity;
import java.io.Serializable;
import java.util.Date;
public class BizImportUser implements Serializable{
    private Long id;

    private Long batchId;

    private String userName;

    private String userId;

    private Integer provinceId;

    private String provinceName;

    private Integer cityId;

    private String cityName;

    private String threelevelName;

    private String fourLevelname;

    private String fiveLevelphone;

    private String secondPhone;

    private String dutyName;

    private String gridCode;

    private String gridName;

    private String dataUpdatetime;

    private String qita1;

    private String qita2;

    private Integer createUserId;

    private String createUserName;

    private Date createTime;

    private Integer isDeleted;

    private Integer deleteUserId;

    private String deleteUserName;

    private Date deleteTime;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBatchId() {
        return batchId;
    }

    public void setBatchId(Long batchId) {
        this.batchId = batchId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName == null ? null : provinceName.trim();
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName == null ? null : cityName.trim();
    }

    public String getThreelevelName() {
        return threelevelName;
    }

    public void setThreelevelName(String threelevelName) {
        this.threelevelName = threelevelName == null ? null : threelevelName.trim();
    }

    public String getFourLevelname() {
        return fourLevelname;
    }

    public void setFourLevelname(String fourLevelname) {
        this.fourLevelname = fourLevelname == null ? null : fourLevelname.trim();
    }

    public String getFiveLevelphone() {
        return fiveLevelphone;
    }

    public void setFiveLevelphone(String fiveLevelphone) {
        this.fiveLevelphone = fiveLevelphone == null ? null : fiveLevelphone.trim();
    }

    public String getSecondPhone() {
        return secondPhone;
    }

    public void setSecondPhone(String secondPhone) {
        this.secondPhone = secondPhone == null ? null : secondPhone.trim();
    }

    public String getDutyName() {
        return dutyName;
    }

    public void setDutyName(String dutyName) {
        this.dutyName = dutyName == null ? null : dutyName.trim();
    }

    public String getGridCode() {
        return gridCode;
    }

    public void setGridCode(String gridCode) {
        this.gridCode = gridCode == null ? null : gridCode.trim();
    }

    public String getGridName() {
        return gridName;
    }

    public void setGridName(String gridName) {
        this.gridName = gridName == null ? null : gridName.trim();
    }

    public String getDataUpdatetime() {
        return dataUpdatetime;
    }

    public void setDataUpdatetime(String dataUpdatetime) {
        this.dataUpdatetime = dataUpdatetime == null ? null : dataUpdatetime.trim();
    }

    public String getQita1() {
        return qita1;
    }

    public void setQita1(String qita1) {
        this.qita1 = qita1 == null ? null : qita1.trim();
    }

    public String getQita2() {
        return qita2;
    }

    public void setQita2(String qita2) {
        this.qita2 = qita2 == null ? null : qita2.trim();
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName == null ? null : createUserName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getDeleteUserId() {
        return deleteUserId;
    }

    public void setDeleteUserId(Integer deleteUserId) {
        this.deleteUserId = deleteUserId;
    }

    public String getDeleteUserName() {
        return deleteUserName;
    }

    public void setDeleteUserName(String deleteUserName) {
        this.deleteUserName = deleteUserName == null ? null : deleteUserName.trim();
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}
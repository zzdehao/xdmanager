package com.tf.biz.check.entity;

import java.util.Date;

public class BizCheckDetail {
    private Long id;

    private Long planId;

    private Long storeId;

    private String storeName;

    private String storeAddress;

    private Date checkTime;

    private Long checkUserId;

    private String checkUserName;

    private String checkLongitude;

    private String checkLatitude;

    private Date createTime;

    private Integer status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
    }

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress == null ? null : storeAddress.trim();
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Long getCheckUserId() {
        return checkUserId;
    }

    public void setCheckUserId(Long checkUserId) {
        this.checkUserId = checkUserId;
    }

    public String getCheckUserName() {
        return checkUserName;
    }

    public void setCheckUserName(String checkUserName) {
        this.checkUserName = checkUserName == null ? null : checkUserName.trim();
    }

    public String getCheckLongitude() {
        return checkLongitude;
    }

    public void setCheckLongitude(String checkLongitude) {
        this.checkLongitude = checkLongitude == null ? null : checkLongitude.trim();
    }

    public String getCheckLatitude() {
        return checkLatitude;
    }

    public void setCheckLatitude(String checkLatitude) {
        this.checkLatitude = checkLatitude == null ? null : checkLatitude.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
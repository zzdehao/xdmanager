package com.tf.biz.imp.entity;

import java.util.Date;

public class BizImportBatch {
    private Long id;

    private Integer importType;

    private String batchName;

    private String fileName;

    private String filePath;

    private Integer createUserId;

    private String createUserName;

    private Date createTime;

    private Integer isDeleted;

    private Integer deleteUserId;

    private String deleteUserName;

    private Date deleteTime;

    private String remark;

    private String blz1;

    private String blz2;

    private String blz3;

    private Integer state;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getImportType() {
        return importType;
    }

    public void setImportType(Integer importType) {
        this.importType = importType;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName == null ? null : batchName.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
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

    public String getBlz1() {
        return blz1;
    }

    public void setBlz1(String blz1) {
        this.blz1 = blz1 == null ? null : blz1.trim();
    }

    public String getBlz2() {
        return blz2;
    }

    public void setBlz2(String blz2) {
        this.blz2 = blz2 == null ? null : blz2.trim();
    }

    public String getBlz3() {
        return blz3;
    }

    public void setBlz3(String blz3) {
        this.blz3 = blz3 == null ? null : blz3.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
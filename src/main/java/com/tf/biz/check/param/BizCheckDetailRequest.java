package com.tf.biz.check.param;

import com.tf.biz.check.entity.BizCheckDetail;

import java.util.Date;

public class BizCheckDetailRequest extends BizCheckDetail {

    private Long batchId;

    private String phone;

    private Date startTime;

    private Date endTime;

    public Long getBatchId() {
        return batchId;
    }

    public void setBatchId(Long batchId) {
        this.batchId = batchId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
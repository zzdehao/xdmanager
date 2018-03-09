package com.tf.biz.check.param;

import com.tf.biz.check.entity.BizCheckDetail;
import com.tf.biz.store.entity.BizStore;

import java.util.Date;

public class BizCheckDetailResponse extends BizCheckDetail {

    private BizCheckDetail bizCheckDetail;

    private BizStore bizStore;

    public BizCheckDetail getBizCheckDetail() {
        return bizCheckDetail;
    }

    public void setBizCheckDetail(BizCheckDetail bizCheckDetail) {
        this.bizCheckDetail = bizCheckDetail;
    }

    public BizStore getBizStore() {
        return bizStore;
    }

    public void setBizStore(BizStore bizStore) {
        this.bizStore = bizStore;
    }

    @Override
    public String toString() {
        return "BizCheckDetailResponse{" +
                "bizCheckDetail=" + bizCheckDetail +
                ", bizStore=" + bizStore +
                "} " + super.toString();
    }
}
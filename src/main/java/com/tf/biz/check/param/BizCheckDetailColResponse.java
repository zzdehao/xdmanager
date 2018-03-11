package com.tf.biz.check.param;

import java.util.Map;

public class BizCheckDetailColResponse extends BizCheckDetailResponse {

    private Map<String, ?> colMap;

    public Map getColMap() {
        return colMap;
    }

    public void setColMap(Map colMap) {
        this.colMap = colMap;
    }
}

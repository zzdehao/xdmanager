package com.tf.biz.store.constant;

public interface StoreEnum {

    enum ValidChannel {

        VALID(1, "有效"), UN_VALID(2, "无效");

        private Integer code;
        private String name;

        ValidChannel(Integer code, String name) {
            this.code = code;
            this.name = name;
        }

        public int getCode() {
            return this.code;
        }

        public String getStringCode() {
            return this.code.toString();
        }
    }

}

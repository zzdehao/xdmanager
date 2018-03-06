package com.tf.biz.imp.constant;

public interface ImportEnum {

    enum ImportType {

        SELF_CHANNEL(11, "自有渠道"),
        WORLD_CHANNEL(12, "社会渠道"),
        SMALL_CHANNEL(13, "小微渠道");

        private Integer code;
        private String name;

        ImportType(Integer code, String name) {
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

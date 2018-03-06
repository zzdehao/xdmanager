package com.tf.biz.imp.constant;

public interface ImportEnum {
    //导入类型
    enum ImportType {

        SELF_CHANNEL(11, "自有渠道","商铺"),
        WORLD_CHANNEL(12, "社会渠道","商铺"),
        SMALL_CHANNEL(13, "小微渠道","商铺"),
        USER(21, "人员","人员");

        private Integer code;
        private String name;
        private String typeName;

        ImportType(Integer code, String name,String typeName) {
            this.code = code;
            this.name = name;
            this.typeName=typeName;
        }

        public int getCode() {
            return this.code;
        }

        public String getStringCode() {
            return this.code.toString();
        }
    }
    //渠道类型
    enum ChannelType {

        SELF(10, "自有渠道"),
        WORLD(20, "社会渠道"),
        SMALL(30, "小微渠道");

        private Integer code;
        private String name;

        ChannelType(Integer code, String name) {
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

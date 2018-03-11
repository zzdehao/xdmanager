package com.tf.biz.imp.constant;

public interface ImportEnum {
    //导入类型
    enum ImportType {

        SELF_CHANNEL(11, "自有渠道","店铺"),
        WORLD_CHANNEL(12, "社会渠道","店铺"),
        SMALL_CHANNEL(13, "小微渠道","店铺"),
        USER(21, "人员","人员"),
        SELF_CHANNEL_PLAN(31, "自有渠道","巡检计划"),
        WORLD_CHANNEL_PLAN(32, "社会渠道","巡检计划"),
        SMALL_CHANNEL_PLAN(33, "小微渠道","巡检计划");
        private Integer code;
        private String name;
        private String typeName;

        ImportType(Integer code, String name,String typeName) {
            this.code = code;
            this.name = name;
            this.typeName=typeName;
        }
        // 普通方法
        public static String getFullName(Integer code) {
            for (ImportType c : ImportType.values()) {
                if (c.getCode() == code) {
                    return c.name+"("+c.getTypeName()+")";
                }
            }
            return null;
        }
        public static ImportType getByCode(Integer code) {
            for (ImportType c : ImportType.values()) {
                if (c.getCode() == code) {
                    return c;
                }
            }
            return null;
        }
        public String getTypeName(){
            return this.typeName;
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
        SELF(11,  "自有渠道"),
        WORLD(12, "社会渠道"),
        SMALL(13, "小微渠道");
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

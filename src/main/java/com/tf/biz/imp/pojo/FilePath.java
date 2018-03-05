package com.tf.biz.imp.pojo;

public class FilePath {

    private String realPath;

    private String webPath;

    public FilePath(String realPath, String webPath) {
        this.realPath = realPath;
        this.webPath = webPath;
    }

    public String getRealPath() {
        return realPath;
    }

    public void setRealPath(String realPath) {
        this.realPath = realPath;
    }

    public String getWebPath() {
        return webPath;
    }

    public void setWebPath(String webPath) {
        this.webPath = webPath;
    }
}

package com.offcn.bean;

//封装统计数据
public class ResultBean {

    //保存性别
    private String esex;
    //性别人数
    private Integer cou;

    public String getEsex() {
        return esex;
    }

    public void setEsex(String esex) {
        this.esex = esex;
    }

    public Integer getCou() {
        return cou;
    }

    public void setCou(Integer cou) {
        this.cou = cou;
    }
}

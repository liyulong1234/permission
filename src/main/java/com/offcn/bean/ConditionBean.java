package com.offcn.bean;

//封装查询条件有关的内容
public class ConditionBean {

    //封装页面送来的下拉框中选中的项对应的value值--实际上就是字段名字符串
    private String caption;
    //封装页面送来的文本框中的值--也就是条件值
    private String keyword;

    //思路拓展---页面中有更多的条件框，那么就在此类中设置更多的对应的属性即可


    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}

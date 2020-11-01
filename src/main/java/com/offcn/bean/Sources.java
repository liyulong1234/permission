package com.offcn.bean;

import java.util.List;

public class Sources {
    private Integer id;
    private String name;
    private String url;
    private String remark;
    private Integer pid;
    private String icon;

    //保存子数据的属性
    private List<Sources> children;//两种状态--对象为null;对象不为null但是没有元素size()=0

    //如果节点没有了下级子节点，那么本身就是子节点；如果节点有下级子节点，那么节点本身是父节点
    //要实现以上状态，当前节点以文件夹或者文件状态显示，两个要素：isParent=true children.size()>0; isParent=false children=null
    private Boolean isParent = false;

    private String target = "_self";

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public List<Sources> getChildren() {
        return children;
    }

    public void setChildren(List<Sources> children) {
        this.children = children;
    }

    public Boolean getParent() {
        return isParent;
    }

    public void setParent(Boolean parent) {
        isParent = parent;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
}

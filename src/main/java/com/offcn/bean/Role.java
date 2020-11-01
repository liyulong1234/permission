package com.offcn.bean;

import javax.swing.*;
import java.util.List;

public class Role {

    private Integer roleid;
    private String rolename;
    private String roledis;
    private Integer status;

    //接收多个资源id字符串的属性
    private String sids;

    //接收开启与否的字符串的属性
    private String staStr;//要么是"on" 要么没有值

    //从角色到中间表，单向一对多
    private List<RoleSources> list;

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRoledis() {
        return roledis;
    }

    public void setRoledis(String roledis) {
        this.roledis = roledis;
    }

    public Integer getStatus() {
        //判断
        if("on".equals(this.staStr)){
            this.status = 1;
        }else {
            this.status = 0;
        }
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSids() {
        return sids;
    }

    public void setSids(String sids) {
        this.sids = sids;
    }

    public String getStaStr() {
        return staStr;
    }

    public void setStaStr(String staStr) {
        this.staStr = staStr;
    }

    public List<RoleSources> getList() {
        return list;
    }

    public void setList(List<RoleSources> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                ", roledis='" + roledis + '\'' +
                ", status='" + status + '\'' +
                ", sids='" + sids + '\'' +
                '}';
    }
}

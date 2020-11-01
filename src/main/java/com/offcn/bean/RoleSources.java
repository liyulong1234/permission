package com.offcn.bean;

public class RoleSources {
    private Integer rsid;
    private String rsdis;
    private Integer resources_fk;
    private Integer role_fk;

    public Integer getRsid() {
        return rsid;
    }

    public void setRsid(Integer rsid) {
        this.rsid = rsid;
    }

    public String getRsdis() {
        return rsdis;
    }

    public void setRsdis(String rsdis) {
        this.rsdis = rsdis;
    }

    public Integer getResources_fk() {
        return resources_fk;
    }

    public void setResources_fk(Integer resources_fk) {
        this.resources_fk = resources_fk;
    }

    public Integer getRole_fk() {
        return role_fk;
    }

    public void setRole_fk(Integer role_fk) {
        this.role_fk = role_fk;
    }
}

package com.offcn.bean;

import javax.xml.crypto.Data;
import java.util.Date;

public class Forum {
    private Integer fid;
    private String fcaption;
    private Integer emp_fks;
    private Date fdate;
    private String fcontent;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFcaption() {
        return fcaption;
    }

    public void setFcaption(String fcaption) {
        this.fcaption = fcaption;
    }

    public Integer getEmp_fks() {
        return emp_fks;
    }

    public void setEmp_fks(Integer emp_fks) {
        this.emp_fks = emp_fks;
    }

    public Date getFdate() {
        return fdate;
    }

    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }

    public String getFcontent() {
        return fcontent;
    }

    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
}

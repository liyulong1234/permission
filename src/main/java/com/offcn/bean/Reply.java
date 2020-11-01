package com.offcn.bean;

import java.util.Date;

public class Reply {
    private Integer rid;
    private Integer emp_fkr;
    private Date replaydate;
    private String  replaycontent;
    private Integer pid;
    private Integer forum_fk;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getEmp_fkr() {
        return emp_fkr;
    }

    public void setEmp_fkr(Integer emp_fkr) {
        this.emp_fkr = emp_fkr;
    }

    public Date getReplaydate() {
        return replaydate;
    }

    public void setReplaydate(Date replaydate) {
        this.replaydate = replaydate;
    }

    public String getReplaycontent() {
        return replaycontent;
    }

    public void setReplaycontent(String replaycontent) {
        this.replaycontent = replaycontent;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getForum_fk() {
        return forum_fk;
    }

    public void setForum_fk(Integer forum_fk) {
        this.forum_fk = forum_fk;
    }
}

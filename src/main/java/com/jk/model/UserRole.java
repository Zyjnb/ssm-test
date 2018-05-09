package com.jk.model;

public class UserRole {
    private Integer userid;

    private String roleid;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid == null ? null : roleid.trim();
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "userid=" + userid +
                ", roleid='" + roleid + '\'' +
                '}';
    }
}
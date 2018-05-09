package com.jk.model;

public class RoleTree {
    private String roleid;

    private Integer treeid;
    private String treeidlist;
    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid == null ? null : roleid.trim();
    }

    public Integer getTreeid() {
        return treeid;
    }

    public void setTreeid(Integer treeid) {
        this.treeid = treeid;
    }
    public String getTreeidlist() {
        return treeidlist;
    }

    public void setTreeidlist(String treeidlist) {
        this.treeidlist = treeidlist == null ? null : treeidlist.trim();
    }
}
package com.jk.service.impl;


import com.jk.dao.RoleMapper;
import com.jk.model.Highchars;
import com.jk.model.Role;
import com.jk.model.UserRole;
import com.jk.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> selectRoleAll() {

        return roleMapper.selectRoleAll();
    }

    @Override
    public List<Role> selectRole(String id) {
        return roleMapper.selectRole(id);
    }

    @Override
    public void addRole(UserRole userRole) {
        roleMapper.deleteRole(userRole.getUserid());
        String [] arr =userRole.getRoleid().toString().split(",");
        for (String a : arr) {
            UserRole user = new UserRole();
            user.setUserid(userRole.getUserid());
            roleMapper.addRole(user);
        }
    }

    @Override
    public void addRoles(Role role) {
        roleMapper.addRoles(role);
    }

    @Override
    public List<Highchars> queryChars() {
        List<Highchars> list = new ArrayList<Highchars>();

        List<Role> lists  =  roleMapper.selectRoleAll();

        for (Role role : lists) {
            Highchars high = new Highchars();
            high.setName(role.getName());
            Integer aa = roleMapper.selCount(role.getId());
            high.setY(aa);
            list.add(high);
        }
        return list;
    }
}

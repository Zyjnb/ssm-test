package com.jk.service;

import com.jk.model.Highchars;
import com.jk.model.Role;
import com.jk.model.UserRole;

import java.util.List;

public interface RoleService {
    List<Role> selectRoleAll();

    List<Role> selectRole(String id);

    void addRole(UserRole userRole);

    void addRoles(Role role);

    List<Highchars> queryChars();
}

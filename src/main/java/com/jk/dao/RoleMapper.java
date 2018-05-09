package com.jk.dao;

import com.jk.model.Role;
import com.jk.model.UserRole;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> selectRoleAll();

    List<Role> selectRole(String id);

    void deleteRole(Integer userid);

    void addRole(UserRole user);

    void addRoles(Role role);

    Integer selCount(Integer id);
}
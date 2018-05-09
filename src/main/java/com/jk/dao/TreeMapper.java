package com.jk.dao;

import com.jk.model.RoleTree;
import com.jk.model.Tree;

import java.util.List;

public interface TreeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tree record);

    int insertSelective(Tree record);

    Tree selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tree record);

    int updateByPrimaryKey(Tree record);

    List<Tree> QuertTreeList();

    List<RoleTree> queryTree(String roleid);

    void deleteTree(String roleid);

    void addTree(RoleTree role);
}
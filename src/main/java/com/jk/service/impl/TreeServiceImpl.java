package com.jk.service.impl;

import com.jk.dao.TreeMapper;
import com.jk.model.RoleTree;
import com.jk.model.Tree;
import com.jk.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TreeServiceImpl implements TreeService {
    @Autowired
    private TreeMapper treeMapper;

    @Override
    public List<Tree> QuertTreeList() {
        return treeMapper.QuertTreeList();
    }

    @Override
    public List<RoleTree> queryTree(String roleid) {

        return treeMapper.queryTree(roleid);
    }

    @Override
    public void addTree(RoleTree roleTree) {
        treeMapper.deleteTree(roleTree.getRoleid());
        String [] arr =roleTree.getTreeidlist().split(",");
        for (String a : arr) {
            RoleTree role = new RoleTree();
            role.setTreeid(Integer.valueOf(a.trim()));
            role.setRoleid(roleTree.getRoleid());
            treeMapper.addTree(role);
        }
    }
}

package com.jk.service;

import com.jk.model.RoleTree;
import com.jk.model.Tree;

import java.util.List;

public interface TreeService {
    List<Tree> QuertTreeList();

    List<RoleTree> queryTree(String roleid);

    void addTree(RoleTree roleTree);
}

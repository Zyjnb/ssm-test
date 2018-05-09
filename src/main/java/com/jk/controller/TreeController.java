package com.jk.controller;

import com.jk.model.RoleTree;
import com.jk.model.Tree;
import com.jk.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("treeController")
public class TreeController {
    @Autowired
    private TreeService treeServiceImpl;
    @RequestMapping("QuertTreeList")
    @ResponseBody
    public List<Tree> QuertTreeList(){
        List<Tree> list = treeServiceImpl.QuertTreeList();
        return list;
    }
    @RequestMapping("queryTree")
    @ResponseBody
    public List<Tree> queryTree(String roleid){

        List<Tree> listAll =treeServiceImpl.QuertTreeList();
        List<RoleTree> list = treeServiceImpl.queryTree(roleid);
        for (Tree tTree : listAll) {
            for (RoleTree tTrees : list) {
                if(tTree.getId()==tTrees.getTreeid()){
                    tTree.setChecked(true);
                    break;
                }
            }
        }
        return listAll;
    }
    @RequestMapping("addTree")
    @ResponseBody
    public void addTree(RoleTree roleTree){
        treeServiceImpl.addTree(roleTree);

    }
}

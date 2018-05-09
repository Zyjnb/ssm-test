package com.jk.controller;

import com.jk.model.Highchars;
import com.jk.model.Role;
import com.jk.model.UserRole;
import com.jk.service.RoleService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.net.URL;
import java.util.*;

@Controller
@RequestMapping("RoleController")
public class RoleController {
    @Autowired
    private RoleService RoleServiceImpl;
    @RequestMapping("selectRoleAll")
    @ResponseBody
    public List<Role> selectRoleAll(){
        List<Role> list =RoleServiceImpl.selectRoleAll();
        return list;
    }
    @RequestMapping("selectRole")
    @ResponseBody
    public List<Role> selectRole(String id){
        List<Role> list =RoleServiceImpl.selectRole(id);
        return list;
    }
    @RequestMapping("addRole")
    @ResponseBody
    public void addRole(UserRole userRole){
        RoleServiceImpl.addRole(userRole);

    }
    @RequestMapping("addRoles")
    @ResponseBody
    public void addRoles(Role role){
        RoleServiceImpl.addRoles(role);

    }
    @RequestMapping("queryChars")
    @ResponseBody
    public List<Highchars> queryChars(){
        List<Highchars> list =  RoleServiceImpl.queryChars();

        return list;
    }
    @RequestMapping("selectRoleList")
    @ResponseBody
    public String selectRoleList(){
        List<Role> list =RoleServiceImpl.selectRoleAll();
        Configuration configuration = new Configuration();
        try {
            configuration.setDirectoryForTemplateLoading(new  File("D:\\workspace-idea\\ssm-test\\src\\main\\webapp\\templates"));
            configuration.setDefaultEncoding("utf-8");
            Template template = null;
            template = configuration.getTemplate("role.ftl");
            Writer out= null;
            out = new FileWriter(new File("D:\\workspace-idea\\ssm-test\\src\\main\\webapp\\templates\\role.html"));
            Map root=new HashMap();
            root.put("list", list);
            try {
                template.process(root, out);
            } catch (TemplateException e) {
                e.printStackTrace();
            }
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "templates/role.html";
    }
}

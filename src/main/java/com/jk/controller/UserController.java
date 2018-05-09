package com.jk.controller;

import com.jk.model.User;
import com.jk.service.UserService;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;
import java.util.List;

@Controller
@RequestMapping("userController")
public class UserController {
    @Resource
    private UserService UserServiceImpl;
    @RequestMapping("queryUserList")
    @ResponseBody
    public  List<User>  queryUserList(){
        List<User> list =UserServiceImpl.queryUserList();
        return list;
    }
    @RequestMapping("addUser")
    @ResponseBody
    public  void  addUser(User user){
        UserServiceImpl.addUser(user);

    }
    @RequestMapping("updateUser")
    @ResponseBody
    public  void  updateUser(User user){
        UserServiceImpl.updateUser(user);

    }
    @RequestMapping("queryUser")
    @ResponseBody
    public  User  queryUser(Integer id){
        User user =UserServiceImpl.queryUser(id);

        return user;
    }

}

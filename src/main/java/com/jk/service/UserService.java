package com.jk.service;

import com.jk.model.User;

import java.util.List;

public interface UserService {

    List<User> queryUserList();

    void addUser(User user);

    void updateUser(User user);

    User queryUser(Integer id);
}

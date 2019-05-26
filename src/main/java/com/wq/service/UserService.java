package com.wq.service;

import com.wq.entity.User;

public interface UserService {
    User login(User user);

    User addUser(User user);

    int selectByUserId(String userId);
}

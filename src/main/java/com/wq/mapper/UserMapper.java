package com.wq.mapper;

import com.wq.entity.User;

/**
 * @author admin
 * @title: UserMapper
 * @projectName MyBlog
 * @description: TODO
 * @date 2019/5/2710:42
 */
public interface UserMapper {
    User login(User user);

    int insert(User user);

    int selectByUserId(String userId);
}

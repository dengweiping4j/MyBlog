package com.wq.service.impl;

import com.wq.entity.User;
import com.wq.mapper.UserMapper;
import com.wq.service.UserService;
import com.wq.util.MD5Util;
import com.wq.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.UUID;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
        user.setPassword(MD5pwd);
        return userMapper.login(user);
    }

    @Override
    public User addUser(User user) {
        user.setPkid(UUID.randomUUID().toString());
        user.setUserType("3");
        String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
        user.setPassword(MD5pwd);
        if (StringUtil.isEmpty(user.getProfilePhoto())) {
            user.setProfilePhoto("photo.jpg");
        }
        int total = userMapper.insert(user);
        if (total > 0) {
            return user;
        }
        return null;
    }

    @Override
    public int selectByUserId(String userId) {
        return userMapper.selectByUserId(userId);
    }
}

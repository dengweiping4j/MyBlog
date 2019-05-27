package com.wq.controller;

import com.wq.common.Result;
import com.wq.common.ResultGenerator;
import com.wq.entity.User;
import com.wq.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    /*
     *添加用户
     */
    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody User user) {
        int preUser = userService.selectByUserId(user.getUserId());
        if (preUser != 0) {
            return ResultGenerator.genFailResult("该用户已存在，请重新输入！");
        }
        User resulrUser = userService.addUser(user);
        if (resulrUser != null) {
            Map data = new HashMap();
            data.put("currentUser", resulrUser);
            return ResultGenerator.genSuccessResult(data);
        }
        return ResultGenerator.genFailResult("注册失败，请与系统管理员联系！");
    }

    /**
     * 登陆
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(@RequestBody User user) {
        User resultUser = userService.login(user);
        if (resultUser == null) {
            return ResultGenerator.genFailResult("账号或密码错误,请重新登录！");
        } else {
            resultUser.setPassword("PASSWORD");
            Map data = new HashMap();
            data.put("currentUser", resultUser);
            return ResultGenerator.genSuccessResult(data);
        }
    }
}

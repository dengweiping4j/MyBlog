package com.wq.controller;

import com.wq.common.Result;
import com.wq.common.ResultGenerator;
import com.wq.entity.User;
import com.wq.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    /**
     * 登陆
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(@RequestBody User user) {
        if (checkUser(user)) return ResultGenerator.genFailResult("登录失败<br>您输入的内容含有非法字符！");
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

    /*
     *添加用户
     */
    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody User user) {
        if (checkUser(user)) return ResultGenerator.genFailResult("注册失败<br>您输入的内容含有非法字符！");
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
        return ResultGenerator.genFailResult("注册失败<br>请与系统管理员联系！");
    }

    /*
     *上传图片
     */
    @RequestMapping(value = "uploadImg", method = RequestMethod.POST)
    @ResponseBody
    public Result uploadImg(@RequestBody String imgBase64) {
        System.out.println(imgBase64);
        return ResultGenerator.genSuccessResult();
    }

    //校验输入的用户信息
    private boolean checkUser(User user) {
        String userId = user.getUserId() == null ? "" : user.getUserId();
        String userName = user.getUserName() == null ? "" : user.getUserName();
        String password = user.getPassword() == null ? "" : user.getPassword();
        if (!userId.matches("[a-zA-Z0-9_]*") || !password.matches("[a-zA-Z0-9_]*")) {
            return true;
        }
        if (userId.length() < 6 || userId.length() > 15 || userName.length() > 40 || password.length() < 6 || password.length() > 40) {
            return false;
        }
        return false;
    }

}

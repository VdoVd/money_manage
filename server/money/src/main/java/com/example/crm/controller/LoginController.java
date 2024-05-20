package com.example.crm.controller;

import com.example.crm.Mapper.UserMapper;
import com.example.crm.pojo.Login.User;
import com.example.crm.result.AllReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class LoginController {

    @Autowired
    User user;

    @Autowired
    UserMapper userMapper;

    @Autowired
    AllReturn allReturn;

    @GetMapping("/register")
    public String register(@RequestParam String email,@RequestParam String password){
        user.setName(email);
        user.setEmail(email);
        user.setPassword(password);
        Integer res = userMapper.insert(user);

        if (res == 1){
            allReturn.setMessage("注册成功");
            allReturn.setCode(200);
            allReturn.setData(true);
            allReturn.setSuccess(true);
            return "register";
        }else {

        }
        return "register";
    }

    @PostMapping("/login")
    public String login(){

        return "login";
    }

    @GetMapping("/test")
    public String test(){
        return "test";
    }
}

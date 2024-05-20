package com.example.crm.controller;

import com.example.crm.Mapper.UserMapper;
import com.example.crm.pojo.Login.User;
import com.example.crm.pojo.Login.UserReq;
import com.example.crm.result.AllReturn;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {

    @Autowired
    User user;

    @Autowired
    UserMapper userMapper;

    @Autowired
    AllReturn allReturn;

    @Autowired
    Gson gson;

    @GetMapping("/register")
    public String register(@RequestParam String name, @RequestParam String password){
        Map<String,Object>map=new HashMap<>();
        map.put("name",name);
        if(userMapper.selectByMap(map).size()>=1){
            allReturn.setMessage("注册过");
            allReturn.setCode(201);
            allReturn.setData(true);
            allReturn.setSuccess(true);
            System.out.println("注册过："+gson.toJson(allReturn));
            return gson.toJson(allReturn);
        }
        user.setName(name);
        user.setEmail(name);
        user.setPassword(password);
        Integer res = userMapper.insert(user);

        if (res == 1){
            allReturn.setMessage("注册成功");
            allReturn.setCode(200);
            allReturn.setData(true);
            allReturn.setSuccess(true);
        }else {
            allReturn.setSuccess(false);
            allReturn.setCode(400);
            allReturn.setMessage("注册失败");
            allReturn.setData(false);
        }
        System.out.println(gson.toJson(allReturn));
        return gson.toJson(allReturn);
    }

    @PostMapping("/login")
    public String login(@RequestBody UserReq userReq){
        Map<String,Object>map=new HashMap<>();
        map.put("name",userReq.getName());
        map.put("password",userReq.getPassword());
        Integer res=userMapper.selectByMap(map).size();
        System.out.println("res:"+res);
        System.out.println("login:"+gson.toJson(userReq));
        if (res>=1){
            allReturn.setMessage("登录成功");
            allReturn.setCode(200);
            allReturn.setData(true);
            allReturn.setSuccess(true);
        }else {
            allReturn.setSuccess(false);
            allReturn.setCode(400);
            allReturn.setMessage("登录失败");
            allReturn.setData(false);
        }
        System.out.println(gson.toJson(allReturn));
        return gson.toJson(allReturn);
    }

    @GetMapping("/test")
    public String test(){
        return "test";
    }
}

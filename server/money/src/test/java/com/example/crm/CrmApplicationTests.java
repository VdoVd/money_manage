package com.example.crm;

import com.example.crm.Mapper.UserMapper;
import com.example.crm.pojo.Login.User;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class CrmApplicationTests {

    @Autowired
    private UserMapper userMapper;

    @Test
    void contextLoads() {
        System.out.println("--------selectAll method test ---------------");
        List<User>userList = userMapper.selectList(null);
        if(5==userList.size()){
            System.out.println("find 5 users");
        }
        userList.forEach(System.out::println);
    }

}

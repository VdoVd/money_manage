package com.example.crm.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.crm.pojo.Login.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface UserMapper extends BaseMapper<User> {
}

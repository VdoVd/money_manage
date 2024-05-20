package com.example.crm.pojo.Login;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class User {
    private Long id;
    private String name;
    private Integer age;
    private String email;
    private String password;
}

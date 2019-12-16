package com.atguigu.crud.service;

import com.atguigu.crud.bean.Info;
import com.atguigu.crud.bean.User;
import com.atguigu.crud.dao.InfoMapper;
import com.atguigu.crud.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-12:13
 */
@Service
    public class UserService {

        @Autowired
        private UserMapper userMapper;

    public User selectUserByName(String name){
        return userMapper.selectUserByName(name);
    }

}

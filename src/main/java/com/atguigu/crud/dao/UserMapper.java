package com.atguigu.crud.dao;

import com.atguigu.crud.bean.User;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-16:12
 */
public interface UserMapper {
    public User selectUserByName(String name);
}

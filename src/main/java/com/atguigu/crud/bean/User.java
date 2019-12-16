package com.atguigu.crud.bean;

import java.io.Serializable;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-16:11
 */
public class User implements Serializable {
    private String name;
    private String pwd;
    private int place;

    public User(String name, String pwd, int place) {
        this.name = name;
        this.pwd = pwd;
        this.place = place;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", place=" + place +
                '}';
    }

    public User() {

    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }
}

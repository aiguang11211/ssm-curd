package com.atguigu.crud.bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-12:05
 */
public class Info implements Serializable {
    private Date time;
    private double y;

    public Info(Date time, double y) {
        this.time = time;
        this.y = y;
    }

    public Info() {

    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    @Override
    public String toString() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(time);
        return "[" +
                "\"" + format +
                "\", " + y +
                ']';
    }
}

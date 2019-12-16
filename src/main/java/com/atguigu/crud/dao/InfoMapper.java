package com.atguigu.crud.dao;

import com.atguigu.crud.bean.Info;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-12:10
 */
public interface InfoMapper {
    public List<Info> selectInfos(int x);
    public List<Info> selectInfosWithTime(@Param("x") int x,
                                          @Param("startTime") String startTime,
                                          @Param("endTime") String endTime);
}

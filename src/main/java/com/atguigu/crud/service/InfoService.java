package com.atguigu.crud.service;

import com.atguigu.crud.bean.Info;
import com.atguigu.crud.dao.InfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-12:13
 */
@Service
    public class InfoService {

        @Autowired
        private InfoMapper infoMapper;

    public List<Info> selectInfos_0(){
        return infoMapper.selectInfos(0);
    }

    public List<Info> selectInfos_1(){
        return infoMapper.selectInfos(1);
    }

    public List<Info> selectInfosWithTime(int x,String startTime,String endTime){
        return infoMapper.selectInfosWithTime(x,startTime,endTime);
    }
}

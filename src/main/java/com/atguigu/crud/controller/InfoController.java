package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Info;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-12:14
 */
@Controller
public class InfoController {

    @Autowired
    private InfoService infoService;

    @RequestMapping("/selectInfos")
    public String selectInfos(HttpSession session,Map<String,String> map){
        String flag=(String)session.getAttribute("login");

        if("0".equals(flag)){
            return "list_2";
        }else {
            map.put("user",flag);
            return "list_3";
        }


    }


    @RequestMapping("/selectInfos_all")
    @ResponseBody
    public Msg selectInfos_all(HttpSession session){
        List<Info> infos_0 = infoService.selectInfos_0();
        List<Info> infos_1 = infoService.selectInfos_1();
        return Msg.success().add("infos_0",infos_0.toString()).add("infos_1",infos_1.toString());
    }


    @RequestMapping("/selectInfos_0")
    @ResponseBody
    public Msg selectInfos_0(){
        List<Info> infos_0 = infoService.selectInfos_0();

        return Msg.success().add("infos",infos_0.toString());
    }


    @RequestMapping("/selectInfos_1")
    @ResponseBody
    public Msg selectInfos_1(){
        List<Info> infos_1 = infoService.selectInfos_1();

        return Msg.success().add("infos",infos_1.toString());
    }

    @RequestMapping("/selectInfosWithTime")
    @ResponseBody
    public Msg selectInfosWithTime(@RequestParam("flag") int x,
                                   @RequestParam("startTime") String start,
                                   @RequestParam("endTime") String end){



        List<Info> infos = infoService.selectInfosWithTime(x,
                            start.replace('T',' '),
                            end.replace('T',' '));

        return Msg.success().add("infos",infos.toString());
    }


}

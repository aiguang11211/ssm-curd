package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.bean.User;
import com.atguigu.crud.service.UserService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author 拉布拉多搭
 * @create 2019-08-20-15:59
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Msg loginUser(@RequestParam("name") String name,
                         @RequestParam("pwd") String pwd, HttpSession session){
        System.out.println("text...");
        User user = userService.selectUserByName(name);
        System.out.println(user);
        if(user!=null && pwd.equals(user.getPwd())){
            session.setAttribute("login",user.getPlace()+"");
            return Msg.success();
        }
        return Msg.fail();
    }

    @RequestMapping("/layout")
    public void layout(HttpSession session, HttpServletResponse response,
                       HttpServletRequest request) throws IOException {
        session.removeAttribute("login");
        response.sendRedirect(request.getContextPath());
    }



}

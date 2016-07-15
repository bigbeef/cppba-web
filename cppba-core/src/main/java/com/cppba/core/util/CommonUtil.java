package com.cppba.core.util;

import com.cppba.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
public class CommonUtil {

    private static Logger logger = LoggerFactory.getLogger(CommonUtil.class);

    public static boolean isAjaxRequerst(HttpServletRequest request){
        String requestType = request.getHeader("X-Requested-With");
        if(StringUtils.equals(requestType,"XMLHttpRequest")){
            return true;
        }
        return false;
    }
    
    //获取session
    public static HttpSession getSession(HttpServletRequest request){
        HttpSession session = request.getSession();
        //Subject currentUser = SecurityUtils.getSubject();
        //Session session = currentUser.getSession();
        return session;
    }
    
    //从session中获取user
    public static User getUserFromSession(HttpServletRequest request){
        HttpSession session = getSession(request);
        User user = (User) session.getAttribute("user");
        return user;
    }

    /**
     * 构建response返回json
     * code 返回码，1表示成功，2表示失败
     * msg 中文提示
     * data 返回数据
     */
    public static void responseBuildJson(String code,String msg,Map<String,Object> map,HttpServletResponse response){
        String json = "";
       
        try {
            HashMap<String, Object> map1 = new HashMap<String,Object>();
            //返回码，1表示成功，2表示失败
            map1.put("result", code);
            //中文提示
            map1.put("msg", msg);
            //返回数据
            map1.put("data", map);
            ObjectMapper objectMapper = new ObjectMapper();
            json = objectMapper.writeValueAsString(map1);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        response.setContentType("application/json");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        try {
            PrintWriter writer;
            writer = response.getWriter();
            writer.print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    //获取coockie
    public static String getCookie(String name,HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        for(Cookie c :cookies ){
            if(c.getName().equals(name)){
                return c.getValue();
            }
        }
        return null;
    }
}

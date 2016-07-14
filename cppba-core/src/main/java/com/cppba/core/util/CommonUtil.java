package com.cppba.core.util;

import com.cppba.entity.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    public static User getUserFromSession(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        return user;
    }
    
    //构建返回json规范
    public static Map<String,Object> parseJson(String code,String msg,Object data){
        Map<String,Object> map = new HashMap<String, Object>();
        //返回码，1表示成功，2表示失败
        map.put("result", code);
        //中文提示
        map.put("msg", msg);
        //返回数据
        map.put("data", data);
        return map;
    }
    

    //构建response返回json
    public static void responseBuildJson(HttpServletResponse response, Map<String,Object> map){
        try{
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(map);
            //response.setContentType("text/plain");
            response.setContentType("application/json");
            response.setHeader("Cache-Control", "no-cache");
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer;
            writer = response.getWriter();
            writer.print(json);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            System.out.println(e.getMessage());
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

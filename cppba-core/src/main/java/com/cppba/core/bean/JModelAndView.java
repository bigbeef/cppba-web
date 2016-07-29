package com.cppba.core.bean;

import com.cppba.entity.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public class JModelAndView extends ModelAndView {

    public JModelAndView(String viewName){
        super.setViewName(viewName);
    }

    public JModelAndView(String viewName, User user,HttpServletRequest request) {
        super.setViewName(viewName);
        //加入user
        this.addObject("user",user);
        //webPath
        String path = request.getContextPath();
        String webPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        this.addObject("webPath",webPath);

    }
}

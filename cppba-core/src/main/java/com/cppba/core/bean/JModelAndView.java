package com.cppba.core.bean;

import com.cppba.core.constant.Globals;
import com.cppba.entity.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public class JModelAndView extends ModelAndView {

    public JModelAndView(String viewName){
        super.setViewName(viewName);
    }

    public JModelAndView(String viewName, User user,HttpServletRequest request) {
        viewName = "/template/"+Globals.template_type+viewName;
        super.setViewName(viewName);
        this.addObject("template_type", Globals.template_type);
        //加入user
        this.addObject("user",user);
        //webPath
        String path = request.getContextPath();
        String webPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        this.addObject("webPath",webPath);
    }
}

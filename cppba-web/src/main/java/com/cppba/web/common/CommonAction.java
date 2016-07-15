package com.cppba.web.common;

import com.cppba.core.util.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
@Controller
public class CommonAction {
    private static Logger logger = LoggerFactory.getLogger(CommonAction.class);

    //返回403错误
    @RequestMapping("/403.htm")
    public void login(
            HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map = new HashMap<String,Object>();
        CommonUtil.responseBuildJson("403","你无权访问该资源!",null,response);
    }
}

package com.cppba.web.blog;

import com.cppba.core.util.CommonUtil;
import com.cppba.entity.User;
import com.cppba.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
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
@Controller("blogUserAction")
public class UserAction {

    private static Logger logger = LoggerFactory.getLogger(UserAction.class);

    @Resource
    private UserService userService;

    @RequestMapping("/user_load.htm")
    public void user_load(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="userId", defaultValue="0")long userId){
        Map<String,Object> map = new HashMap<>();
        try {
            User user = userService.findById(userId);
            if(user == null){
                CommonUtil.responseBuildJson("3","用户不存在",null,response);
                return;
            }
            Map<String,Object> map1 = new HashMap<String,Object>();
            map1.put("user",user);
            CommonUtil.responseBuildJson("1","操作成功",map1,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }
}

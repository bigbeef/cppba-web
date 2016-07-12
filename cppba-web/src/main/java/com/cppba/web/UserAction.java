package com.cppba.web;

import com.cppba.core.bean.PageEntity;
import com.cppba.core.util.CommonUtil;
import com.cppba.dto.UserDto;
import com.cppba.entity.User;
import com.cppba.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
@Controller
public class UserAction {

    private static Logger logger = LoggerFactory.getLogger(UserAction.class);

    @Resource
    private UserService userService;

    @RequestMapping("login.htm")
    public ModelAndView login(
            HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pages/login.jsp");
        return mv;
    }

    @RequestMapping("login_system.htm")
    public ModelAndView login_system(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="userName", defaultValue="")String userName,
            @RequestParam(value="password", defaultValue="")String password,
            RedirectAttributes redirectAttributes){
        ModelAndView mv = null;
        UserDto userDto = new UserDto();
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        userDto.setUser(user);
        PageEntity<User> pe = userService.query(userDto);
        List<User> userList = pe.getList();
        if(userList.size()>0){//登录成功
            mv = new ModelAndView("pages/main.jsp");
            User u = userList.get(0);
            HttpSession session = request.getSession();
            session.setAttribute("user",u);
        }else{//用户名密码错误
            mv = new ModelAndView("redirect:/login.htm");
            redirectAttributes.addFlashAttribute("error","用户名密码错误！");
        }
        return mv;
    }

    @RequestMapping("user_setting.htm")
    public void user_setting(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="userId", defaultValue="0")int userId,
            @RequestParam(value="nickName", defaultValue="")String nickName,
            @RequestParam(value="remark", defaultValue="")String remark){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            User user = userService.findById(userId);
            if(user == null){
                map = CommonUtil.parseJson("3","用户不存在","");
                CommonUtil.responseBuildJson(response,map);
                return;
            }
            user.setNickName(nickName);
            user.setRemark(remark);
            userService.update(user);
            map = CommonUtil.parseJson("1","操作成功","");
        }catch (Exception e){
            map = CommonUtil.parseJson("2","操作异常","");
            logger.error(e.getMessage(),e);
        }
        CommonUtil.responseBuildJson(response,map);
    }

    @RequestMapping("user_load.htm")
    public void user_load(HttpServletRequest request, HttpServletResponse response,
                             @RequestParam(value="userId", defaultValue="0")int userId){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            User user = userService.findById(userId);
            if(user == null){
                map = CommonUtil.parseJson("3","用户不存在","");
                CommonUtil.responseBuildJson(response,map);
                return;
            }
            Map<String,Object> map1 = new HashMap<String,Object>();
            map1.put("user",user);
            map = CommonUtil.parseJson("1","操作成功",map1);
        }catch (Exception e){
            map = CommonUtil.parseJson("2","操作异常","");
            logger.error(e.getMessage(),e);
        }
        CommonUtil.responseBuildJson(response,map);
    }
}

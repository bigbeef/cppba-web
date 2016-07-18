package com.cppba.web.blogger;

import com.cppba.core.bean.PageEntity;
import com.cppba.core.util.CommonUtil;
import com.cppba.dto.UserDto;
import com.cppba.entity.User;
import com.cppba.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping("/login.htm")
    public ModelAndView login(
            HttpServletRequest request, HttpServletResponse response){
        boolean isAjaxRequest = CommonUtil.isAjaxRequerst(request);
        if(isAjaxRequest){
            CommonUtil.responseBuildJson("741","用户未登录",null,response);
            return null;
        } 
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/pages/login.jsp");
        return mv;
    }

    @RequestMapping("/login_system.htm")
    public ModelAndView login_system(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="userName", defaultValue="")String userName,
            @RequestParam(value="password", defaultValue="")String password,
            RedirectAttributes redirectAttributes){
        ModelAndView mv = null;
        UserDto userDto = new UserDto();
        User user = new User();
        user.setUserName(userName);
        //user.setPassword(password);
        userDto.setUser(user);
        PageEntity<User> pe = userService.query(userDto);
        List<User> userList = pe.getList();
        if(userList.size()>0){//登录成功
            mv = new ModelAndView("redirect:/pages/main.jsp");
            User u = userList.get(0);

            SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());
            // 登录后存放进shiro token  
            UsernamePasswordToken token = new UsernamePasswordToken(userName,password);
            Subject subject = SecurityUtils.getSubject();
            try{
                subject.login(token);
            }catch (AuthenticationException ae){
                logger.info("用户{}尝试登陆失败！",userName);
                mv = new ModelAndView("redirect:/login.htm");
                redirectAttributes.addFlashAttribute("error","用户名密码错误！");
            }
        }else{//用户名密码错误
            mv = new ModelAndView("redirect:/login.htm");
            redirectAttributes.addFlashAttribute("error","用户名密码错误！");
        }
        return mv;
    }

    @RequiresRoles("blogger")
    @RequestMapping("/blogger/user_setting.htm")
    public void user_setting(
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value="nickName", defaultValue="")String nickName,
            @RequestParam(value="remark", defaultValue="")String remark){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            User sessionUser = CommonUtil.getUserFromSession(request);
            long userId = sessionUser.getUserId();
            User user = userService.findById(userId);
            if(user == null){
                CommonUtil.responseBuildJson("3","用户不存在",null,response);
                return;
            }
            user.setNickName(nickName);
            user.setRemark(remark);
            userService.update(user);
            CommonUtil.responseBuildJson("1","操作成功",null,response);
        }catch (Exception e){
            CommonUtil.responseBuildJson("2","操作异常",null,response);
            logger.error(e.getMessage(),e);
        }
    }

    @RequiresRoles("blogger")
    @RequestMapping("/blogger/user_load.htm")
    public void user_load(
            HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map = new HashMap<>();
        try {
            User sessionUser = CommonUtil.getUserFromSession(request);
            long userId = sessionUser.getUserId();
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

package com.cppba.web.common;

import com.cppba.core.util.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
@Controller
public class TestAction {
    private static Logger logger = LoggerFactory.getLogger(TestAction.class);

    //测试接口
    @RequestMapping("/test.htm")
    public void login(
            HttpServletRequest request, HttpServletResponse response) {
        CommonUtil.responseBuildJson("1", "操作成功", null, response);
    }
}

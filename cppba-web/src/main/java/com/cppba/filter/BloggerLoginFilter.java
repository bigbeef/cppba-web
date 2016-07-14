package com.cppba.filter;

import com.cppba.core.util.CommonUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/7/14.
 */
public class BloggerLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse res = (HttpServletResponse)servletResponse;
        //基于http协议的servlet  

        //如果没有登录.  
        String requestURI = req.getRequestURI();
        
        //需要过滤的
        if(requestURI.indexOf("blogger") >= 0){
            //取得session. 如果没有session则自动会创建一个, 我们用false表示没有取得到session则设置为session为空.  
            HttpSession session = req.getSession(false);
            //System.out.println(session.getAttribute("user"));
            //如果session中没有任何东西.  
            if(session == null ||session.getAttribute("user")==null)
            {
                Map map = new HashMap<>();
                map = CommonUtil.parseJson("741","用户无效，请重新登录！","");
                CommonUtil.responseBuildJson(res,map);
                //返回
                return;
            }
        }
        
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {
    }
}

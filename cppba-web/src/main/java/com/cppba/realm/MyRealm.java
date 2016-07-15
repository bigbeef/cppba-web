package com.cppba.realm;


import com.cppba.core.bean.PageEntity;
import com.cppba.dto.PermissionDto;
import com.cppba.dto.UserRoleDto;
import com.cppba.entity.Permission;
import com.cppba.entity.Role;
import com.cppba.entity.User;
import com.cppba.entity.UserRole;
import com.cppba.service.PermissionService;
import com.cppba.service.RoleService;
import com.cppba.service.UserRoleService;
import com.cppba.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

public class MyRealm extends AuthorizingRealm {
    @Resource
    private RoleService roleService;
    @Resource
    private PermissionService permissionService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private UserService userService;

    /**
     * 为当前登录的Subject授予角色和权限
     * <p>
     * 经测试:本例中该方法的调用时机为需授权资源被访问时
     * 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache
     * 个人感觉若使用了Spring3.1开始提供的ConcurrentMapCache支持,则可灵活决定是否启用AuthorizationCache
     * 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        //获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
        String currentUsername = (String) super.getAvailablePrincipal(principals);
        List<String> roleList = new ArrayList<>();
        List<String> permissionList = new ArrayList<>();
        //从数据库中获取当前登录用户的详细信息
        User user = userService.findByUserName(currentUsername);
        if (null != user) {
            //获取当前登录用户的角色
            //role
            UserRoleDto userRoleDto = new UserRoleDto();
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getUserId());
            userRoleDto.setUserRole(userRole);
            PageEntity<UserRole> pe = userRoleService.query(userRoleDto);
            List<UserRole> userRoleList = pe.getList();
            for (UserRole ur : userRoleList) {
                Role role = roleService.findById(ur.getRoleId());
                if (StringUtils.isNoneBlank(role.getName())) {
                    roleList.add(role.getName());
                }
                //获取权限
                //permission
                PermissionDto permissionDto = new PermissionDto();
                Permission permission = new Permission();
                permission.setRoleId(role.getRoleId());
                permissionDto.setPermission(permission);
                PageEntity<Permission> permissionPageEntity = permissionService.query(permissionDto);
                List<Permission> pList = permissionPageEntity.getList();
                for (Permission p : pList) {
                    if (StringUtils.isNotBlank(p.getUrl())) {
                        permissionList.add(p.getUrl());
                    }
                }
            }
        } else {
            throw new AuthorizationException();
        }
        //System.out.println("roles:"+roleList);
        //System.out.println("permissions:"+permissionList);
        //为当前用户设置角色和权限
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        simpleAuthorInfo.addRoles(roleList);
        simpleAuthorInfo.addStringPermissions(permissionList);
        //若该方法什么都不做直接返回null的话,就会导致任何用户访问/admin/listUser.jsp时都会自动跳转到unauthorizedUrl指定的地址
        //详见applicationContext.xml中的<bean id="shiroFilter">的配置
        return simpleAuthorInfo;
    }


    /**
     * 验证当前登录的Subject
     * <p>
     * 经测试:本例中该方法的调用时机为LoginController.login()方法中执行Subject.login()时
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        //获取基于用户名和密码的令牌
        //实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
        //两个token的引用都是一样的
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        //System.out.println("验证当前Subject时获取到token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));

        User user = userService.findByUserName(token.getUsername());
        if (null != user) {
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(), user.getNickName());
            this.setSession("currentUser", user);
            return authcInfo;
        }
        return null;
    }


    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     * <p>
     * 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
     */
    private void setSession(Object key, Object value) {
        Subject currentUser = SecurityUtils.getSubject();
        if (null != currentUser) {
            Session session = currentUser.getSession();
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
            if (null != session) {
                session.setAttribute(key, value);
            }
        }
    }
}

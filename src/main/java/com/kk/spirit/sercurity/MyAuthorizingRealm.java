package com.kk.spirit.sercurity;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import com.kk.spirit.entity.UserEntity;
import com.kk.spirit.service.UserService;

public class MyAuthorizingRealm extends AuthorizingRealm
{
    
    @Autowired
    private UserService userService;
    
    Logger log = Logger.getLogger(MyAuthorizingRealm.class);
    
    /**
     * 回调函数
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals)
    {
        Subject currentUser = SecurityUtils.getSubject(); 
        Session session = currentUser.getSession();
        
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        return info;
    }
    
    /**
     * 用户登录使用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
        throws AuthenticationException
    {
        UsernamePasswordToken usernamePasswordToke = (UsernamePasswordToken)token;
        
        String username = usernamePasswordToke.getUsername();      
        String password = new String(usernamePasswordToke.getPassword());
        UserEntity user = userService.userLoginByUsername(username);
        if (user != null) {
            if (password.equals(user.getPassword())) {
                // TODO  执行登录操作等。。。。
                Subject currentUser = SecurityUtils.getSubject(); 
                Session session = currentUser.getSession();
                session.setAttribute("user", user);
                return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());                 
            } else {
                throw new IncorrectCredentialsException();
            }
        }else {
            throw new UnknownAccountException();
        }
       
    }
    
}

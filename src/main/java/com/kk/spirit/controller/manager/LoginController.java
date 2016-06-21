package com.kk.spirit.controller.manager;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.kk.spirit.entity.UserEntity;
import com.kk.spirit.service.UserService;
import com.kk.spirit.utils.JSONUtil;

/**
 * 登录空值类
 * <功能详细描述>
 * 
 * @author  huangteng
 * @date  2016年5月10日
 */
@Controller
@RequestMapping("/manager")
public class LoginController {

    Logger log = Logger.getLogger(LoginController.class);

    @Autowired
    private UserService userService; 
    /**
     * 跳转到登录的页面
     * <功能详细描述>
     */
    @RequestMapping({"/admin", "login"})
    public String login(HttpServletRequest req) {
    	System.out.println(req);
        log.debug("跳转到登录页面！");
        System.out.println("ddd");
        return "manager/login";
    }

    /**
     * 登录的方法，验证用户名和密码
     * <功能详细描述>
     */
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    @ResponseBody
    public String checkLogin(UserEntity user, HttpServletRequest req) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken();
        token.setUsername(user.getUsername());
        token.setPassword(user.getPassword().toCharArray());
        Map<String, Object> map = new HashMap<>();
        UserEntity userEntity = userService.userLoginByUsername(user.getUsername());
        try {
            subject.login(token);
            map.put("result", true);
            map.put("msg", "用户验证正确，登录...");
            req.getSession().setAttribute("user", userEntity);
        } catch (UnknownAccountException e) {
            // 用户不正确
            map.put("result", false);
            map.put("msg", "用户不存在！");
        } catch (IncorrectCredentialsException e) {
            // 密码不正确
            map.put("result", false);
            map.put("msg", "密码不正确！");
        }
        return JSONUtil.writeJson(map);
    }

    /**
     * 登录成功后跳转到后台管理的主页面
     * <功能详细描述>
     */
    @RequestMapping("/main")
    public ModelAndView main() {
        log.debug("跳转到主页面！");

        ModelAndView mv = new ModelAndView("manager/main");
        return mv;
    }

    /**
     * 退出登录的功能
     * <功能详细描述>
     */
    @RequestMapping("/logout")
    public String logout() {
        log.debug("退出登录！");
        // 菜单信息 ，需要根据用户权限取得
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }
    
    @RequestMapping("/error")
    public ModelAndView error() {
        ModelAndView mv = new ModelAndView("manager/error");

        return mv;
    }

    @RequestMapping("/welcome")
    public ModelAndView welcome() {
        log.debug("跳转到欢迎页面！");
        
        ModelAndView mv = new ModelAndView("manager/welcome");
        return mv;
    }


}

package org.cms.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.cms.entity.AjaxObj;
import org.cms.entity.MyException;
import org.cms.entity.User;
import org.cms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;

/**
 * Created by a on 2017/7/18.
 */
@Controller
public class LoginController {

    @Resource
    private UserService userService;

    private final Logger log = LoggerFactory.getLogger(getClass());

    @GetMapping("/sys/login")
    public String login() {
        log.debug("进入login");
        return "/login";
    }

    @PostMapping("/sys/login")
    public String login(String username, String password, Model model) {
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(new UsernamePasswordToken(username, password));
        } catch (AuthenticationException e) {
            MyException myException = new MyException();
            myException.getMessage();
            throw new MyException("用户名或密码不正确");
        }
        return "/index/index";
    }

    @PostMapping("/sys/regist")
    public String regist(User user) {
        userService.regist(user);
        return "redirect:/sys/login";
    }
}

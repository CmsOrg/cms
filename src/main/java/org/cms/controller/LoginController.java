package org.cms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * Created by a on 2017/7/18.
 */
@Controller
public class LoginController {


    LoginController(){
        log.debug("构造");
    }
    private final Logger log = LoggerFactory.getLogger(getClass());
    @GetMapping("/sys/login")
    public String login(){
        log.debug("进入login");
        return "/login";
    }

}

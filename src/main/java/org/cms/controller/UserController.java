package org.cms.controller;

import javax.annotation.Resource;

import org.cms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by a on 2017/7/18.
 */
@Controller
@RequestMapping("/sys/user")
public class UserController {

	@Resource
	private UserService userService;
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/list")
	public String list(Model model){
		return "/sys/user/list";
	}

	@PostMapping("/list")
	@ResponseBody
	public Object list() {
		return userService.find();
	}

}

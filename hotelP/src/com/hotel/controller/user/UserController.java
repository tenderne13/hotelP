package com.hotel.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("initRegist")
	public String initRegist(){
		return "user/regist";
	}
}

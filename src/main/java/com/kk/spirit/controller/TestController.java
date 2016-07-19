package com.kk.spirit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {

	@RequestMapping("/angular")
	public String testAngular() {
		
		return "/test/testangular";
	}
	
	@RequestMapping("/jsp")
	public String testjsp() {
		System.out.println("地址");
		return "/test/testangular";
	}
	
}

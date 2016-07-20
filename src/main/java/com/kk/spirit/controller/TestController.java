package com.kk.spirit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import freemarker.template.Configuration;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private Configuration freemarker;
	
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

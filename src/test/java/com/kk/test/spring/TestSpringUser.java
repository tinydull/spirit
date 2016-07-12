package com.kk.test.spring;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.kk.spirit.service.UserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class TestSpringUser {

	@Autowired
	private UserService userService;
	
	@Test
	public void testUserService() {
		System.out.println(userService.queryUsers(null, 1, 5));
	}

	
}

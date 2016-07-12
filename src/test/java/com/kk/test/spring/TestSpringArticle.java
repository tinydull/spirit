package com.kk.test.spring;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kk.spirit.service.ArticleService;
import com.kk.spirit.service.UserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class TestSpringArticle {

	@Autowired
	private ArticleService articleService;
	
	@Test
	public void testUserService() {
		System.out.println(articleService.queryArticleById("1"));
	}

	
}

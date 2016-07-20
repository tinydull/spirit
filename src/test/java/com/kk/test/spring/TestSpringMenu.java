package com.kk.test.spring;

import java.awt.Menu;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.kk.spirit.entity.MenuEntity;
import com.kk.spirit.service.MenuService;
import com.kk.spirit.utils.JSONUtil;

import freemarker.template.Template;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class TestSpringMenu {

	@Autowired
	private MenuService menuService;

	@Test
	public void testInsert() {
		MenuEntity menu = new MenuEntity();
		menu.setDes("首页");
		menu.setName("首页");
		menu.setPid(13);
		menu.setUrl("http:www.baidu.com");
		System.out.println(menuService.insert(menu));
	}
	
	@Test
	public void testUpdate() {
		MenuEntity menu = new MenuEntity();
		menu.setId(1);
		menu.setDes("首页");
		menu.setName("首页");
		menu.setUrl("http:www.baidu.com");
		System.out.println(menuService.update(menu));
	}
	@Test
	public void testSelect() {
		System.out.println(JSONUtil.writeJson(menuService.queryMenus()));
	}
	@Test
	public void testDelete() {
		MenuEntity menu = new MenuEntity();
		menu.setId(1);
		menu.setDes("首页");
		menu.setName("首页");
		menu.setUrl("http:www.baidu.com");
		System.out.println(menuService.delete(menu));
	}

}

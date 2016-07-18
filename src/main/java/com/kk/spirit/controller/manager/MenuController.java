package com.kk.spirit.controller.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kk.spirit.entity.MenuEntity;
import com.kk.spirit.service.MenuService;
import com.kk.spirit.utils.JSONUtil;

@Controller
@RequestMapping("/manager/menu")
public class MenuController {

	@Autowired
	private MenuService menuServic;
	
	@RequestMapping("/init")
	public String init() {
		
		return "manager/menu/init";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public String list() {
		List<MenuEntity> list = menuServic.queryMenus();
		return JSONUtil.writeJson(list);
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(MenuEntity menu) {
		int f = menuServic.insert(menu);
		return JSONUtil.writeJson(f);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(MenuEntity menu) {
		int f = menuServic.update(menu);
		return JSONUtil.writeJson(f);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(MenuEntity menu) {
		int f = menuServic.delete(menu);
		return JSONUtil.writeJson(f);
	}
}

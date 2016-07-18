package com.kk.spirit.service;

import java.util.List;
import com.kk.spirit.entity.MenuEntity;

public interface MenuService {

	public int insert(MenuEntity menu);
	
	public int delete(MenuEntity menu);
	
	public int update(MenuEntity menu);
	
	public List<MenuEntity> queryMenus();
	
}

package com.kk.spirit.dao;

import java.util.List;

import com.kk.spirit.entity.MenuEntity;

public interface MenuDao {

	public int insert(MenuEntity menu);

	public int delete(MenuEntity menu);

	public int update(MenuEntity menu);

	public List<MenuEntity> queryMenus();
	
}

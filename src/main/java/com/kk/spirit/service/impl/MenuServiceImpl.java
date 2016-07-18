package com.kk.spirit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.spirit.dao.MenuDao;
import com.kk.spirit.entity.MenuEntity;
import com.kk.spirit.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	
	@Override
	public int insert(MenuEntity menu) {
		return menuDao.insert(menu);
	}

	@Override
	public int delete(MenuEntity menu) {
		return menuDao.delete(menu);
	}

	@Override
	public int update(MenuEntity menu) {
		return menuDao.update(menu);
	}

	@Override
	public List<MenuEntity> queryMenus() {
		return menuDao.queryMenus();
	}

}

package com.kk.spirit.service;

import java.util.List;

import com.kk.spirit.entity.RoleEntity;

public interface RoleService {

	public int insert(RoleEntity role);
	
	public int delete(RoleEntity role);
	
	public int update(RoleEntity role);
	
	public List<RoleEntity> queryRoles(String name, int page, int limit);
	/**
	 * 查询角色总数（分页用）
	 * 
	 */
	public Integer queryTotal(String name);
}

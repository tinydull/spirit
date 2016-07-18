package com.kk.spirit.dao;

import java.util.List;
import java.util.Map;
import com.kk.spirit.entity.UserEntity;

public interface RoleDao {
	/**
	 * 
	 * 根据用户登录名查询用户信息
	 */
	public UserEntity userLoginByUsername(String username);

	/**
	 * 
	 * 分页查询所有的用户信息
	 */
	public List<UserEntity> queryUsers(Map<String, Object> map);

	/**
	 * 
	 * 查询用户总数
	 */
	public Integer queryTotal(String name);

	/**
	 * 
	 * 根据ID查询用户
	 */
	public UserEntity queryUserById(String id);

	/**
	 * 
	 * 更新用户信息
	 */
	public int update(UserEntity user);

	/**
	 * 
	 * 插入用户信息
	 */
	public int insert(UserEntity user);

	/**
	 * 
	 * 删除用户角色
	 */
	public int deleteUserRoles(String userId);

	public int insertUserRoles(Map<String, Object> map);
}

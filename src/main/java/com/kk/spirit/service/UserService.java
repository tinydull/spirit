package com.kk.spirit.service;

import java.util.List;
import com.kk.spirit.entity.UserEntity;

/**
 * 
 * 用户管理类
 * 
 * @author huangteng
 * @date 2016年6月21日
 */
public interface UserService {

	/**
	 * 根据用户登录名获得用户信息，登录用
	 * 
	 */
	public UserEntity userLoginByUsername(String username);
	/**
	 * 分页查询用户信息列表
	 * 	name: 用户名
	 * 	int:  当前页
	 * 	limit:每页显示条数
	 */
	public List<UserEntity> queryUsers(String name, int page, int limit);
	/**
	 * 查询用户总数（分页用）
	 * 	name:用户名
	 */
	public Integer queryTotal(String name);
	/**
	 * 根据用戶ID精确查询用户 
	 * 
	 */
	public UserEntity queryUserById(String id);
	/**
	 * 更新用户信息
	 * 
	 */
	public int update(UserEntity user);
	/**
	 * 插入用户信息
	 * 
	 */
	public int insert(UserEntity user);

	public int delete(UserEntity user);
}

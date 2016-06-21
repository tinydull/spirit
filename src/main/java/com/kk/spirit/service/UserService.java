package com.kk.spirit.service;

import java.util.List;
import com.kk.spirit.entity.UserEntity;

/**
 * 
 * 用户管理类
 * 
 * @author  huangteng
 * @date  2016年6月21日
 */
public interface UserService
{

	/**
	 * 
	 * 根据用户名查询用户登录
	 */
    public UserEntity userLoginByUsername(String username);
    /**
     * 
     * 分页查询用户
     */
    public List<UserEntity> queryUsers(String name, int page, int limit);
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
     * 插入用户信息
     * 
     */
    public int insert(UserEntity user);
    
}

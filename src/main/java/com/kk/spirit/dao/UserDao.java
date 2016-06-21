package com.kk.spirit.dao;

import java.util.List;
import java.util.Map;
import com.kk.spirit.entity.UserEntity;

public interface UserDao
{
    
    public UserEntity userLoginByUsername(String username);
    
    public List<UserEntity> queryUsers(Map<String, Object> map);
    
    public Integer queryTotal(String name);
    
    public UserEntity queryUserById(String id);
    
    public int update(UserEntity user);
    
    public int insert(UserEntity user);
    
    public int deleteUserRoles(String userId);
    
    public int insertUserRoles(Map<String, Object> map);
}

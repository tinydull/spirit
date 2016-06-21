package com.kk.spirit.service;

import java.util.List;
import com.kk.spirit.entity.UserEntity;


public interface UserService
{

    public UserEntity userLoginByUsername(String username);
    
    public List<UserEntity> queryUsers(String name, int page, int limit);
    
    public Integer queryTotal(String name);
    
    public UserEntity queryUserById(String id);
    
    public int update(UserEntity user);
    
    public int insert(UserEntity user);
}

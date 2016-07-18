package com.kk.spirit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kk.spirit.dao.UserDao;
import com.kk.spirit.entity.UserEntity;
import com.kk.spirit.service.UserService;

@Service
public class UserServiceImpl implements UserService
{

    @Autowired
    private UserDao userDao;
    
    @Override
    public UserEntity userLoginByUsername(String username)
    {
        // TODO Auto-generated method stub
        
        return userDao.userLoginByUsername(username);
    }

    @Override
    public List<UserEntity> queryUsers(String name, int page, int limit)
    {
        // TODO Auto-generated method stub
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", name);
        map.put("page", page);
        map.put("limit", limit);
        return userDao.queryUsers(map);
    }

    @Override
    public Integer queryTotal(String name)
    {
        // TODO Auto-generated method stub
        
        return userDao.queryTotal(name);
    }

    @Override
    public UserEntity queryUserById(String id)
    {
        // TODO Auto-generated method stub
        UserEntity user = userDao.queryUserById(id);
        return user;
    }

    @Override
    public int update(UserEntity user)
    {
        // TODO Auto-generated method stub
        // 先删除角色信息，再重新插入
        userDao.deleteUserRoles(user.getId());
        String[] roles = user.getRoles().split(",");
        if (null != roles && roles.length > 0) {
            for (String string : roles)
            {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("userId", user.getId());
                map.put("roleId", string);
                userDao.insertUserRoles(map);            
            }            
        }
        return userDao.update(user);
    }

    @Override
    public int insert(UserEntity user)
    {
        // 插入角色信息
        userDao.insert(user);
        String[] roles = user.getRoles().split(",");
        if (null != roles && roles.length > 0) {
            for (String string : roles)
            {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("userId", user.getId());
                map.put("roleId", string);
                userDao.insertUserRoles(map);    
            }            
        }
        return 1;
    }

	@Override
	public int delete(UserEntity user) {
		// TODO Auto-generated method stub
		return 0;
	}

   
    
}

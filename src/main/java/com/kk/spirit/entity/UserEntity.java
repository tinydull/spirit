package com.kk.spirit.entity;

import java.io.Serializable;
/**
 * 
 * 用户
 * 
 * @author  huangteng
 * @date  2016年6月21日
 */
public class UserEntity implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 708283335170015489L;
    private String id;
    private String username;
    private String password;
    private String email;
    private String sex;
    private String number;
    private String phone;
    private String qq;
    private String roles;
    
    public String getQq()
    {
        return qq;
    }
    public void setQq(String qq)
    {
        this.qq = qq;
    }
    public String getPhone()
    {
        return phone;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    public String getId()
    {
        return id;
    }
    public void setId(String id)
    {
        this.id = id;
    }
    public String getUsername()
    {
        return username;
    }
    public void setUsername(String username)
    {
        this.username = username;
    }
    public String getPassword()
    {
        return password;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getSex()
    {
        return sex;
    }
    public void setSex(String sex)
    {
        this.sex = sex;
    }
    public String getNumber()
    {
        return number;
    }
    public void setNumber(String number)
    {
        this.number = number;
    }
    public String getRoles()
    {
        return roles;
    }
    public void setRoles(String roles)
    {
        this.roles = roles;
    }
    
    
    
    
}

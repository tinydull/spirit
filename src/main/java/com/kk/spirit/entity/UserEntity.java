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
    /**
     * ID
     */
    private String id;
    /**
     * 用户名称
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 电子邮箱
     */
    private String email;
    /**
     * 性别：
     * 1    男
     * 0    女
     */
    private String sex;
    /**
     * 真实名称
     */
    private String realname;
    /**
     * 电话号码
     */
    private String phone;
    /**
     * QQ号码
     */
    private String qq;
    
    private String isValid;
    
    private String createtime;
    
    private String updatetime;
    
    /**
     * 角色信息
     */
    private String roles;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getIsValid() {
		return isValid;
	}

	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}
    
    
    
    
    
}

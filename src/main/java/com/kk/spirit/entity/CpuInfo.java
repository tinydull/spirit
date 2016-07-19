package com.kk.spirit.entity;

public class CpuInfo {

	// CPU的总量MHz
	private int mhz;
	// CPU生产商
	private String vendor;
	// CPU类别
	private String model;
	// CPU缓存数量
	private long size;
	// CPU用户使用率
	private String user;
	// CPU系统使用率
	private String sys;
	// CPU当前等待率
	private String wait;
	// CPU当前错误率
	private String nice;
	// CPU当前空闲率
	private String idle;
	// CPU总的使用率
	private String combined;
	public int getMhz() {
		return mhz;
	}
	public void setMhz(int mhz) {
		this.mhz = mhz;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getSys() {
		return sys;
	}
	public void setSys(String sys) {
		this.sys = sys;
	}
	public String getWait() {
		return wait;
	}
	public void setWait(String wait) {
		this.wait = wait;
	}
	public String getNice() {
		return nice;
	}
	public void setNice(String nice) {
		this.nice = nice;
	}
	public String getIdle() {
		return idle;
	}
	public void setIdle(String idle) {
		this.idle = idle;
	}
	public String getCombined() {
		return combined;
	}
	public void setCombined(String combined) {
		this.combined = combined;
	}
	
	
	
	
}

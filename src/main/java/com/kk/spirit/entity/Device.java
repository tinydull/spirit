package com.kk.spirit.entity;

public class Device {

	private String devname;
	private String dirname;
	
	private long flag;
	
	private String systypename;
	private long total;
	private long free;
	private long avail;
	private long used;
	private String useper;
	private String peruser;
	private long diskreads;
	private long diskwrites;
	public String getDevname() {
		return devname;
	}
	public void setDevname(String devname) {
		this.devname = devname;
	}
	public String getDirname() {
		return dirname;
	}
	public void setDirname(String dirname) {
		this.dirname = dirname;
	}
	
	public long getFlag() {
		return flag;
	}
	public void setFlag(long flag) {
		this.flag = flag;
	}
	public String getSystypename() {
		return systypename;
	}
	public void setSystypename(String systypename) {
		this.systypename = systypename;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public long getFree() {
		return free;
	}
	public void setFree(long free) {
		this.free = free;
	}
	public long getAvail() {
		return avail;
	}
	public void setAvail(long avail) {
		this.avail = avail;
	}
	public long getUsed() {
		return used;
	}
	public void setUsed(long used) {
		this.used = used;
	}
	
	public long getDiskreads() {
		return diskreads;
	}
	public void setDiskreads(long diskreads) {
		this.diskreads = diskreads;
	}
	public long getDiskwrites() {
		return diskwrites;
	}
	public void setDiskwrites(long diskwrites) {
		this.diskwrites = diskwrites;
	}
	public String getUseper() {
		return useper;
	}
	public void setUseper(String useper) {
		this.useper = useper;
	}
	public String getPeruser() {
		return peruser;
	}
	public void setPeruser(String peruser) {
		this.peruser = peruser;
	}
	
	
	
	
}

package com.kk.spirit.entity;

public class Memory {

	private long mtotal;
	private long mused;
	private long mfree;
	
	private long stotal;
	private long sused;
	private long sfree;
	
	private long percent;
	
	public long getMtotal() {
		return mtotal;
	}
	public void setMtotal(long mtotal) {
		this.mtotal = mtotal;
	}
	public long getMused() {
		return mused;
	}
	public void setMused(long mused) {
		this.mused = mused;
	}
	public long getMfree() {
		return mfree;
	}
	public void setMfree(long mfree) {
		this.mfree = mfree;
	}
	public long getStotal() {
		return stotal;
	}
	public void setStotal(long stotal) {
		this.stotal = stotal;
	}
	public long getSused() {
		return sused;
	}
	public void setSused(long sused) {
		this.sused = sused;
	}
	public long getSfree() {
		return sfree;
	}
	public void setSfree(long sfree) {
		this.sfree = sfree;
	}
	public long getPercent() {
		return percent;
	}
	public void setPercent(long percent) {
		this.percent = percent;
	}
	
	
	
	
}

package com.cya.pojo;

import java.util.Date;

/**
 * 公告
 * @author 蜡笔小新
 *
 */
public class Notice {
	private int nId; //公告id
	private Date nTime; //发布时间
	private String nPerson;  //发布人
	private String nContext; //发布内容
	public int getnId() {
		return nId;
	}
	public void setnId(int nId) {
		this.nId = nId;
	}
	public Date getnTime() {
		return nTime;
	}
	public void setnTime(Date nTime) {
		this.nTime = nTime;
	}
	public String getnPerson() {
		return nPerson;
	}
	public void setnPerson(String nPerson) {
		this.nPerson = nPerson;
	}
	public String getnContext() {
		return nContext;
	}
	public void setnContext(String nContext) {
		this.nContext = nContext;
	}
	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", nTime=" + nTime + ", nPerson=" + nPerson + ", nContext=" + nContext + "]";
	}
	
	
	
}

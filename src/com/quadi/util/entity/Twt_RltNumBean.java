package com.quadi.util.entity;

public class Twt_RltNumBean {
	private long tweetNum;
	private long relationNum;
	private String formattimes;
	private String pwdStatus;
	private String picname;
	

	public String getPicname() {
		return picname;
	}
	public void setPicname(String picname) {
		this.picname = picname;
	}
	public String getPwdStatus() {
		return pwdStatus;
	}
	public void setPwdStatus(String pwdStatus) {
		this.pwdStatus = pwdStatus;
	}
	public String getFormattimes() {
		return formattimes;
	}
	public void setFormattimes(String formattimes) {
		this.formattimes = formattimes;
	}
	public long getTweetNum() {
		return tweetNum;
	}
	public void setTweetNum(long l) {
		this.tweetNum = l;
	}
	public long getRelationNum() {
		return relationNum;
	}
	public void setRelationNum(long relationNum) {
		this.relationNum = relationNum;
	}
	public Twt_RltNumBean(long tweetNum, long relationNum) {
		super();
		this.tweetNum = tweetNum;
		this.relationNum = relationNum;
	}
	public Twt_RltNumBean() {
		super();
		// TODO �Զ����ɵĹ��캯�����
	}
	
}

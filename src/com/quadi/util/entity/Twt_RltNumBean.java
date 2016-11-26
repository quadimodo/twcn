package com.quadi.util.entity;

public class Twt_RltNumBean {
	private long tweetNum;
	private long relationNum;
	private String formattimes;
	private String oldPwd;
	
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
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
		// TODO 自动生成的构造函数存根
	}
	
}

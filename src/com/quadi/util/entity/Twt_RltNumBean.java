package com.quadi.util.entity;

public class Twt_RltNumBean {
	private String tweetNum;
	private long relationNum;
	public String getTweetNum() {
		return tweetNum;
	}
	public void setTweetNum(String tweetNum) {
		this.tweetNum = tweetNum;
	}
	public long getRelationNum() {
		return relationNum;
	}
	public void setRelationNum(long relationNum) {
		this.relationNum = relationNum;
	}
	public Twt_RltNumBean(String tweetNum, long relationNum) {
		super();
		this.tweetNum = tweetNum;
		this.relationNum = relationNum;
	}
	public Twt_RltNumBean() {
		super();
		// TODO 自动生成的构造函数存根
	}
	
}

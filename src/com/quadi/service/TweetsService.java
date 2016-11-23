package com.quadi.service;

import com.quadi.dao.TweetsDAO;
import com.quadi.entity.Tweets;
import com.quadi.entity.Users;

public class TweetsService {
	private TweetsDAO tweetsDAO;
	private Users users;
	private Tweets tweets;
	public TweetsDAO getTweetsDAO() {
		return tweetsDAO;
	}
	public void setTweetsDAO(TweetsDAO tweetsDAO) {
		this.tweetsDAO = tweetsDAO;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Tweets getTweets() {
		return tweets;
	}
	public void setTweets(Tweets tweets) {
		this.tweets = tweets;
	}
	public long findByUid(Users user){
		long i =tweetsDAO.findByUid(user);
		return i;
	}
}

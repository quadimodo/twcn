package com.quadi.service;

import java.util.List;

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
	//返回值，给首页
	public List<?> findTweetistByUid(Users users,int currentpage){
		List<?> list=tweetsDAO.findTweetByUid(users, currentpage);
		System.out.println("推特数量为="+list.size());
		return list;
	}
}

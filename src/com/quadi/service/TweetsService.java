package com.quadi.service;

import java.util.ArrayList;
import java.util.List;

import com.quadi.dao.TweetsDAO;
import com.quadi.entity.Tweets;
import com.quadi.entity.Users;
import com.quadi.util.entity.Twt_RltNumBean;
import com.quadi.util.tool.UtilTool;

public class TweetsService {
	private TweetsDAO tweetsDAO;
	private Users users;
	private Tweets tweets;
	private List<Twt_RltNumBean> utilBean=new ArrayList<Twt_RltNumBean>();
	public List<Twt_RltNumBean> getUtilBean() {
		return utilBean;
	}
	public void setUtilBean(List<Twt_RltNumBean> utilBean) {
		this.utilBean = utilBean;
	}
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
	public List<Tweets> findTweetistByUid(Users users,int currentpage){
		Object[] array=new Object[2];
		List<Tweets> list=(List<Tweets>) tweetsDAO.findTweetByUid(users, currentpage);
		UtilTool utilTool=new UtilTool();
		for (Tweets li : list) {
			//将转换的值赋给utilbean这个list
			li.setFormateTime(utilTool.formatTime(li.getTweettime()));
		}
		System.out.println("推特数量为="+list.size());
		return list;
	}
}

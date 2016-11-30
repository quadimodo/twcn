package com.quadi.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.quadi.dao.T2pDAO;
import com.quadi.dao.TweetsDAO;
import com.quadi.entity.Pics;
import com.quadi.entity.T2p;
import com.quadi.entity.Tweets;
import com.quadi.entity.Users;
import com.quadi.util.entity.Twt_RltNumBean;
import com.quadi.util.tool.UtilTool;

public class TweetsService {
	private TweetsDAO tweetsDAO;
	@Resource
	private Users users;
	@Resource
	private Tweets tweets;
	@Resource
	private T2pDAO t2pDAO;
	private List<Twt_RltNumBean> utilBean=new ArrayList<Twt_RltNumBean>();
	public T2pDAO getT2pDAO() {
		return t2pDAO;
	}
	public void setT2pDAO(T2pDAO t2pDAO) {
		this.t2pDAO = t2pDAO;
	}
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
		List<Tweets> list=(List<Tweets>) tweetsDAO.findTweetByUid(users, currentpage);
		UtilTool utilTool=new UtilTool();
		for(int i=0;i<list.size();i++){
			//将转换的值赋给utilbean这个list
			list.get(i).setFormateTime(utilTool.formatTime(list.get(i).getTweettime()));
			List<T2p> picList=(List<T2p>) tweetsDAO.findPicByTweets(list.get(i));
			Set<T2p> set=new HashSet<T2p>();
			if(picList.size()!=0){
				set.addAll(picList);
				list.get(i).setT2ps(set);				
			}
		}
		System.out.println("推特数量为="+list.size());
		return list;
	}
	//发送推特
	public void insertTweets(int uid,String tcontent,String picname){
		Users users=new Users();
		users.setUid(uid);
		Tweets tweets=new Tweets();
		tweets.setUsers(users);
		tweets.setTcontent(tcontent);
		T2p t2p=new T2p();
		Pics pics=new Pics();
		pics.setPname(picname);
		pics.setPpath("/img/"+picname);
		t2p.setPics(pics);
		t2p.setTweets(tweets);
		Set<T2p> set=new HashSet<T2p>();
		set.add(t2p);
		pics.setT2ps(set);
		tweets.setT2ps(set);
		t2pDAO.save(t2p);
		//tweetsDAO.attachDirty(tweets);
	}
}

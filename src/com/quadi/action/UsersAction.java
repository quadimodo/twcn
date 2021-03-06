package com.quadi.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import  javax.servlet.jsp.PageContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.opensymphony.xwork2.ActionContext;
import com.quadi.entity.Relationships;
import com.quadi.entity.Tweets;
import com.quadi.entity.Users;
import com.quadi.service.RelationshipsService;
import com.quadi.service.TweetsService;
import com.quadi.service.UserService;
import com.quadi.util.entity.Twt_RltNumBean;
import com.quadi.util.entity.UtilBean;

public class UsersAction {
	private UserService userService;
	private String msg;
	private Users users;
	private Tweets tweets;
	private TweetsService tweetsService;
	private Relationships relationships;
	private RelationshipsService relationshipsService;
	private List<Tweets> tweetsList;
	private JSONArray jsonArray;
	private String oldPwd;
	private ServletConfig servletConfig;
	public ServletConfig getServletConfig() {
		return servletConfig;
	}
	public void setServletConfig(ServletConfig servletConfig) {
		this.servletConfig = servletConfig;
	}
	private Twt_RltNumBean twt_RltNumBean=new Twt_RltNumBean();

	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public JSONArray getJsonArray() {
		return jsonArray;
	}
	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}
	public Tweets getTweets() {
		return tweets;
	}
	public void setTweets(Tweets tweets) {
		this.tweets = tweets;
	}
	public List<?> getTweetsList() {
		return tweetsList;
	}
	public void setTweetsList(List<Tweets> tweetsList) {
		this.tweetsList = tweetsList;
	}
	public TweetsService getTweetsService() {
		return tweetsService;
	}
	public void setTweetsService(TweetsService tweetsService) {
		this.tweetsService = tweetsService;
	}
	public Twt_RltNumBean getTwt_RltNumBean() {
		return twt_RltNumBean;
	}
	public void setTwt_RltNumBean(Twt_RltNumBean twt_RltNumBean) {
		this.twt_RltNumBean = twt_RltNumBean;
	}
	public Relationships getRelationships() {
		return relationships;
	}
	public void setRelationships(Relationships relationships) {
		this.relationships = relationships;
	}
	public RelationshipsService getRelationshipsService() {
		return relationshipsService;
	}
	public void setRelationshipsService(RelationshipsService relationshipsService) {
		this.relationshipsService = relationshipsService;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	//登录验证
	public String  login(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		userService=context.getBean("UserService", UserService.class);
		HttpServletRequest request=ServletActionContext.getRequest();
		Users newuser=userService.findByUsername_pwd(users.getUsername(), users.getPassword());
		if(newuser!=null){
			msg="登录成功";
			users=newuser;
			request.getSession().setAttribute("users", users);
			System.out.println(users.getUid());
			//ActionContext.getContext().put("msg", msg);
			return "home";
		}else{
			msg="账号或密码错误";
			ActionContext.getContext().put("msg", msg);
			return "error";
		}		
	}
	//注册
	public String signup(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		userService=context.getBean("UserService", UserService.class);
		HttpServletRequest request=ServletActionContext.getRequest();
		Users newuser=userService.findByUsername_email(users);
		if(newuser!=null){
			msg="注册成功";
			//注册成功后，先关注自己
			relationshipsService=context.getBean("RelationshipsService",RelationshipsService.class);
			relationshipsService.relationMyself(newuser);
			users=newuser;
			request.getSession().setAttribute("users", users);
			//ActionContext.getContext().put("msg", msg);
			return "home";
		}else{
			msg="用户名或邮箱已存在";
			ActionContext.getContext().put("msg", msg);
			return "error";
		}
	}
	//进入到主页面
	public String homepage(){
		Map<String, Object> maplist=commonService();
		//userService=(UserService) maplist.get("userService");
		HttpServletRequest request=ServletActionContext.getRequest();
		users=(Users) request.getSession().getAttribute("users");
		relationshipsService=(RelationshipsService) maplist.get("relationshipsService");
		relationshipsService.setUsers(users);
		tweetsService=(TweetsService) maplist.get("tweetsService");
		//将关注人数和推特数放入工具中
		twt_RltNumBean.setTweetNum(tweetsService.findByUid(users));
		twt_RltNumBean.setRelationNum(relationshipsService.findByHuid());
		//返回推特
		//tweetsList=tweetsService.findTweetistByUid(users, 1);
		 tweetsList=tweetsService.findTweetistByUid(users, 1);
		return "login";
	}
	//ajax修改用户名
	public String ajaxUsername(){
		Map<String, Object> maplist=commonService();
		userService=(UserService) maplist.get("userService");
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			PrintWriter out=response.getWriter();
			String name=request.getParameter("fieldValue");
			String id=request.getParameter("fieldId");
			jsonArray=JSONArray.fromObject(userService.ajaxUsername(name,id ));
			out.println(jsonArray);
			out.close();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		//jsonobj=JSONObject.fromObject(userService.ajaxUsername(name,id ));
		return null;
	}
	//获取修改过后的用户名，放入session并跳转页面
	public String unameEmail(){
		Map<String, Object> maplist=commonService();
		userService=(UserService) maplist.get("userService");
		HttpServletRequest request=ServletActionContext.getRequest();
		//users=(Users) request.getSession().getAttribute("users");
		users=userService.updateUnameEmail(users);
		request.getSession().setAttribute("users", users);
		return "unameEmail";
	}
	//获取修改过后的密码，进行对比，然后修改
	public String pwd(){
		Map<String, Object> maplist=commonService();
		HttpServletRequest request=ServletActionContext.getRequest();
		//users=(Users) request.getSession().getAttribute("users");
		userService=(UserService) maplist.get("userService");
		if(userService.updatePassword(users, oldPwd)){
			twt_RltNumBean.setPwdStatus("密码修改成功");
		}else{
			twt_RltNumBean.setPwdStatus("原密码错误");
		}
		request.getSession().setAttribute("users", users);
		return "pwd";
	}
	//发送推特
	public String sendTweet(){
		Map<String, Object> maplist=commonService();
		userService=(UserService) maplist.get("userService");
		tweetsService=(TweetsService) maplist.get("tweetsService");
		HttpServletRequest request=ServletActionContext.getRequest();
		 int uid=Integer.parseInt(request.getParameter("tweets[uid]"));
		 String tcontent=request.getParameter("tweets[tcontent]");
		 String picname=request.getParameter("pics[pname]");
		 
		 System.out.println(uid+tcontent);
		tweetsService.insertTweets(uid, tcontent,picname);
		return null;
	}
	
	
	//公共方法，提供service
	public  Map<String, Object> commonService(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		Map<String, Object> maplist=new HashMap<String, Object>();
		userService=context.getBean("UserService", UserService.class);
		maplist.put("userService", userService);
		relationshipsService=context.getBean("RelationshipsService", RelationshipsService.class);
		maplist.put("relationshipsService", relationshipsService);
		tweetsService=context.getBean("TweetsService", TweetsService.class);
		maplist.put("tweetsService",tweetsService);
		return maplist;
	}
}

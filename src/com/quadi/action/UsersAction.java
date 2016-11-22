package com.quadi.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.quadi.entity.Relationships;
import com.quadi.entity.Users;
import com.quadi.service.RelationshipsService;
import com.quadi.service.UserService;
import com.quadi.util.UtilBean;

public class UsersAction {
	private UserService userService;
	private Users users;
	private UtilBean utilBean;
	private Relationships relationships;
	public Relationships getRelationships() {
		return relationships;
	}
	public void setRelationships(Relationships relationships) {
		this.relationships = relationships;
	}
	private RelationshipsService relationshipsService;
	public RelationshipsService getRelationshipsService() {
		return relationshipsService;
	}
	public void setRelationshipsService(RelationshipsService relationshipsService) {
		this.relationshipsService = relationshipsService;
	}
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public UtilBean getUtilBean() {
		return utilBean;
	}
	public void setUtilBean(UtilBean utilBean) {
		this.utilBean = utilBean;
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
		boolean i=userService.findByUsername_pwd(users.getUsername(), users.getPassword());
		System.out.println("userService.findByUsername_pwd="+i);
		if(i){
			msg="登录成功";
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
		boolean i=userService.findByUsername_email(users);
		System.out.println("userService.findByUsername_email="+i);
		if(i){
			msg="注册成功";
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
		userService=(UserService) maplist.get("userService");
		relationshipsService=(RelationshipsService) maplist.get("relationshipsService");
		relationshipsService.setUsers(users);
		long i=relationshipsService.findByHuid();
		
		return "login";
	}
	public  Map<String, Object> commonService(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		Map<String, Object> maplist=new HashMap<String, Object>();
		userService=context.getBean("UserService", UserService.class);
		maplist.put("userService", userService);
		relationshipsService=context.getBean("RelationshipsService", RelationshipsService.class);
		maplist.put("relationshipsService", relationshipsService);
		return maplist;
	}
}

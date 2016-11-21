package com.quadi.action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.quadi.entity.Users;
import com.quadi.service.UserService;
import com.quadi.util.UtilBean;

public class UsersAction {
	private UserService userService;
	private Users users;
	private UtilBean utilBean;
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
	//µÇÂ¼ÑéÖ¤
	public String  login(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		userService=context.getBean("UserService", UserService.class);
		boolean i=userService.findByUsername_pwd(users.getUsername(), users.getPassword());
		System.out.println(i);
		if(i){
			msg="µÇÂ¼³É¹¦";
		}else{
			msg="ÕËºÅ»òÃÜÂë´íÎó";
		}		
		ActionContext.getContext().put("msg", msg);
		return "login";
	}
}

package com.quadi.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.jasper.tagplugins.jstl.core.Out;

import com.quadi.dao.UsersDAO;
import com.quadi.entity.Tweets;
import com.quadi.entity.Users;

public class UserService {
	private Users users;
	private UsersDAO usersDAO;
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public UsersDAO getUsersDAO() {
		return usersDAO;
	}
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	//根据id查询users
	public Users findUserById(int usersid){
		return usersDAO.findById(usersid);
	}
	//登录查询users
	public Users findByUsername_pwd(String username,String pwd){ 
		return usersDAO.findByUsername_pwd(username, pwd);
}
	//注册，先判断是否存在，再注册
	public Users findByUsername_email(Users user){
		users=usersDAO.findByUsername_email(user);
		if(users==null){
			user.setNickname(user.getUsername());
			user.setRegisttime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			usersDAO.save(user);
			users=usersDAO.findByUsername_email(user);
			return users;
		}else{
			return null;			
		}
		
	}
	//ajax判断修改后用户名是否存在
	public void ajaxUsername(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String username=request.getParameter("fieldValue");
		String fieldId=request.getParameter("fieldId");
		users.setUsername(username);
		users=usersDAO.findByUsername_email(users);
		Object[] obj=new Object[2];
		obj[0]=fieldId;
		if(users==null){
			obj[1]=true;
		}else{
			obj[1]=false;
		}
		JSONObject jsonobj=JSONObject.fromObject(obj);
		try {
			PrintWriter out = response.getWriter();
			out.print(jsonobj);
			out.close();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
package com.quadi.service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import com.quadi.dao.UsersDAO;
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
	//����id��ѯusers
	public Users findUserById(int usersid){
		return usersDAO.findById(usersid);
	}
	//��¼��ѯusers
	public boolean findByUsername_pwd(String username,String pwd){
		 users=usersDAO.findByUsername_pwd(username, pwd);
		 if(users!=null){
			 return true;
		 }else{
			 return false;			
		 }
}
	//ע�ᣬ���ж��Ƿ���ڣ���ע��
	public boolean findByUsername_email(Users user){
		users=usersDAO.findByUsername_email(user);
		if(users==null){
			user.setNickname(user.getUsername());
			user.setRegisttime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			usersDAO.save(user);
			return true;
		}else{
			return false;			
		}
		
	}
}
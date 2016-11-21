package com.quadi.service;

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
}
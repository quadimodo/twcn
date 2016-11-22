package com.quadi.service;

import java.util.List;

import com.quadi.dao.RelationshipsDAO;
import com.quadi.entity.Users;

public class RelationshipsService {
	private RelationshipsDAO relationshipsDAO;
	private Users users;
	public RelationshipsDAO getRelationshipsDAO() {
		return relationshipsDAO;
	}
	public void setRelationshipsDAO(RelationshipsDAO relationshipsDAO) {
		this.relationshipsDAO = relationshipsDAO;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public List<?> findByHuid(){
		
		return null;
	}
}

package com.quadi.service;

import java.util.List;

import com.quadi.dao.RelationshipsDAO;
import com.quadi.entity.Relationships;
import com.quadi.entity.Users;

public class RelationshipsService {
	private RelationshipsDAO relationshipsDAO;
	private Users users;
	private Relationships relationships =new Relationships();
	
	public Relationships getRelationships() {
		return relationships;
	}
	public void setRelationships(Relationships relationships) {
		this.relationships = relationships;
	}
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
	// 关注人数
	public long findByHuid(){
		System.out.println(users);
		long i=relationshipsDAO.findByHuid(users);
		return i;
	}
	//关注自己
	public void relationMyself(Users users){
		relationships.setUsersByHuid(users);
		relationships.setUsersBySuid(users);
		relationshipsDAO.save(relationships);
	}
}

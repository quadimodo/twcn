package com.quadi.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.quadi.action.UsersAction;
import com.quadi.entity.Users;
import com.quadi.service.RelationshipsService;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UsersAction usersAction=context.getBean("UsersAction",UsersAction.class);
		/*Users users=new Users();
		users.setPassword("123");
		users.setUsername("nick");
		usersAction.setUsers(users);
		System.out.println(usersAction.login());
		*/
		RelationshipsService relationshipsService=context.getBean("RelationshipsService",RelationshipsService.class);
		Users users=new Users();
		users.setUid(1);
		relationshipsService.setUsers(users);
		long i=relationshipsService.findByHuid();
		System.out.println(i);
	}

}

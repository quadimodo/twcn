package com.quadi.action;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.quadi.service.UserService;

public class AjaxAction {
	private UserService userService;
	private JSONObject jsonobj;
	
	public void setJsonobj(JSONObject jsonobj) {
		this.jsonobj = jsonobj;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

		//ajax修改用户名
		public String ajaxUsername(){
			HttpServletRequest request=ServletActionContext.getRequest();
			String name=request.getParameter("fieldValue");
			String id=request.getParameter("fieldId");
			 this.jsonobj=userService.ajaxUsername(name,id );
			
			return "success";
		}
}

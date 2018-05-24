package com.aviation.adminuser.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.aviation.adminuser.service.AdminUserService;
import com.aviation.adminuser.vo.AdminUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser>{

	private AdminUser adminUser = new AdminUser();
	@Override
	public AdminUser getModel() {
		// TODO Auto-generated method stub
		return adminUser;
	}
	
	private AdminUserService adminUserService;
	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}

	public String login(){
		return "login";
	}
	
	public String loginJudge(){
		//调用service完成登录
		AdminUser existAdminUser = adminUserService.login(adminUser);
		if(existAdminUser == null){
			//登录失败
			this.addActionError("用户名或者密码错误");
			return "loginFail";
		}else{
			//登录成功
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess";
		}
	}
	
	public String exit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "exit";
	}
	
	public String findAll(){
		List<AdminUser> aUList = adminUserService.findAll();
		ActionContext.getContext().getValueStack().set("aUList", aUList);
		return "findAll";
	}
	
	public String edit(){
		adminUser = adminUserService.findByUid(adminUser.getUserid());
		return "editSuccess";
	}
	
	public String update(){
		adminUserService.update(adminUser);
		return "updateSuccess";
	}
	
	public String save(){
		adminUserService.save(adminUser);
		return "saveSuccess";	
	}
	
	public String delete(){
		adminUser = adminUserService.findByUid(adminUser.getUserid());
		adminUserService.delete(adminUser);
		return "deleteSuccess";
	}
}

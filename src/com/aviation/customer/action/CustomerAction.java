package com.aviation.customer.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.aviation.customer.service.CustomerService;
import com.aviation.customer.vo.Customer;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{
	//模型驱动使用的对象
	private Customer customer = new Customer();
	@Override
	public Customer getModel() {
		return customer;
	}
	//接受验证码
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	//注入CustomerService
	private CustomerService customerService;
	
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	/**
	 * 跳转到注册界面
	 */
	public String registPage(){
		return "registPage";
	}
	
	/**
	 * ajax进行异步校验用户名的执行方法
	 * @throws IOException 
	 */
	public String findByName() throws IOException{
		//调用service查询
		Customer existCustomer = customerService.findByCustomername(customer.getCname());
		//获得response对象，向页面输出
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		//判断
		if(existCustomer != null){
			//用户名已存在
			response.getWriter().println("<font color='red'>用户名已存在</font>");
		}else{
			//用户名可以使用
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}

	/**
	 * 用户注册的方法
	 */
	public String regist(){
		//判断验证码程序：
		//从session中获得随机验证码
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码输入错误");
			return "checkcodeFail";
		}
		customer.setSign("0");
		customerService.save(customer);
		this.addActionMessage("注册成功");
		return "msg";
	}
	
	/**
	 * 跳转到登录页面
	 */
	public String loginPage(){	
		return "loginPage";
	}
	
	/**
	 * 登录的方法
	 */
	public String login(){
		Customer existCustomer = customerService.login(customer);
		if(existCustomer == null){
			//登录失败
			this.addActionError("用户名或密码错误");
			return "login";
		}else{
			//登录成功
			//将用户信息存入session中
			ServletActionContext.getRequest().getSession()
			.setAttribute("existCustomer", existCustomer);
		}
		return "loginSuccess";
	}
	
	/**
	 * 用户退出的方法
	 */
	public String quit(){
		//销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
	
	//到个人信息页面方法
	public String toPersonalInfo(){
		/*customer = customerService.findByCid(customer.getCid());*/
		customer = (Customer) ServletActionContext.getRequest().getSession().getAttribute("existCustomer");
		customer = customerService.findByCid(customer.getCid());
		return "toPersonalInfo";
	}
	
	//到完善信息页面
	public String toCompleteInfo(){
		
		customer = (Customer) ServletActionContext.getRequest().getSession().getAttribute("existCustomer");
		customer = customerService.findByCid(customer.getCid());
		return "toCompleteInfo";
	}
	//去修改密码页面
	public String toPasswordInfo(){
		customer = (Customer) ServletActionContext.getRequest().getSession().getAttribute("existCustomer");
		customer = customerService.findByCid(customer.getCid());
		return "toPasswordInfo";
	}
	//编辑个人信息
	public String editInfo(){
		//customer = (Customer) ServletActionContext.getRequest().getSession().getAttribute("existCustomer");
		customerService.update(customer);
		
		return "editInfoSuccess";
	}
	
	

}

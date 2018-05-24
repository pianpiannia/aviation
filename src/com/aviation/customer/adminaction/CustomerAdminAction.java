package com.aviation.customer.adminaction;

import java.util.List;

import com.aviation.customer.service.CustomerService;
import com.aviation.customer.vo.Customer;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CustomerAdminAction extends ActionSupport implements ModelDriven<Customer>{
	//模型驱动使用的对象
	private Customer customer = new Customer();
	@Override
	public Customer getModel() {
		// TODO Auto-generated method stub
		return customer;
	}
	private CustomerService customerService;
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	public String findAll(){
		List<Customer> cList = customerService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}
	
	public String edit(){
		customer = customerService.findByCid(customer.getCid());
		return "editSuccess";
	}
		
	public String update(){
		customerService.update(customer);
		return "updateSuccess";
	}
	
	public String save(){
		customerService.save(customer);
		return "saveSuccess";	
	}
		
	public String delete(){
		customer = customerService.findByCid(customer.getCid());
		customerService.delete(customer);
		return "deleteSuccess";
	}
}

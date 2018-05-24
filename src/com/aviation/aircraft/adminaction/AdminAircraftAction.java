package com.aviation.aircraft.adminaction;

import java.util.List;

import com.aviation.aircraft.service.AircraftService;
import com.aviation.aircraft.vo.Aircraft;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAircraftAction extends ActionSupport implements ModelDriven<Aircraft>{
	
	private Aircraft aircraft = new Aircraft();
	@Override
	public Aircraft getModel() {
		return aircraft;
	}
	
	private AircraftService aircraftService;
	
	public void setAircraftService(AircraftService aircraftService) {
		this.aircraftService = aircraftService;
	}

	//后台查询所有客机
	public String findAll(){
		List<Aircraft> aList = aircraftService.findAll();
		ActionContext.getContext().getValueStack().set("aList", aList);
		return "findAll";
	}
	
	//后台编辑客机
	public String edit(){
		//先查询
		aircraft = aircraftService.findByAid(aircraft.getAid());
		return "editSuccess";
	}
	
	//查询后编辑
	public String update(){
		aircraftService.update(aircraft);
		return "updateSuccess";
	}
	
	//添加时保存
	public String save(){
		aircraftService.save(aircraft);
		return "saveSuccess";
	}
	
	//删除客机信息
	public String delete(){
		//删除要先查询
		aircraft = aircraftService.findByAid(aircraft.getAid());
		aircraftService.delete(aircraft);
		return "deleteSuccess";
	}

	
}

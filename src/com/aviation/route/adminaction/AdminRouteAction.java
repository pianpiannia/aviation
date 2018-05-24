package com.aviation.route.adminaction;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.aviation.aircraft.service.AircraftService;
import com.aviation.aircraft.vo.Aircraft;
import com.aviation.route.service.RouteService;
import com.aviation.route.vo.Route;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminRouteAction extends ActionSupport implements ModelDriven<Route>{

	private Route route = new Route();
	@Override
	public Route getModel() {
		return route;
	}
	
	private RouteService routeService;
	
	private AircraftService aircraftService;
	
	public void setRouteService(RouteService routeService) {
		this.routeService = routeService;
	}

	public void setAircraftService(AircraftService aircraftService) {
		this.aircraftService = aircraftService;
	}

	//后台查询所有航线
	public String findAll(){
		List<Route> rList = routeService.findAll();
		ActionContext.getContext().getValueStack().set("rList", rList);
		return "findAll";
	}
	//到添加页面
	public String toAddPage(){
		List<Aircraft> aList = aircraftService.findAll();
		ActionContext.getContext().getValueStack().set("aList", aList);
		return "toAddPage";
	}
	//后台添加航线
	public String save(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String aid = request.getParameter("aircraft.aid");
System.out.println("======================"+route.getFlight_date());
System.out.println("======================"+route.getStart_time());
System.out.println("======================"+route.getArrival_time());
		Date start = route.getStart_time();
		Date arr = route.getArrival_time();
		boolean a = start.after(arr);
		boolean b = start.before(arr);
		if(start.after(arr)){
			this.addActionError("出发时间不能再到达时间之后");
			List<Aircraft> aList = aircraftService.findAll();
			ActionContext.getContext().getValueStack().set("aList", aList);
			return "toAddPage";
		}else{
			Aircraft aircraft = aircraftService.findByAid(Integer.valueOf(aid));
			route.setFirst_number(aircraft.getFirstClass());
			route.setTourist_number(aircraft.getTouristClass());
			route.setBusiness_number(aircraft.getBusinessClass());
			routeService.save(route);
			return "saveSuccess";
		}
		
	}
	//后台编辑时查询
	public String edit(){
		route = routeService.findByRid(route.getRid());
		List<Aircraft> aList = aircraftService.findAll();
		ActionContext.getContext().getValueStack().set("aList", aList);
		
		
		return "editSuccess";
	}
	public String update(){
		Aircraft aircraft = aircraftService.findByAid(route.getAircraft().getAid());
		route.setFirst_number(aircraft.getFirstClass());
		route.setTourist_number(aircraft.getTouristClass());
		route.setBusiness_number(aircraft.getBusinessClass());
		routeService.update(route);
		return "updateSuccess";
	}
	
	//后台删除航线
	public String delete(){
		route = routeService.findByRid(route.getRid());
		routeService.delete(route);
		return "deleteSuccess";
	}
}

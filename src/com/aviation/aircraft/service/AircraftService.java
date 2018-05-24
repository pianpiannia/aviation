package com.aviation.aircraft.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.aviation.aircraft.dao.AircraftDao;
import com.aviation.aircraft.vo.Aircraft;

@Transactional
public class AircraftService {
	
	private AircraftDao aircraftDao;

	public void setAircraftDao(AircraftDao aircraftDao) {
		this.aircraftDao = aircraftDao;
	}

	public List<Aircraft> findAll() {
		return aircraftDao.findAll();
	}

	public Aircraft findByAid(Integer aid) {
		return aircraftDao.findByAid(aid);
	}

	public void update(Aircraft aircraft) {
		aircraftDao.update(aircraft);
	}

	public void save(Aircraft aircraft) {
		aircraftDao.save(aircraft);
	}

	public void delete(Aircraft aircraft) {
		aircraftDao.delete(aircraft);
	}
}

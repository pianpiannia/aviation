package com.aviation.route.dao;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.aviation.route.vo.Route;
import com.aviation.util.PageHibernateCallback;

public class RouteDao extends HibernateDaoSupport {
	public List<Route> findAll() {
		String sql = "from Route";
		List<Route> list = this.getHibernateTemplate().find(sql);
		return list;
	}

	public Route findByRid(Integer rid) {
		return this.getHibernateTemplate().get(Route.class, rid);
	}

	public void update(Route route) {
		this.getHibernateTemplate().update(route);
	}

	public void delete(Route route) {
		this.getHibernateTemplate().delete(route);
	}

	public void save(Route route) {
		this.getHibernateTemplate().save(route);
	}

	public int findCount() {
		String hql = "select count(*) from Route";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Route> findByPage(int begin, int limit) {
		
		String hql = "from Route where flight_date = ? and start_time > ? order by flight_date";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String date = simpleDateFormat.format(now);
		Date day = null;
		try {
			day = simpleDateFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Object[] o = {day,now};
	System.out.println("============="+day);
		List<Route> list = this.getHibernateTemplate()
				.execute(new PageHibernateCallback<Route>(hql, o, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public List<Route> findMoreCondition(Route route) {
		// 2.使用离线对象
		DetachedCriteria criteria = DetachedCriteria.forClass(Route.class);
		// 判断条件值是否为空
		if (route.getStart_city() != null && !"".equals(route.getStart_city())) {
			// 对属性设置值
			criteria.add(Restrictions.eq("start_city", route.getStart_city()));
		}
		if (route.getArrival_city() != null && !"".equals(route.getArrival_city())) {
			criteria.add(Restrictions.eq("arrival_city", route.getArrival_city()));
		}
		if (route.getFlight_date() != null && !"".equals(route.getFlight_date())) {
			criteria.add(Restrictions.eq("flight_date", route.getFlight_date()));
		}
	
		return (List<Route>) this.getHibernateTemplate().findByCriteria(criteria);
	}
	
	public int findTotal(Route route){
		DetachedCriteria criteria = DetachedCriteria.forClass(Route.class);
		// 判断条件值是否为空
		if (route.getStart_city() != null && !"".equals(route.getStart_city())) {
			// 对属性设置值
			criteria.add(Restrictions.eq("start_city", route.getStart_city()));
		}
		if (route.getArrival_city() != null && !"".equals(route.getArrival_city())) {
			criteria.add(Restrictions.eq("arrival_city", route.getArrival_city()));
		}
		if (route.getFlight_date() != null && !"".equals(route.getFlight_date())) {
			criteria.add(Restrictions.eq("flight_date", route.getFlight_date()));
		}
		
		Long totalCount = (Long) criteria.setProjection(Projections.rowCount()).
				getExecutableCriteria(this.getHibernateTemplate().getSessionFactory().getCurrentSession()).uniqueResult();
		int total = totalCount.intValue();
		return (int) total;
	}
	
	public List<Route> findMoreConditionPage(Route route ,int begin, int limit) {
		// 2.使用离线对象
		DetachedCriteria criteria = DetachedCriteria.forClass(Route.class);
		// 判断条件值是否为空
		if (route.getStart_city() != null && !"".equals(route.getStart_city())) {
			// 对属性设置值
			criteria.add(Restrictions.eq("start_city", route.getStart_city()));
		}
		if (route.getArrival_city() != null && !"".equals(route.getArrival_city())) {
			criteria.add(Restrictions.eq("arrival_city", route.getArrival_city()));
		}
		if (route.getFlight_date() != null && !"".equals(route.getFlight_date())) {
			criteria.add(Restrictions.eq("flight_date", route.getFlight_date()));
		}
		System.out.println("==================="+route.getFlight_date());
		return (List<Route>) this.getHibernateTemplate().findByCriteria(criteria,begin,limit);
	}

}

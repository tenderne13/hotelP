package com.hotel.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.common.Page;
import com.hotel.dao.OrderDao;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.po.User;
import com.hotel.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public Page<Order> selectOrderPage(Page<Order> page, Order order,
			Hotel hotel, User user) {
		Map<String, Object> parMap=new HashMap<String, Object>();
		parMap.put("order", order);
		parMap.put("page", page);
		parMap.put("hotel", hotel);
		parMap.put("user", user);
		
		Integer totalCount = orderDao.getOrderCount(parMap);
		page.setTotalCount(totalCount);
		if(totalCount>0){
			List<Order> orderList=orderDao.getOrderList(page, parMap);
			page.setResult(orderList);
		}else{
			page.setResult(null);
		}
		return page;
	}

}

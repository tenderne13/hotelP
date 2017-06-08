package com.hotel.dao;

import java.util.List;
import java.util.Map;

import com.hotel.common.Page;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.po.User;


public interface OrderDao {
	//获取订单列表
	List<Order> getOrderList(Page<Order> page,Map<String, Object> parMap);
	//获取订单数目
	Integer getOrderCount(Map<String, Object> parMap);
}

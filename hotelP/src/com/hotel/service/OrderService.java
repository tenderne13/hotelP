package com.hotel.service;

import com.hotel.common.Page;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.po.User;

public interface OrderService {
	//获取订单分页数据
	Page<Order> selectOrderPage(Page<Order> page,Order order,Hotel hotel,User user);
}

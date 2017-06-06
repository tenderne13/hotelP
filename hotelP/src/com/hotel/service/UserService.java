package com.hotel.service;

import com.hotel.po.Order;
import com.hotel.po.User;

public interface UserService {
	//校验用户名是否存在
	Integer checkUserName(String userName);
	//注册用户
	void registUser(User user);
	//校验登录用户
	User checkLogin(User user);
	//确认订单
	void orderConfirm(Order order);
}

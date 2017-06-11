package com.hotel.service.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hotel.common.MD5Util;
import com.hotel.dao.UserDao;
import com.hotel.po.Order;
import com.hotel.po.User;
import com.hotel.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	
	@Override
	public Integer checkUserName(String userName) {
		return userDao.checkUserName(userName);
	}


	@Override
	public void registUser(User user) {
		String md5Pass=MD5Util.toMd5String(user.getPassword());
		user.setPassword(md5Pass);
		userDao.registUser(user);
	}


	@Override
	public User checkLogin(User user) {
		return userDao.checkLogin(user);
	}


	@Override
	public void orderConfirm(Order order) {
		userDao.orderConfirm(order);
	}

}

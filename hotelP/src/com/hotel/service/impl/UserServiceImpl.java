package com.hotel.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.dao.UserDao;
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
		userDao.registUser(user);
	}


	@Override
	public User checkLogin(User user) {
		return userDao.checkLogin(user);
	}

}

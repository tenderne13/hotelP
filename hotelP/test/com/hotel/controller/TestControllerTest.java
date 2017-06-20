package com.hotel.controller;

import static org.junit.Assert.*;

import java.util.List;
import java.util.UUID;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class TestControllerTest {

	private ApplicationContext applicationContext;
	@Before
	public void setUp()throws Exception{
		applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext.xml");
	}

	@Test
	public void jdbcTest(){
		JdbcTemplate jdbcTemplate=(JdbcTemplate) applicationContext.getBean("jdbcTemplate");
		String sql="select * from t_hotel";
		List list= jdbcTemplate.queryForList(sql);
		System.out.println(list);
	}
	
	public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString().replaceAll("-", "").substring(0,16));
	}
}

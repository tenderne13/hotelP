package com.hotel.controller;

import static org.junit.Assert.*;

import java.util.List;
import java.util.UUID;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jdbc.core.JdbcTemplate;

public class TestControllerTest {

	private ApplicationContext applicationContext;
	@Before
	public void setUp()throws Exception{
		applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext-redis.xml");
	}

	@Test
	public void jdbcTest(){
		RedisTemplate<String, Object> redisTemplate = (RedisTemplate<String, Object>) applicationContext.getBean("redisTemplate");
		ListOperations<String, Object> ops = redisTemplate.opsForList();
		System.out.println(redisTemplate.getClientList());
	}
	
	public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString().replaceAll("-", "").substring(0,16));
	}
}

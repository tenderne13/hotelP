package com.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.hotel.common.Page;
import com.hotel.dao.HotelDao;
import com.hotel.po.Hotel;
import com.hotel.service.HotelService;

@Controller
public class TestController {
	
	@Autowired
	private HotelService hotelService;
	
	
	@RequestMapping(value="/hello",produces="application/json; charset=utf-8")
	@ResponseBody
	public String hello(){
		Page<Hotel> page=new Page<Hotel>();
		page.setPageNo(1);
		page.setPageSize(2);
		Hotel hotel=new Hotel();
		hotel.setCategory("双人间");
		//hotelService.selectHousePage(page, hotel);
		return page.toJson();
	}
}

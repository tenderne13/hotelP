package com.hotel.controller.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.awt.HToolkit;

import com.hotel.common.Page;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.service.HotelService;

@Controller
public class IndexController {
	
	@Autowired
	private HotelService hotelService;
	
	
	/*------------------------------引入依赖------------------------------------*/
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
	/*--------------------------页面跳转方法结束-----------------------------*/
	
	@RequestMapping(value="getHotHouses",produces="application/json; charset=utf-8")
	@ResponseBody
	public String getHotHouses(){
		Page<Hotel> page=new Page<Hotel>();
		page.setPageNo(1);
		page.setPageSize(15);
		Hotel hotel=new Hotel();
		Order order=new Order();
		hotelService.selectHousePage(page, hotel,order);
		return page.toJson();
	}
}

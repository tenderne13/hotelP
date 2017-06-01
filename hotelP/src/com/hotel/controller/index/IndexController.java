package com.hotel.controller.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


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
		return "index/index";
	}
	//加载不同的位置页面
	@RequestMapping("position")
	public String position(String meth){
		return "index/"+meth;
	}
	
	//房间详情页跳转
	@RequestMapping("initRoomDetail")
	public String initRoomDetail(Integer roomId,Model model){
		Hotel hotel=hotelService.getHouseByRoomId(roomId);
		model.addAttribute("hotel",hotel);
		return "index/roomDetail";
	}
	
	/*--------------------------页面跳转方法结束-----------------------------*/
	//获取首页热门房间
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

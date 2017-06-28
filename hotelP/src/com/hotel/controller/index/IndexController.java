package com.hotel.controller.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import com.hotel.common.Page;
import com.hotel.common.util.PostUtil;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.service.HotelService;
import com.hotel.service.OrderService;

@Controller
public class IndexController {
	
	@Autowired
	private HotelService hotelService;
	@Autowired
	private OrderService orderService;
	
	
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
	
	//房间列表页面跳转
	@RequestMapping("roomList")
	public String roomList(String category,Model model){
		model.addAttribute("category",category);
		return "index/roomList";
	}
	
	//vue
	@RequestMapping("vuePage")
	public String vuePage(){
		return "index/vue";
	}
	
	//火车票查询页面
	@RequestMapping("trainList")
	public String trainList(){
		return "index/trainList";
	}
	/*--------------------------页面跳转方法结束-----------------------------*/
	//获取首页热门房间
	@RequestMapping(value="getHotHouses")
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
	
	@RequestMapping(value="getHousesByCategory",produces="application/json; charset=utf-8")
	@ResponseBody
	public String getHousesByCategory(@RequestParam(value="pageSize",defaultValue="8")Integer pageSize,
						@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,Hotel hotel,Order order,
						String reserveTime){
		Page<Hotel> page=new Page<Hotel>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		order.setReserveTime(reserveTime);
		hotelService.selectHousePage(page, hotel,order);
		return page.toJson();
	}
	
	@RequestMapping("checkRoomStatus")
	@ResponseBody
	public String checkRoomStatus(Order order){
		boolean status = orderService.checkRoomStatus(order);
		if(status){
			return "empty";
		}
		return "full";
	}
	
	
	//查询时刻信息
	@RequestMapping("queryLeftTicket")
	@ResponseBody
	public String queryLeftTicket(String url,String fromStation,String toStation){
		url="https://kyfw.12306.cn/otn/leftTicket/query?leftTicketDTO.train_date=2017-06-29&leftTicketDTO.from_station=BJP&leftTicketDTO.to_station=BMP&purpose_codes=ADULT";
		return  PostUtil.doGetStrs(url);
	}
}

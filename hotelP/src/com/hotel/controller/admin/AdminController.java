package com.hotel.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.common.Page;
import com.hotel.po.AdminUser;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.service.HotelService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private HotelService hotelService;
	
	@RequestMapping("/initLogin")
	public String initLogin(){
		return "admin/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession httpSession){
		httpSession.invalidate();
		return "redirect:/admin/initLogin";
	}
	
	//登录成功后的主页跳转
	@RequestMapping("/home")
	public String adminHome(@RequestParam(defaultValue="home") String position){
		return "admin/"+position;
	}
	
	//房间列表跳转
	@RequestMapping("houseList")
	public String houseList(){
		return "admin/house/houseList";
	}
	//房间新增页面跳转.
	@RequestMapping("initHouseAdd")
	public String initHouseAdd(){
		return "admin/house/houseAdd";
	}
	//房间编辑页面
	@RequestMapping("initHouseEdit")
	public String initHouseEdit(Integer roomId,Model model){
		Hotel hotel=hotelService.getHouseByRoomId(roomId);
		model.addAttribute("hotel",hotel);
		return "admin/house/houseEdit";
	}
	/*--------------以上为页面跳转的方法--------------*/
	@RequestMapping(value="login")
	@ResponseBody
	public String login(AdminUser adminUser,HttpSession httpSession){
		adminUser=hotelService.checkUser(adminUser);
		if(adminUser!=null){
			System.out.println(adminUser);
			httpSession.setAttribute("adminUser", adminUser);
			return "success";
		}else{
			return "error";
		}
		
		
	}
	
	
	//获取房间列表
	@RequestMapping(value="getHouseData",produces="application/json; charset=utf-8")
	@ResponseBody
	public String getHouseData(@RequestParam(value="pageSize",defaultValue="8")Integer pageSize,
						@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,Hotel hotel,Order order,
						String reserveTime){
		Page<Hotel> page=new Page<Hotel>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		order.setReserveTime(reserveTime);
		hotelService.selectHousePage(page, hotel,order);
		return page.toJson();
	}
	
	//新增房间
	@RequestMapping(value="houseAdd")
	@ResponseBody
	public String houseAdd(Hotel hotel){
		try {
			hotelService.addHouse(hotel);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//删除房间
	@RequestMapping(value="houseDel")
	@ResponseBody
	public String houseDel(Hotel hotel){
		try {
			hotelService.houseDel(hotel);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	//public boyfriend is xiaopeng Li; jiaxinqi is beautiful;
	//@ni kending shi pianwode ,ok ?
	@RequestMapping(value="houseEdit")
	@ResponseBody
	public String houseEdit(Hotel hotel){
		try {
			hotelService.houseEdit(hotel);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
}

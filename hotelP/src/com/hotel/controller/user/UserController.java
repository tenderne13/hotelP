package com.hotel.controller.user;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.po.User;
import com.hotel.service.HotelService;
import com.hotel.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private HotelService hotelService;
	
	//注册页面跳转
	@RequestMapping("initRegist")
	public String initRegist(){
		return "user/regist";
	}
	
	//登录页面跳转
	@RequestMapping("initLogin")
	public String initLogin(){
		return "user/login";
	}
	
	//预定页跳转
	@RequestMapping("initPay")
	public String initPay(Hotel hotel,Order order,Model model){
		hotel=hotelService.getHouseByRoomId(hotel.getRoomId());
		String orderCodes=UUID.randomUUID().toString().replaceAll("-", "").substring(0, 12);
		order.setOrderCodes(orderCodes);
		model.addAttribute("hotel",hotel);
		model.addAttribute("order",order);
		return "user/order";
	}
	
	/*-------------------以上为页面跳转-------------------*/
	
	//校验用户名是否被注册
	@RequestMapping("checkUserName")
	@ResponseBody
	public String checkUserName(String userName){
		
		int count=userService.checkUserName(userName);
		if(count>0){
			return "error";
		}else{
			return "success";
		}
		
	}
	
	//注册
	@RequestMapping("regist")
	@ResponseBody
	public String regist(User user){
		try {
			userService.registUser(user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//登录
	@RequestMapping("login")
	@ResponseBody
	public String login(User user,HttpSession httpSession){
		User existUser = userService.checkLogin(user);
		if(existUser!=null){
			httpSession.setAttribute("user", existUser);
			System.out.println("用户信息为："+existUser);
			return "success";
		}else{
			return "error";
		}
		
	}
	//注销
	@RequestMapping("logout")
	@ResponseBody
	public String logout(HttpSession httpSession){
		httpSession.removeAttribute("user");
		return "success";
	}
}

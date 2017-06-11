package com.hotel.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.common.MD5Util;
import com.hotel.common.Page;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.po.User;
import com.hotel.service.HotelService;
import com.hotel.service.OrderService;
import com.hotel.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private OrderService orderService;
	
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
	
	//确认订单成功后跳转页面
	@RequestMapping("confirmSuccess")
	public String confirmSuccess(String orderCodes,Model model){
		model.addAttribute("orderCodes",orderCodes);
		return "user/success";
	}
	
	//我的订单页面跳转
	@RequestMapping("orderList")
	public String orderList(){
		return "user/orderList";
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
		String MD5Pass=MD5Util.toMd5String(user.getPassword());
		user.setPassword(MD5Pass);
		User existUser = userService.checkLogin(user);
		if(existUser!=null){
			httpSession.setAttribute("user", existUser);
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
	
	//确认订单
	@RequestMapping("confirmOrder")
	@ResponseBody
	public String confirmOrder(Hotel hotel,Order order,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		String createTime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		order.setUserId(user.getId());
		order.setCreateTime(createTime);
		order.setTotalPrice(hotel.getPrice());
		try {
			userService.orderConfirm(order);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	//获得个人的订单数据
	@RequestMapping("getOrderList")
	@ResponseBody
	public String getOrderList(@RequestParam(value="pageSize",defaultValue="8")Integer pageSize,
			@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,Hotel hotel,Order order,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		Page<Order> page=new Page<Order>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		orderService.selectOrderPage(page, order, hotel, user);
		return page.toJson();
	}
}

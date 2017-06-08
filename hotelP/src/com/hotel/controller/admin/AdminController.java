package com.hotel.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.hotel.common.Page;
import com.hotel.common.Paths;
import com.hotel.po.AdminUser;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.po.User;
import com.hotel.service.HotelService;
import com.hotel.service.OrderService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private HotelService hotelService;
	@Autowired
	private OrderService orderService;
	
	//登录页面跳转
	@RequestMapping("/initLogin")
	public String initLogin(){
		return "admin/login";
	}
	
	//注销
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
	
	//订单页面跳转
	@RequestMapping("orderList")
	public String orderList(){
		return "admin/order/orderList";
	}
	
	/*--------------以上为页面跳转的方法--------------*/
	//登录请求
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
	//编辑保存房间信息
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
	
	//图片上传的方法
	@RequestMapping(value="uploadImage",produces="application/json; charset=utf-8")
	@ResponseBody
	public String uploadImage(@RequestParam("imagefile") MultipartFile file,HttpServletRequest request){
		String realPath=Paths.getIMAGE_REAL_PATH();//E:/data/image
		String originalFileName=null;
		Map<String,Object> map=new HashMap<String, Object>();
		
		//获得随机图片名
		originalFileName=file.getOriginalFilename();
		String[] suffix=originalFileName.split("\\.");
		originalFileName=UUID.randomUUID().toString()+"."+suffix[suffix.length-1];
		
		
		//将图片流写入到硬盘中
		try {
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, originalFileName));
			map.put("msg", "success");
			map.put("imageUrl",Paths.getStaticAccessTempUrl(originalFileName));
			map.put("photo", Paths.getPhotoPath(originalFileName));
			return JSON.toJSONString(map);
		} catch (IOException e) {
			e.printStackTrace();
			map.put("msg", "上传失败");
			return JSON.toJSONString(map);
		}
	}
	
	
	//获取所有的订单列表
	@RequestMapping(value="getOrderList",produces="application/json; charset=utf-8")
	@ResponseBody
	public String getOrderList(@RequestParam(value="pageSize",defaultValue="8")Integer pageSize,
			@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,Hotel hotel,Order order,User user){
		Page<Order> page=new Page<Order>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		orderService.selectOrderPage(page, order, hotel, user);
		return page.toJson();
	}
}

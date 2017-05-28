package com.hotel.service;

import com.hotel.common.Page;
import com.hotel.po.Hotel;
import com.hotel.po.Order;

public interface HotelService {
	//分页查询房间列表（可模糊查询条件）
	Page<Hotel> selectHousePage(Page<Hotel> page,Hotel hotel,Order order);
	 //新增房间
	 void addHouse(Hotel hotel);
	//删除房间
	void houseDel(Hotel hotel);
	//编辑房间
	void houseEdit(Hotel hotel);
	 //根据roomId获得房间信息
	 Hotel getHouseByRoomId(Integer roomId);
}

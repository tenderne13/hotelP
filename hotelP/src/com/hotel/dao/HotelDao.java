package com.hotel.dao;

import java.util.List;
import java.util.Map;

import com.hotel.common.Page;
import com.hotel.po.Hotel;

public interface HotelDao {
	 //查询某条件下的总条数
	 Integer getHotelCount(Map<String, Object> parMap);
	 //分页查询房间列表
	 List<Hotel> getHotelList(Page<Hotel> page,Map<String, Object> parMap);
	 //新增房间
	 void addHouse(Hotel hotel);
	 //删除房间
	 void houseDel(Hotel hotel);
	 //编辑房间
	 void houseEdit(Hotel hotel);
	 //根据roomId获得房间信息
	 Hotel getHouseByRoomId(Integer roomId);
}

package com.hotel.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.common.Page;
import com.hotel.dao.HotelDao;
import com.hotel.po.AdminUser;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.service.HotelService;

@Service
public class HotelServieImpl implements HotelService{

	@Autowired
	private HotelDao hotelDao;
	
	
	@Override
	public Page<Hotel> selectHousePage(Page<Hotel> page, Hotel hotel,Order order) {
		Map<String, Object> parMap=new HashMap<String, Object>();
		parMap.put("hotel", hotel);
		parMap.put("order", order);
		int totalCount=hotelDao.getHotelCount(parMap);
		page.setTotalCount(totalCount);
		if(totalCount>0){
			List<Hotel> list=hotelDao.getHotelList(page, parMap);
			page.setResult(list);
		}
		return page;
	}


	@Override
	public void addHouse(Hotel hotel) {
		hotelDao.addHouse(hotel);	
	}


	@Override
	public void houseDel(Hotel hotel) {
		hotelDao.houseDel(hotel);
	}


	@Override
	public void houseEdit(Hotel hotel) {
		hotelDao.houseEdit(hotel);
	}


	@Override
	public Hotel getHouseByRoomId(Integer roomId) {
		return hotelDao.getHouseByRoomId(roomId);
	}


	@Override
	public AdminUser checkUser(AdminUser adminUser) {
		return hotelDao.checkUser(adminUser);
	}

}

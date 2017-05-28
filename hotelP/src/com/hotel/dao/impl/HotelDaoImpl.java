package com.hotel.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import sun.awt.HToolkit;

import com.hotel.common.Page;
import com.hotel.dao.HotelDao;
import com.hotel.po.Hotel;
import com.hotel.po.Order;

@Repository(value="hotelDao")
public class HotelDaoImpl implements HotelDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	@Override
	public Integer getHotelCount(Map<String, Object> parMap) {
		Hotel hotel=(Hotel) parMap.get("hotel");
		Order order=(Order) parMap.get("order");
		StringBuffer sql=new StringBuffer("select count(*) from t_house t1 ");
		sql.append(" left join (select o.roomid,count(*) as status from t_order o where o.orderStatus ='1' ");
		if(order.getReserveTime()!=null && order.getReserveTime()!=""){
			sql.append(" and o.reserveTime='"+order.getReserveTime()+"'");
		}
		sql.append(" group by o.roomid) as t2 on t1.roomid= t2.roomid where 1=1 ");
		
		if(hotel.getName()!=null && hotel.getName()!=""){
			sql.append(" and t1.name like '%"+hotel.getName()+"%'");
		}
		if(hotel.getCategory()!=null&&hotel.getCategory()!=""){
			sql.append(" and t1.category ='"+hotel.getCategory()+"'");
		}
		
		int count = jdbcTemplate.queryForInt(sql.toString());
		return count;
	}
	
	
	@Override
	public List<Hotel> getHotelList(Page<Hotel> page,Map<String, Object> parMap) {
		Hotel hotel=(Hotel) parMap.get("hotel");
		Order order=(Order) parMap.get("order");
		StringBuffer sql=new StringBuffer("select t1.*,t2.status from t_house t1 ");
		sql.append(" left join (select o.roomid,count(*) as status from t_order o where o.orderStatus ='1' ");
		if(order.getReserveTime()!=null && order.getReserveTime()!=""){
			sql.append(" and o.reserveTime='"+order.getReserveTime()+"'");
		}
		sql.append(" group by o.roomid) as t2 on t1.roomid= t2.roomid where 1=1 ");
		
		if(hotel.getName()!=null && hotel.getName()!=""){
			sql.append(" and t1.name like '%"+hotel.getName()+"%'");
		}
		if(hotel.getCategory()!=null&&hotel.getCategory()!=""){
			sql.append(" and t1.category ='"+hotel.getCategory()+"'");
		}
		
		sql.append(" order by roomid desc");
		
		if(page!=null){
			sql.append(" limit "+page.getBeginRowNo()+","+page.getPageSize());
		}
		
		
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString());
		List<Hotel> hotelList=new ArrayList<Hotel>();
		for(Map<String, Object> m:list){
			Hotel ho=new Hotel((Integer)m.get("roomid"), (String)m.get("name"), (Double)m.get("price"),(String)m.get("category"), (String)m.get("photo"));
			if(m.get("status")!=null && m.get("status")!=""){
				ho.setStatus(1);
			}else{
				ho.setStatus(0);
			}
			hotelList.add(ho);
		}
		return hotelList;
	}


	@Override
	public void addHouse(Hotel hot) {
		final Hotel hotel=hot;
		String sql = "insert into t_house(name,price,category,photo) values (?,?,?,?)";
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement pr) throws SQLException {
				pr.setString(1, hotel.getName());
				pr.setDouble(2, hotel.getPrice());
				pr.setString(3, hotel.getCategory());
				pr.setString(4, hotel.getPhoto());
			}
		});
	}


	@Override
	public void houseDel(Hotel hotel) {
		String sql="delete from t_house where roomId ="+hotel.getRoomId();
		jdbcTemplate.update(sql);
	}


	
	
	

}

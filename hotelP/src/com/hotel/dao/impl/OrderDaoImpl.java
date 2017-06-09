package com.hotel.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.common.Page;
import com.hotel.dao.OrderDao;
import com.hotel.po.Hotel;
import com.hotel.po.Order;
import com.hotel.po.User;

@Repository(value="orderDao")
public class OrderDaoImpl implements OrderDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private String baseHeader=" o.userid,o.roomid,o.orderid," +
								"o.orderCodes,o.reserveTime,o.createTime,o.orderStatus,o.totalPrice," +
								"o.contactPerson,o.mobilePhone";//roomName,photo,

	@Override
	public List<Order> getOrderList(Page<Order> page,Map<String, Object> parMap) {
		Order order=(Order) parMap.get("order");
		Hotel hotel=(Hotel) parMap.get("hotel");
		User user=(User) parMap.get("user");
		StringBuffer sql=new StringBuffer("select ");
		sql.append(baseHeader).append(",h.name as roomName,h.photo as photo ");
		sql.append(" from t_order o,t_user u,t_house h where o.userid = u.userid and o.roomid = h.roomid ");
		
		if(order.getOrderStatus()!=null){
			sql.append(" and o.orderStatus = "+order.getOrderCodes());
		}
		
		if(order.getReserveTime()!=null && order.getReserveTime()!=""){
			sql.append(" and o.reserveTime ='"+order.getReserveTime()+"' ");
		}
		
		if(order.getOrderCodes()!=null && order.getOrderCodes()!=""){
			sql.append(" and o.orderCodes ='"+order.getOrderCodes()+"' ");
		}
		
		if(order.getContactPerson()!=null && order.getContactPerson()!=""){
			sql.append(" and o.contactPerson like '%"+order.getContactPerson()+"%' ");
		}
		
		if(user!=null && user.getId()!=null){
			sql.append(" and o.userid= "+user.getId()+" ");
		}
		
		if(hotel!=null && hotel.getRoomId()!=null){
			sql.append(" and h.roomid = "+hotel.getRoomId()+" ");
		}
		
		if(hotel!=null && hotel.getName()!=null){
			sql.append(" and h.name like '%"+hotel.getName()+"%' ");
		}
		
		sql.append(" order by createTime desc");
		
		if(page!=null){
			sql.append(" limit "+page.getBeginRowNo()+","+page.getPageSize());
		}
		
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString());
		
		List<Order> orderList =new ArrayList<Order>();
		for(Map<String,Object> m : list){
			Order ord=new Order();
			/*Order ord=new Order((Integer)m.get("orderid"), (String)m.get("orderCodes"), (Integer)m.get("roomid"), 
								(String)m.get("reserveTime"), (String)m.get("createTime"), (Integer)m.get("orderStatus"), (Double)m.get("totalPrice"), 
								(String)m.get("contactPerson"), (String)m.get("mobilePhone"), (String)m.get("roomName"), (String)m.get("photo"));*/
			ord.setOrderId((Integer)m.get("orderid"));
			ord.setOrderCodes((String)m.get("orderCodes"));
			ord.setRoomId((Integer)m.get("roomid"));
			ord.setReserveTime((String)m.get("reserveTime"));
			ord.setCreateTime((String)m.get("createTime"));
			ord.setOrderStatus((Integer)m.get("orderStatus"));
			ord.setTotalPrice((Double)m.get("totalPrice"));
			ord.setContactPerson((String)m.get("contactPerson"));
			ord.setMobilePhone((String)m.get("mobilePhone"));
			ord.setRoomName((String)m.get("roomName"));
			ord.setPhoto((String)m.get("photo"));
			if(m.get("userid")!=null){
				ord.setUserId((Integer)m.get("userid"));
			}
			orderList.add(ord);
		}
		return orderList;
		
		
	}

	@Override
	public Integer getOrderCount(Map<String, Object> parMap) {
		Order order=(Order) parMap.get("order");
		Hotel hotel=(Hotel) parMap.get("hotel");
		User user=(User) parMap.get("user");
		StringBuffer sql=new StringBuffer("select count(*) ");
		sql.append(" from t_order o,t_user u,t_house h where o.userid = u.userid and o.roomid = h.roomid ");
		
		if(order.getOrderStatus()!=null){
			sql.append(" and o.orderStatus = "+order.getOrderCodes());
		}
		
		if(order.getReserveTime()!=null && order.getReserveTime()!=""){
			sql.append(" and o.reserveTime ='"+order.getReserveTime()+"' ");
		}
		
		if(order.getOrderCodes()!=null && order.getOrderCodes()!=""){
			sql.append(" and o.orderCodes ='"+order.getOrderCodes()+"' ");
		}
		
		if(order.getContactPerson()!=null && order.getContactPerson()!=""){
			sql.append(" and o.contactPerson like '%"+order.getContactPerson()+"%' ");
		}
		
		if(user!=null && user.getId()!=null){
			sql.append(" and o.userid= "+user.getId()+" ");
		}
		
		if(hotel!=null && hotel.getRoomId()!=null){
			sql.append(" and h.roomid = "+hotel.getRoomId()+" ");
		}
		
		if(hotel!=null && hotel.getName()!=null){
			sql.append(" and h.name like '%"+hotel.getName()+"%' ");
		}
		
		int count = jdbcTemplate.queryForInt(sql.toString());
		return count;
	}
}

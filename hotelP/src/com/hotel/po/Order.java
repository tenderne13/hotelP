package com.hotel.po;

public class Order {
	private Integer orderId;
	private String orderCodes;
	private Integer userId;
	private Integer roomId;
	private String reserveTime;
	private String createTime;
	private Integer orderStatus;
	private Double totalPrice;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	public String getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getOrderCodes() {
		return orderCodes;
	}
	public void setOrderCodes(String orderCodes) {
		this.orderCodes = orderCodes;
	}
	public Order() {
		super();
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderCodes=" + orderCodes
				+ ", userId=" + userId + ", roomId=" + roomId
				+ ", reserveTime=" + reserveTime + ", createTime=" + createTime
				+ ", orderStatus=" + orderStatus + ", totalPrice=" + totalPrice
				+ "]";
	}
	
}

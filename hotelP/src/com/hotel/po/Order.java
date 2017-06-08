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
	private String contactPerson;
	private String mobilePhone;
	/*---------扩展字段----------*/
	private String roomName;
	private String photo;
	
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
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
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public Order() {
		super();
	}
	
	public Order(Integer orderId, String orderCodes,
			Integer roomId, String reserveTime, String createTime,
			Integer orderStatus, Double totalPrice, String contactPerson,
			String mobilePhone, String roomName, String photo) {
		super();
		this.orderId = orderId;
		this.orderCodes = orderCodes;
		this.roomId = roomId;
		this.reserveTime = reserveTime;
		this.createTime = createTime;
		this.orderStatus = orderStatus;
		this.totalPrice = totalPrice;
		this.contactPerson = contactPerson;
		this.mobilePhone = mobilePhone;
		this.roomName = roomName;
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderCodes=" + orderCodes
				+ ", userId=" + userId + ", roomId=" + roomId
				+ ", reserveTime=" + reserveTime + ", createTime=" + createTime
				+ ", orderStatus=" + orderStatus + ", totalPrice=" + totalPrice
				+ ", contactPerson=" + contactPerson + ", mobilePhone="
				+ mobilePhone + ", roomName=" + roomName + ", photo=" + photo
				+ "]";
	}
	
}

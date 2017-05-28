package com.hotel.po;

public class Hotel {
	private Integer roomId;
	private String name;
	private Double price;
	private String category;
	private String photo;
	
	private Integer status;//房间预订状态
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Hotel() {
		super();
	}
	public Hotel(Integer roomId, String name, Double price, String category,
			String photo) {
		super();
		this.roomId = roomId;
		this.name = name;
		this.price = price;
		this.category = category;
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "Hotel [roomId=" + roomId + ", name=" + name + ", price="
				+ price + ", category=" + category + ", photo=" + photo
				+ ", status=" + status + "]";
	}
	
	
	
	
	
	
}

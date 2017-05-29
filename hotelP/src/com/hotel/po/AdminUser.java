package com.hotel.po;

public class AdminUser {
	private Integer adminId;
	private String userName;
	private String password;
	private String name;
	
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public AdminUser() {
		super();
	}
	@Override
	public String toString() {
		return "AdminUser [adminId=" + adminId + ", userName=" + userName
				+ ", password=" + password + ", name=" + name + "]";
	}
	
	
}

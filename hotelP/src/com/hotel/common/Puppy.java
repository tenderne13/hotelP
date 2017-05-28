package com.hotel.common;

public class Puppy {
	private int age;
	private String name;
	
	
	
	public Puppy() {
	}
	public Puppy(int age) {
		this.age = age;
	}
	public Puppy(String name) {
		this.name = name;
	}
	public Puppy(int age, String name) {
		this.age = age;
		this.name = name;
	}
	
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public static void main(String[] args) {
		Puppy puppy=new Puppy();
		puppy.setAge(10);
		puppy.setName("刘冲");
		
		Puppy puppy4=new Puppy(10, "刘冲");
		
		Puppy puppy2=new Puppy(10);
		Puppy puppy3=new Puppy("刘冲");
		
	}
	
	
}

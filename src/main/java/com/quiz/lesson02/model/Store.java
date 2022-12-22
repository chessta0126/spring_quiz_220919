package com.quiz.lesson02.model;

import java.util.Date;

public class Store {
	// 필드
	// desc `연결할 테이블명`; -> 컬럼만 전부 복사 -> 은닉화, 자료형은 java에서 쓰는대로 변형
	// null이 가능하면 Integer / not null은 int로 해야함
	private int id;
	private String name;
	private String phoneNumber;
	private String address;
	private String businessNumber;
	private String introduce;
	private Date createdAt;
	private Date updatedAt;
	
	// getter, setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
}

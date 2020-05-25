package com.bookstore.vo;

import java.util.Date;

public class Order {
	
	private int no;
	private String userId;
	private int bookNo;
	private int price;
	private int amount;
	private Date registeredDate;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int no, String userId, int bookNo, int price, int amount, Date registeredDate) {
		super();
		this.no = no;
		this.userId = userId;
		this.bookNo = bookNo;
		this.price = price;
		this.amount = amount;
		this.registeredDate = registeredDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	
}

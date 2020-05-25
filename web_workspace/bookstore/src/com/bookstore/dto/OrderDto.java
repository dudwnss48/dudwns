package com.bookstore.dto;

import java.util.Date;

public class OrderDto {
	
	private int bookNo;
	private int no;
	private String id;
	private String bookTitle;
	private int price;
	private int amount;
	private int allPrice;
	private Date RegisteredDate;
	
	public OrderDto() {
		// TODO Auto-generated constructor stub
	}

	public OrderDto(int bookNo, int no, String id, String bookTitle, int price, int amount, int allPrice,
			Date registeredDate) {
		super();
		this.bookNo = bookNo;
		this.no = no;
		this.id = id;
		this.bookTitle = bookTitle;
		this.price = price;
		this.amount = amount;
		this.allPrice = allPrice;
		RegisteredDate = registeredDate;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
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

	public int getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(int allPrice) {
		this.allPrice = allPrice;
	}

	public Date getRegisteredDate() {
		return RegisteredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		RegisteredDate = registeredDate;
	}
	
}

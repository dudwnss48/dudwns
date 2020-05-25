package com.bookstore.vo;

public class Like {
	
	private int bookNo;
	private String userId;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public Like(int bookNo, String userId) {
		super();
		this.bookNo = bookNo;
		this.userId = userId;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	

}

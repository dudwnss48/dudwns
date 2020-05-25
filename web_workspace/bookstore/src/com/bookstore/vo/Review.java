package com.bookstore.vo;

import java.util.Date;

public class Review {

	private int no;
	private String content;
	private int point;
	private int bookNo;
	private String userId;
	private Date registerdeDate;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int no, String content, int point, int bookNo, String userId, Date registerdeDate) {
		super();
		this.no = no;
		this.content = content;
		this.point = point;
		this.bookNo = bookNo;
		this.userId = userId;
		this.registerdeDate = registerdeDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
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

	public Date getRegisterdeDate() {
		return registerdeDate;
	}

	public void setRegisterdeDate(Date registerdeDate) {
		this.registerdeDate = registerdeDate;
	}
	
	
	
}

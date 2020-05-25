package com.bookstore.dto;

import java.util.Date;

public class ReviewDto {
	
	private int no;
	private String userName;
	private int point;
	private String content;
	private Date registeredDate;
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDto(int no, String userName, int point, String content, Date registeredDate) {
		super();
		this.no = no;
		this.userName = userName;
		this.point = point;
		this.content = content;
		this.registeredDate = registeredDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	
	

}

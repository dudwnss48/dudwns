package com.sample.bookstore.vo;

import java.util.Date;

public class Review {
	
	private int no;
	private String content;
	private int point;
	private Date registered;
	private Book book;
	private User user;
	
	public Review() {}

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

	public Date getRegistered() {
		return registered;
	}

	public void setRegistered(Date registered) {
		this.registered = registered;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	
	
}

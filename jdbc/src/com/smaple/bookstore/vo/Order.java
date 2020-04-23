package com.smaple.bookstore.vo;

import java.util.Date;

public class Order {
	// sample_book_orders 테이블
private int no;
private String user_id;
private int book_no;
private int price;
private int amount;
private Date registeredDate;

public Order() {}

public int getNo() {
	return no;
}

public void setNo(int no) {
	this.no = no;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public int getBook_no() {
	return book_no;
}

public void setBook_no(int book_no) {
	this.book_no = book_no;
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